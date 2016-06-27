//
//  DemoTest.m
//  AnnieSDKDemo
//
//  Created by jiangfeng on 15/3/24.
//  Copyright (c) 2015年 anqu. All rights reserved.
//

#import "DemoTest.h"

#import <AnnieIosSdk/AnnieIosSdk.h>



@interface DemoTest ()

@end

@implementation DemoTest

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _orientation = [UIApplication sharedApplication].statusBarOrientation;
    
     [self performSelectorOnMainThread:@selector(initApp) withObject:nil waitUntilDone:NO];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initApp{
    /**
      *初始化应用的CP商渠道号，游戏ID和AppKey。Todo
     */
   [[AnnieIosSdk sharedInstance] setDelegate:self];
    
   [AnnieIosSdk setOrientation:UIInterfaceOrientationLandscapeRight];
   //[AnnieIosSdk setOrientation:UIInterfaceOrientationPortraitUpsideDown];
    
    [AnnieIosSdk setDebugLogOn:TRUE];
    
    //SDK初始化
   [[AnnieIosSdk sharedInstance] initsdk:3];
   
}

-(void)initDemoView
{
    NSLog(@"#######");
    UILabel *annie = [[UILabel alloc] initWithFrame:CGRectMake(35, 20, 250, 50)];
    annie.text = @"Annieo欢迎您，SDKDemo";
    annie.textColor = [UIColor blueColor];
    annie.backgroundColor = [UIColor clearColor];
    [self.view addSubview:annie];
    
    _annmore = [[UIButton alloc] initWithFrame:CGRectMake(20, 80,100, 50)];
    [_annmore setTitle:@"更多" forState:UIControlStateNormal];
    [_annmore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_annmore setBackgroundColor:[UIColor blueColor]];
    [_annmore addTarget:self action:@selector(annStartMoreClick:) forControlEvents: UIControlEventTouchUpInside];//处理点击
    [self.view addSubview:_annmore];
    
    _annest = [[UIButton alloc] initWithFrame:CGRectMake(130, 80, 100, 50)];
    [_annest setTitle:@"评论" forState:UIControlStateNormal];
    [_annest setBackgroundColor:[UIColor blueColor]];
    [_annest setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_annest addTarget:self action:@selector(annStartEstClick:) forControlEvents: UIControlEventTouchUpInside];//处理点击
    [self.view addSubview:_annest];
    

    _annRecomm = [[UIButton alloc] initWithFrame:CGRectMake(20, 140, 100, 50)];
    [_annRecomm setTitle:@"推荐" forState:UIControlStateNormal];
    [_annRecomm setBackgroundColor:[UIColor blueColor]];
    [_annRecomm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_annRecomm addTarget:self action:@selector(annStartRecommClick:) forControlEvents: UIControlEventTouchUpInside];//处理点击
    [self.view addSubview:_annRecomm];
    
    
    _redemmBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 140, 100, 50)];
    [_redemmBtn setTitle:@"兑换码" forState:UIControlStateNormal];
    [_redemmBtn setBackgroundColor:[UIColor brownColor]];
    [_redemmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_redemmBtn addTarget:self action:@selector(annExtinfo:) forControlEvents: UIControlEventTouchUpInside];//处理点击
    [self.view addSubview:_redemmBtn];
    
    
    _annBannerView = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
    [_annBannerView setTitle:@"banner广告" forState:UIControlStateNormal];
    [_annBannerView setBackgroundColor:[UIColor blueColor]];
    [_annBannerView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_annBannerView addTarget:self action:@selector(annbannerClick:) forControlEvents: UIControlEventTouchUpInside];//处理点击
    [self.view addSubview:_annBannerView];
    
    
    _annIntereBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 200, 100, 50)];
    [_annIntereBtn setTitle:@"插屏广告" forState:UIControlStateNormal];
    [_annIntereBtn setBackgroundColor:[UIColor brownColor]];
    [_annIntereBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_annIntereBtn addTarget:self action:@selector(annIntereClick:) forControlEvents: UIControlEventTouchUpInside];//处理点击
    [self.view addSubview:_annIntereBtn];
    
}


