//
//  LikeAnimationButton.h
//  AnimationZanDemo
//
//  Created by 星梦 on 2020/3/12.
//  Copyright © 2020 星梦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LikeAnimationButton : UIView
//正常情况下的图片
@property(nonatomic,strong) NSString * normalImage;
//选中时的图片
@property(nonatomic,strong) NSString * selectedImage;
//标题
@property(nonatomic,strong) NSString * title;
//是否选中
@property(nonatomic,assign) BOOL selected;
//开始动画 动画消失
- (void)startAnimation;
@property(nonatomic,copy)void(^animationComplete)(void);

@property(nonatomic,copy)void(^animationBeign)(void);
@end

NS_ASSUME_NONNULL_END
