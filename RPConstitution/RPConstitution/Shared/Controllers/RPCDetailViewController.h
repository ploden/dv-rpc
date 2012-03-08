//
//  RPCDetailViewController.h
//  RPConstitution
//
//  Created by Philip Loden on 12/24/11.
//  Copyright (c) 2011 Deo Volente, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RPCConfessionChapter;

@interface RPCDetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *chapterTitleLabel;
@property (nonatomic, retain, setter = setChapter:) RPCConfessionChapter *chapter;
@property (nonatomic, strong) IBOutlet UILabel *catechismLabel;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@end
