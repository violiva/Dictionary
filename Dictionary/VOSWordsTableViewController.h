//
//  VOSWordsTableViewController.h
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
@class VOSWordsModel;
@class VOSWordsTableViewController;

@protocol wordsTableViewControllerDelegate <NSObject>

// methods
@optional
-(void) wordsTableViewController:(VOSWordsTableViewController *) dictVC didSelectword:(NSString *) aWord;

-(void) wordsTableViewController:(VOSWordsTableViewController *) dictVC willSelectword:(NSString *) aWord;

@end


@interface VOSWordsTableViewController : UITableViewController // <VOSWordsTableViewControllerDelegate>

@property (weak, nonatomic) id<wordsTableViewControllerDelegate> delegate;

-(id) initWithModel: (VOSWordsModel *) model
              style:(UITableViewStyle) style;

@end









