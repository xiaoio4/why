//
//  LXTabbar.h
//  mianbaotrip
//
//  Created by liuxin on 14/10/30.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXTabbar;

@protocol LXTabbarDelegate <NSObject>

-(void) tabBar:(LXTabbar *) tabBar selectFrom:(NSInteger) from To:(NSInteger) to;


@end
@interface LXTabbar : UIView
@property (nonatomic, weak) id<LXTabbarDelegate> delegate;
-(void)addtabBarWithImage:(UIImage *) image selectImage:(UIImage *) selectimage;

@end
