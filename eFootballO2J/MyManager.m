//
//  MyManager.m
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import "MyManager.h"
#import "STTableViewController.h"

@implementation MyManager

@synthesize ArrayUrl;
@synthesize ArrayWebview;
//@synthesize ArrayRequest;
@synthesize TabButtonNews;

@synthesize scrollviewANG;
@synthesize scrollviewFR;
@synthesize scrollviewALL;
@synthesize scrollviewITA;
@synthesize scrollviewESP;

@synthesize TabMentionLink;

@synthesize TabTweet;
@synthesize TabPic;

@synthesize ArrayTweetName;
@synthesize ArraytweetText;
@synthesize ArrayTweetUrl;
@synthesize ArraytweetUsername;
@synthesize ArraytweetDate;
@synthesize DicoIdTop;
@synthesize DicoArraytop;

@synthesize DicoUserbox;
@synthesize CurrentTeam;
@synthesize dicoNewsContent;
@synthesize BackVc1;
@synthesize BackVc2;
@synthesize TopFlag;
@synthesize Titre1;
@synthesize Titre2;
@synthesize BtnTop;
@synthesize btnSelect;
@synthesize NullText;
@synthesize tabUrlTimages;

@synthesize  orderNewsTab;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static MyManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    
    if (self = [super init]) {
        
        TopFlag = [[NSNumber alloc] initWithInt:0];
        
        dicoNewsContent = [[NSMutableDictionary alloc] init];
        
        ArrayWebview = [[NSMutableDictionary alloc] init];
        ArrayUrl = [[NSMutableArray alloc] init];
        
        TabButtonNews = [[NSMutableArray alloc] init];
        
        scrollviewANG = [[AutoScrollAng alloc]initWithFrame:CGRectMake(0, 97, 320, 192)];
        scrollviewFR = [[AutoScrollFra alloc]initWithFrame:CGRectMake(0, 287, 320, 192)];
        scrollviewALL = [[AutoScrollAll alloc]initWithFrame:CGRectMake(0, 477, 320, 192)];
        scrollviewITA = [[AutoScrollIta alloc]initWithFrame:CGRectMake(0, 667, 320, 192)];
        scrollviewESP = [[AutoScrollEsp alloc]initWithFrame:CGRectMake(0, 857, 320, 192)];
        
        
        
        TabTweet = [[NSMutableArray alloc] init];
        TabPic = [[NSMutableArray alloc] init];
        TabMentionLink = [[NSMutableArray alloc] init];
        
        BackVc1 = [[UIButton alloc] init];
        BackVc2 = [[UIButton alloc] init];
        
        btnSelect = [UIButton buttonWithType:UIButtonTypeCustom];
        BtnTop = [[UIButton alloc] init];
        
        Titre1 = [[GSBorderLabel alloc] init];
        Titre2 = [[GSBorderLabel alloc] init];
        
        ArrayTweetUrl = [[NSMutableDictionary alloc] init];
        ArraytweetText = [[NSMutableDictionary alloc] init];
        ArrayTweetName = [[NSMutableDictionary alloc] init];
        ArraytweetUsername = [[NSMutableDictionary alloc] init];
        ArraytweetDate = [[NSMutableDictionary alloc]init];
        
        DicoIdTop = [[NSMutableDictionary alloc]init];
        
        DicoArraytop = [[NSMutableArray alloc] init];
        
        CurrentTeam = [[NSString alloc] init];
        
        NullText = [[NSNumber alloc] init];
        
        DicoUserbox = [[NSMutableDictionary alloc]init];
        
        tabUrlTimages = [[NSMutableArray alloc] init];
        
        
    }
    
    return self;
    
}



- (void)dealloc {
    // Should never be called, but just here for clarity really.
}




@end
