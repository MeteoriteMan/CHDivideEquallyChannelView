//
//  ViewController.m
//  CHDivideEquallyChannelView-Demo
//
//  Created by 张晨晖 on 2018/8/23.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "CHDivideEquallyChannelView.h"

@interface ViewController ()

@property (nonatomic ,strong) CHDivideEquallyChannelView *divideEquallyChannelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.divideEquallyChannelView = [[CHDivideEquallyChannelView alloc] init];
    self.divideEquallyChannelView.buttonNormalFont = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
    self.divideEquallyChannelView.buttonSelectedFont = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    self.divideEquallyChannelView.shouldTwigViewBeRadius = YES;
    self.divideEquallyChannelView.viewTwigWidth = 10;
    self.divideEquallyChannelView.viewTwigHeight = 6;
    self.divideEquallyChannelView.shouldTwigViewWidthEquateToSelectedButton = YES;
    self.divideEquallyChannelView.arrayTitle = @[@"史泽东" ,@"董雷" ,@"村上村树"];
    [self.view addSubview:self.divideEquallyChannelView];
    [self.divideEquallyChannelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.offset(44);
        make.top.equalTo(self.mas_topLayoutGuide);
    }];
    [self.divideEquallyChannelView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
