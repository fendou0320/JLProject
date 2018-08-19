//
//  QIYPlayer.m
//  JLProject
//
//  Created by UCS on 2018/8/18.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "QIYPlayer.h"

static QIYPlayer *_QIYPlayer = nil;

@interface QIYPlayer ()<NSCopying, NSMutableCopying>
//播放器
@property (nonatomic, strong) AVPlayer *myPlayer;
//播放单元
@property (nonatomic, strong) AVPlayerItem *myItem;
//播放界面
@property (nonatomic, strong) AVPlayerLayer *myLayer;
//用来现实视频的播放进度，并且通过它来控制视频的快进快退。
@property (strong, nonatomic)UISlider *avSlider;
//用来判断当前视频是否准备好播放。
@property (assign, nonatomic)BOOL isReadToPlay;
//记录进度
@property (nonatomic, strong) id timeObserver;
// 视频总时间
@property (nonatomic, assign) CMTime duration;

//线程
@property (nonatomic, strong) NSThread *threadOne;

@end

@implementation QIYPlayer

/*
 我们之所以能够看到视频是因为AVPlayerLayer帮我们把视频呈现出来了，可以说是AVPlayerLayer就是一个视频播放器的载体，它负责需要播放的画面。用MVC比喻，就是AVPlayerLayer属于V层，负责对用户的呈现。从AVPlayerLayer的便利构造器方法中可以看出我们在创建一个AVPlayerLayer的时候需要一个AVPlayer类型的参数。所以在创建AVPlayerLayer的时候，我们需要先有一个AVPlayer，它用MVC来分类的话就相当于MVC中的C层，负责播放单元和播放界面的协调工作，我们在它的便利构造器方法中可以看到他需要我们传入一个AVPlayerItem也就是播放单元，所谓的播放单元就是给播放器提供了一个数据的来源，用MVC来类比的话，它就属于M层，在创建一个播放单元的时候，我们首先得需要一个网址。
 */

//+ (instancetype)shareInstace
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _QIYPlayer = [[self alloc] init];
//    });
//    return _QIYPlayer;
//}

/*
 当我们调用shareInstance方法时获取到的对象是相同的，但是当我们通过alloc和init以及copy来构造对象的时候，依然会创建新的实例。
 要确保对象的唯一性，所以我们就需要封锁用户通过alloc和init以及copy来构造对象这条道路。
 
 创建对象的步骤分为申请内存(alloc)、初始化(init)这两个步骤，我们要确保对象的唯一性，因此在第一步这个阶段我们就要拦截它。当我们调用alloc方法时，oc内部会调用allocWithZone这个方法来申请内存，我们覆写这个方法，然后在这个方法中调用shareInstance方法返回单例对象，这样就可以达到我们的目的。拷贝对象也是同样的原理，覆写copyWithZone方法，然后在这个方法中调用shareInstance方法返回单例对象。
 */

/*
AVPlayer一次只能播放一个媒体资源。播放器可以使用其- (void)replaceCurrentItemWithPlayerItem:(nullable AVPlayerItem *)item方法被重新使用来播放额外的媒体资产，但是它一次只管理单个媒体资产的播放。该框架还提供了一个 AVQueuePlayer 子类，该类可以使用来创建和管理媒体资产的队列，以便按顺序播放。
*/

+ (instancetype)shareInstace
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _QIYPlayer = [[super allocWithZone:NULL] init];
        //不是使用alloc方法，而是调用[[super allocWithZone:NULL] init]
        //已经重载allocWithZone基本的对象分配方法，所以要借用父类（NSObject）的功能来帮助出处理底层内存分配的杂物
//        _QIYPlayer.backgroundColor = [UIColor greenColor];
        [_QIYPlayer setUpNSThread];
    });
    return _QIYPlayer;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [QIYPlayer shareInstace];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [QIYPlayer shareInstace];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [QIYPlayer shareInstace];
}

//创建不死线程
- (void)setUpNSThread{
    //创建不死线程
    self.threadOne = [[NSThread alloc] initWithTarget:self selector:@selector(playVideo) object:@"MYPLAY"];
    //设置线程的名称
    self.threadOne.name = @"threadA";
    //设置线程的优先级,注意线程优先级的取值范围为0.0~1.0之间，1.0表示线程的优先级最高,如果不设置该值，那么理想状态下默认为0.5
    self.threadOne.threadPriority = 1.0;
    //    self.threadOne.stackSize
    [self.threadOne start];
}

