//
//  RPCConfessionChapter.m
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import "RPCConfessionChapter.h"
#import "RPCStatement.h"

@implementation RPCConfessionChapter

@synthesize chapterTitle;
@synthesize chapterSubtitle;
@synthesize confessionStatements;
@synthesize testimonyStatements;
@synthesize chapterNumber;
@synthesize catechismReferences;

- (id)initFromDict:(NSDictionary *)aDict {
  if ( ! (self = [super init]) ) return nil;

  chapterTitle = [aDict objectForKey:@"chapter_title"];
  chapterSubtitle = [aDict objectForKey:@"chapter_subtitle"];
  catechismReferences = [aDict objectForKey:@""];

  NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:100];
    
  for (NSDictionary *statementDict in [aDict objectForKey:@"confession"]) {
    RPCStatement *s = [[RPCStatement alloc] initFromDict:statementDict];
    [tmpArray addObject:s];
    
  }
  
  confessionStatements = [NSArray arrayWithArray:tmpArray];
  
  [tmpArray removeAllObjects];
  
  for (NSDictionary *statementDict in [aDict objectForKey:@"testimony"]) {
    RPCStatement *s = [[RPCStatement alloc] initFromDict:statementDict];
    [tmpArray addObject:s];
  }
  
  testimonyStatements = [NSArray arrayWithArray:tmpArray];
  
  return self;
}

@end
