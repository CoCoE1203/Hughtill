//
//  FirstViewController.m
//  Hughtill
//
//  Created by Burn on 2018. 1. 4..
//  Copyright © 2018년 Hugh. All rights reserved.
//

#import "FirstViewController.h"
#import "Htills.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)BtnActionBackButton:(id)sender
{
    [Htills popToRootViewControllerAnimation:YES];
}

@end
