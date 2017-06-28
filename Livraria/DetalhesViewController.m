//
//  DetalhesViewController.m
//  Livraria
//
//  Created by XCODE on 28/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "DetalhesViewController.h"

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
