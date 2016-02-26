//
//  ButtonNews.m
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import "ButtonNews.h"

@implementation ButtonNews

@synthesize ImageNews = _ImageNews, ImgLogo = _ImgLogo, TextView = _TextView, Soustitre = _Soustitre, Article = _Article, Date = _Date, LienUrl = _LienUrl, textMore = _textMore, nomMed = _nomMed, urlImg = _urlImg;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:1]];
        [[self layer] setBorderWidth:1];
        [[self layer] setBorderColor:[UIColor blackColor].CGColor];
        
        [self setUserInteractionEnabled:YES];
        [self setEnabled:YES];
        
        _ImageNews = [[UIImage alloc]init];
        _ImgLogo  = [[UIImageView alloc] init];
        _ImgLogo.alpha = 0.9;
        
        _TextView = [[GSBorderLabel alloc] initWithTextColor:[UIColor whiteColor]
                                                            andBorderColor:[UIColor blackColor]
                                                            andBorderWidth:3];
        _TextView.backgroundColor = [UIColor blackColor];
        [_TextView setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0]];
        
        _TextView.lineBreakMode = NSLineBreakByTruncatingTail;
        _TextView.textAlignment = NSTextAlignmentCenter;
        _TextView.numberOfLines = 0;

        _Soustitre = [[UILabel alloc]init];
        
         _Article = [[UILabel alloc]init];
        
         _Date = [[UILabel alloc]init];
        
        _LienUrl = [[UILabel alloc]init];
        
        _nomMed = [[UILabel alloc]init];
    
        _urlImg = [[NSURL alloc]init];

    }
    return self;
}


@end
