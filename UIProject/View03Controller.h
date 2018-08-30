//
//  View03Controller.h
//  UIProject
//
//  Created by Knight on 2018/8/30.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View03Controller : UIViewController<UIGestureRecognizerDelegate>{
    UIPinchGestureRecognizer* _pinchGes;
    UIRotationGestureRecognizer* _rotGes;
}
@end
