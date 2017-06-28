//
//  LivroTableViewCell.h
//  Livraria
//
//  Created by XCODE on 27/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LivroTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *capaImageView;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *autorLabel;
@property (weak, nonatomic) IBOutlet UILabel *precoLabel;

@end
