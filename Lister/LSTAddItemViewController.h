//
//  LSTAddItemViewController.h
//  Lister
//
//  Created by Michael Colon on 9/4/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import <UIKit/UIKit.h>

/*** View controller to add items to table view list.
 */
@interface LSTAddItemViewController : UIViewController <UITextFieldDelegate> {
  NSTimer * _timer;
}
@property ( nonatomic, weak ) IBOutlet UITextField *firstName;
@property ( nonatomic, weak ) IBOutlet UITextField *lastName;
@property ( nonatomic, weak ) IBOutlet UITextField *email;
@property ( nonatomic, weak ) IBOutlet UITextField *screenName;
@property ( nonatomic, weak ) IBOutlet UILabel *status;
@end
