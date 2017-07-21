//
//  PhotoBrowserViewController.m
//  Luban-iOS
//
//  Created by guo on 2017/7/20.
//  Copyright © 2017年 guo. All rights reserved.
//

#import "PhotoBrowserViewController.h"

@interface PhotoBrowserViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation PhotoBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

- (void)initSubViews {
    
    [self.imgView setImage:self.imgBrowse];
}

- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setImgBrowse:(UIImage *)imgBrowse {
    
    _imgBrowse = imgBrowse;
    
    if (imgBrowse) {
        self.view.backgroundColor = [UIColor blackColor];
    }
    else {
        self.view.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:216.0/255.0 blue:255.0/255.0 alpha:1.0];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
