//
//  DetalhesViewController.m
//  Livraria
//
//  Created by XCODE on 28/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "DetalhesViewController.h"
#import "LivroFavorito+CoreDataClass.h"
#import "LivroFavoritoDao.h"

@interface DetalhesViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *autorLabel;
@property (weak, nonatomic) IBOutlet UILabel *precoLabel;
@property (weak, nonatomic) IBOutlet UITextView *descricaoLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoritosButton;
@property (weak, nonatomic) IBOutlet UIImageView *capaImage;

@end

@implementation DetalhesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tituloLabel.text = self.livro.titulo;
    self.autorLabel.text = self.livro.autor;
    self.precoLabel.text = self.livro.precoString;
    self.descricaoLabel.text = self.livro.descricao;
    
    [self.capaImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.livro.capaUrl]]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)salvaFavoritos:(id)sender {
    LivroFavoritoDao * dao = [LivroFavoritoDao new];
    [dao novo:self.livro];
    [dao salvar];

    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Sucesso" message:@"Livro adicionado com Sucesso!" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
