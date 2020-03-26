//
//  MPTabBarViewController.m
//  MPCdpDemo_plugin
//
//  Created by shifei.wkp on 2019/08/05.
//  Copyright © 2019 ORGNIZATION_NAME. All rights reserved.
//

#import "MPTabBarViewController.h"

@interface MPTabBarViewController ()

@end

@implementation MPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    self.title = viewController.title;
    self.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem;
    self.navigationItem.leftBarButtonItems = viewController.navigationItem.leftBarButtonItems;
    self.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
    self.navigationItem.rightBarButtonItems = viewController.navigationItem.rightBarButtonItems;
}


@end
