//
//  ListManager.h
//  Lister
//
//  Created by Michael Colon on 9/4/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import <Foundation/Foundation.h>

/*** basic list object for storing/retrieving in list manager
 */
@interface  ListObject : NSObject <NSCoding>
@property ( nonatomic, strong ) NSString *firstName;
@property ( nonatomic, strong ) NSString *lastName;
@property ( nonatomic, strong ) NSString *email;
@property ( nonatomic, strong ) NSString *screenName;
- ( id ) initWithFirstName: ( NSString* ) first lastName: (NSString*)last email: ( NSString * ) email screenName:( NSString *) screenName;
@end

/*** List Manager for storing, saving and retrieving list items.
 
 */
@interface ListManager : NSObject
{
  NSMutableArray * _list;
  int _selected;
}

// Singleton function for grabbing shared object
+ ( ListManager * ) sharedListManager;
// adds a new item to the list
- ( void ) addItem:( ListObject * ) item;
// deletes an item from the list
- ( void ) deleteItemAtIndex: ( int ) index;
// grabs item at index
- ( ListObject * ) itemAtIndex: ( int ) index;
// moves item from current index to destination index
- ( void ) moveItemAtIndex: ( int ) current toDestinationIndex: ( int ) destination;
// counts number of items
- ( int ) numberOfItems;
// saves list to plist file in sandboxed documents directory
- ( void ) saveAsPlist;
// sets a selected item variable in list manager
- ( void ) selectedItem: ( int ) index;
// grabs the current selection
- ( int ) currentSelection;
// sorts list by last name
- ( void ) sortByLastName;
@end
