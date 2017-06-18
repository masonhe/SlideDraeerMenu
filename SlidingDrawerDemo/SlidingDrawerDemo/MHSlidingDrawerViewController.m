//
//  MHSlidingDrawerViewController.m
//  SlidingDrawerDemo
//
//  Created by mason on 2017/6/18.
//  Copyright © 2017年 mason. All rights reserved.
//

#import "MHSlidingDrawerViewController.h"

#define kManY 100
#define kMHScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMHScreenHeight [UIScreen mainScreen].bounds.size.height
#define kTarget kMHScreenWidth * 0.8
#define kAnimateDurationTime 0.5

@interface MHSlidingDrawerViewController ()

@end

@implementation MHSlidingDrawerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.target = kTarget;
        self.animateDurationTime = kAnimateDurationTime;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.target = kTarget;
        self.animateDurationTime = kAnimateDurationTime;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    [self addGestureRecognizer];
}

#pragma mark - 添加手势
- (void)addGestureRecognizer {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.mainView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.view addGestureRecognizer:tap];
}

- (void)panGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer translationInView:self.mainView];
    CGFloat offsetXAfter = self.mainView.frame.origin.x  + point.x;
    if ((offsetXAfter > 0 && self.slideDirection == MHSlideDirectionLeft) || (offsetXAfter < 0 && self.slideDirection == MHSlideDirectionRight) || self.slideDirection == MHSlideDirectionBoth) {
        self.mainView.frame = [self mainViewFrameWithOffsetX:point.x];
        if (self.mainView.frame.origin.x > 0) {
            //说明向右滑动
            self.leftView.hidden = NO;
        } else {
            //说明先左滑动
            self.leftView.hidden = YES;
        }
        
        if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
            CGFloat target = 0;
            if (self.mainView.frame.origin.x > kMHScreenWidth * 0.5) {
                target = kTarget;
            } else if (CGRectGetMaxX(self.mainView.frame) < kMHScreenWidth * 0.5){
                target = -kTarget;
            }
            
            CGFloat x = target - self.mainView.frame.origin.x;
            [UIView animateWithDuration:self.animateDurationTime animations:^{
                self.mainView.frame = [self mainViewFrameWithOffsetX:x];
            }];
        }
    }
    [panGestureRecognizer setTranslation:CGPointZero inView:self.mainView];
}

- (void)tapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    [UIView animateWithDuration:self.animateDurationTime animations:^{
        self.mainView.frame = self.view.bounds;
    }];
}

- (CGRect) mainViewFrameWithOffsetX:(CGFloat)offsetX {
    CGRect frame = self.mainView.frame;
    frame.origin.x += offsetX;
    
    CGFloat y = kManY * fabs(frame.origin.x) / kMHScreenWidth;
    frame.origin.y = y;
    frame.size.height = kMHScreenHeight - 2 * y;
    return frame;
}

#pragma mark - setup UI
- (void)setupView {
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:rightView];
    _rightView = rightView;
    self.rightView.backgroundColor = [UIColor greenColor];
    
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:leftView];
    _leftView = leftView;
    self.leftView.backgroundColor = [UIColor blueColor];
    
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mainView];
    _mainView = mainView;
    self.mainView.backgroundColor = [UIColor redColor];
}


@end
