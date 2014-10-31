//
//  HttpDownload.h
//  mianbaotrip
//
//  Created by liuxin on 14/10/31.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpDownload;
@protocol HttpDownloadDelegate <NSObject>

-(void) DownloadComplete:(NSMutableData *) data;


@end
@interface HttpDownload : NSObject<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

{
    HttpDownload *httpDownload;
    NSMutableData *receiveData;
    
}
@property (nonatomic, strong) NSMutableData *receiveData;

@property (nonatomic, strong) HttpDownload *httpDownload;

@property (nonatomic, weak) id<HttpDownloadDelegate> delegate;




-(void)startDownloadWithUrl:(NSString *) url;
@end
