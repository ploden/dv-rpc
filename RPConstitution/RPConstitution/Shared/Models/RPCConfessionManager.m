//
//  RPCConfessionManager.m
//  RPConstitution
//
//  Created by Philip Loden on 1/26/12.
//  Copyright (c) 2012 Deo Volente, LLC. All rights reserved.
//

#import "RPCConfessionManager.h"
#import "RPCConfessionChapter.h"

@implementation RPCConfessionManager

@synthesize confessionChapters;

+ (RPCConfessionManager *)sharedInstance {
    static dispatch_once_t pred;
    static RPCConfessionManager *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[RPCConfessionManager alloc] init];
        
        NSString *tilePathsPath = [[NSBundle mainBundle] pathForResource:@"c_and_t" ofType:@"json"];
        NSString *tilePathsString = [NSString stringWithContentsOfFile:tilePathsPath encoding:NSUTF8StringEncoding error:nil];
        NSError *error;
        NSDictionary *tilePathsDict = [NSJSONSerialization JSONObjectWithData:[tilePathsString dataUsingEncoding:NSUTF8StringEncoding] options:NULL error:&error];
        NSArray *confessionChapters = [tilePathsDict objectForKey:@"chapters"];
        if (confessionChapters) {
            NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[confessionChapters count]];
                      
          NSLog(@"%@", confessionChapters);
          for (int i = 0; i < [confessionChapters count]; i++) {
              NSDictionary *chapterDict = [confessionChapters objectAtIndex:i];
                RPCConfessionChapter *chapter = [[RPCConfessionChapter alloc] initFromDict:chapterDict];
            [chapter setChapterNumber:[NSNumber numberWithInt:i+1]];
                [tmpArray addObject:chapter];
            }
            
            [shared setConfessionChapters:tmpArray];
        }
        ;
    }); 
    
    return shared;
}

@end
