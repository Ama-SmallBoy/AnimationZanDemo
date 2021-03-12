//
//  LikeAnimationButton.m
//  AnimationZanDemo
//
//  Created by 星梦 on 2020/3/12.
//  Copyright © 2020 星梦. All rights reserved.
//

#import "LikeAnimationButton.h"
#import "PublicConfig.h"
#import "Masonry.h"

#define kAnimationDuration 1.0
#define kImageLeftSpace -10
#define kTitleRightSpace 2
#define kTitleLeftSpace - 20
#define kTitleBottomSpace 0
#define kImageBottomSpace 10
#define kImageSize CGSizeMake(45,45)

@interface LikeAnimationButton ()
@property(nonatomic,strong)UIImageView * imgViewBig;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton * actionButn;
@property(nonatomic,assign)CGFloat titleWidth;
@end

@implementation LikeAnimationButton
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultUI];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self initDefaultUI];
        //self.backgroundColor = [UIColor redColor];
    }
    return self;
}
-(void)initDefaultUI{
    [self initImageViewAnimationImages];
    [self addSubview:self.imgViewBig];
    [self addSubview:self.titleLabel];
    [self addSubview:self.actionButn];
    //图片
    [_imgViewBig mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kImageLeftSpace);
        make.height.equalTo(@(kImageSize.height));
        make.width.equalTo(@(kImageSize.width));
        make.bottom.equalTo(self).offset(kImageBottomSpace);
    }];
    //标题
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kTitleRightSpace);
        make.width.equalTo(@(_titleWidth));
        make.bottom.equalTo(self).offset(-kTitleBottomSpace);
    }];
    //动作事件
    [_actionButn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self);
    }];
}
//#pragma mark--------- setter 方法 --
-(void)setTitleWidth:(CGFloat)titleWidth{
    _titleWidth = titleWidth;
    [self changeFrame:_titleWidth+kImageSize.width+kImageLeftSpace+kTitleLeftSpace+kTitleRightSpace];
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kTitleRightSpace);
        make.width.equalTo(@(_titleWidth));
        make.bottom.equalTo(self).offset(-kTitleBottomSpace);
    }];
    
}
-(void)setTitle:(NSString *)title{
    _title = title;
    //设置标题更改自身宽度
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    self.titleWidth =_titleLabel.frame.size.width;
}
//更改自身的宽度
-(void)changeFrame:(CGFloat)width{
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
    }];
//    CGRect frame = self.frame;
//    frame.size.width = width;
//    frame.origin.x = SCREEN_WIDTH - 15-width;
//    self.frame = frame;
}
-(void)setSelected:(BOOL)selected{
    _selected = selected;
    _selected?(_imgViewBig.image = [UIImage imageNamed:_selectedImage]):(_imgViewBig.image = [UIImage imageNamed:_normalImage]);
}
-(void)setNormalImage:(NSString *)normalImage{
    _normalImage = normalImage;
    _imgViewBig.image = [UIImage imageNamed:normalImage];
}
-(void)setSelectedImage:(NSString *)selectedImage{
    _selectedImage = selectedImage;
}
#pragma mark---------- 动画相关方法 ---
-(void)initImageViewAnimationImages{
    NSMutableArray * images = [NSMutableArray array];
    for (int i = 0; i<=29; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"like%d",i]];
        [images addObject:image];
    }
    [self.imgViewBig setAnimationImages:images];
    [_imgViewBig setAnimationRepeatCount:0];
    [_imgViewBig setAnimationDuration:kAnimationDuration];
}
//开始动画 动画消失
- (void)startAnimation{
    [_imgViewBig startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((kAnimationDuration - 0.2) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self imgAnimationStop];
        if (self.animationComplete) {
            self.animationComplete();
        }
    });
}
//停止删除
-(void)imgAnimationStop{
    [_imgViewBig stopAnimating];
    [_imgViewBig.layer removeAllAnimations];
}
#pragma mark---------- 一波懒加载 ---
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLabel.textColor = kUIColorFromRGB(0x333333, 1.0);
        _titleLabel.font = [UIFont systemFontOfSize:13.0];
        _titleLabel.userInteractionEnabled =YES;
        //_titleLabel.backgroundColor = [UIColor orangeColor];
    }
    return _titleLabel;
}

-(UIButton *)actionButn{
    if (!_actionButn) {
        _actionButn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        [_actionButn addTarget:self action:@selector(didTargateAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButn;
}
-(UIImageView *)imgViewBig{
    if (!_imgViewBig) {
        _imgViewBig = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_imgViewBig.backgroundColor = [UIColor blueColor];
        _imgViewBig.userInteractionEnabled = YES;
    }
    return _imgViewBig;
}
-(void)didTargateAction:(UIButton *)sendder{
    if (self.animationBeign) {
        self.animationBeign();
    }
}
@end
