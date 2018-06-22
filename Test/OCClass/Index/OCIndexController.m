//
//  OCIndexController.m
//  Test
//
//  Created by dow-np-162 on 2018/4/27.
//  Copyright © 2018年 yefa. All rights reserved.
//

#import "OCIndexController.h"

#import "MainViewController.h"
#import "SubViewController.h"
#import "UINavigationController+finishBlock.h"

#import "AObj.h"
#import "BObj.h"
#import "ZObject.h"
#import <objc/runtime.h>
#import "AnimalFacatory.h"
#import "ChickenFactory.h"
#import "DuckFactory.h"
#import "Dog.h"
#import "Cat.h"
#import "Chicken.h"
#import "Duck.h"
#import "PhotoPrinter.h"



@interface MyObject<__covariant O>: NSObject

@property (nonatomic, strong) O obj;

@end

@implementation MyObject

@end


@interface OCIndexController ()

@property (nonatomic, strong) NSArray *data;
@property (strong, nonatomic) IBOutlet UITableView *listView;

@end

@implementation OCIndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"OC代码测试";
    [self.listView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark getter& setter
- (NSArray *)data {
    return @[@{@"title": @"简单工厂", @"action": @"simpleFactory"},
             @{@"title": @"常规工厂", @"action": @"factory"},
             @{@"title": @"消息转发", @"action": @"swizzingMethod"},
             @{@"title": @"绘制文字", @"action": @"drawText"},
             @{@"title": @"简单工厂", @"action": @"simpleFactory"}
             
             ];
}

#pragma mark- private
#pragma mark- 文字绘制
- (void)drawText {
    
}

#pragma mark- 工厂模式
- (void)simpleFactory {
    Dog *d = [AnimalFacatory createDog:@"旺财"];
    [d laugh];
    Cat *c = [AnimalFacatory createCat:@"咪咪"];
    [c laugh];
}

- (void)factory {
    Chicken *c = [ChickenFactory createPoultry:@"大公鸡"];
    [c laugh];
    Duck *d = [DuckFactory createPoultry:@"小黄鸭"];
    [d laugh];
}

#pragma mark- 消息转发
- (void)swizzingMethod {
    PhotoPrinter *printer = [[PhotoPrinter alloc] init];
    [printer performSelector:@selector(print) withObject:nil];
    [printer printPhoto:@"大头贴"];
    [printer performSelector:@selector(printCMD) withObject:nil];
}

#pragma mark- 导航控制器 FinishBlock
- (void)finishUI {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 40);
    [btn setTitle:@"跳转 Main" forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.orangeColor;
    [btn addTarget:self action:@selector(pushMain) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 200, 200, 40);
    [btn2 setTitle:@"跳转 Sub" forState:UIControlStateNormal];
    btn2.backgroundColor = UIColor.orangeColor;
    [btn2 addTarget:self action:@selector(pushSub) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

-  (void)pushSub {
    SubViewController *main = [[SubViewController alloc] init];
    main.title = @"index->sub";
    [self.navigationController pushViewController:main animated:YES];
}

- (void)pushMain {
    MainViewController *main = [[MainViewController alloc] init];
    main.title = @"index->main";
    [self.navigationController pushViewController:main animated:YES];
}

#pragma mark- 泛型
- (void)idGeneric{
    AObj *a = [[AObj alloc] init];
    BObj *b = [[BObj alloc] init];
    ZObject * z = [[ZObject alloc] init];
    [a print:b];
    [a print:z];
}

- (void)generic {
    NSArray<NSString *> * ar = @[@"11"];
    MyObject * o = [[MyObject alloc] init];
    o.obj = @"111";
    
    MyObject * o1 = [[MyObject alloc] init];
    o1.obj = @[@"111"];
    
    MyObject * o2 = [[MyObject alloc] init];
    o2.obj = @{@"1": @"111"};
    
    NSLog(@"o.obj %@",o.obj);
    NSLog(@"o1.obj %@",o1.obj);
    NSLog(@"o2.obj %@",o2.obj);
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSString *actionStr = [self.data[indexPath.row] valueForKey:@"action"];
    if (actionStr) {
        SEL sel = NSSelectorFromString(actionStr);
        [self performSelector:sel withObject:nil];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.data[indexPath.row] valueForKey:@"title"];
    return cell;
}



@end
