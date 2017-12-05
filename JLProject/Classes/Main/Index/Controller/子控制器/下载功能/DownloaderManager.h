//
//  DownloaderManager.h
//  JLProject
//
//  Created by UCS on 2017/11/30.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloaderManager : NSObject

+ (instancetype)sharedInstance;

- (void)downLoadBigFile: (NSString *)url;

@end
