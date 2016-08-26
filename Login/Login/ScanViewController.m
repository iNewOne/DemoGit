
/*!
 @Header  ScanViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/26.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "ScanViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    
    
    
    
    
    
    
}

@property (strong,nonatomic)AVCaptureDevice * device;

@property (strong,nonatomic)AVCaptureDeviceInput * input;

@property (strong,nonatomic)AVCaptureMetadataOutput * output;

@property (strong,nonatomic)AVCaptureSession * session;

@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;




@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";
    

//    [self setNeedsStatusBarAppearanceUpdate];
    
    
//    UIColor * blackColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
//    CGSize imageSize = CGSizeMake(ScreenWidth, self.navigationController.navigationBar.size.height + 20);
//    UIImage * backImage = [self createImageFromColor:blackColor imageSize:imageSize];
    
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];



    
    
    
    UIView * containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];

    [self preferredStatusBarStyle];
    
    
    UIView * naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    naviView.backgroundColor = [UIColor blackColor];
    naviView.alpha = 0.3;
    
    [containerView addSubview:naviView];
    

    [[UIApplication sharedApplication].keyWindow addSubview:containerView];
    
    UIButton * cancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    [cancel setTitle:@"关闭" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:cancel];
    self.navigationItem.leftBarButtonItem = item1;
    
    
    // Device
    
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    
    _output = [[AVCaptureMetadataOutput alloc]init];
    
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    
    // Session
    
    _session = [[AVCaptureSession alloc]init];
    
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([_session canAddInput:self.input])
        
    {
        
        [_session addInput:self.input];
        
    }
    
    if ([_session canAddOutput:self.output])
        
    {
        
        [_session addOutput:self.output];
        
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    
    // Preview
    
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    _preview.frame = containerView.bounds;
    
    [containerView.layer insertSublayer:_preview atIndex:0];
    
    // Start
    
    [_session startRunning];
    

}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}





#pragma mark AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection

{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
        
    {
        
        //停止扫描
        
        [_session stopRunning];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        
        stringValue = metadataObject.stringValue;
        
    }
    
    
}


- (void)cancelAction{
    [self.navigationController popViewControllerAnimated:YES];
}


- (UIImage *)createImageFromColor:(UIColor *)color imageSize:(CGSize)imageSize{
    
    CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
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
