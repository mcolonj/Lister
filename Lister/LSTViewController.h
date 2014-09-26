//
//  LSTViewController.h
//  Lister
//
//  Created by Michael Colon on 9/4/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import <UIKit/UIKit.h>

/*** TableView controller main view for displaying list items.
 
 */
@interface LSTViewController : UITableViewController <UITextFieldDelegate>
{
  BOOL _sorted;
}
//@property ( nonatomic, strong ) IBOutlet UITableView *table;
@property ( nonatomic, weak ) IBOutlet UIView *headerView;
@property ( nonatomic, weak ) IBOutlet UITextField *firstName;
@property ( nonatomic, weak ) IBOutlet UITextField *lastName;
@property ( nonatomic, weak ) IBOutlet UITextField *email;
@property ( nonatomic, weak ) IBOutlet UILabel *status;
@property ( nonatomic, weak ) IBOutlet UITapGestureRecognizer *tapGesture;
@end
