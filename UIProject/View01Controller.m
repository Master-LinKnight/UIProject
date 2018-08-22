//
//  View01Controller.m
//  UIProject
//
//  Created by Knight on 2018/8/17.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import "View01Controller.h"
#import "UIProject-Swift.h"

@interface View01Controller ()

@end

@implementation View01Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void) createUI {
    [self createButton];
    [self createScrollView];
}

- (void) createScrollView {
    UIScrollView* sv = [[UIScrollView alloc] init];
    sv.frame = CGRectMake(0, 150, 320, 576);
    sv.pagingEnabled = YES;
    sv.scrollEnabled = YES;
    sv.contentSize = CGSizeMake(320*5, 576);
    sv.bounces = YES;
    sv.alwaysBounceHorizontal = YES;
    sv.alwaysBounceVertical = YES;
    sv.showsVerticalScrollIndicator = YES;
    sv.showsHorizontalScrollIndicator = YES;
    sv.backgroundColor = [UIColor yellowColor];
    [self.view addSubview: sv];
}

- (void) createButton {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) pressBtn {
    ViewSwiftController *vc = [[ViewSwiftController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