- (void)setMediaUrl:(NSURL *)mediaUrl
{
    _mediaUrl = mediaUrl;
    
    [self performSelector:@selector(playVideo) onThread:self.threadOne withObject:nil waitUntilDone:NO];
}

- (void)playVideo{
    
    if (!_mediaUrl) return;
    if (!_QIYPlayer) {
        [QIYPlayer shareInstace];
    }
    
    self.myItem = [AVPlayerItem playerItemWithURL:_mediaUrl];
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.myItem];
    self.myLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.myLayer.frame = self.bounds;
    [self.layer addSublayer:self.myLayer];
    self.duration = self.myItem.duration;
    
    [self.myItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    // 更新当前播放条目的已播时间, CMTimeMake(3, 30) == (Float64)3/30 秒
    weakedSelf
    self.timeObserver = [self.myPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 30) queue:nil usingBlock:^(CMTime time) {
        // 当前播放时间
        NSLog(@"当前时间--%@，剩余时间--%@", [weakSelf timeStringWithCMTime:time], [weakSelf timeStringWithCMTime:CMTimeSubtract(weakSelf.myItem.duration, time)]);
        // 更新进度--视频总时间
        Float64 currentSecond = CMTimeGetSeconds(time); // 当前秒
        Float64 timeSecond = CMTimeGetSeconds(weakSelf.myItem.duration);
        weakSelf.avSlider.value = currentSecond/timeSecond;
        NSLog(@"%lf", weakSelf.avSlider.value);
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status = [change [NSKeyValueChangeNewKey]integerValue];
        switch (status) {
            case AVPlayerStatusFailed:
                NSLog(@"item有误");
                self.isReadToPlay = NO;
                break;
            case AVPlayerStatusReadyToPlay:
                NSLog(@"准备播放了");
                self.isReadToPlay = YES;
                self.avSlider.maximumValue = self.myItem.duration.value/self.myItem.duration.timescale;
                break;
            case AVPlayerStatusUnknown:
                NSLog(@"视频播放资源出现未知错误");
                self.isReadToPlay = NO;
                break;
            default:
                break;
        }
    }
}

- (UISlider *)avSlider
{
    if (!_avSlider) {
        _avSlider = [[UISlider alloc]initWithFrame:CGRectMake(0, self.height-10, self.width, 10)];
        _avSlider.minimumValue = 0.0;
        _avSlider.maximumValue = 200;
        [_avSlider setContinuous:YES];
        //07.minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
        _avSlider.minimumTrackTintColor = [UIColor redColor];
        [self addSubview:_avSlider];
        [_avSlider addTarget:self action:@selector(avSliderAction) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchCancel|UIControlEventTouchUpOutside];
    }
    return _avSlider;
}

- (void)playAction
{
    if (!self.myPlayer) return;
    if ( self.isReadToPlay) {
        [self.myPlayer play];
    }else{
        NSLog(@"视频正在加载中");
    }
}

- (void)pauseAction
{
    if (self.myPlayer == nil) {
        return;
    }else{
        [self.myPlayer pause];
    }
}

- (void)avSliderAction{
    
    //slider的value值为视频的时间
    float seconds = self.avSlider.value;
    //让视频从指定的CMTime对象处播放。
    CMTime startTime = CMTimeMakeWithSeconds(seconds, self.myItem.currentTime.timescale);
    //让视频从指定处播放
    [self.myPlayer seekToTime:startTime];
}

#pragma mark 根据CMTime生成一个时间字符串
- (NSString *)timeStringWithCMTime:(CMTime)time {
    
    Float64 seconds = time.value / time.timescale;
    // 把seconds当作时间戳得到一个date
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    // 格林威治标准时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    // 设置时间显示格式
    [formatter setDateFormat:(seconds / 3600 >= 1) ? @"h:mm:ss" : @"mm:ss"];
    
    // 返回这个date的字符串形式
    return [formatter stringFromDate:date];
}


- (void)dealloc
{
    [self.myItem removeObserver:self forKeyPath:@"status" context:nil];
}

@end
