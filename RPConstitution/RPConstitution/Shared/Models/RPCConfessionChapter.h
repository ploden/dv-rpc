//
//  RPCConfessionChapter.h
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPCConfessionChapter : NSObject

@property (nonatomic, strong) NSString *chapterTitle;
@property (nonatomic, strong) NSString *chapterSubtitle;
@property (nonatomic, strong) NSArray *testimonyStatements;
@property (nonatomic, strong) NSArray *confessionStatements;
@property (nonatomic, strong) NSNumber *chapterNumber;
@property (nonatomic, strong) NSString *catechismReferences;

- (id)initFromDict:(NSDictionary *)aDict;

@end
