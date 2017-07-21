//
//  ModalTransitionAnimator.m
//  Luban-iOS
//
//  Created by guo on 2017/7/21.
//  Copyright © 2017年 guo. All rights reserved.
//
#import <objc/runtime.h>
#import "ModalTransitionAnimator.h"

@implementation ModalTransitionAnimator

- (instancetype)init {
    self = [super init];
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.m_duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *transToView ;
    UIView *transFromView ;
    CGPoint endAnimationCenter ;
    CGPoint startAnimationCenter ;
    CGAffineTransform transformEnd ;
    CGAffineTransform transformStart ;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        transToView   = [transitionContext viewForKey:UITransitionContextToViewKey];
        transFromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    }
    else {
        // lower ios7
        transToView   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
        transFromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    }
    UIView *animationView = self.m_isPresented ? transToView : transFromView;
    
    CGFloat scaleX = CGRectGetWidth(animationView.frame) ? CGRectGetWidth(self.m_originRect) / CGRectGetWidth(animationView.frame) : 0.0;
    CGFloat scaleY = CGRectGetHeight(animationView.frame) ? CGRectGetHeight(self.m_originRect) / CGRectGetHeight(animationView.frame) : 0.0;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleX, scaleY);
    
    CGPoint originCenter     = CGPointMake(CGRectGetMidX(self.m_originRect), CGRectGetMidY(self.m_originRect));
    CGPoint animationCenter  = CGPointMake(CGRectGetMidX(animationView.frame), CGRectGetMidY(animationView.frame));
    
    if (self.m_isPresented) {
        transformEnd         = CGAffineTransformIdentity;
        transformStart       = transform;
        endAnimationCenter   = animationCenter;
        startAnimationCenter = originCenter;
    }
    else {
        transformEnd         = transform;
        transformStart       = CGAffineTransformIdentity;
        endAnimationCenter   = originCenter;
        startAnimationCenter = animationCenter;
    }
    UIView *contrainer = [transitionContext containerView];
    [contrainer addSubview:transToView];
    [contrainer bringSubviewToFront:animationView];
    
    animationView.transform  = transformStart;
    animationView.center     = startAnimationCenter;
    
    [UIView animateWithDuration:self.m_duration animations:^{
        
        animationView.transform = transformEnd;
        animationView.center    = endAnimationCenter;
    } completion:^(BOOL finished) {
        BOOL transitionWasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!transitionWasCancelled];
    }];
}

- (CGFloat)m_duration {
    
    NSNumber *duration = objc_getAssociatedObject(self, _cmd);
    if (duration) {
        return [duration floatValue];
    }
    self.m_duration = 0.3;
    return 0.3;
}

- (void)setM_duration:(CGFloat)m_duration {
    
    SEL key = @selector(m_duration);
    objc_setAssociatedObject(self, key, @(m_duration), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)m_originRect {
    NSValue *rect = objc_getAssociatedObject(self, _cmd);
    if (rect) {
        return [rect CGRectValue];
    }
    self.m_originRect = CGRectZero;
    return CGRectZero;
}

- (void)setM_originRect:(CGRect)m_originRect {
    
    SEL key = @selector(m_originRect);
    objc_setAssociatedObject(self, key, [NSValue valueWithCGRect:m_originRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)m_isPresented {
    
    NSNumber *present = objc_getAssociatedObject(self, _cmd);
    if (present) {
        return [present boolValue];
    }
    self.m_isPresented = YES;
    return YES;
}

- (void)setM_isPresented:(BOOL)m_isPresented {
    
    SEL key = @selector(m_isPresented);
    objc_setAssociatedObject(self, key, @(m_isPresented), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
