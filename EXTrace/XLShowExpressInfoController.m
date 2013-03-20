//
//  XLShowExpressInfoController.m
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLShowExpressInfoController.h"

@interface XLShowExpressInfoController ()

@end

@implementation XLShowExpressInfoController

@synthesize express = _express;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backHome)];
        
        self.navigationItem.leftBarButtonItem = leftItem;
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareInfomation)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    return self;
}

- (void)backHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)shareInfomation
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    XLCompanyService *service = [[XLCompanyService alloc] init];
    _company = [service getExpressCompanyById:_express.companyId];
    
    self.title = [NSString stringWithFormat:@"%@-%@",_company.name,_express.expressNo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

@end
