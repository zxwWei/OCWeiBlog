//
//  XWCompassVC.m
//  WeiboOC
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 ZXW. All rights reserved.
//

#import "XWCompassVC.h"
#import "XWCompassView.h"

@interface XWCompassVC ()

@property(nonatomic,assign) BOOL userLogin;
@end

@implementation XWCompassVC

-(void)viewDidLoad{
    [super viewDidLoad];
    // 在某地方处理这个self.userLogin
    //self.userLogin = NO;
}

// MARK:  当加载的时候loadview时，当没登陆的时候进入这个界面
-(void)loadView{
    //self.userLogin = YES;
    self.userLogin ? [super loadView] : [self setupVistor] ;

}

// 替代的界面
-(void)setupVistor{
    //NSLog(@"d");
    self.view = [[XWCompassView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
