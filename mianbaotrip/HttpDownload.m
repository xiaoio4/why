//
//  HttpDownload.m
//  mianbaotrip
//
//  Created by liuxin on 14/10/31.
//  Copyright (c) 2014年 liuxin. All rights reserved.
//

#import "HttpDownload.h"

@interface HttpDownload ()
//
//@property (nonatomic, strong) NSMutableData *receiveData;
@end

@implementation HttpDownload
@synthesize delegate;
@synthesize httpDownload;
@synthesize receiveData;

-(void)startDownloadWithUrl:(NSString *) url
{
    receiveData = [[NSMutableData alloc] init];
    NSURL *url_01 = [[NSURL alloc] initWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url_01 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receiveData appendData:data];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//     NSLog(@"ddd=%@",receiveData);
    if ([delegate respondsToSelector:@selector(DownloadComplete:)]) {
        [delegate DownloadComplete:receiveData];
       
    }
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}
@end
