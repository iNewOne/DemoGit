
/*!
 @Header  ScanViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/26.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "ScanViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    
    
    UIView * containerView;
    
    CGRect boxRect;
    
    
}

@property (strong,nonatomic)AVCaptureDevice * device;

@property (strong,nonatomic)AVCaptureDeviceInput * input;

@property (strong,nonatomic)AVCaptureMetadataOutput * output;

@property (strong,nonatomic)AVCaptureSession * session;

@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;

@property (nonatomic, strong) UIView * boxView;


@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";
    
    
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];

    
    containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    containerView.backgroundColor = [UIColor blackColor];
    containerView.alpha = 0.5;
    
    
//    UIView * naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
//    naviView.backgroundColor = [UIColor blackColor];
//    naviView.alpha = 0.7;
//    
//    [containerView addSubview:naviView];
//    
//    
//    UIButton * cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 26, 50, 22)];
//    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//    [cancelButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
//    cancelButton.alpha = 1;
//    [naviView addSubview:cancelButton];
    
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    //    [rectPath appendPath:[[UIBezierPath bezierPathWithRect:CM((SCREEN_WIDTH - 250) / 2, 66, 250, 250)] bezierPathByReversingPath]];
    [rectPath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake((ScreenWidth - 250) / 2, ScreenHeight / 2 - 64 - 125, 250, 250) cornerRadius:1] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = rectPath.CGPath;
    
    containerView.layer.mask = shapeLayer;
    
    
//    boxRect = [_boxView convertRect:_boxView.frame toView:containerView];
    

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
    
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    [_session startRunning];

   
    /**这部分需要放在startRunning后生效*/
    CGRect rect = CGRectMake((ScreenWidth - 250) / 2, ScreenHeight / 2 - 64 - 125, 250, 250);
    CGRect intertRect = [_preview metadataOutputRectOfInterestForRect:rect];
    
    CGRect layerRect = [_preview rectForMetadataOutputRectOfInterest:intertRect];
    
    
    _output.rectOfInterest = [_output metadataOutputRectOfInterestForRect:intertRect];
    NSLog(@"%@------%@", NSStringFromCGRect(intertRect), NSStringFromCGRect(layerRect));
    
    
    // Start
    
    

}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)cancelAction{
    
    [containerView removeFromSuperview];
    [self dismissViewControllerAnimated:NO completion:nil];
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
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:stringValue delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
    
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
