//
//  BTSConfessionTableViewCell.h
//  RPConstitution
//
//  Created by Philip Loden on 2/6/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import "PRPNibBasedTableViewCell.h"

@interface RPCConfessionTableViewCell : PRPNibBasedTableViewCell

@property (nonatomic, retain) IBOutlet UILabel *chapterNumberLabel;
@property (nonatomic, retain) IBOutlet UILabel *chapterTitleLabel;

@end
