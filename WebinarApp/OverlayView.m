//
//  OverlayView.m
//  WebinarApp
//
//  Created by admin on 8/6/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "OverlayView.h"

@interface OverlayView()

- (IBAction)closeButtonPressed:(id)sender;
- (IBAction)changeButtonPressed:(id)sender;


@end

@implementation OverlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)changeButtonPressed:(id)sender {
    if (_captureDelegate) {
        [_captureDelegate changeVideoSource];
    }
}


- (IBAction)closeButtonPressed:(id)sender {
    if (_captureDelegate) {
        [_captureDelegate finishVideoCapture];
    }
}

@end
