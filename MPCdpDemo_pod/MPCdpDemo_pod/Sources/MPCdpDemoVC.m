//
//  MPCdpDemoVC.m
//  MPCdpDemo
//
//  Created by shifei.wkp on 2018/12/18.
//  Copyright © 2018 alipay. All rights reserved.
//

#import "MPCdpDemoVC.h"
#import "MPCdpDemoDef.h"
#import "MPCDPSpaceViewController.h"

// 展位ID
#define kBannerSpaceCode            @"space-rotation-pic"
#define kListSpaceCode              @"space-list-pic"
#define kSingleSpaceCode            @"space-banner-url"
#define kAnnouncementSpaceCode      @"space-annoucement-text-final"
#define kH5PopupSpaceCode           @"h5-popup-test"

// 动态展位页面ID
#define kFullScreenViewId           @"MPCDPFullScreenViewController"
#define kListHeaderViewId           @"MPCDPLocationListHeaderViewController"
#define kListFooterViewId           @"MPCDPLocationListFooterViewController"
#define kScreenTopViewId            @"MPCDPLocationTopViewController"
#define kScreenBottomViewId         @"MPCDPLocationBottomViewController"
#define kFloatTopViewId             @"MPCDPLocationFloatTopViewController"
#define kH5PopupViewId              @"MPCDPH5PopupViewController"


@implementation MPCdpDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"智能营销";
    
    CREATE_UI({
        SECTION_LABEL(@"动态展位")
        BUTTON_WITH_ACTION(@"H5页面广告", webviewActivity)
        BUTTON_WITH_ACTION(@"全屏广告", fullscreenActivity:)
        BUTTON_WITH_ACTION(@"列表头部广告", listHeaderActivity:)
        BUTTON_WITH_ACTION(@"列表尾部广告", listFooterActivity:)
        BUTTON_WITH_ACTION(@"页面顶部广告", screenTopActivity:)
        BUTTON_WITH_ACTION(@"页面底部广告", screenBottomActivity:)
        BUTTON_WITH_ACTION(@"浮动顶部广告", floatTopActivity:)
        
        SECTION_LABEL(@"展位ID类型")
        BUTTON_WITH_ACTION(@"轮播广告", bannerActivity:)
        BUTTON_WITH_ACTION(@"列表广告", listActivity:)
        BUTTON_WITH_ACTION(@"单行广告", singleActivity:)
        BUTTON_WITH_ACTION(@"公告广告", annoucementActivity:)
        BUTTON_WITH_ACTION(@"H5弹屏广告", h5PopupActivity:)
    })
}

- (void)fullscreenActivity:(id)sender {
    [self showViewControllerWithDynamicViewID:kFullScreenViewId
                                        title:[(UIButton *)sender currentTitle]];
}

- (void)listHeaderActivity:(id)sender {
    [self showViewControllerWithDynamicViewID:kListHeaderViewId
                                        title:[(UIButton *)sender currentTitle]];
}

- (void)listFooterActivity:(id)sender {
    [self showViewControllerWithDynamicViewID:kListFooterViewId
                                        title:[(UIButton *)sender currentTitle]];
}

- (void)screenTopActivity:(id)sender {
    [self showViewControllerWithDynamicViewID:kScreenTopViewId
                                        title:[(UIButton *)sender currentTitle]];
}

- (void)screenBottomActivity:(id)sender {
    [self showViewControllerWithDynamicViewID:kScreenBottomViewId
                                        title:[(UIButton *)sender currentTitle]];
}

- (void)floatTopActivity:(id)sender {
    [self showViewControllerWithDynamicViewID:kFloatTopViewId
                                        title:[(UIButton *)sender currentTitle]];
}

- (void)h5PopupActivity:(id)sender {
    [self showViewControllerWithSpaceCode:kH5PopupSpaceCode
                                    title:[(UIButton *)sender currentTitle]];
}

- (void)bannerActivity:(id)sender {
    [self showViewControllerWithSpaceCode:kBannerSpaceCode
                                    title:[(UIButton *)sender currentTitle]];
}

- (void)listActivity:(id)sender {
    [self showViewControllerWithSpaceCode:kListSpaceCode
                                    title:[(UIButton *)sender currentTitle]];
}

- (void)singleActivity:(id)sender {
    [self showViewControllerWithSpaceCode:kSingleSpaceCode
                                    title:[(UIButton *)sender currentTitle]];
}

- (void)annoucementActivity:(id)sender {
    [self showViewControllerWithSpaceCode:kAnnouncementSpaceCode
                                    title:[(UIButton *)sender currentTitle]];
}

- (void)webviewActivity {
    NSString *url = @"https://mcube-prod.oss-cn-hangzhou.aliyuncs.com/226BA46061731-default/66666666/1.0.0.0_all/nebula/fallback/index.html";
    [[MPNebulaAdapterInterface shareInstance] startH5ViewControllerWithParams:@{@"url": url}];
}

- (void)showViewControllerWithSpaceCode:(NSString *)spaceCode title:(NSString *)title {
    MPCDPSpaceViewController *vc = [[MPCDPSpaceViewController alloc] init];
    vc.title = title;
    vc.spaceCode = spaceCode;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showViewControllerWithDynamicViewID:(NSString *)vcName title:(NSString *)title {
    Class vcClz = NSClassFromString(vcName);
    if (vcClz) {
        DTViewController *vc = [[vcClz alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
