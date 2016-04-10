//
//  TestCase.m
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "TestCase.h"

@implementation TestCase

@synthesize lines;

- (NSString *)contentAtLine:(NSUInteger)index {
	if (index < [self.lines count]) {
		return [self.lines objectAtIndex:index];
	}
	else {
		return nil;
	}
}

- (id)init {
	self = [super init];
	if (self) {
		self.lines = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	self.lines = nil;
}

@end
