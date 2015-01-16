//
//  VOSWordsModel.h
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import Foundation;

@interface VOSWordsModel : NSObject

@property (strong) NSDictionary * words;


-(NSArray *) letters;
-(NSString *) letterAtIndex: (NSInteger) aLetterIndex;
-(NSString *) wordAtIndex:(NSInteger) aWordIndex inLetterAtIndex:(NSInteger) aLetterIndex;
-(NSArray *) wordsAtIndex:(NSInteger) anIndex;

@end
