//
//  GLDeviceInfo.m
//  AiyoyouCocoapods
//
//  Created by gulu on 2018/5/30.
//  Copyright © 2018年 zoenet. All rights reserved.
//

#import "GLDeviceInfo.h"
#import "sys/utsname.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation GLDeviceInfo
static GLDeviceInfo *deviceInfo;

+ (instancetype)sharedInstance {
    return [[self alloc]init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (deviceInfo == nil) {
            deviceInfo = [super allocWithZone:zone];
        }
    });
    return deviceInfo;
}

- (id)copyWithZone:(NSZone *)zone {
    return deviceInfo;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return deviceInfo;
}

//----------------------------------------------------------------
- (NSString *)deviceName {
    if (_deviceName) return _deviceName;
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone7,1"])    _deviceName = @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    _deviceName = @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    _deviceName = @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    _deviceName = @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    _deviceName = @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    _deviceName = @"iPhone 7";//国行、日版、港行
    if ([deviceString isEqualToString:@"iPhone9,2"])    _deviceName = @"iPhone 7 Plus";//港行、国行
    if ([deviceString isEqualToString:@"iPhone9,3"])    _deviceName = @"iPhone 7";//美版、台版
    if ([deviceString isEqualToString:@"iPhone9,4"])    _deviceName = @"iPhone 7 Plus";//美版、台版
    if ([deviceString isEqualToString:@"iPhone10,1"])   _deviceName = @"iPhone 8";//国行(A1863)、日行(A1906)
    if ([deviceString isEqualToString:@"iPhone10,4"])   _deviceName = @"iPhone 8";//美版(Global/A1905)
    if ([deviceString isEqualToString:@"iPhone10,2"])   _deviceName = @"iPhone 8 Plus";//国行(A1864)、日行(A1898)
    if ([deviceString isEqualToString:@"iPhone10,5"])   _deviceName = @"iPhone 8 Plus";//美版(Global/A1897)
    if ([deviceString isEqualToString:@"iPhone10,3"])   _deviceName = @"iPhone X";//国行(A1865)、日行(A1902)
    if ([deviceString isEqualToString:@"iPhone10,6"])   _deviceName = @"iPhone X";//美版(Global/A1901)
    if ([deviceString isEqualToString:@"iPhone3,1"])    _deviceName = @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    _deviceName = @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    _deviceName = @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    _deviceName = @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    _deviceName = @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    _deviceName = @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    _deviceName = @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    _deviceName = @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    _deviceName = @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    _deviceName = @"iPhone 5s (GSM+CDMA)";
    
    
    
    if ([deviceString isEqualToString:@"iPod1,1"])      _deviceName = @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      _deviceName = @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      _deviceName = @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      _deviceName = @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      _deviceName = @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      _deviceName = @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      _deviceName = @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      _deviceName = @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      _deviceName = @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      _deviceName = @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      _deviceName = @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      _deviceName = @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      _deviceName = @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      _deviceName = @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      _deviceName = @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      _deviceName = @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      _deviceName = @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      _deviceName = @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      _deviceName = @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      _deviceName = @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      _deviceName = @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      _deviceName = @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      _deviceName = @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      _deviceName = @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      _deviceName = @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      _deviceName = @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      _deviceName = @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      _deviceName = @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      _deviceName = @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      _deviceName = @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      _deviceName = @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      _deviceName = @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      _deviceName = @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      _deviceName = @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      _deviceName = @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      _deviceName = @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,11"])     _deviceName = @"iPad 5 (WiFi)";
    if ([deviceString isEqualToString:@"iPad6,12"])     _deviceName = @"iPad 5 (Cellular)";
    if ([deviceString isEqualToString:@"iPad7,1"])      _deviceName = @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if ([deviceString isEqualToString:@"iPad7,2"])      _deviceName = @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if ([deviceString isEqualToString:@"iPad7,3"])      _deviceName = @"iPad Pro 10.5 inch (WiFi)";
    if ([deviceString isEqualToString:@"iPad7,4"])      _deviceName = @"iPad Pro 10.5 inch (Cellular)";
    
    if ([deviceString isEqualToString:@"AppleTV2,1"])   _deviceName = @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])   _deviceName = @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])   _deviceName = @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])   _deviceName = @"Apple TV 4";
    
    if ([deviceString isEqualToString:@"i386"])         _deviceName = @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       _deviceName = @"Simulator";
    
    if (!_deviceName) _deviceName = @"";
    return _deviceName;
}

- (NSString *)nickName {
    if (_nickName) return _nickName;
    _nickName = [UIDevice currentDevice].name;
    return _nickName;
}

- (NSString *)localizedModel {
    if (_localizedModel) return _localizedModel;
    _localizedModel = [UIDevice currentDevice].localizedModel;
    return _localizedModel;
}

- (NSString *)systemVersion {
    if (_systemVersion) return _systemVersion;
    _systemVersion = [UIDevice currentDevice].systemVersion;
    return _systemVersion;
}

- (NSDictionary *)wifiInfo {
    if (_wifiInfo) return _wifiInfo;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        _wifiInfo = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if(_wifiInfo && [_wifiInfo count]) {break;}
    }
    return _wifiInfo;
}

@end
