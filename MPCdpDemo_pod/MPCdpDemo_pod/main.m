//
//  main.m
//  MPCdpDemo_pod
//
//  Created by shifei.wkp on 2020/3/26.
//  Copyright © 2020 alipay. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
        return UIApplicationMain(argc, argv, @"DFApplication", @"DFClientDelegate"); // NOW USE MPAAS FRAMEWORK
}
