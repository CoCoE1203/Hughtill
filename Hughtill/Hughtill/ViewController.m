//
//  ViewController.m
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Htills.h"
#import "Htills.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button setCenter:self.view.center];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) show
{

    [Htills makeCenterAlertWithViewController:self title:@"t" message:@"m" handler:^(UIAlertAction * _Nullable action) {
        
        NSLog(@"test1");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
