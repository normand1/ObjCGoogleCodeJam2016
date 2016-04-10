//
//  QualRound.m
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "QualRound.h"

@interface QualRound ()

@end

@implementation QualRound

@synthesize lines;

#pragma mark Output

- (NSString *)output {
	// override in subclasses
	return @"";
}

#pragma mark init and dealloc

- (id)initWithLines:(NSMutableArray *)l {
	self = [super init];
	if (self) {
		self.lines = l;
	}
	return self;
}

- (void)dealloc {
	self.lines = nil;
}

@end



@implementation SingleLineQualRound

- (id)initWithLine:(NSString *)l {
	self = [super init];
	if (self) {
		self.line = l;
	}
	return self;
}

- (NSString *)output {
	return @"";
}

@end