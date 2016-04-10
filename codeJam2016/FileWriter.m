//
//  FileWriter.m
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "FileWriter.h"
#import "FileReader.h"

@interface FileWriter ()
@property (nonatomic, retain) NSString *filePath;
@property (nonatomic, retain) NSString *fileContent;
@end

@implementation FileWriter

@synthesize filePath, fileContent;

- (NSString *)description {
	return [NSString stringWithFormat:@"FileWriter: %@, %@", self.fileContent, self.filePath];
}

- (NSString *)outputFileName:(NSString *)inputFileName {
	NSString *fileExtension = [inputFileName pathExtension];
	if (!fileExtension) {
		fileExtension = @"txt";
	}
	else {
		inputFileName = [inputFileName stringByDeletingPathExtension];
	}
	return [[inputFileName stringByAppendingString:@"_out"] stringByAppendingPathExtension:fileExtension];
}

- (void)write {
	NSError *writeError = nil;
	if (![fileContent writeToFile:self.filePath atomically:YES encoding:NSUTF8StringEncoding error:&writeError]) {
		NSLog(@"FileWriter: save: %@", [writeError description]);
	}
	else {
		NSLog(@"FileWriter: saved sucessfully:");
	}
}

#pragma mark init and dealloc

- (id)initWithFile:(File *)file fileName:(NSString *)fileName {
	self = [super init];
	if (self) {
		self.fileContent = [file fileContent];
		self.filePath = [FileReader downloadFilePath:[self outputFileName:fileName]];
	}
	return self;
}

- (void)dealloc {
	self.filePath = nil;
	self.fileContent = nil;
}

@end
