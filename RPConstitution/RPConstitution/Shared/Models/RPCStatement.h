//
//  RPCStatement.h
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPCStatement : NSObject

@property (nonatomic, strong) NSString *statement;
@property (nonatomic, strong) NSString *references;

- (id)initFromDict:(NSDictionary *)aDict;

@end
