//
//  ViewController.m
//  UIProject
//
//  Created by 林晓峰 on 2018/8/9.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)createUI {
    [self createLabel];
    [self createRectButtons];
    [self createUIView];
}

- (void)createLabel {
    UILabel* label = [[UILabel alloc] init];
    label.text = @"Hello World!";
    label.frame = CGRectMake(80, 100, 100, 40);
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: 16];
    label.textColor = [UIColor blackColor];
//    label.shadowColor = [UIColor grayColor];
//    label.shadowOffset = CGSizeMake( 2, 2);
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0; //0会按照需要显示的行数进行显示
    [self.view addSubview:label];
}

-(void)createRectButtons {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 140, 100, 40);
    [btn setTitle:@"btn1" forState:UIControlStateNormal];
    [btn setTitle:@"btn2" forState:UIControlStateHighlighted];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:btn];
}

-(void)createUIView {
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(40, 200, 300, 300);
    view.backgroundColor = [UIColor blueColor];
    view.alpha = 0.5;
    [self.view addSubview:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
