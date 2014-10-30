//
//  RootViewController.m
//  mianbaotrip
//
//  Created by liuxin on 14/10/30.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import "RootViewController.h"
#import "LXTabbar.h"

@interface RootViewController ()<LXTabbarDelegate>

@property (nonatomic, weak) UIButton *selectButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = self.tabBar.bounds;
    [self.tabBar removeFromSuperview];
    
    LXTabbar *tabBarView = [[LXTabbar alloc] init];
    tabBarView.delegate = self;
    tabBarView.frame = rect;
    
    NSArray *imageArray = [NSArray arrayWithObjects:@"root_tabbar_dest 2",@"root_tabbar_recommend 2",@"root_tabbar_recommend 2",@"root_tabbar_recommend 2",@"root_tabbar_recommend 2", nil];
    NSArray *seleceImageArray = [NSArray arrayWithObjects:@"root_tabbar_me_hl 2",@"root_tabbar_me_hl 2",@"root_tabbar_me_hl 2",@"root_tabbar_me_hl 2",@"root_tabbar_me_hl 2", nil];
    for (int i = 0; i < [imageArray count]; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[imageArray objectAtIndex:i]]];
        UIImage *selectImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[seleceImageArray objectAtIndex:i]]];
        [tabBarView addtabBarWithImage:image selectImage:selectImage];
        
    }
    [self.tabBar addSubview:tabBarView];
    // Do any additional setup after loading the view.
}
-(void)tabBar:(LXTabbar *)tabBar selectFrom:(NSInteger)from To:(NSInteger)to
{
    
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
