//
//  XLSiteController.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLSiteController.h"

@interface XLSiteController ()

@end

@implementation XLSiteController

@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"号码管理";
        
        service = [[XLCompanyService alloc] init];
        companys = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [companys removeAllObjects];
    [companys addObjectsFromArray:[service getAllCompany]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
//datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [companys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLSiteCell *cell = nil;
    static NSString *cellId = @"express_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[XLSiteCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    
    NSString *str = [NSString stringWithFormat:@"%@_s.png",company.image];
    cell.logoView.image = [UIImage imageNamed:str];
    cell.textLabel.text = company.name;
    cell.detailTextLabel.text = company.phone;
    
    return cell;
}

//delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XLEditCompanyController *editCompany = [[XLEditCompanyController alloc] initWithNibName:@"XLEditCompanyController" bundle:nil];
    editCompany.company = [companys objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:editCompany animated:YES];
}

@end
