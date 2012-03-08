//
//  RPCStatement.m
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import "RPCStatement.h"

@implementation RPCStatement

@synthesize statement;
@synthesize references;

- (id)initFromDict:(NSDictionary *)aDict {
  if ( ! (self = [super init]) ) return nil;
    
  statement = [aDict objectForKey:@"statement"];
  references = [aDict objectForKey:@"references"];
  
  return self;
}

@end
