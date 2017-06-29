//
//  LivroFavoritoDao.m
//  Livraria
//
//  Created by XCODE on 29/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "LivroFavoritoDao.h"


@implementation LivroFavoritoDao{
    NSManagedObjectContext *context;
}

-(id)init{
    self = [super init];
    
    context = [[((AppDelegate *)[[UIApplication sharedApplication] delegate]) persistentContainer] viewContext];
    
    return self;
}

-(LivroFavorito *)novo:(Livro *)livro{
    
    
    LivroFavorito * livroFavorito = [NSEntityDescription insertNewObjectForEntityForName:@"LivroFavorito" inManagedObjectContext:context];
    
    livroFavorito.autor = livro.autor;
    livroFavorito.titulo = livro.titulo;
    livroFavorito.descricao = livro.descricao;
    livroFavorito.precoString = livro.precoString;
    livroFavorito.preco = 0.0;
    livroFavorito.capaUrl = livro.capaUrl;
    
    return livroFavorito;
}

-(void)salvar{
    
     [context save:nil];
}

-(void)apagar:(NSManagedObject *)objeto{
    [context deleteObject:objeto];
    
    [context save:nil];
}

-(NSArray *)getLivrosFavoritos{
    
    NSFetchRequest * request = [NSFetchRequest new];
    
    request.entity = [NSEntityDescription entityForName:@"LivroFavorito" inManagedObjectContext:context];
    
    NSArray * saida = [context executeFetchRequest:request error:nil];
    
    return saida;
}

@end
