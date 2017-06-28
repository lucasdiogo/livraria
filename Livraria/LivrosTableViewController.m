//
//  LivrosTableViewController.m
//  Livraria
//
//  Created by XCODE on 27/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "LivrosTableViewController.h"
#import "LivroTableViewCell.h"

@interface LivrosTableViewController (){

}

@end

@implementation LivrosTableViewController{
    ItunesAPI * itunes;
    NSArray * results;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    itunes = [[ItunesAPI alloc] init];
    
    itunes.origem = self;
    
    results = [NSArray new];
    
    [itunes buscaLivro:@"Java"];
    
    
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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LivroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"livroCelula" forIndexPath:indexPath];
    
    NSDictionary * result = [results objectAtIndex:indexPath.row];
  
    
    NSLog(@"passando na celula");
    
    
    
    cell.autorLabel.text = [result objectForKey:@"artistName"];
    cell.tituloLabel.text = [result objectForKey:@"trackName"];
//    cell.subtituloLabel.text = [result objectForKey:@"genres"];
    cell.precoLabel.text = [result objectForKey:@"formattedPrice"];
    [cell.capaImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"artworkUrl100"]] options:NSDataReadingUncached error:nil]]];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Itunes
-(void)recebeDados:(NSDictionary *)resposta{
    NSLog(@"Cheguei aqui");
    
    results = [[resposta objectForKey:@"results"] allObjects];
    for (NSDictionary * objeto in results) {
        NSLog(@"Titulo: %@", [objeto objectForKey:@"trackName"]);
        NSLog(@"Autor: %@", [objeto objectForKey:@"artistName"]);
    }
    
    [self.tableView reloadData];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
