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

@interface CPCViewController ()<CPCADViewDelegate>



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


@end

@implementation CPCViewController

int i = 0;
- (IBAction)ActionShowADView:(id)sender {
    
    
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
    config.imageOffset = 10;
    
    if (self.isRightButton.selected == 1) {
        config.isRight = YES;
        
    }
    else
    {
        
        config.isRight = NO;
    }
    config.time = @"12:30";
    //    config.push = self;
    [config setVideoType:0];
    //        config.clickSize = CGSizeMake(0, 200);
    //    config.style = 404100;
    
    
    
    
    config.style = ([self.styleTextField.text isEqualToString:@""] ?0: [self.styleTextField.text intValue] );
    [userDefault setValue:self.styleTextField.text forKey:@"styleDef"];
    
    
    
    [[CPCCoreServer sharedInstance] cpcGetADModel:config success:^(CPCADViewConfigModel *adViewModel) {
        
        // 有百度打底
        if (adViewModel.flag == 1) {
            
            //
            //            UIView * adView = [[CPCCoreServer sharedInstance] cpcShowView:adViewModel setDelegate:self];
            //
            //            [self.view addSubview:adView];
            
        }
        else // 正常逻辑
        {
            adViewModel.pushRootVC = self;
            
            UIView * adView = [[CPCCoreServer sharedInstance] cpcShowView:adViewModel setDelegate:self];
            
            
            
            [adView setBackgroundColor:[UIColor grayColor ]];
            if (adView != nil) {
                
                CGRect fr = adView.frame;
                fr.origin.y = 100 * i + 64;
                
                if (self.changeButton.selected == 1) {
                    
                    
                    adViewModel.width = 300;
                    
                    fr.origin.x = 0;
                    fr.size.width = 300;
                    [adView setFrame:fr];
                    [self.view addSubview:adView];
                    i = i + 1;
                    [self.adViewArr addObject:adView];
                }
                else
                {
                    
                    [adView setFrame:fr];
                    [self.view addSubview:adView];
                    NSLog(@"高度:-----------------------%f",adView.frame.size.height);
                    
                    i = i + 1;
                    [self.adViewArr addObject:adView];
                }
                
                
            }
            
        }
        
        NSLog(@" model 高度:**************************************  == %f",adViewModel.cellHeight);
        
        
    } failure:^(NSError *error) {
        
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
        NSLog(@"更新后 =============== %f",[[CPCCoreServer sharedInstance] cpcConfigWithFont:adView font:[UIFont systemFontOfSize:fontSize]]);
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
    self.tab.adverts = self.adModelArr;
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:self.tab];
    
    nav.navigationBar.barTintColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:33/255.0 alpha:1];
    
    
    [self presentViewController:nav animated:YES completion:nil];
    //    [self.navigationController pushViewController:tab animated:YES];
    
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
    
    //    [self addviews];
    
    
    
    //    UIButton *buttonName = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonName setFrame:CGRectMake(100,100, 100, 100)];
    //    [buttonName setBackgroundColor:[UIColor redColor]];
    //    [buttonName setTitle:@"title" forState:UIControlStateNormal];
    //    [buttonName addTarget:self action:@selector(ActionName) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:buttonName];
    
    
    
    
    
    
    
    
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
            
            [[CPCCoreServer sharedInstance] cpcOnClickReport:adViewModel];
            [[CPCCoreServer sharedInstance] cpcOnShowReport:adViewModel];
            
            
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
