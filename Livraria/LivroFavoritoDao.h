//
//  LivroFavoritoDao.h
//  Livraria
//
//  Created by XCODE on 29/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "LivroFavorito+CoreDataClass.h"
#import "Livro.h"

@interface LivroFavoritoDao : NSObject

-(id)init;
-(LivroFavorito *)novo:(Livro *)livro;
-(void)salvar;
-(NSArray *)getLivrosFavoritos;
-(void)apagar:(NSManagedObject *)objeto;

@end
