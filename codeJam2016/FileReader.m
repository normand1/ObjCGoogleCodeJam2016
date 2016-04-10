//
//  FileReader.m
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "FileReader.h"

@interface FileReader ()
@property (nonatomic, copy) NSString *filePath;
@end

@implementation FileReader

@synthesize filePath;

- (NSString *)fileName {
	return [self.filePath lastPathComponent];
}

#pragma mark Class Methods

+ (NSString *)downloadFilePath:(NSString *)fileName {
	NSString *downloadsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Downloads"];
	return [downloadsPath stringByAppendingPathComponent:fileName];
}

#pragma mark Reading

- (File *)readFileWithLinesPerAssignment:(NSUInteger)lines {
	if ([[NSFileManager defaultManager] fileExistsAtPath:self.filePath]) {
		NSError *readError;
		NSString *fileContent = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:&readError];
		if (!fileContent) {
			NSLog(@"FileReader: readFile: %@", [readError description]);
			return nil;
		}
		File *file = [[File alloc] initWithFileContent:fileContent];
        return file;
	}
	else {
		NSLog(@"FileReader: readFile: file does not exist at %@", self.filePath);
		return nil;
	}
}

#pragma mark init and dealloc

- (id)initForFileName:(NSString *)fileName {
	self = [super init];
	if (self) {
		self.filePath = [FileReader downloadFilePath:fileName];
		NSLog(@"FileReader: initForFileName: self.filePath = %@", self.filePath);
	}
	return self;
}

- (void)dealloc {
	self.filePath = nil;
}

@end
