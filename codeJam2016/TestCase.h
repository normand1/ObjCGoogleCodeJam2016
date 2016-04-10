//
//  TestCase.h
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestCase : NSObject

@property (nonatomic, retain) NSMutableArray *lines;

- (NSString *)contentAtLine:(NSUInteger)index;

@end
