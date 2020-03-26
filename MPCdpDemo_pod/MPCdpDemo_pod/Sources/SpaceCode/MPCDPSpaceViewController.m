//
//  MPCDPSpaceViewController.m
//  MPPromotionDemo
//
//  Created by shifei.wkp on 2019/8/3.
//  Copyright © 2019 Alipay. All rights reserved.
//

#import "MPCDPSpaceViewController.h"

@interface MPCDPSpaceViewController () <CDPPromotionCenterDelegate>

@property (nonatomic, strong) UIView* containerView;

@end

@implementation MPCDPSpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.containerView];
    self.containerView.hidden = YES;
    
    [CDPPromotionCenter addObserver:self
                  spaceCodesForView:@[self.spaceCode]
                  spaceCodesForData:nil
                            extInfo:nil
                        immediately:YES];
    
}

- (void)dealloc {
    [CDPPromotionCenter removeObserver:self];
}


#pragma mark - PromotionCenterDelegate
- (void)promotionViewDidFinishLoading:(CDPSpaceView *)spaceView
                            spaceCode:(NSString *)spaceCode {
    [self.containerView removeAllSubviews];
    
    if (spaceView) {
        [self.containerView addSubview:spaceView];
        self.containerView.size_mp = spaceView.size_mp;
    }
    self.containerView.hidden = spaceView == nil;
}


#pragma mark - getter and setter
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.width, 100)];
        _containerView.backgroundColor = AU_COLOR_CLIENT_BG1;
        _containerView.layer.borderWidth = 1.0f;
        _containerView.layer.borderColor = AU_COLOR_APP_RED.CGColor;
    }
    return _containerView;
}

@end
