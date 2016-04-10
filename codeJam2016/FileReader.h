//
//  FileReader.h
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"

@interface FileReader : NSObject {
	NSString *filePath;
}

+ (NSString *)downloadFilePath:(NSString *)fileName;

- (id)initForFileName:(NSString *)fileName;
- (File *)readFileWithLinesPerAssignment:(NSUInteger)lines;
- (NSString *)fileName;

@end
