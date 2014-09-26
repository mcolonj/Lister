//
//  LSTTableViewCellHeader.h
//  Lister
//
//  Created by Michael Colon on 9/10/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import <UIKit/UIKit.h>

/*** TableView cell header.
 Displays controls for sorting, adding, and editing items in the table view.
 
 */
@interface LSTTableViewCellHeader : UITableViewCell
@property ( nonatomic, weak ) IBOutlet UIButton *sort;
@property ( nonatomic, weak ) IBOutlet UIButton *add;
@property ( nonatomic, weak ) IBOutlet UIButton *edit;
@property ( nonatomic, weak ) IBOutlet UIButton *home;
@end
