//
//  File.h
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestCase.h"

@interface File : NSObject {
	NSUInteger numberOfTestCases;
	NSUInteger linesPerGroup;
	NSMutableArray *inputLines;
	NSMutableArray *outputLines;
}

@property (nonatomic, assign) NSUInteger numberOfTestCases;
@property (nonatomic, assign) NSUInteger linesPerGroup;

- (id)initWithFileContent:(NSString *)content;
- (id)initWithFileContent:(NSString *)content linesPerGroup:(NSUInteger)lpg;

- (NSUInteger)numberOfTestCases;
- (void)writeText:(NSString *)newText inLine:(NSUInteger)index append:(BOOL)append;
- (NSMutableArray *)testCase:(NSUInteger)index;

- (NSString *)fileContent;
- (NSMutableArray *)inputLines;

- (TestCase *)testCaseWithIndex:(NSUInteger)index;

@end
