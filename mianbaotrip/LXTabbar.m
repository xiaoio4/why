//
//  LXTabbar.m
//  mianbaotrip
//
//  Created by liuxin on 14/10/30.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import "LXTabbar.h"

@interface LXTabbar ()
@property (nonatomic, weak) UIButton *selectButton;

@end
@implementation LXTabbar
@synthesize delegate;

-(void)addtabBarWithImage:(UIImage *)image selectImage:(UIImage *)selectimage
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:selectimage forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
  
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        //取得按钮
        UIButton *btn = self.subviews[i];
        
        btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
        CGFloat x = i * self.bounds.size.width / count;
        CGFloat y = 0;
        CGFloat width = self.bounds.size.width / count;
        CGFloat height = self.bounds.size.height;
        btn.frame = CGRectMake(x, y, width, height);
        NSLog(@"layoutSubviews");
    }  

}

-(void)buttonClick:(UIButton *) btn
{
    self.selectButton.selected = NO;
    
    btn.selected = YES;
    
    self.selectButton = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:selectFrom:To:)]) {
        [self.delegate tabBar:self selectFrom:self.selectButton.tag To:btn.tag];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
