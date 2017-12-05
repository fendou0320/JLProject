//
//  StarController.m
//  JLProject
//
//  Created by UCS on 2017/9/10.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "StarController.h"
#import "TQStarRatingView.h"
#import "CostomsStarView.h"

@interface StarController ()
@property (nonatomic, strong) TQStarRatingView *starRatingView;

@end

@implementation StarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(30, 200, 250, 50)
                                                     numberOfStar:kNUMBER_OF_STAR];
    [self.view addSubview:self.starRatingView];

    CostomsStarView *starView = [[CostomsStarView alloc] initWithFrame:CGRectMake(30, 400, 250, 50)
                                                     numberOfStar:kNUMBER_OF_STAR];
    [self.view addSubview: starView];
    [starView setScore:(1.0/10) withAnimation:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
