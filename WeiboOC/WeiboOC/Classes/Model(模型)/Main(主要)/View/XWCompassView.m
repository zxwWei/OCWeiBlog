//
//  XWCompassView.m
//  WeiboOC
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 ZXW. All rights reserved.
//

#import "XWCompassView.h"

@interface XWCompassView ()
@property(nonatomic,strong) UIImageView *rotationIconView;
@property(nonatomic,strong) UIImageView *homeView;
@property(nonatomic,strong) UILabel *messageLabel;
@property(nonatomic,strong) UIButton *registerButton;
@property(nonatomic,strong) UIButton *loginButton;

@end


@implementation XWCompassView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

#pragma mark 子控件的添加及约束
-(void)setupSubviews{
    [self addSubview:self.rotationIconView];
    [self addSubview:self.homeView];
    [self addSubview:self.messageLabel];
    [self addSubview:self.registerButton];
    [self addSubview:self.loginButton];
    
    // 取消autoresizing
    self.rotationIconView.translatesAutoresizingMaskIntoConstraints = NO;
    self.homeView.translatesAutoresizingMaskIntoConstraints = NO;
    self.messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    
// MARK: - OC添加约束方法 注意注意
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rotationIconView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rotationIconView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-70]];
    
    
    // 房子
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.homeView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.homeView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-70]];
    
    // 信息按钮
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.rotationIconView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.homeView attribute:NSLayoutAttributeBottom multiplier:1 constant:46]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:240]];
   
    // 注册按钮
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.messageLabel attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.messageLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:16]];
    
    // 注册按钮
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.messageLabel attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.messageLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:16]];
}




#pragma mark 懒加载
-(UIImageView *)rotationIconView{
    if (!_rotationIconView) {
        _rotationIconView = [[UIImageView alloc]init];
        
        _rotationIconView.image = [UIImage imageNamed:@"visitordiscover_feed_image_smallicon"];
        [_rotationIconView sizeToFit];
    }
    return _rotationIconView;
}

-(UIImageView *)homeView{
    if (!_homeView) {
        _homeView = [[UIImageView alloc]init];
        _homeView.image = [UIImage imageNamed:@"visitordiscover_feed_image_house"];
        [_homeView sizeToFit];
    }
    return _homeView;
}

-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.text = @"想看更多的好东西吗";
    // MARK: -分行啊
        _messageLabel.numberOfLines = 0;
        _messageLabel.textColor = [UIColor blackColor];
    }
    return _messageLabel;
}

-(UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc]init];
        [_registerButton setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_registerButton sizeToFit];
    }
    return _registerButton;
}

-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc]init];
        
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton sizeToFit];
    }
    return _loginButton;
}



@end
