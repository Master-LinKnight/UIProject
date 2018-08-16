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
    [self createButtonEvent];
    [self createStoreyView];
}

- (void)createLabel {
    UILabel* label = [[UILabel alloc] init];
    label.text = @"Hello World!";
    label.frame = CGRectMake(80, 100, 100, 40);
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: 16];
    label.textColor = [UIColor blackColor];
    label.shadowColor = [UIColor grayColor];
    label.shadowOffset = CGSizeMake( 1, 1);
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0; //0会按照需要显示的行数进行显示
    [self.view addSubview:label];
}

-(void)createRectButtons {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 140, 100, 40);
    [btn setTitle:@"btn1" forState:UIControlStateNormal];
    [btn setTitle:@"btn2" forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"arrow-1.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"arrow-2.png"] forState:UIControlStateHighlighted];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.tag = 100;
    [self.view addSubview:btn];
}

-(void)createButtonEvent {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 170, 100, 40);
    [btn setTitle:@"btn03" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    btn.tag = 200;
    [self.view addSubview:btn];
}

-(void) pressBtn: (UIButton*) btn {
    if (btn.tag == 100) {
        NSLog(@"btn01");
    } else {
        NSLog(@"btn03");
    }
    NSLog(@"%@", btn);
}

-(void) touchDown {
    NSLog(@"按钮按下！");
}

-(void)createUIView {
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(40, 200, 200, 200);
    view.backgroundColor = [UIColor blueColor];
    view.alpha = 0.5;
    view.hidden = YES;
    UILabel* label = [self createTextLabel: @"Hello"];
    [view addSubview:label];
    [self.view addSubview:view];
}

- (UILabel*)createTextLabel: (NSString*) value {
    UILabel* label = [[UILabel alloc] init];
    label.text = value;
    label.frame = CGRectMake(80, 100, 100, 40);
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: 16];
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake( 1, 1);
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0; //0会按照需要显示的行数进行显示
    return label;
}

-(void) createStoreyView{
    UIView* view01 = [[UIView alloc] init];
    view01.frame = CGRectMake(100, 200, 150, 150);
    view01.backgroundColor = [UIColor blueColor];
    UIView* view02 = [[UIView alloc] init];
    view02.frame = CGRectMake(125, 225, 150, 150);
    view02.backgroundColor = [UIColor redColor];
    UIView* view03 = [[UIView alloc] init];
    view03.frame = CGRectMake(150, 250, 150, 150);
    view03.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view01];
    [self.view addSubview:view02];
    [self.view addSubview:view03];
    
//    [self.view bringSubviewToFront:view02];
//    [self.view sendSubviewToBack:view03];
//    UIView* viewFront = self.view.subviews[2];
//    UIView* viewBack = self.view.subviews[0];
//    if (viewBack == view01) {
//        NSLog(@"equal");
//    }
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
