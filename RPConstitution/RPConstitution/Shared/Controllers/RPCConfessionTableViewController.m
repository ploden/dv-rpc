//
//  RPCConfessionTableViewController.m
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import "RPCConfessionTableViewController.h"
#import "RPCConfessionManager.h"
#import "RPCConfessionChapter.h"
#import "RPCConfessionTableViewCell.h"

@implementation RPCConfessionTableViewController

@synthesize confessionTableViewCellNib;
@synthesize introCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.navigationItem setTitle:@"Confession"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  NSInteger c = [[[RPCConfessionManager sharedInstance] confessionChapters] count];
  return c;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0) {
    return [self introCell];
  } else {
    RPCConfessionChapter *chapter = [[[RPCConfessionManager sharedInstance] confessionChapters] objectAtIndex:indexPath.row-1];

    RPCConfessionTableViewCell *c = [RPCConfessionTableViewCell cellForTableView:tableView fromNib:self.confessionTableViewCellNib];
    
    [c.chapterNumberLabel setText:[NSString stringWithFormat:@"%d", indexPath.row]];
    [c.chapterTitleLabel setText:chapter.chapterTitle];
      
    return c;
  }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0) {
    ;
  } else {
    id obj = [self.splitViewController performSelector:@selector(detailViewController)];
    
    if ([obj respondsToSelector:@selector(setChapter:)]) {
      RPCConfessionChapter *chapter = [[[RPCConfessionManager sharedInstance] confessionChapters] objectAtIndex:indexPath.row-1];
      [obj performSelector:@selector(setChapter:) withObject:chapter];
    }
  }
}

- (UINib *)confessionTableViewCellNib {
  if (confessionTableViewCellNib == nil) {
    [self setConfessionTableViewCellNib:[RPCConfessionTableViewCell nib]];
  }
  return confessionTableViewCellNib;
}

@end
