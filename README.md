# CHDivideEquallyChannelView

## 效果

![](https://github.com/MeteoriteMan/Assets/blob/master/gif/CHDivideEquallyChannelView-iPhone%20X.gif?raw=true)

## 使用

```
self.divideEquallyChannelView = [[CHDivideEquallyChannelView alloc] init];
[self.view addSubview:self.divideEquallyChannelView];
[self.divideEquallyChannelView mas_makeConstraints:^(MASConstraintMaker *make) {
	make.left.right.offset(0);
	make.height.offset(44);
	make.top.equalTo(self.mas_topLayoutGuide);
}];
[self.divideEquallyChannelView reloadData];
```

## 安装

使用 [CocoaPods](http://www.cocoapods.com/) 集成.
首先在podfile中
>`pod 'CHDivideEquallyChannelView'`

安装一下pod

>`#import <CHDivideEquallyChannelView/CHDivideEquallyChannelView.h>`

## 更新记录

|版本|更新内容|
|:--|:--|
|0.0.5|新增twigView距离底边距离|
|0.0.4|修复偶数个布局时的Bug|
|0.0.3|新增一个TwigView的过度动画|
|0.0.2|修复不能设置0.0.1版本TwigView颜色的BUG|
|0.0.1|支持设置TwigView,是否隐藏等.正常/选中状态字体,文字颜色设置.|