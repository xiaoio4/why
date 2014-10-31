//
//  RootViewController.m
//  mianbaotrip
//
//  Created by liuxin on 14/10/30.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import "RootViewController.h"

#import "LXTabbar.h"

@interface RootViewController ()<LXTabbarDelegate,HttpDownloadDelegate>

@property (nonatomic, weak) UIButton *selectButton;

@end

@implementation RootViewController
@synthesize httpDownload;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    CGRect rect = self.tabBar.bounds;
//    [self.tabBar removeFromSuperview];
//    self.tabBar.hidden = YES;
    LXTabbar *tabBarView = [[LXTabbar alloc] init];
    tabBarView.delegate = self;
    tabBarView.frame = rect;
    
    NSArray *imageArray = [NSArray arrayWithObjects:@"root_tabbar_recommend 2",@"root_tabbar_dest 2",@"root_tabbar_addtrip 2",@"root_tabbar_sale 2",@"root_tabbar_me 2", nil];
    NSArray *seleceImageArray = [NSArray arrayWithObjects:@"root_tabbar_recommend_hl 2",@"root_tabbar_dest_hl 2",@"root_tabbar_addtrip_hl 2",@"root_tabbar_sale_hl 2",@"root_tabbar_me_hl 2", nil];
    for (int i = 0; i < [imageArray count]; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[imageArray objectAtIndex:i]]];
        UIImage *selectImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[seleceImageArray objectAtIndex:i]]];
        [tabBarView addtabBarWithImage:image selectImage:selectImage];
        
    }
    [self.tabBar addSubview:tabBarView];
    
    httpDownload = [[HttpDownload alloc] init];
    httpDownload.delegate = self;
    [httpDownload startDownloadWithUrl:[NSString stringWithFormat:@"http://api.breadtrip.com/featured/"]];
    // Do any additional setup after loading the view.
}
-(void)DownloadComplete:(NSMutableData *)data
{
    [self parseJsonWithData:data];
}

-(NSDictionary *)parseJsonWithData:(NSMutableData *) jsonData
{
    NSError *error;
    NSDictionary *jsonDic;
    if (jsonData) {
        jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    }
    return jsonDic;
   
    
}
-(void)tabBar:(LXTabbar *)tabBar selectFrom:(NSInteger)from To:(NSInteger)to
{
    self.selectedIndex = to;
    
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
