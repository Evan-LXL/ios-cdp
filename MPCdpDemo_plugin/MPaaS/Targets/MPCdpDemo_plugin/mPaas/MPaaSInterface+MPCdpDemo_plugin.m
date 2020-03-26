//
//  MPaaSInterface+MPCdpDemo_plugin.m
//  MPCdpDemo_plugin
//
//  Created by shifei.wkp on 2020/03/26.
//  Copyright © 2020 Alibaba. All rights reserved.
//

#import "MPaaSInterface+MPCdpDemo_plugin.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation MPaaSInterface (MPCdpDemo_plugin)

- (BOOL)enableSettingService
{
    return NO;
}

- (NSString *)userId
{
    return nil;
}

@end

#pragma clang diagnostic pop
