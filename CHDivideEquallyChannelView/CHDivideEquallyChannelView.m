//
//  CHMineIndentTopChannelView.m
//  CHDivideEquallyChannelView
//
//  Created by 张晨晖 on 2018/7/25.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "CHDivideEquallyChannelView.h"
#import "UIButton+CHForbidHighlighted.h"
#import "Masonry.h"

@interface CHDivideEquallyChannelView ()

/// 保存按钮的数组
@property (nonatomic ,strong) NSArray <UIButton *> *arrayButton;

/// 上一个选中按钮
@property (nonatomic ,strong) UIButton *buttonLastSelected;

/// 指示条
@property (nonatomic ,strong) UIView *viewTwig;

@end

@implementation CHDivideEquallyChannelView {
    UIColor *_buttonNormalColor;
    UIColor *_buttonSelectedColor;
    UIFont *_buttonNormalFont;
    UIFont *_buttonSelectedFont;
    UIColor *_viewTwigBackgroundColor;
}

- (UIColor *)buttonNormalColor {
    if (!_buttonNormalColor) {
        _buttonNormalColor = [UIColor lightGrayColor];
    }
    return _buttonNormalColor;
}

- (UIColor *)buttonSelectedColor {
    if (!_buttonSelectedColor) {
        _buttonSelectedColor = [UIColor darkTextColor];
    }
    return _buttonSelectedColor;
}

- (UIFont *)buttonNormalFont {
    if (!_buttonNormalFont) {
        _buttonNormalFont = self.buttonSelectedFont;
    }
    return _buttonNormalFont;
}

- (UIFont *)buttonSelectedFont {
    if (!_buttonSelectedFont) {
        _buttonSelectedFont = [UIFont systemFontOfSize:15];
    }
    return _buttonSelectedFont;
}

- (UIView *)viewTwig {
    if (!_viewTwig) {
        _viewTwig = [[UIView alloc] init];
        _viewTwig.hidden = YES;
    }
    return _viewTwig;
}

- (UIColor *)viewTwigBackgroundColor {
    if (!_viewTwigBackgroundColor) {
        _viewTwigBackgroundColor = self.buttonSelectedColor;
    }
    return _viewTwigBackgroundColor;
}

- (CGFloat)viewTwigHeight {
    if (!_viewTwigHeight) {
        _viewTwigHeight = 2;
    }
    return _viewTwigHeight;
}

- (CGFloat )viewTwigWidth {
    if (!_viewTwigWidth) {
        _viewTwigWidth = 10;
    }
    return _viewTwigWidth;
}

- (void)setShouldHideTwigView:(BOOL)shouldHideTwigView {
    _shouldHideTwigView = shouldHideTwigView;
    self.viewTwig.hidden = shouldHideTwigView;
}

- (void)setViewTwigBackgroundColor:(UIColor *)viewTwigBackgroundColor {
    _viewTwigBackgroundColor = viewTwigBackgroundColor;
    self.viewTwig.backgroundColor = viewTwigBackgroundColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.viewTwig];
}

- (void)reloadData {
    self.viewTwig.hidden = YES;
    for (UIView *subView in self.arrayButton) {
        [subView removeFromSuperview];
    }
    if (self.arrayTitle.count != 0) {
        /// 分母
        NSInteger denominator;
        /// 分子
        NSInteger numerator;
        denominator = self.arrayTitle.count + 1;
        NSMutableArray *arrayM = [NSMutableArray array];
        for (int i = 0; i < self.arrayTitle.count; i++) {
            UIButton *button = [UIButton new];
            [self addSubview:button];
            numerator = i + 1;
            float multiplied = [[NSNumber numberWithInteger:numerator] floatValue] / [[NSNumber numberWithInteger:denominator] floatValue] * 2;
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self).multipliedBy(multiplied);
                make.centerY.equalTo(self);
            }];
            button.titleLabel.font = self.buttonNormalFont;
            [button setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [button setTitleColor:self.buttonSelectedColor forState:UIControlStateSelected];
            [button setTitle:self.arrayTitle[i] forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [arrayM addObject:button];
        }
        self.arrayButton = arrayM.copy;
        [self setSelectedButton:self.arrayButton.firstObject];
    }
}

