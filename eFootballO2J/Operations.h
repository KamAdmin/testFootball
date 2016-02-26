//
//  Operations.h
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Parametre.h"


@interface Operations : NSObject
{
    NSString * nomBDD;
    NSString * cheminBDD;
    NSMutableArray * NumButtonS;
    NSMutableArray* TabPosY;
    NSMutableArray* TabPosY1;
    NSMutableArray* TabDate;
    NSMutableArray* TabDate1;
    NSMutableArray* TabRecupNewY;
    NSMutableArray* TabRecupNewY1;
    NSMutableArray * TabRecupOnscreenV;
    NSMutableArray* TabRecupOnscreen;
    NSMutableArray * TabRecupOnscreen2;
    NSMutableArray * TabRecupOnscreen191;
    NSMutableArray * TabRecupOnscreen380;
    NSMutableArray * TabRecupOnscreen570;
    NSMutableArray * TabRecupOnscreen760;
    NSMutableArray * TabRecupParametres;
    NSMutableArray * TabRecupPosX;
    NSMutableArray * TabRecupNum;
    NSMutableArray * TabRecupWidth;
    NSMutableArray * TabMed;
    NSString * derTitre;
    NSString * derImg;
    
}

@property (nonatomic,retain) NSMutableArray * NumButtonS;
@property (nonatomic,retain) NSMutableArray * TabPosY;
@property (nonatomic,retain) NSMutableArray * TabPosY1;
@property (nonatomic,retain) NSMutableArray * TabDate;
@property (nonatomic,retain) NSMutableArray * TabDate1;
@property (nonatomic,retain) NSMutableArray * TabRecupNewY;
@property (nonatomic,retain) NSMutableArray * TabRecupNewY1;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreenV;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreen;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreen2;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreen191;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreen380;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreen570;
@property (nonatomic,retain) NSMutableArray * TabRecupOnscreen760;
@property (nonatomic,retain) NSMutableArray * TabRecupParametres;
@property (nonatomic,retain) NSMutableArray * TabRecupPosX;
@property (nonatomic,retain) NSMutableArray * TabRecupNum;
@property (nonatomic,retain) NSMutableArray * TabRecupWidth;
@property (nonatomic,retain) NSMutableArray * TabMed;


-(id)InitialiserBDD;
-(void)VerifierCreerBDD;
-(void)InserParamMedia:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
-(void)ReplaceParamMedia:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
-(void)CopyOnscreen:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
-(void)ReplaceOnscreen:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
-(NSMutableArray*)RecupDerURL:(NSString*)MedColumn MedWithNum:(NSString*)Med;
-(void)RecupPAYSfromOnscreen:(NSString*)Pays;

@end