-(void)annStartRecommClick:(id)sender
{
   //[[AnnieIosSdk sharedInstance] setshowEsttime:15];
     [[AnnieIosSdk sharedInstance] showandgoAssessment];
  
}

-(void)annbannerClick:(id)sender
{
//    CGPoint adsPoint =  CGPointMake(0, 0);
//    UIViewController * adsViewController = [[AnnieIosSdk sharedInstance] getBannerAdsView:kMyGADAdSizeBannerNormal withAdsPosition:adsPoint];

    UIViewController *adsViewController =[[AnnieIosSdk sharedInstance]getBannerAdsView:kMyGADAdSizeSmartBannerLandscape withAdsPositionEnum:kMyAdPosBotRight];
//    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootViewController.view addSubview:adsViewController.view];
}


-(void)annIntereClick:(id)sender
{
//    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [[AnnieIosSdk sharedInstance]showInterstitialWithParentVC:rootViewController];
}

/**
 *
 *  @param sender
 */
- (void)annStartMoreClick:(id)sender {
   // NSLog(@"进入更多");
    [[AnnieIosSdk sharedInstance] tomore];
}

/**
 *  @param sender
 */
-(void)annStartEstClick:(id)sender
{
    [[AnnieIosSdk sharedInstance] showandgoAssessment];
}


/**
 *
 *  @param sender
 */
-(void)annExtinfo:(id)sender
{
    [[AnnieIosSdk sharedInstance] getReemcode];
}


/**
 *  初始化回调
 */
-(void)initSdk:(int)resultCode{
   NSLog(@"!!!!!!!");
    if (resultCode == AnnInitSuccess) {
       
   }else if(resultCode == AnnNoInit){
       NSLog(@"＝＝＝未初始化");
   }
    
    [self initDemoView];
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    [[AnnieIosSdk sharedInstance]showInterstitialWithParentVC:rootViewController];
}


-(void)codeExchange:(int)resultCode{
    if (resultCode == AnncodeSuccess) {
        NSLog(@"codeExchange info = %@", [AnnComTool sharedSingleton].codeinfo);//返回给info cp使用
    }else if(resultCode == AnncodeFail)
    {
        [self showMessage:@"here--未获得兑换码"];
    }
}


/**
 *  检测更新回调
 *
 *  @param msg description
 */
//-(void)AnquCheckUpdate
//{
//    [self showMessage:@"检测更新回调"];
//}



-(void)showMessage:(NSString*)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}


#pragma -mark UITextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect frame = textField.frame;
    int offset;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {//如果机型是iPhone
        
        if (_orientation == UIDeviceOrientationPortrait) {//是竖屏
            offset = frame.origin.y + 200 - (self.view.frame.size.height -216.0);
        }else{
            offset = frame.origin.y + 230 - (self.view.frame.size.height -216.0);
        }
        
    }else{//机型是ipad
        if (_orientation == UIDeviceOrientationPortrait) {//是竖屏
            offset = frame.origin.y + 100 - (self.view.frame.size.height -216.0);
        }else{
            offset = frame.origin.y + 190 - (self.view.frame.size.height -216.0);
        }
        
    }
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        if (_orientation == UIDeviceOrientationPortrait) {//是竖屏
            self.view.frame =CGRectMake(0.0f, 0,self.view.frame.size.width,self.view.frame.size.height);//-offset 0.0f
        }else{
            self.view.frame =CGRectMake(0, 0.0f,self.view.frame.size.width,self.view.frame.size.height);//-offset 0.0f
        }
    
    [UIView commitAnimations];
    
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
}

//触摸view隐藏键盘——touchDown

- (IBAction)View_TouchDown:(id)sender {
    // 发送resignFirstResponder.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

-(BOOL)shouldAutorotate
{
    return YES;
}

//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//    
// 
//}

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

