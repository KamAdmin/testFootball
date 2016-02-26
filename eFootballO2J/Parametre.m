//
//  Parametre.m
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import "Parametre.h"
#import <sqlite3.h>

@implementation Parametre

@synthesize primarykey;
@synthesize nompays;
@synthesize nommedia;
@synthesize numbutton;
@synthesize title;
@synthesize LienUrl;
@synthesize SousTitre;
@synthesize Article;
@synthesize Date;
@synthesize imageUrl;

-(id)initWithName:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(NSInteger)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
{
    self.nompays = Nom;
    self.nommedia = NomM;
    self.numbutton = Num;
    self.title = titre;
    self.LienUrl = LienUrls;
    self.SousTitre = UnderTitle;
    self.Article = txtNews;
    self.Date = date;
    self.imageUrl = imgLien;
    
    return self;
}



@end
