//
//  VOSWordsModel.m
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWordsModel.h"

@implementation VOSWordsModel

#pragma mark - Properties
@synthesize words;

-(id)init{
    if( self = [super init]){

        NSURL * urlToFile = [[NSBundle mainBundle] URLForResource:@"vocabwords"
                                                    withExtension:@"txt"];
    
        self.words = [NSDictionary dictionaryWithContentsOfURL:urlToFile];

    }
    return self;
}


#pragma mark -
-(NSArray *) letters{
    
    return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

-(NSString *) letterAtIndex: (NSInteger) aLetterIndex{
    return [[self letters] objectAtIndex:aLetterIndex];
}

-(NSString *) wordAtIndex:(NSInteger) aWordIndex
          inLetterAtIndex:(NSInteger) aLetterIndex{
    
    NSString * letter = [self letterAtIndex:aLetterIndex];
    NSArray * wordsThatStartWithLetter = [self.words objectForKey:letter];
    return [wordsThatStartWithLetter objectAtIndex:aWordIndex];
}

-(NSArray *) wordsAtIndex:(NSInteger)anIndex{
    NSString *letter = [[self letters] objectAtIndex:anIndex];
    return [[self.words objectForKey:letter] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}
@end


