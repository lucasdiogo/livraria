//
//  LivroFavorito+CoreDataProperties.h
//  Livraria
//
//  Created by XCODE on 29/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "LivroFavorito+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LivroFavorito (CoreDataProperties)

+ (NSFetchRequest<LivroFavorito *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *autor;
@property (nullable, nonatomic, copy) NSString *titulo;
@property (nullable, nonatomic, copy) NSString *descricao;
@property (nullable, nonatomic, copy) NSString *precoString;
@property (nonatomic) double preco;
@property (nullable, nonatomic, copy) NSString *capaUrl;

@end

NS_ASSUME_NONNULL_END
