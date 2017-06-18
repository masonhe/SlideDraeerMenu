//
//  ViewController.m
//  SlidingDrawerDemo
//
//  Created by mason on 2017/6/18.
//  Copyright © 2017年 mason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.rightView.backgroundColor = [UIColor greenColor];
    
    self.leftView.backgroundColor = [UIColor blueColor];
    
    self.mainView.backgroundColor = [UIColor redColor];
    
    self.target = [UIScreen mainScreen].bounds.size.width * 0.7;
    
    self.slideDirection = MHSlideDirectionLeft;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
