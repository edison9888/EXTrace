//
//  XLViewController.m
//  EXTrace
//
//  Created by liang xie on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import "XLViewController.h"

@interface XLViewController ()

@end

@implementation XLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSString *nilName = nibNameOrNil;
    if (nilName) {
        if (!iPhone5) {
            nilName = [NSString stringWithFormat:@"%@_4",nibNameOrNil];
        }
    }
    
    self = [super initWithNibName:nilName bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = (XLAppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
