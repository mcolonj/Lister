//
//  ListManager.m
//  Lister
//
//  Created by Michael Colon on 9/4/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import "ListManager.h"

@implementation ListObject
- ( id ) initWithFirstName: ( NSString* ) first lastName: (NSString*)last email: ( NSString * ) email screenName:( NSString * ) screenName
{

  self = [super init];
  if ( self ) {
    self.firstName = first;
    self.lastName = last;
    self.email = email;
    self.screenName = screenName;
  }
  return self;
}

- ( id ) init {
  self = [super init];
  if ( self ) {
    self.firstName = nil;
    self.lastName = nil;
    self.email = nil;
    self.screenName = nil;
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeObject:self.firstName forKey:@"firstname"];
  [coder encodeObject:self.lastName forKey:@"lastname"];
  [coder encodeObject:self.email forKey:@"email"];
  [coder encodeObject:self.screenName forKey:@"screenname"];
}

- (id)initWithCoder:(NSCoder *)coder {
  self = [super init];
  if (self) {
    self.firstName = [coder decodeObjectForKey:@"firstname"];
    self.lastName = [coder decodeObjectForKey:@"lastname"];
    self.email = [coder decodeObjectForKey:@"email"];
    self.screenName = [coder decodeObjectForKey:@"screenname"];
  }
  return self;
}

@end

@implementation ListManager

static ListManager * sharedListManager_ = nil;

// static manager
+ ( ListManager * ) sharedListManager {
  if ( ! sharedListManager_)
    sharedListManager_ = [[ListManager alloc] init];
  return sharedListManager_;
}

// ListManager generic init
- ( id ) init {
  self = [super init];
  if ( self )
  {
    if ( [self doesPlistExist] ) {
      NSLog(@"file exists");
      [self loadPlist];
    } else {
      NSLog(@"File does not exist");
      _list = [[NSMutableArray alloc] init];
    }
      
  }
  return self;
}

- ( void ) addItem:( ListObject *) item {
  [_list addObject:item];
  [self saveAsPlist];
}

- ( void ) deleteItemAtIndex: ( int ) index {
  [_list removeObjectAtIndex:index];
  [self saveAsPlist];
}

- ( ListObject * ) itemAtIndex: ( int ) index {
    return [_list objectAtIndex:index];
}

- ( void ) moveItemAtIndex: ( int ) current toDestinationIndex: ( int ) destination {
  // grab object from list
  ListObject *object = [_list objectAtIndex:current];
  if ( object == nil ) return;   // no object there
  // remove retrieved object from list
  [_list removeObjectAtIndex:current];
  // insert retrieved object into new spot
  [_list insertObject:object atIndex:destination];
}

- ( int ) numberOfItems {
  return (int) _list.count;
}

- ( NSURL* ) docsURL {
  return  [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                  inDomains:NSUserDomainMask] lastObject];
}
- ( NSString * ) listPath {
  return [NSString stringWithFormat:@"%@/%@ ", [self docsURL].path, @"list.plist"];
}

- ( void  ) saveAsPlist {
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:(NSArray*)_list];
  if ( [data writeToFile:[self listPath] atomically:YES]) NSLog(@"written");
  else NSLog(@"not written");
}

- ( BOOL ) doesPlistExist {
  return [[NSFileManager defaultManager] fileExistsAtPath:[self listPath]];
}

- ( void ) loadPlist {
  // if file exists
  if ([[NSFileManager defaultManager] fileExistsAtPath:[self listPath]])
  {
    NSData *data = [[NSData alloc] initWithContentsOfFile:[self listPath]];
    if (data)
    {
      NSArray * array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
      if ( array && array.count > 0 )
        _list = (NSMutableArray*) array;
      else
        NSLog(@"list is empty");
    }
  }
  else
  {
    NSLog(@"File does not exist");
  }
}

- ( void ) selectedItem: ( int ) index {
  _selected = index;
}

- ( int ) currentSelection
{
  return _selected;
}

- ( void ) sortByLastName {
    NSArray * sortedList = [_list sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
    NSString *first  = (NSString*) ((ListObject*)a).lastName;
    NSString *second = (NSString*) ((ListObject*)b).lastName;
    return [first compare:second];
  }];
  _list = [NSMutableArray arrayWithArray: sortedList];
}

@end
