//
//  Operations.m
//  AffichageTest
//
//  Created by cachem on 21/01/13.
//  Copyright (c) 2013 cachem. All rights reserved.
//
#import "sqlite3.h"
#import "Operations.h"
#import "Parametre.h"


@implementation Operations

@synthesize NumButtonS;
@synthesize TabPosY;
@synthesize TabPosY1;
@synthesize TabDate;
@synthesize TabDate1;
@synthesize TabRecupOnscreenV;
@synthesize TabRecupOnscreen;
@synthesize TabRecupOnscreen2;
@synthesize TabRecupOnscreen191;
@synthesize TabRecupOnscreen380;
@synthesize TabRecupOnscreen570;
@synthesize TabRecupOnscreen760;
@synthesize TabRecupParametres;
@synthesize TabRecupPosX;
@synthesize TabRecupNum;
@synthesize TabRecupWidth;
@synthesize TabRecupNewY;
@synthesize TabRecupNewY1;
@synthesize TabMed;



-(id)InitialiserBDD;
{
    nomBDD = @"Database.sql";
    NSArray * ListeRepertoires = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * cheminDocuments = [ListeRepertoires objectAtIndex:0];
    cheminBDD = [cheminDocuments stringByAppendingPathComponent:nomBDD];
    return self;
}


-(void)VerifierCreerBDD
{
    BOOL succes;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    succes = [fileManager fileExistsAtPath:cheminBDD];
    if (succes)
    {
        return;
    }else
    {
        NSString *resourcesBDD = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:nomBDD];
        
        [fileManager copyItemAtPath:resourcesBDD toPath:cheminBDD error:nil];
    }
}



-(void)InserParamMedia:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
{
    
    NSString * NomMediaTable = [NomM substringToIndex:[NomM length] - 1];
    
    sqlite3 * BDD;
    sqlite3_stmt  *statement;
    
    if (sqlite3_open([cheminBDD UTF8String], &BDD) == SQLITE_OK)
    {
        
        NSString * requete1SQL = [[NSString alloc]initWithFormat:@"INSERT INTO %@ (NomPays,NomMedia,NumButton,title,LienUrl,SousTitre,Article,imageUrl,date) VALUES('%@','%@','%d','%@','%@','%@','%@','%@','%@');",NomMediaTable, Nom ,NomM, Num,titre,LienUrls,UnderTitle, txtNews, imgLien, date];
        
        const char *query_stmt = [requete1SQL UTF8String];
        
        if (sqlite3_prepare_v2(BDD, query_stmt, -1, &statement, NULL) != SQLITE_OK) {
            
            sqlite3_step(statement);
            
            sqlite3_finalize(statement);
        }
        
    }
    
    sqlite3_close(BDD);
    
}

-(void)CopyOnscreen:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
{
    
    sqlite3 * BDD;
    sqlite3_stmt  *statement;
    
    if (sqlite3_open([cheminBDD UTF8String], &BDD) == SQLITE_OK)
    {
        
        NSString * requete1SQL = [[NSString alloc]initWithFormat:@"INSERT INTO Onscreen (NomPays,NomMedia,NumButton,title,LienUrl,SousTitre,Article,imageUrl,date) VALUES('%@','%@','%d','%@','%@','%@','%@','%@','%@');", Nom ,NomM, Num,titre,LienUrls,UnderTitle, txtNews, imgLien, date];

        const char *query_stmt = [requete1SQL UTF8String];
        sqlite3_prepare_v2(BDD, query_stmt, -1, &statement, NULL);
        
        sqlite3_step(statement);
        
        sqlite3_finalize(statement);
        
    }
    
    sqlite3_close(BDD);
    
}


