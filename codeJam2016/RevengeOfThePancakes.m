//
//  RevengeOfThePancakes.m
//  codeJam2016
//
//  Created by David Norman on 4/9/16.
//  Copyright © 2016 David Norman. All rights reserved.
//

#import "RevengeOfThePancakes.h"


@interface RevengeOfThePancakes ()

@property (nonatomic) NSMutableArray* pancakeStack;
@property (nonatomic) NSInteger tries;

@end

@implementation RevengeOfThePancakes

- (id)initWithLine:(NSString *)line {
    self = [super initWithLine:line];
    if (self) {
        
        self.tries = 0;
        self.pancakeStack = [self arrayFromString:line];
        
        while ([self findIndexOfLastMinus:self.pancakeStack] != NSNotFound) {
            self.tries += 1;
            NSInteger indexOfPlus = [self checkFirstIndexesForPlus:self.pancakeStack];
            if (indexOfPlus != -1) {
                self.tries += 1;
                self.pancakeStack = [self flipPancakes:self.pancakeStack FromTopTo:indexOfPlus];
            }
            NSInteger indexOfMinus = [self findIndexOfLastMinus:self.pancakeStack];
           self.pancakeStack = [self flipPancakes:self.pancakeStack FromTopTo:indexOfMinus];
        }
    }
    
    return self;
}

#pragma mark Helpers

-(NSMutableArray*) arrayFromString: (NSString*)string {
    
    NSMutableArray* finalArray = [NSMutableArray new];
    
    for (int i = 0; i < [string length]; i+= 1 ) {
        NSString *stringChar = [string substringWithRange:NSMakeRange(i, 1)];
        [finalArray addObject:stringChar];
    }
    
    return finalArray;
}

-(NSMutableArray*) flipPancakes:(NSMutableArray*)pancakesArray FromTopTo: (NSInteger)xPos {
    
    NSMutableArray* shuffledStack = [NSMutableArray new];
    
    //first flip + and -
    
    NSLog(@"before %@", pancakesArray);

    for (NSInteger i = 0; i <= xPos; i += 1) {
        
        pancakesArray[i] = [self flipPancake:pancakesArray[i]];
    }
    
    if (pancakesArray.count == 1 || xPos == 0) { return pancakesArray; }; // don't rotate if only one object
    
    //rotate array so bottom of selected stack is on top
    
    for (NSInteger i = xPos; i >= 0; i -= 1) {
        [shuffledStack addObject:pancakesArray[i]];
    }
    
    //append anything remaining to shuffledStack
    
    for (NSInteger i = xPos + 1; i < pancakesArray.count; i++) {
        [shuffledStack addObject:pancakesArray[i]];
    }
    
    NSLog(@"after %@", shuffledStack);
    
    return shuffledStack;
}

-(NSInteger)findIndexOfLastMinus:(NSMutableArray* )searchArray {
    
    return [searchArray indexOfObjectWithOptions:NSEnumerationReverse
                                           passingTest:^(id obj, NSUInteger i, BOOL *stop) {
                                               return [@"-" isEqualToString:obj];

                                           }];
}

-(NSInteger)checkFirstIndexesForPlus:(NSMutableArray*) searchArray {
    
    NSInteger indexOfPlus = -1;
    for (NSInteger i = 0; i < searchArray.count; i++) {
        if ([searchArray[i] isEqualToString:@"+"]) {
            indexOfPlus++;
        } else {
            if (indexOfPlus > -1) {
                return indexOfPlus;
            }
            return -1;
        }
    }
    
    return indexOfPlus;
}

-(NSString*) flipPancake:(NSString*)pancake {
    
    if ([pancake  isEqual: @"+"]) {
        return @"-";
    } else {
      return @"+";
    }
}

#pragma mark SingleLineQualRound

- (NSString *)output {
        return [NSString stringWithFormat:@"%ld", self.tries];
}



@end
