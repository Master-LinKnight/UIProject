//
//  ViewController.m
//  UIProject
//
//  Created by 林晓峰 on 2018/8/9.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import "ViewController.h"
#import "View01Controller.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timerView = _timerView;
@synthesize mySwitch = _mySwitch;
@synthesize slider = _slider;
@synthesize progressView = _progressView;
@synthesize stepper = _stepper;
@synthesize segControl = _segControl;

- (void)createUI {
    [self createLabel];
    [self createRectButtons];
    [self createUIView];
    [self createButtonEvent];
    [self createStoreyView];
    [self createTimerButton];
    [self createSwitch];
    [self createProgressSlider];
    [self createStepper];
}

- (void) createStepper {
    _stepper = [[UIStepper alloc] init];
    _stepper.frame = CGRectMake(10, 550, 80, 40);
    _stepper.minimumValue = 0;
    _stepper.maximumValue = 100;
    _stepper.value = 10;
    _stepper.stepValue = 10;
    _stepper.autorepeat = YES;
    _stepper.continuous = YES;
    [_stepper addTarget:self action:@selector(stepChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
    
    _segControl = [[UISegmentedControl alloc] init];
    _segControl.frame = CGRectMake(150, 550, 200, 40);
    [_segControl insertSegmentWithTitle:@"0" atIndex:0 animated:YES];
    [_segControl insertSegmentWithTitle:@"5" atIndex:1 animated:YES];
    [_segControl insertSegmentWithTitle:@"10" atIndex:2 animated:YES];
    _segControl.selectedSegmentIndex = 0;
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segControl];
}

- (void) segChange {
    NSLog(@"value %ld", _segControl.selectedSegmentIndex);
}

- (void) stepChange {
    NSLog(@"value %f", _stepper.value);
}

- (void) createProgressSlider {
    _progressView = [[UIProgressView alloc] init];
    _progressView.frame = CGRectMake(50, 500, 200, 40);
    _progressView.progressTintColor = [UIColor redColor];
    _progressView.trackTintColor = [UIColor greenColor];
    _progressView.progress = 0.5;
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    [self.view addSubview:_progressView];
}

- (void) createSwitch {
    _mySwitch = [[UISwitch alloc] init];
    _mySwitch.frame = CGRectMake(10, 400, 80, 40);
//    _mySwitch.on = YES;
    [_mySwitch setOn:YES animated:YES];
    [self.view addSubview:_mySwitch];
    [_mySwitch setOnTintColor:[UIColor redColor]];
    [_mySwitch setThumbTintColor:[UIColor whiteColor]];
    [_mySwitch setTintColor:[UIColor orangeColor]];
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
    
    _slider = [[UISlider alloc] init];
    _slider.frame = CGRectMake(10, 450, 300, 40);
    _slider.maximumValue = 100;
    _slider.minimumValue = 0;
    _slider.value = 50;
    _slider.minimumTrackTintColor = [UIColor blueColor];
    _slider.maximumTrackTintColor = [UIColor greenColor];
    _slider.thumbTintColor = [UIColor orangeColor];
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
}

- (void) pressSlider {
    _progressView.progress = _slider.value/(_slider.maximumValue - _slider.minimumValue);
    NSLog(@"value %f", _slider.value);
}

- (void) swChange:(UISwitch*) sw {
    NSLog(@"changed!");
    if (sw.on == YES) {
        NSLog(@"open");
    } else {
        NSLog(@"close");
    }
}

-(void) createTimerButton {
    UIButton* btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    btnStart.frame = CGRectMake(50, 50, 100, 40);
    [btnStart setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnStart setTitle:@"启动定时器" forState:UIControlStateNormal];
    [btnStart addTarget:self action:@selector(timerStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStart];
    
    UIButton* btnStop = [UIButton buttonWithType:UIButtonTypeCustom];
    btnStop.frame = CGRectMake(200, 50, 100, 40);
    [btnStop setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnStop setTitle:@"关闭定时器" forState:UIControlStateNormal];
    [btnStop addTarget:self action:@selector(timerStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStop];
}

- (void)timerStart {
    _timerView = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerUpdate:) userInfo:@"knight" repeats:YES];
}

- (void)timerUpdate: (NSTimer*) timer {
    NSLog(@"%@ test!!!", timer.userInfo);
    UIView* view = [self.view viewWithTag:103];
    view.frame = CGRectMake(view.frame.origin.x + 0.5, view.frame.origin.y + 0.5, view.frame.size.width, view.frame.size.height);
}

- (void)timerStop {
    [_timerView invalidate];
//    if (_timerView != nil)
//    {
//        [_timerView invalidate];
//    }
}

- (void)createLabel {
    UILabel* label = [[UILabel alloc] init];
    label.text = @"Hello World!";
    label.frame = CGRectMake(20, 100, 100, 40);
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
    
    view03.tag = 103;
//    [self.view bringSubviewToFront:view02];
//    [self.view sendSubviewToBack:view03];
//    UIView* viewFront = self.view.subviews[2];
//    UIView* viewBack = self.view.subviews[0];
//    if (viewBack == view01) {
//        NSLog(@"equal");
//    }
}

//当视图控制器第一次被加载显示视图是，调用此函数，初始化资源
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad, 第一次加载视图！");
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear, 视图即将显示！");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear, 视图即将消失！");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear, 视图已经显示！");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear, 视图已经消失！");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    View01Controller* vc = [[View01Controller alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
