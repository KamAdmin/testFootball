//
//  AutoScrollIta.m
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import "AutoScrollIta.h"
#import "ButtonNews.h"

@implementation AutoScrollIta

@synthesize pointsPerSecond = _pointsPerSecond;

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    if(newWindow)
    {
        [self.panGestureRecognizer addTarget:self action:@selector(gestureDidChange:)];
        [self.pinchGestureRecognizer addTarget:self action:@selector(gestureDidChange:)];
    }
    else
    {
        [self stopScrolling];
        [self.panGestureRecognizer removeTarget:self action:@selector(gestureDidChange:)];
        [self.pinchGestureRecognizer removeTarget:self action:@selector(gestureDidChange:)];
    }
}

#pragma mark - Touch methods

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    [self stopScrolling];
    return [super touchesShouldBegin:touches withEvent:event inContentView:view];
}

- (void)gestureDidChange:(UIGestureRecognizer *)gesture
{
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            [self stopScrolling];
        }
            break;
        default:
            break;
    }
}

- (BOOL)becomeFirstResponder
{
    [self stopScrolling];
    return [super becomeFirstResponder];
}

#pragma mark - Property methods

- (CGFloat)pointsPerSecond
{
    if (!_pointsPerSecond)
    {
        _pointsPerSecond = 30.0f;
    }
    return _pointsPerSecond;
}

#pragma mark - Public methods

- (void)startScrolling
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopScrolling];
        CGFloat animationDuration = (0.5f / self.pointsPerSecond);
        _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:animationDuration
                                                        target:self
                                                      selector:@selector(updateScroll)
                                                      userInfo:nil
                                                       repeats:YES];
    });
}

- (void)stopScrolling
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}

- (void)updateScroll
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        CGFloat animationDuration = _scrollTimer.timeInterval;
        CGFloat pointChange = self.pointsPerSecond * animationDuration;
        CGPoint newOffset = self.contentOffset;
        newOffset.x = newOffset.x + pointChange;

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationDuration];
        self.contentOffset = newOffset;
        [UIView commitAnimations];
        
    });
}










#pragma mark - Layout

// recenter content periodically to achieve impression of infinite scrolling
- (void)recenterIfNecessary
{
    CGPoint currentOffset = [self contentOffset];
    CGFloat contentWidth = [self contentSize].width;
    CGFloat centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
    CGFloat distanceFromCenter = fabs(currentOffset.x - centerOffsetX);
    
    if (distanceFromCenter > (contentWidth / 4.0))
    {
        self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
        
        // move content by the same amount so it appears to stay still
        for (ButtonNews *label in self.visibleLabels) {
            CGPoint center = [self.labelContainerView convertPoint:label.center toView:self];
            center.x += (centerOffsetX - currentOffset.x);
            label.center = [self convertPoint:center toView:self.labelContainerView];
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self recenterIfNecessary];
    
    // tile content in visible bounds
    CGRect visibleBounds = [self convertRect:[self bounds] toView:self.labelContainerView];
    CGFloat minimumVisibleX = CGRectGetMinX(visibleBounds);
    CGFloat maximumVisibleX = CGRectGetMaxX(visibleBounds);
    
    [self tileLabelsFromMinX:minimumVisibleX toMaxX:maximumVisibleX];
}


#pragma mark - Label Tiling

- (ButtonNews *)insertLabel:(int)index
{
    ButtonNews *label = [self.tabBtns objectAtIndex:index];
    [self.labelContainerView addSubview:label];
    
    return label;
}

- (CGFloat)placeNewLabelOnRight:(CGFloat)rightEdge
{
    
    _rightMostVisibleButtonIndex++;
    if (_rightMostVisibleButtonIndex == [self.tabBtns count]) {
        _rightMostVisibleButtonIndex = 0;
    }
    
    ButtonNews *label = [self insertLabel:_rightMostVisibleButtonIndex];
    
    [self.visibleLabels addObject:label]; // add rightmost label at the end of the array
    
    CGRect frame = [label frame];
    frame.origin.x = rightEdge + 5;
    frame.origin.y = [self.labelContainerView bounds].size.height - frame.size.height;
    [label setFrame:frame];
    
    return CGRectGetMaxX(frame);
}




- (CGFloat)placeNewLabelOnLeft:(CGFloat)leftEdge
{

    _leftMostVisibleButtonIndex--;
    if (_leftMostVisibleButtonIndex < 0) {
        _leftMostVisibleButtonIndex = [self.tabBtns count] - 1;
    }
    
    
    ButtonNews *label = [self insertLabel:_leftMostVisibleButtonIndex];
    
    [self.visibleLabels insertObject:label atIndex:0]; // add leftmost label at the beginning of the array
    
    CGRect frame = [label frame];
    frame.origin.x = leftEdge - frame.size.width - 5;
    frame.origin.y = [self.labelContainerView bounds].size.height - frame.size.height;
    [label setFrame:frame];
    
    return CGRectGetMinX(frame);
}

- (void)tileLabelsFromMinX:(CGFloat)minimumVisibleX toMaxX:(CGFloat)maximumVisibleX
{
    // the upcoming tiling logic depends on there already being at least one label in the visibleLabels array, so
    // to kick off the tiling we need to make sure there's at least one label
    
    if ([self.tabBtns count] > 0)
    {
        
        if ([self.visibleLabels count] == 0)
        {
            _rightMostVisibleButtonIndex = -1;
            _leftMostVisibleButtonIndex = 0;
            [self placeNewLabelOnRight:minimumVisibleX];
        }
        
        // add labels that are missing on right side
        ButtonNews *lastLabel = [self.visibleLabels lastObject];
        CGFloat rightEdge = CGRectGetMaxX([lastLabel frame]);
        while (rightEdge < maximumVisibleX)
        {
            rightEdge = [self placeNewLabelOnRight:rightEdge];
        }
        
        // add labels that are missing on left side
        ButtonNews *firstLabel = self.visibleLabels[0];
        CGFloat leftEdge = CGRectGetMinX([firstLabel frame]);
        while (leftEdge > minimumVisibleX)
        {
            leftEdge = [self placeNewLabelOnLeft:leftEdge];
        }
        
        // remove labels that have fallen off right edge
        lastLabel = [self.visibleLabels lastObject];
        while ([lastLabel frame].origin.x > maximumVisibleX)
        {
            [lastLabel removeFromSuperview];
            [self.visibleLabels removeLastObject];
            lastLabel = [self.visibleLabels lastObject];
            
            _rightMostVisibleButtonIndex--;
            if (_rightMostVisibleButtonIndex < 0) {
                _rightMostVisibleButtonIndex = [self.tabBtns count] - 1;
            }
            
        }
        
        // remove labels that have fallen off left edge
        firstLabel = self.visibleLabels[0];
        while (CGRectGetMaxX([firstLabel frame]) < minimumVisibleX)
        {
            [firstLabel removeFromSuperview];
            [self.visibleLabels removeObjectAtIndex:0];
            firstLabel = self.visibleLabels[0];
            
            _leftMostVisibleButtonIndex++;
            if (_leftMostVisibleButtonIndex == [self.tabBtns count]) {
                _leftMostVisibleButtonIndex = 0;
            }
        }
        
    }
}




@end