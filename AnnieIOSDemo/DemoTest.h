//
//  DemoTest.h
//  AnnieSDKDemo
//
//  Created by jiangfeng on 15/3/24.
//  Copyright (c) 2015年 anqu. All rights reserved.
//

 
#import <UIKit/UIKit.h>

@interface DemoTest : UIViewController<UITextFieldDelegate>

@property(nonatomic, strong)IBOutlet UIView *annDemoView;

@property(nonatomic, strong)IBOutlet UIButton *annmore;

@property(nonatomic, strong)IBOutlet UIButton *annest;

@property(nonatomic, strong)IBOutlet UIButton *annRecomm;

@property(nonatomic, strong)UIButton *redemmBtn;

@property(nonatomic, strong)IBOutlet UIButton *annBannerView;

@property(nonatomic, strong)UIButton *annIntereBtn;

@property(nonatomic, assign)UIInterfaceOrientation orientation;

-(void)initDemoView;

@end