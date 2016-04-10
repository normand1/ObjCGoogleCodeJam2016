//
//  HashMap.m
//  codeJam2016
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "HashMap.h"

@interface HashMap()

@property (nonatomic, strong) NSMutableDictionary *map;

@end


@implementation HashMap


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.map = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(BOOL) addUniqueValue:(id)value toKey:(NSString*)key {
    
    if (self.map[key] != nil) {
        return false;
    } else {
        [self.map setObject:value forKey:key];
        return true;
    }
}

-(BOOL) checkRangeForSleep {
    
    NSInteger count = 0;
    
    while (count <= 9) {
        
        NSNumberFormatter *nf = [NSNumberFormatter new];
        
        if (self.map[[nf stringFromNumber:[NSNumber numberWithInteger:count]]] == nil )  {
            return false;
        }
        
        count += 1;
        
    }
    
    return true;
}

@end
