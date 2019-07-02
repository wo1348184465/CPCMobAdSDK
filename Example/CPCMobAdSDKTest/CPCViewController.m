//
//  ViewController.m
//  ADTest
//
//  Created by dinghao on 2018/6/7.
//  Copyright © 2018年 dinghao. All rights reserved.
//
#import "TableViewController.h"
#import "CPCViewController.h"
#import <CPCMobAdSDK/CPCCoreServer.h>
#import "CustomLayoutViewController.h"
#import "TableViewController.h"

#import <CPCH5SDK/CPCWebView.h>

@interface CPCViewController ()<CPCADViewDelegate,CPCWebViewDelegate>




@property (nonatomic , strong) NSMutableArray * adModelArr;
@property (nonatomic , strong) NSMutableArray * adViewArr;

@property (weak, nonatomic) IBOutlet UITextField *adIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *fontTextField;


@property (weak, nonatomic) IBOutlet UITextField *styleTextField;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (nonatomic , strong) TableViewController * tab;


@property (nonatomic , strong) UIButton * jumpButton;

@property (weak, nonatomic) IBOutlet UIButton *changeButton;

@property (weak, nonatomic) IBOutlet UIButton *isRightButton;

@property (nonatomic , strong) CPCWebView * web;
@end

@implementation CPCViewController









int i = 0;
- (IBAction)ActionShowADView:(id)sender {
    
    
    
    
    
    NSMutableArray * arr= [NSMutableArray array];
    
    [arr addObject:@"1"];
    
    
    
    NSString * adid = ([self.adIdTextField.text isEqualToString:@""] ?@"7277638": self.adIdTextField.text );
    
    
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setValue:adid forKey:@"adidDef"];
    [userDefault setValue:@(self.isRightButton.selected) forKey:@"right"];
    [userDefault setValue:@(self.changeButton.selected) forKey:@"change"];
    [userDefault synchronize];
    
    CPCAdViewConfig * config = [[CPCAdViewConfig alloc] init];
    
    config.adid = adid;
    UIEdgeInsets edgeInset;
    edgeInset.top = 10;
    edgeInset.left = 10;
    edgeInset.right = 10;
    edgeInset.bottom = 10;
    config.edgeInset = edgeInset;
    config.titleImageOffset = 10;
    config.titleFont = [UIFont systemFontOfSize:18];
    
    config.imageOffset = 5;
    [config setVideoType:1];
    config.channel = @"123445";
    config.memberid = @"1234";
    //    config.aspectRatio = 0.1;
    
    
    
    if (self.isRightButton.selected == 1) {
        config.isRight = YES;
        
    }
    else
    {
        
        config.isRight = NO;
    }
    config.time = @"12:30";
    //    config.push = self;
    //    [config setVideoType:1];
    //        config.clickSize = CGSizeMake(0, 200);
    //    config.style = 404100;
    
    
    
    
    config.style = ([self.styleTextField.text isEqualToString:@""] ?0: [self.styleTextField.text intValue] );
    [userDefault setValue:self.styleTextField.text forKey:@"styleDef"];
    
    
    
    [[CPCCoreServer sharedInstance] cpcGetADModel:config success:^(CPCADViewConfigModel *adViewModel) {
        
        
        NSLog(@" model 高度:**************************************  == %f",adViewModel.cellHeight);
        // 有百度打底
        
        adViewModel.pushRootVC = self;
        
        
        
        BOOL isExpired =   [[CPCCoreServer sharedInstance] cpcIsExpired:adViewModel];
        
        
        NSLog(@"--- 是否过期:%d" , isExpired);
        
        UIView * adView = [[CPCCoreServer sharedInstance] cpcShowView:adViewModel setDelegate:self];
        [adView setBackgroundColor:[UIColor blackColor]];
        
        [adView setFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        
        //            [adView setBackgroundColor:[UIColor grayColor ]];
        if (adView != nil) {
            
            CGRect fr = adView.frame;
            fr.origin.y = 100 * i + 64;
            
            if (self.changeButton.selected == 1) {
                
                
                adViewModel.width = 300;
                
                fr.origin.x = (self.view.frame.size.width - adView.frame.size.width)/2;
                //                    fr.size.width = 300;
                [adView setFrame:fr];
                [self.view addSubview:adView];
                i = i + 1;
                [self.adViewArr addObject:adView];
            }
            else
            {
                
                //                    fr.origin.x = (self.view.frame.size.width - adView.frame.size.width)/2;
                //                    fr.origin.y = 100;
                //                    fr.size.width = 327;
                //                    fr.size.height = 269.48;
                //                    fr.size.width = 300;
                [adView setFrame:fr];
                [self.view addSubview:adView];
                NSLog(@"高度:-----------------------%f   宽度:%f",adView.frame.size.height,adView.frame.size.width);
                
                i = i + 1;
                [self.adViewArr addObject:adView];
            }
            
            
        }
        
        
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"error == %@",error);
    }];
    
    
    
    
}

