//
//  View03Controller.m
//  UIProject
//
//  Created by Knight on 2018/8/30.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import "View03Controller.h"

@interface View03Controller ()

@end

@implementation View03Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    [self createGirlsImage01View];
    [self createGirlsImage02View];
}

- (void)createGirlsImage02View {
    UIImage* image = [UIImage imageNamed:@"girlStand.jpeg"];
    UIImageView* imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(5, 300, 300, 400);
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    //P1 事件对象的拥有者
    //P2 事件的响应函数
    _pinchGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAct:)];
    [imageView addGestureRecognizer:_pinchGes];
    _rotGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotAct:)];
    [imageView addGestureRecognizer:_rotGes];
    
    _rotGes.delegate = self;
    _pinchGes.delegate = self;
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)rotAct:(UIRotationGestureRecognizer*) rot {
    UIImageView* iView = (UIImageView*) rot.view;
    iView.transform = CGAffineTransformRotate(iView.transform, rot.rotation);
    rot.rotation = 0;
}

- (void)pinchAct:(UIPinchGestureRecognizer*) pinch {
    UIImageView* iView = (UIImageView*) pinch.view;
    // 对视图对象进行矩阵变换计算并赋值
    // 通过缩放产生新矩阵CGAffineTransformScale
    // 参数1 原来的矩阵
    // 参数2 x方向的缩放比例
    // 参数3 y方向的缩放比例
    // 返回值是新的缩放后的矩阵变换
    iView.transform = CGAffineTransformScale(iView.transform, pinch.scale, pinch.scale);
    //=1 将缩放值变回原来大小
    pinch.scale = 1;
}

- (void)createGirlsImage01View {
    UIImage* image = [UIImage imageNamed:@"girl.jpeg"];
    UIImageView* imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(5, 50, 200, 150);
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES; // 可以进行响应交互，默认为不接受响应时间值为NO,必须打开才能接收响应事件
    //UITapGestureRecognizer 点击手势类
    //P1 响应事件拥有者对象，self表示当前视图控制器
    //P2 响应事件的函数
    UITapGestureRecognizer *tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneAct:)];
    tapOne.numberOfTapsRequired = 1; //几次点击时触发 默认值 1
    tapOne.numberOfTouchesRequired = 1; //几个手指点击时触发 默认值 1
    [imageView addGestureRecognizer:tapOne]; //将点击事件加入视图中，视图即可响应
    
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwoAct:)];
    tapTwo.numberOfTapsRequired = 2;
    tapTwo.numberOfTouchesRequired = 1;
    [imageView addGestureRecognizer:tapTwo];
    [tapOne requireGestureRecognizerToFail:tapTwo];
    
    UITapGestureRecognizer *tapThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapThreeAct:)];
    tapThree.numberOfTapsRequired = 3;
    tapThree.numberOfTouchesRequired = 1;
    [imageView addGestureRecognizer:tapThree];
    [tapOne requireGestureRecognizerToFail:tapThree];
    [tapTwo requireGestureRecognizerToFail:tapThree];
}

-(void) tapOneAct:(UITapGestureRecognizer*) tap {
//    NSLog(@"tap one!");
    UIImageView* imageView = (UIImageView*) tap.view;
    //设置动画时间
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    imageView.frame = CGRectMake(5, 100, 400, 300);
    [UIView commitAnimations];
}

-(void) tapTwoAct:(UITapGestureRecognizer*) tap {
    UIImageView* imageView = (UIImageView*) tap.view;
    //设置动画时间
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    imageView.frame = CGRectMake(5, 100, 200, 150);
    [UIView commitAnimations];
}

-(void) tapThreeAct:(UITapGestureRecognizer*) tap {
    UIImageView* imageView = (UIImageView*) tap.view;
    imageView.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    if (touch.tapCount == 3) {
        NSLog(@"Touch Three");
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
