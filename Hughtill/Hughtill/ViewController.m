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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
