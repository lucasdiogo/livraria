//
//  LivroFavorito+CoreDataProperties.h
//  
//
//  Created by XCODE on 29/06/17.
//
//  This file was automatically generated and should not be edited.
//

#import "LivroFavorito+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LivroFavorito (CoreDataProperties)

+ (NSFetchRequest<LivroFavorito *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *autor;
@property (nullable, nonatomic, copy) NSString *capaUrl;
@property (nullable, nonatomic, copy) NSString *descricao;
@property (nonatomic) double preco;
@property (nullable, nonatomic, copy) NSString *precoString;
@property (nullable, nonatomic, copy) NSString *titulo;

@end

NS_ASSUME_NONNULL_END
