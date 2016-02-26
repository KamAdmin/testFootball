//
//  AutoScrollEsp.h
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollEsp : UIScrollView
{
    NSTimer *_scrollTimer;
    NSInteger _rightMostVisibleButtonIndex;
    NSInteger _leftMostVisibleButtonIndex;
}

@property (nonatomic) CGFloat pointsPerSecond;
@property (nonatomic, strong) NSMutableArray *visibleLabels;
@property (nonatomic, strong) NSMutableArray * tabBtns;
@property (nonatomic, strong) UIView *labelContainerView;

- (void)startScrolling;
- (void)stopScrolling;

@end
