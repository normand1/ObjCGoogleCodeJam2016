//
//  File.m
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "File.h"

@interface File ()
@property (nonatomic, retain) NSMutableArray *inputLines;
@property (nonatomic, retain) NSMutableArray *outputLines;
@end

@implementation File

@synthesize numberOfTestCases, linesPerGroup, inputLines, outputLines;

- (NSString *)description {
	return [NSString stringWithFormat:@"inputLines: %@\n outputLines: %@", [self.inputLines description], [self.outputLines description]];
}

- (NSMutableArray *)inputLines {
	if (inputLines == nil)
		inputLines = [[NSMutableArray alloc] init];
	return inputLines;
}

#pragma mark Reading

- (TestCase *)testCaseWithIndex:(NSUInteger)index {
	if (index < [self numberOfTestCases]) {
		TestCase *testCase = [[TestCase alloc] init] ;
		
		for (NSUInteger i = 0; i < self.linesPerGroup; i++) {
			[testCase.lines addObject:[self.inputLines objectAtIndex:index * self.linesPerGroup + i]];
		}
		
		return testCase;
	}
	else {
		return [[TestCase alloc] init];
	}
}

- (NSMutableArray *)testCase:(NSUInteger)index {
	NSMutableArray *lines = [NSMutableArray array];
	if (index < [self numberOfTestCases]) {
		for (NSUInteger i = 0; i < self.linesPerGroup; i++) {
			[lines addObject:[self.inputLines objectAtIndex:index * self.linesPerGroup + i]];
		}
	}
	return lines;
}

#pragma mark Writing

- (NSString *)prefix {
	return @"Case #";
}

- (void)writeText:(NSString *)newText inLine:(NSUInteger)index append:(BOOL)append {
	if (index < [self.outputLines count]) {
		NSString *currentText = [self.outputLines objectAtIndex:index];
		if (append) {
			currentText = [currentText stringByAppendingString:newText];
		}
		[self.outputLines replaceObjectAtIndex:index withObject:currentText];
	}
	else {
		NSLog(@"File: writeText:inLine:append: index out of bounds");
	}
}

- (NSString *)fileContent {
	NSString *output = @"";
	for (NSUInteger lineNr = 0; lineNr < [self.outputLines count]; lineNr++) {
		output = [output stringByAppendingFormat:@"%@\n", [self.outputLines objectAtIndex:lineNr]];
	}
	return output;
}

#pragma mark init and dealloc

- (id)initWithFileContent:(NSString *)content {
	self = [super init];
	if (self) {
		NSMutableArray *fileContent = [NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"\n"]];
		
		self.numberOfTestCases = ([fileContent count] > 0) ? [[fileContent objectAtIndex:0] integerValue] : 0;
		
		for (NSString *line in fileContent) {
			if ([line length] > 0) {
				[self.inputLines addObject:line];
			}
		}
		
		// remove first line which only tells how many test cases are there
		if ([self.inputLines count] > 0) {
			[self.inputLines removeObjectAtIndex:0];
		}
		
		NSInteger dataCount = (self.linesPerGroup > 0) ? [self.inputLines count] / self.linesPerGroup : [self.inputLines count];
		
		self.outputLines = [NSMutableArray arrayWithCapacity:self.numberOfTestCases];
		
		for (NSUInteger lineNr = 1; lineNr <= self.numberOfTestCases; lineNr++) {
			NSString *prefix = [NSString stringWithFormat:@"%@%i: ", [self prefix], lineNr];
			[self.outputLines addObject:prefix];
		}
	}
	return self;
}

- (id)initWithFileContent:(NSString *)content linesPerGroup:(NSUInteger)lpg {
	self = [super init];
	if (self) {
		NSMutableArray *fileContent = [NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"\n"]];
		
		self.numberOfTestCases = ([fileContent count] > 0) ? [[fileContent objectAtIndex:0] integerValue] : 0;
		self.linesPerGroup = lpg;
		
		for (NSString *line in fileContent) {
			if ([line length] > 0) {
				[self.inputLines addObject:line];
			}
		}
		
		// remove first line which only tells how many test cases are there
		if ([self.inputLines count] > 0)
			[self.inputLines removeObjectAtIndex:0];
		
		NSInteger dataCount = (self.linesPerGroup > 0) ? [self.inputLines count] / self.linesPerGroup : [self.inputLines count];
		
		self.outputLines = [NSMutableArray arrayWithCapacity:dataCount];
		
		for (NSUInteger lineNr = 1; lineNr <= [self numberOfTestCases]; lineNr++) {
			NSString *prefix = [NSString stringWithFormat:@"%@%i: ", [self prefix], lineNr];
			[self.outputLines addObject:prefix];
		}
	}
	return self;
}

- (void)dealloc {
	self.inputLines = nil;
	self.outputLines = nil;
}

@end
