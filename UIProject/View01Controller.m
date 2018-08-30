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
    [self createView];
//    [self createScrollView];
}

- (void) createView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    view.frame = CGRectMake(20, 150, 300, 400);
    view.tag = 100;
    [self.view addSubview:view];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch Begin!");
    //anyObject 获取任何一个点击对象
    UITouch* touch = [touches anyObject];
    if (touch.tapCount == 1) {
        NSLog(@"Touch One");
    } else if (touch.tapCount == 2) {
        NSLog(@"Touch Two");
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    _lastPoint = [touch locationInView:self.view];
    UIView* view = (UIView*)[self.view viewWithTag:100];
    // 拖动效果只能用在矩形内部
    _viewOppositePoint = CGPointMake(view.frame.origin.x + view.frame.size.width, view.frame.origin.y + view.frame.size.height);
    _viewOrginPoint = CGPointMake(view.frame.origin.x, view.frame.origin.y);
    if (_lastPoint.x <= _viewOppositePoint.x && _lastPoint.x >= _viewOrginPoint.x
        && _lastPoint.y <= _viewOppositePoint.y && _lastPoint.y >= _viewOrginPoint.y) {
        _couldMove = true;
    } else {
        _couldMove = false;
    }
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_couldMove == true) {
        UITouch* touch = [touches anyObject];
        CGPoint pt = [touch locationInView:self.view]; // 相对当前试图点坐标
        UIView* view = (UIView*)[self.view viewWithTag:100];
        NSLog(@"Touch OnMove!! x=%f,y=%f",pt.x,pt.y);
        float xOffset = pt.x - _lastPoint.x;
        float yOffset = pt.y - _lastPoint.y;
        _lastPoint = pt;
        view.frame = CGRectMake(view.frame.origin.x + xOffset,
                                view.frame.origin.y + yOffset,
                                view.frame.size.width,
                                view.frame.size.height);
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch End!!!");
//    [self dismissViewControllerAnimated:YES completion:nil];
}

//中断触碰时调用，例如电话，信息进来了
-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch Interrupt!!!!");
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

//- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

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
