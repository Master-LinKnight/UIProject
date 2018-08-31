//
//  View04Controller.m
//  UIProject
//
//  Created by Knight on 2018/8/30.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import "View04Controller.h"

@interface View04Controller ()

@end

@implementation View04Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI {
    [self createGirlsImage];
}

- (void)createGirlsImage {
    UIImageView* iView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"girlStand.jpeg"]];
    iView.frame = CGRectMake(50, 50, 300, 400);
    [self.view addSubview:iView];
    iView.userInteractionEnabled = YES;
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAct:)];
    [iView addGestureRecognizer:pan];
    [iView removeGestureRecognizer:pan];
    
    //上下左右滑动手势
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAct:)];
    //设定滑动事件的类型
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [iView addGestureRecognizer:swipe];
    
    //长按手势
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressLong:)];
    [iView addGestureRecognizer:longPress];
    longPress.minimumPressDuration = 3;
}

-(void) pressLong:(UILongPressGestureRecognizer*) longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"pressLong On!");
    } else if (longPress.state == UIGestureRecognizerStateEnded) {
        NSLog(@"pressLong Off!");
    }
}

-(void) swipeAct:(UISwipeGestureRecognizer*) swipe {
    if (swipe.direction & UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right!");
    } else if (swipe.direction & UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left!");
    }
}

-(void) panAct:(UIPanGestureRecognizer*) pan {
//    NSLog(@"pan!");
    //获取移动的坐标，相对于现在视图的坐标系
    CGPoint pt = [pan translationInView:self.view];
    NSLog(@"pt.x=%.2f,pt.y=%2f", pt.x, pt.y);
    //获取移动的相对速度
    CGPoint pv = [pan velocityInView:self.view];
    NSLog(@"pv.x=%.2f,pv.y=%2f", pv.x, pv.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    if (touch.tapCount == 2) {
        NSLog(@"Touch Two");
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
