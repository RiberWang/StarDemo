//
//  RBStarView.m
//  RYApp
//
//  Created by Riber on 16/7/28.
//  Copyright © 2016年 dookay_73. All rights reserved.
//

#import "RBStarView.h"

#define BLACKTEXT [UIColor colorWithRed:0.298 green:0.298 blue:0.306 alpha:1.00]

@interface RBStarView () <CWStarRateViewDelegate>

@property (nonatomic, strong) UILabel *starLabel;
@property (nonatomic, strong) CWStarRateView *starRateView;
@property (nonatomic, assign) NSUInteger stars;

@end

@implementation RBStarView

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSUInteger)stars {
    if (self = [super initWithFrame:frame]) {
        _stars = stars;
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    _starRateView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30) numberOfStars:_stars];
    _starRateView.delegate = self;
    [self addSubview:_starRateView];
    
    _starLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _starRateView.frame.size.height+15, self.frame.size.width, 15)];
    _starLabel.font = [UIFont systemFontOfSize:13];
    _starLabel.textAlignment = NSTextAlignmentCenter;
    _starLabel.textColor = BLACKTEXT;
    [self addSubview:_starLabel];
}

- (void)setStars:(NSUInteger)stars {
    _stars = stars;
    
    if (_stars <= 0) {
        _stars = DEFALUT_STAR_NUMBER;
    }
}

- (void)setScorePercent:(CGFloat)scroePercent {
    _scorePercent = scroePercent;
    _starRateView.scorePercent = _scorePercent;

    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0)
    {
        _scorePercent = 0;
    }
    else if (scroePercent > 1)
    {
        _scorePercent = 1.0;
    }
    else
    {
        _scorePercent = scroePercent;
    }
   
    if (self.starClickBlock) {
        self.starClickBlock(_scorePercent);
    }
    
    [_starRateView setNeedsLayout];
}

- (void)setHasAnimation:(BOOL)hasAnimation {
    _hasAnimation = hasAnimation;
    _starRateView.hasAnimation = _hasAnimation;

//    [_starRateView setNeedsLayout];
}

- (void)setAllowIncompleteStar:(BOOL)allowIncompleteStar {
    _allowIncompleteStar = allowIncompleteStar;
    _starRateView.allowIncompleteStar = _allowIncompleteStar;
}

- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent {
    _scorePercent = newScorePercent;
    
    // 用于评分 整数
    if (!_allowIncompleteStar) {
        if (newScorePercent == 0.2) {
            _starLabel.text = @"极差";
        }
        else if (newScorePercent == 0.4) {
            _starLabel.text = @"较差";
        }
        else if (newScorePercent == 0.6) {
            _starLabel.text = @"还行";
        }
        else if (newScorePercent == 0.8) {
            _starLabel.text = @"满意";
        }
        else if (newScorePercent >= 1.0) {
            _starLabel.text = @"很满意";
        }
        else
        {
            _starLabel.text = @"极差";
        }
    }
    
    if (self.starClickBlock) {
        self.starClickBlock(newScorePercent);
    }
}

@end
