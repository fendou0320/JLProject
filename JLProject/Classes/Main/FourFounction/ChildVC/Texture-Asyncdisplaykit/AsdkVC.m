//
//  AsdkVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/21.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "AsdkVC.h"
//#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface AsdkVC ()
//@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation AsdkVC

/*
 AsyncDisplayKit 是 Facebook 在 2014 年开源的一个异步界面渲染库，她是构筑于 UIKit 之上的一个封装库，与 UIView 是平级的关系（同时提供 UIView bridge 接口）。
 AsyncDisplayKit 在开源社区历经一年多时间的琢磨，已经逐趋成熟，完全可以用于生产环境，但目前将 AsyncDisplayKit 用于生产环境的应用寥寥无几，究其原因，不外乎以下几点：
(1) 不支持 IB，不支持 Autolayout，也不支持 Autoresizing，一切布局都需要手动计算完成；
(2)接口并非与 UIView 完全一致，对入门使用者来说，有一定的学习成本；
(3)AsyncDisplayKit 并不是非用不可，她所追求的是极限用户体验。
 */


/*
 (1)什么情况下应该使用 AsyncDisplayKit
 复杂的界面
 存在滑动性能问题的界面，同时使用各种方法优化无效的界面
 频繁更新的TableView（比如聊天界面）
 (2)什么情况下不应该使用 AsyncDisplayKit
 不存在性能问题的界面，没有必要使用 AsyncDisplayKit
 */

/*
 有什么因素会影响UI性能。
  就一般应用而言，需要关注的性能的UI控件可能就只有 UITableView 和 UICollectionView，其它类型的UI，性能问题在可以容忍的范围内。 这也是 什么情况下应该使用 AsyncDisplayKit 的关注点。
 但是，我们仍然有必要去列出一些影响流畅性的关键点。
 
 (1)网络请求，大部分网络请求都应该使用后台线程完成，如果你使用的是 AFNetworking、 SDWebImage 这些开源缓存库，那么切换到后台去请求网络资源的操作都已经默认完成。
 (2)本地数据读写和计算，当你需要从闪存中读取文件的时候，这些操作都应该使用GCD或者NSThread切换至后台线程中完成。
 (3)图像的处理，尽量使用合适的UIImage给予UIImageView使用，何谓合适？已经提前剪裁、缩放好的图片是最佳的，否则当UIImage赋予UIImageView.image的时候，iOS会有不必要的计算开销，而这些开销却是可以提前手动缓存起来的。
 (4)Layer 属性的谨慎选择，不合理的 Layer 特效（阴影、圆角）都会使流畅的滑动变成卡顿（非常重要）。
 (5)少用 UIView.backgroundColor = UIColor.clearColor()，透明的背景会加剧卡顿。
 (6)文字的渲染，你可能不知道，文字的渲染也是需要开销的。一般来说，文字渲染的开销非常小，甚至不能察觉到。但是，当一个UILabel被赋予大段富文本文字后，开销就会非常大。
 (7)图像的渲染，一个任何开发者、几乎所有库（包括SDWebImage）都无法解决的问题，图像在UIImageView中的渲染开销，并且图像的渲染只能在主线程中执行。
 
 前五点都是可以在 UIView 的基础上解决的，如果前五点均优化完成后，仍然无法解决卡顿问题，则应该使用 AsyncDisplayKit。
 AsyncDisplayKit 有对应的方案，着力解决文字渲染、图像渲染两个难题。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     和 UITableView 一样，这句创建了 ASTableNode 实例，同时指定类型为 plain，因为我们决定使用自定义的表格。
     设置 delegate 和 dataSource。
     tableNode 实际上封装了一个 UITableView，可以通过它的 .view 属性引用这个 UITableView，因此这句清除了表格分隔线。
     leadingScreenFroBatching 指定了表格什么时候抓取新数据，单位为一个完整屏幕。这句表示当还有 1 屏 cell 数据缓存时就抓取新数据。
     addSubnode 是以 Category 形式添加的。其作用类似于 addSubview，不过它添加的是 ASNode 而不是 UIView。
     */
    
//    self.tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
//    self.tableNode.dataSource = self;
//    self.tableNode.delegate = self;
//    // 3
//    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
//    // 4
//    self.tableNode.view.leadingScreensForBatching = 1.0;
//    // 5
//    [self.view addSubnode:self.tableNode];
}


@end
