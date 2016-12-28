//
//  RBStarView.h
//  RYApp
//
//  Created by Riber on 16/7/28.
//  Copyright © 2016年 dookay_73. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"

@interface RBStarView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO

@property (nonatomic, copy) void (^starClickBlock)();

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSUInteger)stars;

@end