- (void)setButtonLastSelected:(UIButton *)buttonLastSelected {
    switch (self.twigViewAnimationType) {
        case CHDivideEquallyChannelViewTwigViewAnimationTypeDefault: {
            [self updateTwigViewDefaultTypeWith:buttonLastSelected];
        }
            break;
        case CHDivideEquallyChannelViewTwigViewAnimationTypeBounces: {
            if (_buttonLastSelected) {
                [self.viewTwig mas_remakeConstraints:^(MASConstraintMaker *make) {
                    if (buttonLastSelected.tag > self->_buttonLastSelected.tag) {//点击在右边
                        make.left.equalTo(self->_buttonLastSelected);
                        make.right.equalTo(buttonLastSelected);
                    } else {
                        make.left.equalTo(buttonLastSelected);
                        make.right.equalTo(self->_buttonLastSelected);
                    }
                    make.bottom.offset(-self.twigViewBottom);
                    make.height.offset(self.viewTwigHeight);
                }];
                [UIView animateWithDuration:.25 animations:^{
                    [self layoutIfNeeded];
                } completion:^(BOOL finished) {
                    self->_buttonLastSelected = buttonLastSelected;
                    [self.viewTwig mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(buttonLastSelected);
                        make.bottom.offset(-self.twigViewBottom);
                        if (self.shouldTwigViewWidthEquateToSelectedButton) {
                            make.width.equalTo(buttonLastSelected.mas_width);
                        } else {
                            make.width.offset(self.viewTwigWidth);
                        }
                        make.height.offset(self.viewTwigHeight);
                    }];
                    if (self.viewTwig.hidden == YES) {
                        [self layoutIfNeeded];
                        self.viewTwig.hidden = self.shouldHideTwigView;
                    } else {
                        [UIView animateWithDuration:.25 animations:^{
                            [self layoutIfNeeded];
                        }];
                    }
                }];
            } else {
                [self updateTwigViewDefaultTypeWith:buttonLastSelected];
            }
        }
            break;
        default: {
            [self updateTwigViewDefaultTypeWith:buttonLastSelected];
        }
            break;
    }
}

- (void)updateTwigViewDefaultTypeWith:(UIButton *)buttonLastSelected {
    _buttonLastSelected = buttonLastSelected;
    [self.viewTwig mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(buttonLastSelected);
        make.bottom.offset(-self.twigViewBottom);
        if (self.shouldTwigViewWidthEquateToSelectedButton) {
            make.width.equalTo(buttonLastSelected.mas_width);
        } else {
            make.width.offset(self.viewTwigWidth);
        }
        make.height.offset(self.viewTwigHeight);
    }];
    if (self.viewTwig.hidden == YES) {
        [self layoutIfNeeded];
        self.viewTwig.hidden = self.shouldHideTwigView;
    } else {
        [UIView animateWithDuration:.25 animations:^{
            [self layoutIfNeeded];
        }];
    }
}

- (void)buttonClick:(UIButton *)sender {
    [self setSelectedButton:sender];
    if (self.channelViewClickBlock) {
        self.channelViewClickBlock(sender.tag);
    }
}

- (void)setSelectedButton:(UIButton *)sender {
    self.buttonLastSelected.titleLabel.font = self.buttonNormalFont;
    sender.titleLabel.font = self.buttonSelectedFont;
    if (sender.selected == YES) {
        return;
    }
    sender.selected = !sender.selected;
    self.buttonLastSelected.selected = !self.buttonLastSelected.selected;
    self.buttonLastSelected = sender;
}

- (void)setSelectTag:(NSInteger)selectTag {
    _selectTag = selectTag;
    self.buttonLastSelected.selected = NO;
    self.arrayButton[selectTag].selected = YES;
    self.buttonLastSelected = self.arrayButton[selectTag];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.shouldTwigViewBeRadius) {
        self.viewTwig.backgroundColor = self.viewTwigBackgroundColor;
        self.viewTwig.layer.cornerRadius = self.viewTwig.bounds.size.height / 2;
        self.viewTwig.layer.masksToBounds = YES;
    }
}

@end
