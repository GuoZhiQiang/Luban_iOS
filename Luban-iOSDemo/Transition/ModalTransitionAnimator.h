//
//  ModalTransitionAnimator.h
//  Luban-iOS
//
//  Created by guo on 2017/7/21.
//  Copyright © 2017年 guo. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>

@interface ModalTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

// default value is 0.3s
@property (nonatomic, assign) CGFloat m_duration;
// default value is CGRectZero
@property (nonatomic, assign) CGRect  m_originRect;
// default value is YES
@property (nonatomic, assign) BOOL    m_isPresented;

@end
