//
//  ItunesAPI.h
//  Livraria
//
//  Created by XCODE on 28/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItunesDelegate <NSObject>

- (void) recebeDados:(NSDictionary *) resposta;

@end

@interface ItunesAPI : NSObject

@property id<ItunesDelegate> origem;

- (void) buscaLivro:(NSString *)termoDaBusca;

@end
