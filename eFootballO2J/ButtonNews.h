//
//  ButtonNews.h
//  E-Football
//
//  Created by Karim Koriche on 03/09/2015.
//  Copyright (c) 2015 Karim Koriche. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GSBorderLabel.h"

@interface ButtonNews : UIButton
{
	UIImage* _ImageNews;
    UIImageView * _ImgLogo;
	GSBorderLabel * _TextView;
    UILabel * _Soustitre;
    UILabel * _Article;
    UILabel * _Date;
    UILabel * LienUrl;
    UILabel * nomMed;
    NSURL * urlImg;
    UITextView * textMore;
	
}

@property (nonatomic,strong) UIImage* ImageNews;
@property (nonatomic,strong) UIImageView * ImgLogo;
@property (nonatomic,strong) GSBorderLabel * TextView;
@property (nonatomic,strong) UILabel * Soustitre;
@property (nonatomic,strong) UILabel * Article;
@property (nonatomic,strong) UILabel * Date;
@property (nonatomic,strong) UILabel * LienUrl;
@property (nonatomic,strong) UILabel * nomMed;

@property (nonatomic,strong) UILabel * textMore;

@property (nonatomic,strong) NSURL * urlImg;




@end
