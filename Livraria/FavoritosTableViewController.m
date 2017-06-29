//
//  FavoritosTableViewController.m
//  Livraria
//
//  Created by XCODE on 27/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "FavoritosTableViewController.h"
#import "LivroFavoritoDao.h"
#import "LivroFavorito+CoreDataClass.h"
#import "LivroTableViewCell.h"

@interface FavoritosTableViewController ()

@end

@implementation FavoritosTableViewController{
    NSMutableArray * livrosFavoritos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    livrosFavoritos = [NSMutableArray new];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    livrosFavoritos = [NSMutableArray arrayWithArray:[[LivroFavoritoDao new] getLivrosFavoritos]];
     [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [livrosFavoritos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LivroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"livroFavoritoCelula" forIndexPath:indexPath];
    
    LivroFavorito * result = [livrosFavoritos objectAtIndex:indexPath.row];
    
    //alternativa para o teste automatizado
    cell.isAccessibilityElement = NO;
    
    
    cell.autorLabel.text = result.autor;
    cell.tituloLabel.text = result.titulo;
    //    cell.subtituloLabel.text = [result objectForKey:@"genres"];
    cell.precoLabel.text = result.precoString;
    [cell.capaImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:result.capaUrl] options:NSDataReadingUncached error:nil]]];
    // Configure the cell...
    
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
        
        
        LivroFavoritoDao * dao = [LivroFavoritoDao new];
        [dao apagar:[livrosFavoritos objectAtIndex:indexPath.row]];
        [livrosFavoritos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
