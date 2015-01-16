//
//  VOSWordsTableViewController.h
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
@class VOSWordsModel;

@interface VOSWordsTableViewController : UITableViewController

@property (strong, nonatomic) VOSWordsModel * model;

-(id) initWithModel: (VOSWordsModel *) model
              style:(UITableViewStyle) style;

@end
