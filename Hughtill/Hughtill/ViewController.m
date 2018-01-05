//
//  ViewController.m
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Htills.h"
#import "UIView+Htills.h"
#import "Htills.h"

@interface ViewController ()
{
    NSInteger selectIndex;
}
@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.tableData = [NSMutableArray new];
    selectIndex = -1;
    self.TableView.rowHeight = UITableViewAutomaticDimension;
    self.TableView.estimatedRowHeight = 80;

    [self.tableData addObject:@{
                                @"detail":
                                @"공지사항 내용"
                                }];
    [self.tableData addObject:@{
                                @"detail":
                                @"공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용공지사항 내용"
                                }];
    [self.TableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* data = self.tableData[indexPath.row];
    
    if (indexPath.row == selectIndex)//선택한 공지사항
    {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"openCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        UILabel* textLabel = [cell.contentView viewWithTag:100];
        [textLabel setText:[data objectForKey:@"detail"]];
        return cell;
    }
    else
    {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"closeCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        return cell;
    }
    
    return [UITableViewCell new];
}



- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //같은걸 다시 눌렀다면.
    if (selectIndex == indexPath.row) {
        selectIndex = -1;
        [tableView reloadRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        NSInteger prevIndex = selectIndex;
        selectIndex = indexPath.row;
        NSMutableArray* reloadIndexes = [NSMutableArray new];
        
        if (selectIndex != -1)
        {
            NSIndexPath* prevIndexPath = [NSIndexPath indexPathForRow:prevIndex inSection:0];
            [reloadIndexes addObject:prevIndexPath];
            //[tableView reloadRowsAtIndexPaths:@[ prevIndexPath ] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        [reloadIndexes addObject:indexPath];
        [tableView reloadRowsAtIndexPaths:reloadIndexes withRowAnimation:UITableViewRowAnimationAutomatic];
    }

    
    
    
    
}





































/*
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button setCenter:self.view.center];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:button];
    
    
    UIView* fadeAnimationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [fadeAnimationView setBackgroundColor:[UIColor grayColor]];
    [fadeAnimationView FadeAnimationAutoSetDuration:0.3f];
    [self.view addSubview:fadeAnimationView];
}

- (void) btnAction:(UIButton*)button
{
    
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
