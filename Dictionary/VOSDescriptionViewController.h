//
//  VOSDescriptionViewController.h
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
#import "VOSWordsTableViewController.h"

@interface VOSDescriptionViewController : UIViewController <UIWebViewDelegate, wordsTableViewControllerDelegate, UISplitViewControllerDelegate>

@property (strong, nonatomic) NSString * word;


@property (weak, nonatomic) IBOutlet UIWebView * browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView * activityView;

-(id) initWithModel:(NSString *) model;


@end
