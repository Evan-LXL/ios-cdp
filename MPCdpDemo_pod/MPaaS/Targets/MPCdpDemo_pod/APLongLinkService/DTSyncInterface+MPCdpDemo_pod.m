//
//  DTSyncInterface+MPCdpDemo_pod.m
//  MPCdpDemo_pod
//
//  Created by quinn on 2020/03/26. All rights reserved.
//

#import "DTSyncInterface+MPCdpDemo_pod.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation DTSyncInterface (MPCdpDemo_pod)

- (NSString*)appId
{
    return @"570DA89281533";
}

- (NSString*)platform
{
    return @"IOS";
}

- (NSString*)workspaceId
{
    return @"default";
}

- (int)syncPort
{
    return 443;
}

- (NSString*)syncServer
{
    return @"cn-hangzhou-mss-link.cloud.alipay.com";
}

@end

#pragma clang diagnostic pop

