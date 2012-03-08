//
//  RPCConfessionTableViewController.h
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPCConfessionTableViewController : UITableViewController

@property (nonatomic, retain) UINib *confessionTableViewCellNib;
@property (nonatomic, retain) IBOutlet UITableViewCell *introCell;

@end
