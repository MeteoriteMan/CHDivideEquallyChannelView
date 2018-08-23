//
//  CHMineIndentTopChannelView.h
//  CHDivideEquallyChannelView
//
//  Created by 张晨晖 on 2018/7/25.
//  Copyright © 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CHDivideEquallyChannelViewClickBlock)(NSInteger tag);

@interface CHDivideEquallyChannelView : UIView

/// 传入arrayTitle,创建Button
@property (nonatomic ,strong) NSArray <NSString *> *arrayTitle;

/// 按钮普通状态颜色
@property (nonatomic ,strong) UIColor *buttonNormalColor;

/// 按钮选中状态颜色
@property (nonatomic ,strong) UIColor *buttonSelectedColor;

/// 按钮普通状态字体
@property (nonatomic ,strong) UIFont *buttonNormalFont;

/// 按钮选中状态字体
@property (nonatomic ,strong) UIFont *buttonSelectedFont;

/// 指示器View
@property (nonatomic ,strong) UIColor *viewTwigBackgroundColor;

/// 指示器View高度
@property (nonatomic ,assign) CGFloat viewTwigHeight;

/// 指示器View宽度
@property (nonatomic ,assign) CGFloat viewTwigWidth;

/// 是否隐藏指示器
@property (nonatomic ,assign) BOOL shouldHideTwigView;

/// 是否对TwigView切圆角
@property (nonatomic ,assign) BOOL shouldTwigViewBeRadius;

/// 是否对TwigView宽度是否和选中按钮相等,如果设置为YES.设置TwigView失效
@property (nonatomic ,assign) BOOL shouldTwigViewWidthEquateToSelectedButton;

/// 选中标签
@property (nonatomic ,assign) NSInteger selectTag;

/// 点击标签回调Block
@property (nonatomic ,copy) CHDivideEquallyChannelViewClickBlock channelViewClickBlock;

- (void)reloadData;

@end
