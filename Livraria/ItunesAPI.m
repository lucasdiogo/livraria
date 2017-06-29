//
//  ItunesAPI.m
//  Livraria
//
//  Created by XCODE on 28/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "ItunesAPI.h"

@implementation ItunesAPI{
    NSMutableData * data;
}

-(void)buscaLivro:(NSString *)termoDaBusca{
    
    
    
    NSString * escapedSearchTerm = [termoDaBusca stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    
//    NSString * itunesSearchTerm = [escapedSearchTerm stringByReplacingOccurrencesOfString:@"%20" withString:@"+"];
    
    
    NSString * urlPath = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=ebook&limit=50", escapedSearchTerm];
    
    NSURL * url = [NSURL URLWithString:urlPath];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection * connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Falhou com erro: %@", [error localizedDescription]);
}

// Estabelece conexão
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    data = [[NSMutableData alloc] init];
}

// Recebimento de dados
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *) _data {
    [data appendData:_data];
}

// Fim do download de dados
-(void)connectionDidFinishLoading:(NSURLConnection *) connection{
    @try{
        NSDictionary * jsonResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        [self.origem recebeDados:jsonResult];
    }
    @catch(NSException * exc){
        NSLog(@"Não consegui");
    }
}
@end
