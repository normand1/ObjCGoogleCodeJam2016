//
//  HashMap.h
//  codeJam2016
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashMap : NSObject

-(BOOL) checkRangeForSleep;
-(BOOL) addUniqueValue:(id)value toKey:(NSString*)key;

@end
