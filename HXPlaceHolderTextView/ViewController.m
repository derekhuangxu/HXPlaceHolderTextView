//
//  ViewController.m
//  HXPlaceHolderTextView
//
//  Created by Derek on 16/1/30.
//  Copyright © 2016年 huangxu. All rights reserved.
//

#import "ViewController.h"
#import "HXPlaceHolderTextView.h"

@interface ViewController ()

@property (nonatomic,retain)HXPlaceHolderTextView* tv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tv = [[HXPlaceHolderTextView alloc]init];
    _tv.frame = CGRectMake(50, 50, 270, 100);
    _tv.placeholder = @"我是占位符";
//    _tv.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_tv];
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
