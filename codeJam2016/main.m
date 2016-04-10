//
//  main.m
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileReader.h"
#import "FileWriter.h"
#import "File.h"


#import "RevengeOfThePancakes.h"

#define TESTCASE_FILE @"testcase.txt"
#define SMALL_INPUT_FILE @"B-large-practice.in"
#define LARGE_INPUT_FILE @"B-large.in"
#define LINES_PER_ASSIGNMENT 1

int main (int argc, const char * argv[])
{

	@autoreleasepool {
	    
//		NSString *fileName = TESTCASE_FILE;
		NSString *fileName = SMALL_INPUT_FILE;
//		NSString *fileName = LARGE_INPUT_FILE;
		
		FileReader *fileReader = [[FileReader alloc] initForFileName:fileName];
		File *readFile = [fileReader readFileWithLinesPerAssignment:LINES_PER_ASSIGNMENT];
		
		
		NSArray *lines = [readFile inputLines];
		NSUInteger index = 0;
		NSUInteger numberOfTestCase = 0;
		
		while (index < [lines count]) {
			NSString *l = [lines objectAtIndex:index];
			
			RevengeOfThePancakes *pancakes = [[RevengeOfThePancakes alloc] initWithLine:l];
			NSString *output = [NSString stringWithFormat:@"%@", [pancakes output]];
			// NSLog(@"output: %@", output);
			[readFile writeText:output inLine:numberOfTestCase append:YES];
			
			index = index /* + [l integerValue] */ + 1;
			numberOfTestCase += 1;
		}
		
		 
		FileWriter *fileWriter = [[FileWriter alloc] initWithFile:readFile fileName:[fileReader fileName]];
		[fileWriter write];
		
		
	}
    return 0;
}

