//
//  VOSWordsTableViewController.h
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
@class VOSWordsModel, VOSWordsTableViewController;


@protocol VOSWordsTableViewControllerDelegate <NSObject>

// <#methods#>
@optional
-(void) wordsTableViewController:(VOSWordsTableViewController *) uVC didSelectCharacter:(NSString *) word;

-(void) wordsTableViewController:(VOSWordsTableViewController *) uVC willSelectCharacter:(NSString *) word;

@end


@interface VOSWordsTableViewController : UITableViewController <VOSWordsTableViewControllerDelegate>

@property (weak, nonatomic) id<VOSWordsTableViewControllerDelegate> delegate;

-(id) initWithModel: (VOSWordsModel *) model
              style:(UITableViewStyle) style;

@end









