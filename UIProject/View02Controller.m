//
//  View02Controller.m
//  UIProject
//
//  Created by Knight on 2018/8/23.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import "View02Controller.h"

@interface View02Controller ()

@end

@implementation View02Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindData];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)bindData {
    _array = [[NSArray alloc] init];
    _array = @[@"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847218036.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847205850.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847017092.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847016837.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847017065.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847016925.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847017035.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847017019.jpeg",
               @"https://community-s3-website.marykay.com.cn/PROD/EBizStorage/library/1530847016939.jpeg"];
}

- (void)createUI {
    [self createScrollView];
}

- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(10, 50, 400, 400);
    _scrollView.bounces = NO;
    _scrollView.userInteractionEnabled = YES;
//    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(400, 400*9);
    for (int i = 0 ; i < 9; i ++) {
        NSString* str = [_array objectAtIndex:i];
        NSURL* url = [NSURL URLWithString:str];
        NSData* data = [NSData dataWithContentsOfURL:url];
        UIImage* image = [UIImage imageWithData: data];
        UIImageView* iView = [[UIImageView alloc] init];
        iView.image = image;
        iView.contentMode = UIViewContentModeScaleAspectFit;
        iView.frame = CGRectMake(0, 400*i, 400, 400);
        [_scrollView addSubview:iView];
    }
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.contentOffset = CGPointMake(0, 0);
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"y = %f", scrollView.contentOffset.y);
}

-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"End:y = %f", scrollView.contentOffset.y);
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Start");
}

-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset  {
     NSLog(@"Will End");
}

-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Will Begin Decelerating");
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Will End Decelerating");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _scrollView.contentOffset = CGPointMake(0, 0);
    [self dismissViewControllerAnimated:YES completion:nil];
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
