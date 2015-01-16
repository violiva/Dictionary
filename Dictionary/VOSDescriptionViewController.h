//
//  VOSDescriptionViewController.h
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
#import "VOSWordsModel.h"

@interface VOSDescriptionViewController : UIViewController

@property (strong, nonatomic) NSString * word;


@property (weak, nonatomic) IBOutlet UIWebView * browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView * activityView;

// -(id) initWithModel:(VOSStarWarsCharacter *) model;


@end
