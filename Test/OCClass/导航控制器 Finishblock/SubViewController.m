//
//  SubViewController.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/20.
//Copyright © 2018年 dow-np-162. All rights reserved.
//
 
#import "SubViewController.h"

#import "MainViewController.h"
#import "UINavigationController+finishBlock.h"
@interface SubViewController ()
 
@end
 
@implementation SubViewController
 
#pragma mark - LifeCycle
 
- (void)viewDidLoad{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 40);
    btn.backgroundColor = UIColor.orangeColor;
    [btn addTarget:self action:@selector(popMain) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style: UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = back;
}

-  (void)back {
    if (self.navigationController.finishBlock) {
        self.navigationController.finishBlock();
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)popMain {
    MainViewController *main = [[MainViewController alloc] init];
    main.title = @"pop main";
    UIViewController *root = [[self.navigationController viewControllers] firstObject];
    [self.navigationController setViewControllers:@[root, main]];
}
 
 
#pragma mark - UITableViewDelegate
 
#pragma mark - Public
 
#pragma mark - Private
 
#pragma mark - Getter
 
#pragma mark - Setter
 
@end
