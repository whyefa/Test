//
//  MainViewController.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/20.
//Copyright © 2018年 dow-np-162. All rights reserved.
//
 
#import "MainViewController.h"
#import "SubViewController.h"
#import "UINavigationController+finishBlock.h"
@interface MainViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) float progress;
@property (nonatomic, strong) UIProgressView *prog;
@end
 
@implementation MainViewController
 
#pragma mark - LifeCycle

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 40);
    btn.backgroundColor = UIColor.orangeColor;
    [btn addTarget:self action:@selector(pushSub) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style: UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = back;
    _prog = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    _prog.frame = CGRectMake(50, 500, 300, 10);
    _prog.progress = 0;
    [self.view addSubview:_prog];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(load) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)load {
    _progress += 0.01;
    _prog.progress = _progress;
}

-  (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)pushSub {
    SubViewController *sub = [[SubViewController alloc] init];
    sub.title = @"m-sub";
    __weak MainViewController *weakSelf = self;
    self.navigationController.finishBlock = ^{
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        weakSelf.navigationController.finishBlock = nil ;
    };
    [self.navigationController pushViewController:sub animated:YES];
}
 
#pragma mark - UITableViewDelegate
 
#pragma mark - Public
 
#pragma mark - Private
 
#pragma mark - Getter
 
#pragma mark - Setter
 
@end
