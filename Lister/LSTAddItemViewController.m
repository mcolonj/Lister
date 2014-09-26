//
//  LSTAddItemViewController.m
//  Lister
//
//  Created by Michael Colon on 9/4/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import "LSTAddItemViewController.h"
#import "ListManager.h"

@interface LSTAddItemViewController ()

@end

@implementation LSTAddItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// button action to save item/person
- ( IBAction ) addItem: ( id ) sender {
  
  // create new item
  ListObject *item = [[ListObject alloc] init];
  // add person detals to item
  if ( self.firstName.text && ! [self.firstName.text isEqualToString:@""] )
    item.firstName = self.firstName.text;
  if ( self.lastName.text && ! [self.lastName.text isEqualToString:@""] )
    item.lastName = self.lastName.text;
  if ( self.email.text && ! [self.email.text isEqualToString:@""] ) {
    //check that email is valid
    if ( [self isValidEmai:self.email.text] ) item.email = self.email.text;
    // if not valid pop up alert
    else [self showInvalidEmailAlert];
  }
  NSLog(@"doing 1");
  // twitter screen name
  item.screenName = self.screenName.text;
  // check to see its all there
  if ( item.firstName && item.lastName && item.email ) {
    // add it
    NSLog(@"doing 2");
    [[ListManager sharedListManager] addItem:item];
    self.status.hidden = NO;
    self.status.text = @"Your entry was added to the list";
    NSLog(@"doing 3");
    [self clearFields];
    _timer = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(resetStatus) userInfo:nil repeats:NO];
  }
  [self resignAllResponders];
}

- ( void ) resetStatus {
  self.status.text = @"";
  self.status.hidden = YES;
}

- ( void ) clearFields {
  self.firstName.text = @"";
  self.lastName.text = @"";
  self.email.text = @"";
  self.screenName.text = @"";
}

// RFC 2822 Regex Validation snippet from http://stackoverflow.com/questions/800123/what-are-best-practices-for-validating-email-addresses-in-objective-c-for-ios-2

- ( BOOL ) isValidEmai: ( NSString * ) email {
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- ( void ) showInvalidEmailAlert {
  UIAlertView *invalidEmailAlert = [[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"The email you entered was invalid" delegate:self cancelButtonTitle:@"I'll fix it" otherButtonTitles:nil];
  [invalidEmailAlert show];
}

- ( void ) textFieldDidBeginEditing:(UITextField *)textField {
  
}

- ( void ) textFieldDidEndEditing:(UITextField *)textField  {
  [textField resignFirstResponder];
}

- ( BOOL ) textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}


- ( void ) resignAllResponders {
  [self.firstName resignFirstResponder];
  [self.email resignFirstResponder];
  [self.lastName resignFirstResponder];
}

- ( IBAction ) lowerKeyboard {
  [self resignAllResponders];
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
