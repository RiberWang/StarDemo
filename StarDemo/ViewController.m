//
//  ViewController.m
//  StarDemo
//
//  Created by Riber on 16/11/29.
//  Copyright © 2016年 Riber. All rights reserved.
//

#import "ViewController.h"
#import "RBStarView.h"

#define kSCREENW [UIScreen mainScreen].bounds.size.width
#define kSCREENH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RBStarView *startView = [[RBStarView alloc] initWithFrame:CGRectMake((kSCREENW-200)/2.0, 200, 200, 60) numberOfStars:5];
    startView.scorePercent = 4;
    startView.allowIncompleteStar = NO;
    [self.view addSubview:startView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
