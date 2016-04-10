//
//  CountingSheep.m
//  codeJam2016
//
//  Created by David Norman on 4/8/16.
//  Copyright © 2016 David Norman. All rights reserved.
//


#import "CountingSheep.h"
#import "HashMap.h"

@interface CountingSheep ()

@property (nonatomic) NSInteger startingNumber;
@property (nonatomic) NSString* finalOutput;
@property (nonatomic) NSInteger finalNumber;
@property (nonatomic) HashMap *uniqueMap;

@end

@implementation CountingSheep

- (id)initWithLine:(NSString *)line {
    self = [super initWithLine:line];
    if (self) {
        
        self.startingNumber = [line integerValue];
        
        if (self.startingNumber == 0) {
            self.finalOutput = @"INSOMNIA";
            return self;
        }
        
        self.uniqueMap = [HashMap new];
        
        NSInteger multiplier = 1;
        
        while (true) {
            
            self.finalNumber = self.startingNumber * multiplier;
            multiplier += 1;
            NSArray* numArray = [CountingSheep numbersArrayFromString:self.finalNumber];
            for (id num in numArray) {;
                [self.uniqueMap addUniqueValue:num toKey:num];
            }
            
            if ([self.uniqueMap checkRangeForSleep]) {
                break;
            }
        }
    }

    return self;
}

#pragma mark Helpers

+(NSArray*) numbersArrayFromString: (NSInteger)number {
    
    NSNumberFormatter *nf = [NSNumberFormatter new];
    NSString *numberString = [nf stringFromNumber: [NSNumber numberWithInteger:number]];
    NSMutableArray* finalArray = [NSMutableArray new];
    
    for (int i = 0; i < [numberString length]; i+= 1 ) {
        NSString *stringChar = [numberString substringWithRange:NSMakeRange(i, 1)];
        [finalArray addObject:stringChar];
    }
    
    return [finalArray copy];
    
    
}

-(NSInteger) multiply: (NSInteger)numberToMultiply by:(NSInteger)multiplier {
    
    return numberToMultiply * multiplier;
    
}


#pragma mark SingleLineQualRound

- (NSString *)output {
    if (self.finalOutput != nil) {
        return [NSString stringWithFormat:@"%@", self.finalOutput];
    } else {
        return [NSString stringWithFormat:@"%ld", self.finalNumber];
    }
}


@end