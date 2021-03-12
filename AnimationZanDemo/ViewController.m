//
//  ViewController.m
//  AnimationZanDemo
//
//  Created by 星梦 on 2020/3/12.
//  Copyright © 2020 星梦. All rights reserved.
//

#import "ViewController.h"
#import "FisrtTableViewController.h"
#import "LikeAnimationView.h"
#import "LikeAnimationButton.h"
#import "Masonry.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView *imgViewBig;
@property(nonatomic,strong)UIImageView *imgViewSmall;
@property(nonatomic,strong)LikeAnimationView * likeAnimationView;
@property(nonatomic,strong)LikeAnimationButton * likeAnimationButton;
@end
#define kAnimationDuration 1.5
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //帧动画
//    self.imgViewBig = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
//    self.imgViewBig.contentMode = UIViewContentModeCenter;
//    [self.view addSubview:self.imgViewBig];
//
//    self.imgViewSmall = [[UIImageView alloc]initWithFrame:CGRectMake(0, 400, 40, 40)];
//    [self.view addSubview:self.imgViewSmall];
//    NSMutableArray * images = [NSMutableArray array];
//    for (int i = 0; i<=29; i++) {
//        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"like%d.png",i]];
//        [images addObject:image];
//    }
//    [self startAnimation4ConnectionWithImagesArray:images.copy];
    
    [self.view addSubview:self.likeAnimationButton];
    [_likeAnimationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-15);
        make.centerY.mas_equalTo(self.view.mas_centerY).mas_offset(0);
        make.height.mas_equalTo(@(30));
    }];
}
//NSArray *_arrayImages4Connecting; 几张图片按顺序切换
//- (void)startAnimation4ConnectionWithImagesArray:(NSArray*) imagesArary{
//    [self.imgViewBig setAnimationImages:imagesArary];
//    [self.imgViewBig setAnimationRepeatCount:0];
//    [self.imgViewBig setAnimationDuration:kAnimationDuration];
//
//    [self.imgViewSmall setAnimationImages:imagesArary];
//    [self.imgViewSmall setAnimationRepeatCount:0];
//    [self.imgViewSmall setAnimationDuration:kAnimationDuration];
//
//
//    [self.imgViewSmall startAnimating];
//    [self.imgViewBig startAnimating];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((kAnimationDuration - 0.2) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//         [self imgAnimationStop];
//    });
//}
- (IBAction)pushNextControllerAction:(UIButton *)sender {
//    FisrtTableViewController * fisrtTableViewController = [[FisrtTableViewController alloc]init];
//    [self.navigationController pushViewController:fisrtTableViewController animated:YES];
    [self.likeAnimationView startAnimation];
}
////停止删除
//-(void)imgAnimationStop{
//    [self.imgViewBig stopAnimating];
//    [self.imgViewSmall stopAnimating];
//    [self.imgViewBig.layer removeAllAnimations];
//    [self.imgViewSmall.layer removeAllAnimations];
//}
-(LikeAnimationView *)likeAnimationView{
    if (!_likeAnimationView) {
        _likeAnimationView = [[LikeAnimationView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _likeAnimationView.backgroundColor = [UIColor clearColor];
    }
    return _likeAnimationView;
}
-(LikeAnimationButton *)likeAnimationButton{
    if (!_likeAnimationButton) {
        _likeAnimationButton= [[LikeAnimationButton alloc]initWithFrame:CGRectZero];
        _likeAnimationButton.normalImage = @"like3";
        _likeAnimationButton.selectedImage = @"like3";
        _likeAnimationButton.title = @" 1 ";
        __weak typeof(self) weakSelf = self;
        _likeAnimationButton.animationComplete = ^{
            //更改状态
            weakSelf.likeAnimationButton.title = @" 10 ";
            weakSelf.likeAnimationButton.selected=!weakSelf.likeAnimationButton.selected;
        };
        _likeAnimationButton.animationBeign  = ^{
            [weakSelf.likeAnimationView startAnimation];
            [weakSelf.likeAnimationButton startAnimation];
         };
    }
    return _likeAnimationButton;
}

//-(LikeAnimationButton *)likeAnimationButton{
//    if (!_likeAnimationButton) {
//        _likeAnimationButton= [[LikeAnimationButton alloc]init];
//        _li
//        [_likeAnimationButton setTitle:@" 1 " forState:UIControlStateNormal];
//        [_likeAnimationButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [_likeAnimationButton setImage:[UIImage imageNamed:@"likeno"] forState:UIControlStateNormal];
//        [_likeAnimationButton setImage:[UIImage imageNamed:@"likes"] forState:UIControlStateSelected];
//        [_likeAnimationButton addTarget:self action:@selector(didAddLikeAction:) forControlEvents:UIControlEventTouchUpInside];
//        __weak typeof(self) weakSelf = self;
//        _likeAnimationButton.animationComplete = ^{
//            //更改状态
//            [weakSelf.likeAnimationButton setTitle:@" 100 " forState:UIControlStateNormal];
//            weakSelf.likeAnimationButton.selected=!weakSelf.likeAnimationButton.selected;
//        };
//    }
//    return _likeAnimationButton;
//}
//-(void)didAddLikeAction:(UIButton *)sender{
//
//    [self.likeAnimationView startAnimation];
//    [self.likeAnimationButton startAnimation];
//
//}
@end
