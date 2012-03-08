//
//  RPCIndexViewController.m
//  RPConstitution
//
//  Created by Philip Loden on 12/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RPCIndexTableViewController.h"
#import "RPCConfessionTableViewController.h"

@implementation RPCIndexTableViewController

@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.navigationItem setTitle:@"Index"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

# pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"IndexTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *text = nil;
    
    switch (indexPath.row) {
        case 0:
            text = @"Confession and Testimony";
            break;
            
        case 1:
            text = @"Larger Catechism";
            break;
            
        case 2:
            text = @"Shorter Catechism";
            break;
            
        default:
            return 0;
            break;
    }
    
    [cell.textLabel setText:text];
    
    return cell;
}

# pragma mark - Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RPCConfessionTableViewController *tvc = [[RPCConfessionTableViewController alloc] initWithNibName:@"RPCConfessionTableViewController" bundle:nil];
    [self.navigationController pushViewController:tvc animated:YES];
}

@end
