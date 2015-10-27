//
//  XWTabBarVC.m
//  WeiboOC
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 ZXW. All rights reserved.
//

#import "XWTabBarVC.h"
#import "XWHomeTableVC.h"
#import "XWMessageTableVC.h"
#import "XWDiscoverTableVC.h"
#import "XWProfileTableVC.h"

@interface XWTabBarVC ()
@property(nonatomic,strong) UIButton *compassBtn;
//@property(nonatomic,strong) UIViewController *vc;
@end

@implementation XWTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    XWHomeTableVC *homeVc = [[XWHomeTableVC alloc]init];
    [self addChildViewController:homeVc title:@"首页" imageName:@"tabbar_home"];
    
    XWMessageTableVC *messageVc = [[XWMessageTableVC alloc]init];
    [self addChildViewController:messageVc title:@"消息" imageName:@"tabbar_message_center"];
    
    // 往tabBar中添加一个占位控制器
    UIViewController *vc = [[UIViewController alloc]init];
    
    [self addChildViewController:vc title:@"" imageName:@""];
    
    XWDiscoverTableVC *discoverVc = [[XWDiscoverTableVC alloc]init];
    [self addChildViewController:discoverVc title:@"发现" imageName:@"tabbar_discover"];
    
    XWProfileTableVC *profileVc = [[ XWProfileTableVC alloc]init];
    [self addChildViewController:profileVc title:@"发现" imageName:@"tabbar_profile"];
    
}

#pragma mark - 当视图即将出现时，计算占位控制器的frame
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CGFloat width = self.tabBar.frame.size.width / 5;
    
    self.compassBtn.frame = CGRectMake(width*2, 0, width, self.tabBar.frame.size.height);
// MARK: 往tabBar添加子控件
    [self.tabBar addSubview:self.compassBtn];
}

#pragma mark - 往tabBar上嵌套导航控制器
-(void)addChildViewController:(UIViewController *)childController title:(NSString *) title imageName: (NSString*)imageName{
    UINavigationController *nav = [[UINavigationController alloc]init];
    
    [nav addChildViewController:childController];
    
    childController.title = title;
    //[self.tabBarItem setImage:[UIImage imageNamed:imageName]];
// MARK: - 注意是控制器的tabBarItem
    [childController.tabBarItem setImage:[UIImage imageNamed:imageName]];
    
    [self addChildViewController:nav];
}

#pragma mark - 懒加载button
-(UIButton *)compassBtn{
    if (!_compassBtn) {
        _compassBtn = [[UIButton alloc]init];
        [_compassBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_compassBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_compassBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
         [_compassBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    }
    return  _compassBtn;
}



@end
