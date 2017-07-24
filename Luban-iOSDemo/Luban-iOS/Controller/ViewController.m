//
//  ViewController.m
//  Luban-iOS
//
//  Created by guo on 2017/7/19.
//  Copyright © 2017年 guo. All rights reserved.
//
#import "ViewController.h"
#import "ModalTransitionAnimator.h"
#import <AVFoundation/AVFoundation.h>
#import "PhotoBrowserViewController.h"
#import "UIImage+Luban_iOS_Extension_h.h"

@interface ViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIImage                 *imgCompressed;
@property (nonatomic, strong) UIImagePickerController *cameraController;
@property (nonatomic, strong) IBOutlet UIImageView    *img_brower;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif
}

- (void)initDataSource {
    self.imgCompressed     = [UIImage lubanCompressImage:[UIImage imageNamed:@"IMG_1998.JPG"]];
    self.img_brower.image  = _imgCompressed;
}

- (IBAction)btnClick:(UIButton *)sender {
    
    if (SIMULATOR) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:SIMULATOR_WARING preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertView addAction:doneAction];
        [self presentViewController:alertView animated:YES completion:nil];
        return;
    }
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusDenied) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:SETTING_ALERT preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertView addAction:doneAction];
        [self presentViewController:alertView animated:YES completion:nil];
    }
    else {
        
        [self presentViewController:self.cameraController animated:YES completion:nil];
    }
}
- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    
    PhotoBrowserViewController *photoBrowseVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PhotoBrowserViewController"];
    photoBrowseVC.imgBrowse = self.imgCompressed;
    photoBrowseVC.transitioningDelegate = self;
    [self presentViewController:photoBrowseVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    
    self.imgCompressed = [UIImage lubanCompressImage:image];
    
    self.img_brower.image  = _imgCompressed;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [self transitionAnimatorWithPresentProperty:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [self transitionAnimatorWithPresentProperty:NO];
}

#pragma mark - Private

- (ModalTransitionAnimator *)transitionAnimatorWithPresentProperty:(BOOL)isPresented {
    
    ModalTransitionAnimator *transitionAnimator = [ModalTransitionAnimator new];
    transitionAnimator.m_isPresented = isPresented;
    transitionAnimator.m_originRect  = [self.view convertRect:self.img_brower.frame toView:nil];
    return transitionAnimator;
}

#pragma mark - Getter & Setter

- (UIImagePickerController *)cameraController {
    
    if (!_cameraController) {
        _cameraController = [[UIImagePickerController alloc] init];
        _cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
        _cameraController.delegate   = self;
        _cameraController.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return _cameraController;
}

- (void)setImgCompressed:(UIImage *)imgCompressed {
    
    _imgCompressed = imgCompressed;
    
    if (imgCompressed) {
        _img_brower.backgroundColor = [UIColor blackColor];
    }
    else {
        _img_brower.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:216.0/255.0 blue:255.0/255.0 alpha:1.0];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
