//
//  RootViewController.h
//  mianbaotrip
//
//  Created by liuxin on 14/10/30.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpDownload.h"

@interface RootViewController : UITabBarController
{
    HttpDownload *httpDownload;
}

@property (nonatomic, strong) HttpDownload *httpDownload;

@end
