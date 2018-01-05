//
//  ViewController.h
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic, strong) NSMutableArray* tableData;

@end

