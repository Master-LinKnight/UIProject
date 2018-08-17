//
//  main.m
//  UIProject
//
//  Created by 林晓峰 on 2018/8/9.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//整个App程序的主函数好，入口函数
int main(int argc, char * argv[]) {
    //自动内存释放池
    @autoreleasepool {
        //UIKit 框架结构的启动函数
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
