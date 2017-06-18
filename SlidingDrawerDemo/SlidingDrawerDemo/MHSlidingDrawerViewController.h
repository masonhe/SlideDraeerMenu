//
//  MHSlidingDrawerViewController.h
//  SlidingDrawerDemo
//
//  Created by mason on 2017/6/18.
//  Copyright © 2017年 mason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,  MHSlideDirection) {
    MHSlideDirectionLeft,
    MHSlideDirectionRight,
    MHSlideDirectionBoth
};

@interface MHSlidingDrawerViewController : UIViewController

/** 左边view */
@property (strong, nonatomic, readonly) UIView *leftView;
/** 右边view */
@property (strong, nonatomic, readonly) UIView *rightView;
/** 主view */
@property (strong, nonatomic, readonly) UIView *mainView;
/** 靠左或靠右的距离 default : [UIScreen mainScreen].bounds.size.width * 0.8 */
@property (assign, nonatomic) CGFloat target;
/** 动画时间 default ：0.5 */
@property (assign, nonatomic) CGFloat animateDurationTime;
/** 滑动方向 default:MHSlideDirectionLeft */
@property (assign, nonatomic) MHSlideDirection slideDirection;
@end