- (void)CPCClickCallBack:(UIView *)adview
{
    
}

- (void)CPCDataReportShow:(BOOL)show
{
    
}
- (IBAction)ActionRefreshADView:(id)sender {
    
    CGFloat fontSize = ([self.fontTextField.text isEqualToString:@""] ? 12 : [self.fontTextField.text floatValue]);
    
    for (int i = 0; i < self.adViewArr.count; i++) {
        
        UIView * adView = [self.adViewArr objectAtIndex:i];
//        NSLog(@"更新后 =============== %f",[[CPCCoreServer sharedInstance] cpcConfigWithFont:adView font:[UIFont systemFontOfSize:fontSize]]);
    }
    
}

- (IBAction)ActionClearADView:(id)sender {
    
    [self.adViewArr removeAllObjects];
    
    for (UIView *view in [self.view subviews]) {
        
        
        
        if ([view  isKindOfClass:NSClassFromString(@"CPCADParentView")]) {
            
            [view removeFromSuperview];
            
        }
        
        
    }
    i = 0;
    
}

- (IBAction)ActionPushTableViewController:(id)sender {
    //    TableViewController * tab = [[TableViewController alloc]init];
    //    self.tab.adverts = self.adModelArr;
    //    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:self.tab];
    //
    //    nav.navigationBar.barTintColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:33/255.0 alpha:1];
    //
    //
    //    [self presentViewController:nav animated:YES completion:nil];
    //    [self.navigationController pushViewController:tab animated:YES];
    
    
    CustomLayoutViewController * baidu = [[CustomLayoutViewController alloc]init];
    [self.navigationController pushViewController:baidu animated:YES];
    
    
    
    
}


#pragma mark -
#pragma mark 改变frame

- (IBAction)changeFrame:(id)sender {
    self.changeButton.selected = !self.changeButton.selected;
    
}

#pragma mark -
#pragma mark 是否是右图

- (IBAction)isRightAction:(id)sender {
    self.isRightButton.selected = !self.isRightButton.selected;
}


#pragma mark -
#pragma mark 互动广告
- (IBAction)hudongAction:(id)sender {
    
    
    //    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    //    [dic setObject:@"12345" forKey:@"getMemberid"];
    //
    //    UIViewController * ctrl = [[CPCCoreServer sharedInstance] loadH5FromeUrl:@"http://cfg.aiclk.com/hdjump?iclicashid=7654888" andDic:dic backHiddenNav:YES];
    //
    //
    //    [self.navigationController pushViewController:ctrl animated:YES];
    
    
    //    TableViewController * table = [[TableViewController alloc]init];
    //    table.adverts = self.adViewArr;
    //    [self.navigationController pushViewController:table animated:YES];
    
    
    
    
    
    
    //
    //    self.web = [[CPCWebView alloc]initWithFrame:self.view.frame];
    //    self.web.url = @"http://game-motivatead.qutuiwa.com/richprize_kb/richprize_kb.html";
    ////    web.cpcDelegate = self;
    ////    self.web.UIDelegate = self;
    ////    self.web.navigationDelegate = self;
    //    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    //    [dic setObject:@"12345" forKey:@"getMemberid"];
    //    [self.view addSubview:self.web];
    //    self.web.infoDic = dic;
    //    [self.web loadRequest];
    
    //    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[@"http://game-motivatead.qutuiwa.com/richprize_kb/richprize_kb.html" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
    
    
    
    
    
    self.web = [[CPCWebView alloc] initWithFrame:self.view.bounds];
    self.web.CPCWebDelegate = self;
    self.web.url = @"http://game-motivatead.qutuiwa.com/wakuang_kb/wakuang_kb.html?iclicashid=7654887";
    self.web.memberid = @"12334564";
    [self.web loadRequest];
    [self.view addSubview:self.web];
    
    
    UIButton *buttonName = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonName setFrame:CGRectMake(100,100, 100, 100)];
    [buttonName setBackgroundColor:[UIColor redColor]];
    [buttonName setTitle:@"title" forState:UIControlStateNormal];
    [buttonName addTarget:self action:@selector(goback1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:    buttonName];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
}


- (void)goback1:(UIButton *)sender
{
    
    if ([self.web canGoBack]) {
        
        [self.web goBack];
    }
    else
    {
        [self.web removeFromSuperview];
    }
    
    
}


#pragma mark -
#pragma mark 滚动区域
-(void)viewDidLayoutSubviews
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,700);
}




#pragma mark -
#pragma mark 取消第一响应者
- (void)resignFirst
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
}

