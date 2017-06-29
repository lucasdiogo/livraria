//
//  LivroFavorito+CoreDataProperties.m
//  Livraria
//
//  Created by XCODE on 29/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "LivroFavorito+CoreDataProperties.h"

@implementation LivroFavorito (CoreDataProperties)

+ (NSFetchRequest<LivroFavorito *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"LivroFavorito"];
}

@dynamic autor;
@dynamic titulo;
@dynamic descricao;
@dynamic precoString;
@dynamic preco;
@dynamic capaUrl;

@end
