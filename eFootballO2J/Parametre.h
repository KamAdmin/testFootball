//
//  Parametre.h
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Parametre : NSObject
{
    NSInteger primarykey;
    NSString * nompays;
    NSString * nommedia;
    NSInteger numbutton;
    NSString * title;
    NSString* LienUrl;
    NSString* SousTitre;
    NSString* Article;
    NSString* Date;
    NSString* imageUrl;
}

@property(assign,nonatomic,readonly) NSInteger primarykey;
@property(nonatomic,retain) NSString * nompays;
@property(nonatomic,retain) NSString * nommedia;
@property(assign,nonatomic) NSInteger numbutton;
@property(nonatomic,retain) NSString * title;
@property(nonatomic,retain) NSString * LienUrl;
@property(nonatomic,retain) NSString * SousTitre;
@property(nonatomic,retain) NSString * Article;
@property(nonatomic,retain) NSString * Date;
@property(nonatomic,retain) NSString* imageUrl;

-(id)initWithName: (NSString*)Nom nommedia:(NSString*)NomM numbutton:(NSInteger)Num title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString*)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;


@end
