//
//  FileWriter.h
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"

@interface FileWriter : NSObject {
	NSString *filePath;
	NSString *fileContent;
}

- (id)initWithFile:(File *)file fileName:(NSString *)fileName;

- (void)write;

@end
