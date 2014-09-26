//
//  LSTViewController.m
//  Lister
//
//  Created by Michael Colon on 9/4/14.
//  Copyright (c) 2014 Michael Colon. All rights reserved.
//

#import "LSTViewController.h"
#import "ListManager.h"
#import "LSTTableViewCellHeader.h"

@interface LSTViewController ()

@end

@implementation LSTViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- ( void ) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////////////////////////////////////
// Table View Methods
////////////////////////////////////

- ( UIView * ) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  // 1. Dequeue the custom header cell
  LSTTableViewCellHeader * headerCell = [self.tableView dequeueReusableCellWithIdentifier:@"header"];
  // 3. And return
  return headerCell.contentView;
}

- ( CGFloat ) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 96.0f;
}

- ( IBAction ) editTable: ( id ) sender {
  if ( self.editing )
  {
    [((UIButton*) sender ) setTitle:@"Edit" forState:UIControlStateNormal ];
    [super setEditing:NO];
    [self setEditing:NO animated:YES];
  }
  else
  {
    [((UIButton*) sender ) setTitle:@"Done" forState:UIControlStateNormal ];
    [super setEditing:YES];
    [self setEditing:YES animated:YES];
  }
}

- ( UITableViewCellEditingStyle ) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
  if ( self.editing )
    return UITableViewCellEditingStyleDelete;
  else
    return UITableViewCellEditingStyleNone;
}

- ( void ) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if ( editingStyle == UITableViewCellEditingStyleDelete )
  {
    [[ListManager sharedListManager] deleteItemAtIndex:(int)indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
  }
}

- ( void ) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"Selected row %i", (int)indexPath.row);
  [[ListManager sharedListManager] selectedItem:(int) indexPath.row];
  [self performSegueWithIdentifier:@"detailItem" sender:self];
}


- ( BOOL ) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
  if ( indexPath.row <= [[ListManager sharedListManager] numberOfItems] )
    return YES;
  else
    return NO;
}

- ( BOOL ) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if ( indexPath.row <= [[ListManager sharedListManager] numberOfItems] )
    return YES;
  else
    return NO;
}


// move some items.
- ( void ) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
  NSLog(@"did move row");
  [[ListManager sharedListManager] moveItemAtIndex:(int)sourceIndexPath.row toDestinationIndex:(int) destinationIndexPath.row];
  
}

// tell table view the number of list items
- ( NSInteger ) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[ListManager sharedListManager] numberOfItems];
}

// tell the table view the number of sections
- ( NSInteger ) numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

// return a cell for an index in the list
- ( UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  // grab reusable cell
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basic"];
  // if cell is nil instantiate new cell
  if (cell == nil) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"basic"];
    cell.showsReorderControl = YES;
  }
  // grab list item and fill in item details
  ListObject *item = [[ListManager sharedListManager] itemAtIndex:(int)indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", item.firstName, item.lastName];
  cell.backgroundColor = [UIColor clearColor];
  cell.textLabel.textColor = [UIColor darkGrayColor];
  return cell; // returner
}

- ( IBAction ) savePlist {
  [[ListManager sharedListManager] saveAsPlist];
}

- ( IBAction ) sortArray {
  [[ListManager sharedListManager] sortByLastName];
  [self.tableView reloadData];
}

@end
