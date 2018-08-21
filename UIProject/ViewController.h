//
//  ViewController.h
//  UIProject
//
//  Created by 林晓峰 on 2018/8/9.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import <UIKit/UIKit.h>

//所有的控制器都需要自定义
@interface ViewController : UIViewController {
    NSTimer* _timerView;
    UISwitch* _mySwitch;
    UIProgressView* _progressView;
    UISlider* _slider;
    UIStepper* _stepper;
    UISegmentedControl* _segControl;
}

@property (retain, nonatomic) NSTimer* timerView;
@property (retain, nonatomic) UISwitch* mySwitch;
@property (retain, nonatomic) UIProgressView* progressView;
@property (retain, nonatomic) UISlider* slider;
@property (retain, nonatomic) UIStepper* stepper;
@property (retain, nonatomic) UISegmentedControl* segControl;

@end

