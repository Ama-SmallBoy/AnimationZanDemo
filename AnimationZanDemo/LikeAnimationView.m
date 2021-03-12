//
//  LikeAnimationView.m
//  AnimationZanDemo
//
//  Created by 星梦 on 2020/3/12.
//  Copyright © 2020 星梦. All rights reserved.
//

#import "LikeAnimationView.h"
#import "AppDelegate.h"
@interface LikeAnimationView ()
@property(nonatomic,strong)UIImageView * imgViewBig;
@end
#define kAnimationDuration 1.0
#define kImageHeight 150
@implementation LikeAnimationView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultUI];
    }
    return self;
}
-(void)initDefaultUI{
    [self addSubview:self.imgViewBig];
    [self initImageViewAnimationImages];
}
-(void)initImageViewAnimationImages{
    NSMutableArray * images = [NSMutableArray array];
    for (int i = 0; i<=29; i++) {
       UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"like%d",i]];
       [images addObject:image];
    }
    [self.imgViewBig setAnimationImages:images];
    [self.imgViewBig setAnimationRepeatCount:0];
    [self.imgViewBig setAnimationDuration:kAnimationDuration];
}
//开始动画 动画消失
- (void)startAnimation{
    [[UIApplication sharedApplication].windows.firstObject addSubview:self];
    [self.imgViewBig startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((kAnimationDuration - 0.2) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self imgAnimationStop];
    });
}
//停止删除
-(void)imgAnimationStop{
    [self.imgViewBig stopAnimating];
    [self.imgViewBig.layer removeAllAnimations];
    [self removeFromSuperview];
}
-(UIImageView *)imgViewBig{
    if (!_imgViewBig) {
        _imgViewBig = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kImageHeight, kImageHeight)];
        _imgViewBig.center = CGPointMake(self.center.x, self.center.y);
    }
    return _imgViewBig;
}
@end
