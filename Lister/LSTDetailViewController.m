//
//  LSTDetailViewController.m
//  Lister
//
//  Created by Michael Colon on 9/9/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import "LSTDetailViewController.h"
#import "ListManager.h"



@interface LSTDetailViewController ()

@end

@implementation LSTDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}
  
- (void)viewDidLoad
{
  [super viewDidLoad];
  // grab person from list manager for detail display
  ListObject *person = [[ListManager sharedListManager] itemAtIndex:[[ListManager sharedListManager] currentSelection]];
  if ( person )
  {
    // format first last name from person
    self.name.text = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    // person email
    self.email.text = person.email;
    // twitter screen name
    self.twitter.text = person.screenName;
  }
}

- ( void ) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- ( void ) didReceiveMemoryWarning
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
