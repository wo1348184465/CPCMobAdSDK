//
//  TableViewController.m
//  HotFixDemo
//
//  Created by bing on 2018/7/7.
//  Copyright © 2018年 Ji Fen. All rights reserved.
//

#import "TableViewController.h"

//#import <CPCMobAdSDK/CPCCoreServer.h>

@interface TableViewController ()
@property (nonatomic , strong) NSMutableDictionary * setBody;
@property (nonatomic , strong) UIButton * backButton;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    //    self.navigationItem.leftBarButtonItem = barButton;

    self.navigationItem.leftBarButtonItems = @[barButton];
    
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:animated];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//
//
//#pragma mark - Table view data source
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 100;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return [[CPCCoreServer sharedInstance] cpcAdViewForHeight:self.adverts[0]];
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
//    }
//    else
//    {
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
//        
//
//    }
//    
//    if (indexPath.row % 7 == 0) {
//        
//        id advert = [[CPCCoreServer sharedInstance] cpcShowView:self.adverts[0] setDelegate:self];
//        [cell.contentView addSubview:advert];
//    }
//    else
//    {
//        
//        cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    }
//    
//    
//    return cell;
//}
//
//- (void)popDiyView
//{
//    
//    
//    
//    NSArray *viewcontrollers=self.navigationController.viewControllers;
//    if (viewcontrollers.count>1) {
//        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self)
//        {
//            //push方式
//            [self.navigationController popViewControllerAnimated:YES];
//            
//        }
//    }
//    else{
//        //present方式
//        [self dismissViewControllerAnimated:YES completion:nil];
//        
//    }
//    
//    
//    
//}
//
//- (UIButton *)backButton
//{
//    if (!_backButton) {
//        
//        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        //        [_backButton setFrame:CGRectMake(5, 5, 30, 30)];
//        [_backButton setFrame:CGRectMake(0, 0, 44, 44)];
//        _backButton.contentEdgeInsets =UIEdgeInsetsMake(0, -16,0, 0);
//        
//        _backButton.imageEdgeInsets =UIEdgeInsetsMake(0, -16,0, 0);
//        //        UIImage *image = [UIImage imageNamed:@"CPCiOSSDK.framework/back_white"];
//        UIImage *image = [UIImage imageNamed:@"CPCMobAdSDK.bundle/back_white"];
//        
//        
//        //        [_backButton setBackgroundImage:image forState:UIControlStateNormal];
//        [_backButton setImage:image forState:UIControlStateNormal];
//        [_backButton addTarget:self action:@selector(popDiyView) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    return _backButton;
//}

@end
