//
//  GLDeviceInfo.h
//  AiyoyouCocoapods
//
//  Created by gulu on 2018/5/30.
//  Copyright © 2018年 zoenet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLDeviceInfo : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic,copy)   NSString           *deviceName;//设备型号  iPhone 7 plus
@property (nonatomic,copy)   NSString           *nickName;//设备昵称  xxx的iPhone
@property (nonatomic,copy)   NSString           *localizedModel;//手机类型 iPhone iPod
@property (nonatomic,copy)   NSString           *systemVersion;//iPhone系统版本 10.3
@property (nonatomic,strong) NSDictionary       *wifiInfo;//wifi信息

@end
