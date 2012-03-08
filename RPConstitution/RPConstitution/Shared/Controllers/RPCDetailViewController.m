//
//  RPCDetailViewController.m
//  RPConstitution
//
//  Created by Philip Loden on 12/24/11.
//  Copyright (c) 2011 Deo Volente, LLC. All rights reserved.
//

#import "RPCDetailViewController.h"
#import "RPCConfessionChapter.h"
#import "RPCStatement.h"

@interface RPCDetailViewController ()

- (void)configureSubviews;
+ (UIView *)statementViewForStatement:(RPCStatement *)aStatement width:(CGFloat)aWidth;

@end

@implementation RPCDetailViewController

@synthesize chapterTitleLabel;
@synthesize chapter;
@synthesize catechismLabel;
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)setChapter:(RPCConfessionChapter *)aChapter {
  chapter = aChapter;
  
  [self configureSubviews];
  
  [self.scrollView setContentOffset:CGPointMake(0.0f, 0.0f)];
}

- (void)configureSubviews {
  NSString *chapterTitle = [NSString stringWithFormat:@"Chapter %@: %@", chapter.chapterNumber, chapter.chapterTitle];
  [self.chapterTitleLabel setText:chapterTitle];
  
  [self.catechismLabel setText:chapter.chapterSubtitle];
  
  for (UIView *v in [self.scrollView subviews]) {
    if (v != [self chapterTitleLabel] && v != [self catechismLabel]) {
      [v removeFromSuperview];
    }
  }
  
  const CGFloat leftMargin = 20.0f;
  const CGFloat rightMargin = leftMargin;
  const CGFloat theSpaceBetween = 40.0f;
  
  const CGFloat topStatementViewOriginY = self.catechismLabel.frame.origin.y + self.catechismLabel.frame.size.height + 30.0f;
  
  CGFloat statementWidth = (self.scrollView.frame.size.width - leftMargin - rightMargin - theSpaceBetween) / 2;
  statementWidth = (CGFloat)((int)(statementWidth));
  
  CGFloat confessionLowestFrameEdge = topStatementViewOriginY - 20.0f;
  
  for (RPCStatement *statement in [chapter confessionStatements]) {
    UIView *statementView = [RPCDetailViewController statementViewForStatement:statement width:statementWidth];
    CGRect frameRect = [statementView frame];
    frameRect.origin.y = confessionLowestFrameEdge + 20.0f;
    frameRect.origin.x = leftMargin;
    [statementView setFrame:frameRect];
    confessionLowestFrameEdge = frameRect.origin.y + frameRect.size.height;
    [self.scrollView addSubview:statementView];
  }
  
  CGFloat testimonyLowestFrameEdge = topStatementViewOriginY - 20.0f;

  for (RPCStatement *statement in [chapter testimonyStatements]) {
    UIView *statementView = [RPCDetailViewController statementViewForStatement:statement width:statementWidth];
    CGRect frameRect = [statementView frame];
    frameRect.origin.y = testimonyLowestFrameEdge + 20.0f;
    frameRect.origin.x = self.scrollView.frame.size.width - rightMargin - statementWidth;
    [statementView setFrame:frameRect];
    testimonyLowestFrameEdge = frameRect.origin.y + frameRect.size.height;
    [self.scrollView addSubview:statementView];
  }
  
  const CGFloat bottomMargin = 40.0f;
  
  [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, MAX(confessionLowestFrameEdge, testimonyLowestFrameEdge) + bottomMargin)];
}

+ (UIView *)statementViewForStatement:(RPCStatement *)aStatement width:(CGFloat)aWidth {
  UIView *v = [[UIView alloc] init];
  [v setBackgroundColor:[UIColor clearColor]];
  
  UILabel *(^statementLabelFactory)(void) = ^(void) {
    UILabel *statementLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, aWidth, 10000.0f)];
    [statementLabel setBackgroundColor:[UIColor clearColor]];
    [statementLabel setText:aStatement.statement];
    [statementLabel setNumberOfLines:0];
    [statementLabel setLineBreakMode:UILineBreakModeWordWrap];
    return statementLabel;
  };
  
  UILabel *statementLabel = statementLabelFactory();
  
  CGSize s = [aStatement.statement sizeWithFont:statementLabel.font constrainedToSize:statementLabel.frame.size lineBreakMode:statementLabel.lineBreakMode];
  CGRect frameRect = [statementLabel frame];
  frameRect.size = s;
  [statementLabel setFrame:frameRect];
  
  v.frame = frameRect;
  
  [v addSubview:statementLabel];
  
  UILabel *(^referencesLabelFactory)(void) = ^(void) {
    UILabel *referencesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, aWidth, 10000.0f)];
    [referencesLabel setBackgroundColor:[UIColor clearColor]];
    [referencesLabel setText:aStatement.references];
    [referencesLabel setNumberOfLines:0];
    [referencesLabel setLineBreakMode:UILineBreakModeWordWrap];
    return referencesLabel;
  };
  
  UILabel *referencesLabel = referencesLabelFactory();
  
  s = [aStatement.references sizeWithFont:referencesLabel.font constrainedToSize:referencesLabel.frame.size lineBreakMode:referencesLabel.lineBreakMode];
  frameRect = referencesLabel.frame;
  frameRect.size = s;
  frameRect.origin.y = statementLabel.frame.origin.y + statementLabel.frame.size.height + 10.0f;
  referencesLabel.frame = frameRect;
  
  frameRect = v.frame;
  frameRect.size.height = referencesLabel.frame.origin.y + referencesLabel.frame.size.height + 10.0f;
  v.frame = frameRect;
  
  [v addSubview:referencesLabel];
  
  return v;
}

@end
