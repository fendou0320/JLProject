//
//  JLLoadingVC.m
//  JLProject
//
//  Created by jiangliang on 2019/5/23.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JLLoadingVC.h"

@interface JLLoadingVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end


@implementation JLLoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight-300) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //进行数据刷新操作
        
    }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return k_TableCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld栏", indexPath.row];
    return cell;
}








































/*
 那么分手后应怎么疗伤呢？
 
 1失恋即手分，意思是不爱了，变心了，但有一些人分手后总是放不下，还要去打听前任的信自己，这样做只能证明你在意对方，放不下对方，这样做只会让你更痛苦，所以要走出失恋，就是要回归自已的生活，不再打听对方，等到一天你内心平静了，听到对方的事你也不再有反应时，你就不会痛苦了。
 
 2分手后应老死不相往来，不再联系，从此在对方的生活中消失，时间是最好的爱情解药，时间久了什么感觉也不会有，痛的感觉也会消失，放过对方的同时也是放过自已，能让自已有一个新的爱情开始
 
 3分手后保持自已的自尊，不要去哀求对方给自已一次机会，这样只会让变心的对方更看不起你，让对方以爱的名义把自忆的尊严踩在脚下，对于变心的人来说你做什么纠纷都是无用的，失去一次的爱情，不是失去所有的爱或者爱情，世界是不是只有TA一个爱人。你可以为爱付出所有，但也要懂得爱自已。
 
 4分手后是不可能做朋友的，如果能做朋友证明没爱过，如果还有前任联系，等于为自已埋下一个定时炸弹,还会影响你找新有对象，不但忘记不了，只会让你痛了好了再痛，反反复复，谈何走出来，所以分了就分了，不要再联系，见面。
 
 */


/*
 现在这个状态，从我的角度来看，
 第一、我什么都做不了，你不让我见家里，你也什么都不做，这样耗着；
 他那边领着你见了他家长，又双方家长一起吃饭，下一步就是和你家提定亲，然后让你回老家。这个流程就是用脚指头都能想出来；
 我这边在这里干等着，什么都不让我干；人家那边一步一个脚印，把所有的事都快做完了；这样结局只会有一个。就是我亲眼看着你和他一步一步的走向结婚。
 第二、我一直都在做梦，梦想着和你还有希望呢，我心里放不下，彷徨、害怕、提心吊胆，做什么又做不了，心里更难受，这种状况伤到我自尊心了，人活着就是为了一口气
 第三、上午说了这么多，就是让你给我个态度，你要是支持我，我做什么都不怕，我肯定能想到办法圆滑的引导这个局面
 第四、一直以来，你说过好多不知道、不确定，大多数小事其实都是我在拿主意，我小事拿了主意，你大事却从来不听我的，也不主动干什么；人家那边，不需要问你想不想去他家直接就去了，不需要问你想不想双方父母吃饭直接就吃了，我问过八百次去你家行不行都不行，人家把全部的事都办完了，我还什么都没干。现在这个状况，我有错，我以前没照顾好你，没早点买房，以前的事没法弥补，只能以后改了。
 第五、我一个同事新浪这边的，91年的秦皇岛的，和她女朋友认识三个月就一起同居了，问我谈过吗，我说谈过一个，谈了三年。问我住一起了吗，我说没有。他开玩笑说不够爱吧，这个就是我现在想的，他说她女朋友五一非拉他回家，他还不想去呢，他女朋友就拉着去了，他女朋友河南的，也是跨省。这个情况和我就是个明显的对比。他说的应该是对的吧
 第六、咱们还能接触的时间不多了，后天你父母吃了这顿饭，肯定很满意，往后就是一马平川，后面或是开始商量个时间订婚，或是问问你想不想回家，估计端午节后一切会再进一步吧
 
 我说了这些，就是要你给我个态度，这种情况下，你如果能支持我，你是爱我的，我以前的怀疑都不会再有了，以后我像史进一样，一步一步的领着你向前走，爱着你，疼着你，护着你，别人怼你我来怼他们。你支持我我什么也都不怕。要是你不支持我，我就自己消失，不会再让你纠结、难过，也不会再怀疑你、质问你、逼你。这段时间我情绪很糟，你也好不到哪里去，我都懂。那天我问你我的优秀是什么，你说是优秀，我其实希望的是你说我爱你啊。
 
 就到周日晚上之前吧，等你父母吃了这顿饭，你告诉我是爱我，还是爱他，也可以不回我，不回不一定是爱谁，但肯定是不爱我的。
 
 
 */


@end
