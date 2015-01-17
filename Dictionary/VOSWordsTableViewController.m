//
//  VOSWordsTableViewController.m
//  Dictionary
//
//  Created by Vicente Oliva de la Serna on 16/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWordsTableViewController.h"
#import "VOSWordsModel.h"
#import "VOSDescriptionViewController.h"


@interface VOSWordsTableViewController ()

@property (strong, nonatomic) VOSWordsModel * model;

@end


@implementation VOSWordsTableViewController

-(id) initWithModel: (VOSWordsModel *) model
              style:(UITableViewStyle) style{

    if (self = [super initWithStyle:style] ){
        _model = model;
        self.title = @"English Vocabulary";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return [[self.model letters] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.model wordsAtIndex:section] count];
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.model letterAtIndex:section];
}

-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"--------------------";
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Reuse ID
    static NSString * cellID = @"WordsCell";
    
    // Averiguar de qué palabra se trata
    NSString * word = [self.model wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section];

    // crear una celda
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil){
        // tenemos que crear la celda a mano
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellID];
    }
    
    // sincronizar el modelo (palabra) -> Vista (celda)
    cell.textLabel.text = word;
    
    // la devuelvo
    return cell;
}


#pragma mark - VOSWordsTableViewControllerDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

/*
    // esto es sólo para cuando queremos poner dentro del navigation controler en el que estamos una vista superpuesta
    // con los datos asociados al elemento de la tableViewController, pero si queremos mostrar estos datos en otro MVC, habrá que implementar
    // nuestro propio protocolo.
 
    // Crear un DefinitionViewControler para mostrar su definición
    VOSDescriptionViewController * defVC = [[VOSDescriptionViewController alloc] initWithModel:[self.model wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section]];
    
    // pushearlo
    [self.navigationController pushViewController:defVC animated:YES];
*/
    [self.delegate wordsTableViewController:self
                              didSelectword:[self.model wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section]];
}

@end