-(void)ReplaceParamMedia:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
{
    
    NSString * NomMediaTable = [NomM substringToIndex:[NomM length] - 1];
    
    sqlite3 * BDD;
    sqlite3_stmt  *statement;
    
    if (sqlite3_open([cheminBDD UTF8String], &BDD) == SQLITE_OK)
    {
        
        NSString * requete1SQL = [[NSString alloc]initWithFormat:@"UPDATE %@ SET NomPays='%@',NomMedia='%@',NumButton='%d',title='%@',LienUrl='%@',SousTitre='%@',Article='%@',imageUrl='%@',date='%@' WHERE NomMedia='%@';" ,NomMediaTable, Nom ,NomMediaTable, Num,titre,LienUrls,UnderTitle, txtNews, imgLien, date, NomMediaTable];

        const char *query_stmt = [requete1SQL UTF8String];
        sqlite3_prepare_v2(BDD, query_stmt, -1, &statement, NULL);
        
        sqlite3_step(statement);
        
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(BDD);
    
}

-(void)ReplaceOnscreen:(NSString *)Nom nommedia:(NSString*)NomM numbutton:(int)Num  title:(NSString*)titre Lien:(NSString*)LienUrls SousTitre:(NSString*)UnderTitle Article:(NSString *)txtNews Date:(NSString*)date imageUrl:(NSString*)imgLien;
{
    
    sqlite3 * BDD;
    sqlite3_stmt  *statement;
    
    if (sqlite3_open([cheminBDD UTF8String], &BDD) == SQLITE_OK)
    {

        NSString * requete1SQL = [[NSString alloc]initWithFormat:@"UPDATE Onscreen SET NomPays='%@',NomMedia='%@',NumButton='%d',title='%@',LienUrl='%@',SousTitre='%@',Article='%@', imageUrl='%@',date='%@' WHERE NomMedia='%@';",Nom,NomM, Num,titre,LienUrls,UnderTitle, txtNews, imgLien, date, NomM];

        const char *query_stmt = [requete1SQL UTF8String];
        
        sqlite3_prepare_v2(BDD, query_stmt, -1, &statement, NULL);
        
        sqlite3_step(statement);
        
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(BDD);
    
}








-(NSMutableArray*)RecupDerURL:(NSString*)MedColumn MedWithNum:(NSString*)Med
{
    
    
    sqlite3 * BDD;
    sqlite3_stmt * requeteCompile = NULL ;
    
    derTitre = @"noTitre";
    derImg = @"noImage";
    
    NSMutableArray * tabReturn = [[NSMutableArray alloc] initWithObjects:derTitre,derImg, nil];
    
    const char * RecupMed1= [MedColumn cStringUsingEncoding:[NSString defaultCStringEncoding]];
    const char * RecupMed2= [Med cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    NSString * requeteSQL = [[NSString alloc]initWithFormat:@"SELECT * FROM %s WHERE NomMedia = '%s';",RecupMed1,RecupMed2];

    const char * requeteSQL1 = [requeteSQL cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    
    if (sqlite3_open([cheminBDD UTF8String], &BDD) == SQLITE_OK)
    {
        if (sqlite3_prepare_v2(BDD, requeteSQL1,-1, &requeteCompile, NULL) == SQLITE_OK)
        {
            
            while (sqlite3_step(requeteCompile) == SQLITE_ROW)
            {
                NSString * titre = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,4)];

                NSString * image = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,8)];
  
                [tabReturn insertObject:titre atIndex:0];
                [tabReturn insertObject:image atIndex:1];
                
            }
            
            
        }
        sqlite3_finalize(requeteCompile);
        
        
    }
    
    sqlite3_close(BDD);
    
    return tabReturn;
    
}





-(void)RecupPAYSfromOnscreen:(NSString*)Pays
{
    
    
    sqlite3 *BDD;
    
    TabRecupOnscreenV = [[NSMutableArray alloc] init];
    
    sqlite3_stmt * requeteCompile = NULL ;
    
    NSString * requete1SQL = [[NSString alloc]initWithFormat:@"SELECT * FROM Onscreen WHERE NomPays='%@'",Pays];

    const char * requeteSQL = [requete1SQL cStringUsingEncoding:[NSString defaultCStringEncoding]];
    
    
    if (sqlite3_open([cheminBDD UTF8String], &BDD) == SQLITE_OK)
    {
        if (sqlite3_prepare_v2(BDD, requeteSQL,-1, &requeteCompile, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(requeteCompile) == SQLITE_ROW)
            {
                NSString * aNomPays = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,1)];
                NSString * aNomMedia = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,2)];
                NSInteger aNumButton = sqlite3_column_int(requeteCompile, 3);
                NSString * LienR = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,5)];

                NSString * UnderTitle;
                NSString * Article;

                NSString * titre = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,4)];
                UnderTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,6)];
                Article = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,7)];
                NSString * image = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,8)];
                NSString * date = [NSString stringWithUTF8String:(char *)sqlite3_column_text(requeteCompile,9)];
                
                Parametre * parametre = [[Parametre alloc] initWithName:aNomPays nommedia:aNomMedia numbutton:aNumButton  title:titre Lien:LienR SousTitre:UnderTitle Article:Article Date:date imageUrl:image];
                
                [NumButtonS addObject: parametre];
                
                [TabRecupOnscreenV addObject: parametre];
            }
        }
        
        sqlite3_finalize(requeteCompile);
    }
    
    sqlite3_close(BDD);
}








@end
