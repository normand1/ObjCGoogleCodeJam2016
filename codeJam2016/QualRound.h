//
//  QualRound.h
//  CoderChallenge
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QualRound : NSObject {
	NSMutableArray *lines;
}

@property (nonatomic, retain) NSMutableArray *lines;

- (id)initWithLines:(NSMutableArray *)l;

- (NSString *)output;

@end


@interface SingleLineQualRound : NSObject

@property (nonatomic, copy) NSString *line;

- (id)initWithLine:(NSString *)l;

- (NSString *)output;

@end
