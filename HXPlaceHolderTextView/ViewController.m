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

    HXPlaceHolderTextView* textView = [[HXPlaceHolderTextView alloc]init];
    textView.frame = CGRectMake(50, 50, 270, 100);
    textView.placeholder = @"我是placeholder";
    textView.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:textView];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
