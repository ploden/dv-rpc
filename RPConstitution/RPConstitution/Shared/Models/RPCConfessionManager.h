//
//  RPCConfessionManager.h
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPCConfessionManager : NSObject

@property (nonatomic, strong) NSArray *confessionChapters;

+ (RPCConfessionManager *)sharedInstance;

@end
