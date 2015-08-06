//
//  ViewController.m
//  WebinarApp
//
//  Created by admin on 8/6/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "OverlayView.h"

@interface ViewController () <OverlayViewProtocol>

@property (nonatomic, strong) UIImagePickerController *picker;

@property (nonatomic) BOOL isFrontalCameraAvailable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)startButtonPressed:(id)sender {
    _picker = [UIImagePickerController new];
    _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _picker.mediaTypes =
    [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    _picker.showsCameraControls = NO;
    
    OverlayView *overlayView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([OverlayView class]) owner:nil options:nil] firstObject];
    overlayView.frame = self.view.frame;
    overlayView.captureDelegate = self;
    
    _picker.cameraOverlayView = overlayView;
    
    _isFrontalCameraAvailable = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    
    [self presentViewController:_picker animated:YES completion:nil];
}

#pragma mark - OverlayView delegate methods

- (void)finishVideoCapture {
    [_picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeVideoSource {
    if ((_picker.cameraDevice == UIImagePickerControllerCameraDeviceRear) && _isFrontalCameraAvailable) {
        _picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    } else if (_picker.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        _picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
