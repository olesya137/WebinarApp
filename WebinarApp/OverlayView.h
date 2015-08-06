//
//  OverlayView.h
//  WebinarApp
//
//  Created by admin on 8/6/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OverlayViewProtocol <NSObject>
- (void)finishVideoCapture;
- (void)changeVideoSource;
@end

@interface OverlayView : UIView

@property (nonatomic, weak) id <OverlayViewProtocol> captureDelegate;

@end
