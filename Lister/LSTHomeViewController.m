//
//  LSTHomeViewController.m
//  Lister
//
//  Created by Michael Colon on 9/10/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import "LSTHomeViewController.h"

@interface LSTHomeViewController ()

@end

@implementation LSTHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

- ( void ) viewWillAppear:(BOOL)animated {
  // set navigation bar to hidden for home view. I like the plain look.
  [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
