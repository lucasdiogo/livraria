//
//  LivroFavorito+CoreDataProperties.m
//  
//
//  Created by XCODE on 29/06/17.
//
//  This file was automatically generated and should not be edited.
//

#import "LivroFavorito+CoreDataProperties.h"

@implementation LivroFavorito (CoreDataProperties)

+ (NSFetchRequest<LivroFavorito *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"LivroFavorito"];
}

@dynamic autor;
@dynamic capaUrl;
@dynamic descricao;
@dynamic preco;
@dynamic precoString;
@dynamic titulo;

@end
