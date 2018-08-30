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