- (void)jumpAction
{
    NSLog(@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //
    //    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 0.8)];
    //    [imageview setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://localhost/fuchouzhe"]]]];
    //    [imageview setContentMode:UIViewContentModeScaleAspectFill];
    //    [self.view addSubview:imageview];
    //
    ////    (origin = (x = 309, y = 49), size = (width = 90, height = 33))
    ////    self.frame = CGRectMake(XH_ScreenW-90 - 15,49, 90, 33);
    //
    //    UIButton *buttonName = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonName setFrame:CGRectMake(309,49, 90, 33)];
    //    [buttonName setBackgroundColor:[UIColor redColor]];
    //    [buttonName setTitle:@"title" forState:UIControlStateNormal];
    //    [buttonName addTarget:self action:@selector(ActionName) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:buttonName];
    
    //
    
    
    
    
    //    [ADSCoreServer sharedInstance].delegate = self;
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignFirst)];
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignFirst)];
    
    [self.view addGestureRecognizer:tap];
    [self.scrollView addGestureRecognizer:tap2];
    
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    
    self.adIdTextField.text = [userDefault objectForKey:@"adidDef"];
    
    self.styleTextField.text = [userDefault objectForKey:@"styleDef"];
    
    self.isRightButton.selected = [[userDefault objectForKey:@"right"] intValue];
    self.changeButton.selected = [[userDefault objectForKey:@"change"] intValue];
    
    
    
    self.tab = [[TableViewController alloc]init];
    
    
    self.jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.jumpButton setFrame:CGRectMake(100,100, 100, 100)];
    [self.jumpButton setBackgroundColor:[UIColor redColor]];
    [self.jumpButton setTitle:@"跳过" forState:UIControlStateNormal];
    [self.jumpButton addTarget:self action:@selector(jumpAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    self.adViewArr = [[NSMutableArray alloc] initWithCapacity:0];
    self.adModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    
    
    
    
    
    
    
    
}

- (void)ActionName
{
    NSString * adid = @"7112926";
    
    
    CPCAdViewConfig * config = [[CPCAdViewConfig alloc] init];
    
    config.adid = adid;
    UIEdgeInsets edgeInset;
    edgeInset.top = 10;
    edgeInset.left = 10;
    edgeInset.right = 10;
    edgeInset.bottom = 10;
    config.edgeInset = edgeInset;
    config.titleImageOffset = 10;
    config.titleFont = [UIFont systemFontOfSize:18];
    config.imageOffset = 10;
    config.isRight = NO;
    //    config.push = self;
    [config setVideoType:1];
    
    
    [[CPCCoreServer sharedInstance] cpcGetADModel:config success:^(CPCADViewConfigModel *adViewModel) {
        
        
        if (adViewModel.flag == 1) {
            
            NSLog(@"----------union = %@",adViewModel.unionName);
            NSLog(@"----------union = %@",adViewModel.appid);
            
            NSLog(@"----------union = %@",adViewModel.adslotid);
            
            NSLog(@"----------union = %@",adViewModel.imp);
            
            NSLog(@"----------union = %@",adViewModel.clk);
            
            
            
        }
        else
        {
            adViewModel.pushRootVC = self;
            
            //            NSLog(@"高度 -----------------------%f",[[CPCCoreServer sharedInstance] cpcAdViewForHeight:adViewModel]);
            
            
            
            UIView * adView = [[CPCCoreServer sharedInstance] cpcShowView:adViewModel setDelegate:self];
            
            
            
            [adView setBackgroundColor:[UIColor whiteColor ]];
            if (adView != nil) {
                
                
                CGRect fr = adView.frame;
                fr.origin.y = 100 * i + 64;
                fr.origin.x = 24;
                [adView setFrame:fr];
                [self.view addSubview:adView];
                i = i + 1;
                
            }
            
        }
        
        
    } failure:^(NSError *error) {
        
    }];
}



- (void)addviews
{
    
    UIEdgeInsets edgeInset;
    
    edgeInset.top = 10;
    edgeInset.left = 10;
    edgeInset.right = 10;
    edgeInset.bottom = 10;
    
    
    NSMutableDictionary * setBody = [NSMutableDictionary dictionary];
    [setBody setObject:@(10) forKey:@"titleImageOffset"];
    [setBody setObject:@(5) forKey:@"imageOffset"];
    [setBody setObject:[NSValue valueWithUIEdgeInsets:edgeInset] forKey:@"edgeInset"];
    [setBody setObject:@"right" forKey:@"picType"];
    [setBody setObject:[UIFont systemFontOfSize:15] forKey:@"titleFont"];
    
    
    
    
    NSMutableDictionary * adBody = [[NSMutableDictionary alloc]initWithCapacity: 0];
    [adBody setObject:@"7277638" forKey:@"id"];
    
    
}



- (void)ADSClickCallBack:(UIView *)adview
{
    NSLog(@"------------------点击回调--------------------%@",adview);
}

-(void)ADSDataReportClick:(BOOL)click
{
    NSLog(@"------------------点击上报回调--------------------");
    
}

- (void)ADSDataReportShow:(BOOL)show
{
    NSLog(@"------------------展示回调--------------------");
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

