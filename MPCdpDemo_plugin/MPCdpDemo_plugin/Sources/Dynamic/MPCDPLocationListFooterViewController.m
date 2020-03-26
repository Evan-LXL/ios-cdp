//
//  MPCDPLocationListFooterViewController.m
//  MPPromotionDemo
//
//  Created by shifei.wkp on 2019/8/3.
//  Copyright © 2019 Alipay. All rights reserved.
//

#import "MPCDPLocationListFooterViewController.h"

@interface MPCDPLocationListFooterViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation MPCDPLocationListFooterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.tableView.backgroundColor = AU_COLOR_CLIENT_BG1;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell id: %ld - %ld", (long)indexPath.section,(long)indexPath.row];
    return cell;
}

@end
