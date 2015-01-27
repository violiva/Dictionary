//
//  VOSDescriptionViewController.m
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSDescriptionViewController.h"

@implementation VOSDescriptionViewController

#pragma mark - Init
-(id) initWithModel:(NSString *) model{
    if (self = [super init]){
        _word = model;
        self.title = model;
        
    }
    return self;
}

#pragma mark - UIWebViewDelegate
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) webViewDidFinishLoad:(UIWebView *) webView{
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{      // aqui ya existe la vista y tiene tamaño correcto
    [super viewWillAppear:animated];

    // Asignamos el delegado
    self.browser.delegate = self;

    [self.activityView startAnimating];
    [self.activityView setHidden:NO];
    
    [self.browser loadRequest:[self definitionRequestForWord:[self word]]];
}

-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord{
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@", aWord]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}


#pragma mark - UISplitViewControllerDelegate
-(void)splitViewController:(UISplitViewController *)svc
   willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // Hay que poner el botón en mi barra de navegación
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
        
    }else if (displayMode == UISplitViewControllerDisplayModeAllVisible){
        
        // Hay que quitar el botón de la barra de navegación
        self.navigationItem.leftBarButtonItem = nil;
    }
}

#pragma mark - wordsTableViewControllerDelegate
-(void) wordsTableViewController:(VOSWordsTableViewController *) dictVC didSelectword:(NSString *) aWord{
    self.word = aWord;
    self.title = aWord;

    [self.activityView startAnimating];
    [self.activityView setHidden:NO];

    [self.browser loadRequest:[self definitionRequestForWord:aWord]];
    
}

@end
