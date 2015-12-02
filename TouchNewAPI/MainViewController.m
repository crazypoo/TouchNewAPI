//
//  MainViewController.m
//  TouchNewAPI
//
//  Created by 邓杰豪 on 15/12/2.
//  Copyright © 2015年 邓杰豪. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "Test3DTouchViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>
{
    NSArray *cellArr;
    UITableView *tbView;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
    [self check3DTouch];
}

-(void)check3DTouch
{
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        //ok
    }
    else{
        //notok
    }
}

-(void)initTableView
{

    cellArr = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tbView.dataSource = self;
    tbView.delegate = self;
    tbView.showsHorizontalScrollIndicator = NO;
    tbView.showsVerticalScrollIndicator = NO;
    tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tbView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellArr.count;

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {

        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    if (indexPath.row == 0 || indexPath.row == 1) {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = cellArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id)context viewControllerForLocation:(CGPoint) point
{
    NSIndexPath *indexPath = [tbView indexPathForCell:(UITableViewCell* )[context sourceView]];

    NSArray *arr = @[@"1",@"2",@"3"];
    NSArray *colorArr = @[[UIColor redColor],[UIColor greenColor],[UIColor blackColor]];

    Test3DTouchViewController *childVC = [[Test3DTouchViewController alloc] initWithTitle:arr[indexPath.row] bgColor:colorArr[indexPath.row]];
    childVC.preferredContentSize = CGSizeMake(0.0f,600.f);
    return childVC;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}
@end
