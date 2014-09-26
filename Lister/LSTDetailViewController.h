//
//  LSTDetailViewController.h
//  Lister
//
//  Created by Michael Colon on 9/9/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*** Detail view controller for viewing item details.
 */
@interface LSTDetailViewController : UIViewController
@property ( nonatomic, weak ) IBOutlet UILabel *name;
@property ( nonatomic, weak ) IBOutlet UILabel *email;
@property ( nonatomic, weak ) IBOutlet UILabel *twitter;
@property ( nonatomic, weak ) IBOutlet UIScrollView *scrollView;
@property ( nonatomic, weak ) IBOutlet UILabel *numberOfTweets;
@end
