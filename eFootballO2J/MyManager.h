//
//  MyManager.h
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAAutoScrollView.h"
#import "AutoScrollAng.h"
#import "AutoScrollAll.h"
#import "AutoScrollEsp.h"
#import "AutoScrollIta.h"
#import "AutoScrollFra.h"
#import "GSBorderLabel.h"


@class STTableViewController;


@interface MyManager : NSObject
{
    
    NSMutableDictionary * ArrayWebview;
    NSMutableArray * ArrayUrl;
    NSMutableArray * TabButtonNews;
    
    NSMutableArray * TabMentionLink;
    
    AutoScrollAng * scrollviewANG;
    AutoScrollFra * scrollviewFR;
    AutoScrollAll * scrollviewALL;
    AutoScrollIta * scrollviewITA;
    AutoScrollEsp * scrollviewESP;
    
    NSMutableDictionary * ArrayTweetName;
    NSMutableDictionary * ArrayTweetUrl;
    NSMutableDictionary * ArraytweetText;
    NSMutableDictionary * ArraytweetUsername;
    NSMutableDictionary * ArraytweetDate;
    
    NSMutableDictionary * DicoIdTop;
    NSMutableArray * DicoArraytop;
    
    NSMutableArray * TabTweet;
    NSMutableArray * TabPic;
    
    UIButton * BackVc1;
    UIButton * BackVc2;
    
    UIButton * btnSelect;
    UIButton * BtnTop;
    
    NSNumber* TopFlag;
    
    NSNumber * NullText;
    
    NSString * CurrentTeam;
    
    GSBorderLabel * Titre;
    
    NSMutableDictionary * DicoUserbox;
    
    NSMutableArray * orderNewsTab;
    
    
}

@property (nonatomic, retain) NSMutableArray * orderNewsTab;

@property (nonatomic, retain) NSMutableDictionary * dicoNewsContent;

@property (nonatomic, retain) NSMutableArray * ArrayUrl;
@property (nonatomic, retain) NSMutableDictionary * ArrayWebview;

@property (nonatomic, retain) NSMutableDictionary * ArrayTweetName;
@property (nonatomic, retain) NSMutableDictionary * ArrayTweetUrl;
@property (nonatomic, retain) NSMutableDictionary * ArraytweetText;
@property (nonatomic, retain) NSMutableDictionary * ArraytweetUsername;
@property (nonatomic, retain) NSMutableDictionary * ArraytweetDate;

@property (nonatomic, retain) NSMutableDictionary * DicoIdTop;

@property (nonatomic, retain) NSMutableDictionary * DicoUserbox;

@property (nonatomic, retain) NSMutableArray * DicoArraytop;

@property (nonatomic, retain) NSMutableArray * TabButtonNews;

@property (nonatomic, retain) NSMutableArray * TabMentionLink;

@property (nonatomic, retain) NSMutableArray * TabPic;

@property (nonatomic,strong) AutoScrollAng * scrollviewANG;
@property (nonatomic,strong) AutoScrollFra * scrollviewFR;
@property (nonatomic,strong) AutoScrollAll * scrollviewALL;
@property (nonatomic,strong) AutoScrollIta * scrollviewITA;
@property (nonatomic,strong) AutoScrollEsp * scrollviewESP;

@property (nonatomic,strong) NSNumber * TopFlag;
@property (nonatomic,strong) NSNumber * NullText;

@property (nonatomic,strong) NSString * CurrentTeam;
@property (nonatomic,strong) NSString * CurrentFolder;


@property (nonatomic,strong) NSMutableArray * ArrayTweetBdd;
@property (nonatomic,strong) NSMutableArray * TabTweet;
@property (nonatomic,strong) UIButton * BackVc1;
@property (nonatomic,strong) UIButton * BackVc2;


@property (nonatomic,strong) GSBorderLabel * Titre1;
@property (nonatomic,strong) GSBorderLabel * Titre2;

@property (nonatomic, strong) UIButton *btnSelect;
@property (nonatomic, strong) UIButton *BtnTop;

@property (nonatomic, strong) NSMutableArray * tabUrlTimages;

@property (assign, nonatomic) NSUInteger flagPosFINISH;
@property (assign, nonatomic) NSUInteger intFuturRefresh;
@property (assign, nonatomic) NSUInteger intLastRefresh;

@property (assign, nonatomic) NSUInteger numGeneralXml;
@property (assign, nonatomic) NSUInteger xmlNum;

@property (assign, nonatomic) NSUInteger PosYFrance;
@property (assign, nonatomic) NSUInteger countFrance;
@property (assign, nonatomic) NSUInteger numMediaFrance;

@property (assign, nonatomic) NSUInteger PosYAng;
@property (assign, nonatomic) NSUInteger countAng;
@property (assign, nonatomic) NSUInteger numMediaAng;

@property (assign, nonatomic) NSUInteger PosYAll;
@property (assign, nonatomic) NSUInteger countAll;
@property (assign, nonatomic) NSUInteger numMediaAll;

@property (assign, nonatomic) NSUInteger PosYIta;
@property (assign, nonatomic) NSUInteger countIta;
@property (assign, nonatomic) NSUInteger numMediaIta;

@property (assign, nonatomic) NSUInteger PosYEsp;
@property (assign, nonatomic) NSUInteger countEsp;
@property (assign, nonatomic) NSUInteger numMediaEsp;

@property (assign, nonatomic) NSUInteger barY;

@property (assign, nonatomic) NSUInteger tweetSuccess;
@property (assign, nonatomic) NSUInteger countUpdateTweet;

@property (assign, nonatomic) NSUInteger accountTwitter;



+ (id)sharedManager;


@end


