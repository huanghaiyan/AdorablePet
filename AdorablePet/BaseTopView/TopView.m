//
//  TopView.m
//  TicketApp
//
//  Created by 蒋林春 on 14-6-10.
//  Copyright (c) 2014年 北京春秋永乐文化传播有限公司. All rights reserved.
//

#import "TopView.h"

@implementation TopView
@synthesize titleImageView,titleLabel,backButton,searchButton, delegate, cityButton,screenButton,shareButton,collectionButton,filmCityButton, line;
@synthesize leftButton,rightButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        backButton=[UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame=CGRectMake(0, 0, 172/2, 43);
        [backButton setImage:IMAGE(@"icon_back") forState:UIControlStateNormal];
//        [backButton setImageEdgeInsets:UIEdgeInsetsMake(8, 13, 8, 13)];
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        backButton.hidden=YES;
        [self addSubview:backButton];
        
        titleImageView=[[UIImageView alloc]initWithFrame:CGRectMake((IPHONE_WIDTH-44)/2, 0, 44, 44)];
        titleImageView.hidden=YES;
        [self addSubview:titleImageView];
        
        titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(44, 0, IPHONE_WIDTH-44*2, 44)];
        titleLabel.textColor=UIColorFromRGB(0xfaad3b);
        titleLabel.font=[UIFont systemFontOfSize:18];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        titleLabel.hidden=YES;
        [self addSubview:titleLabel];
        
        leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame=CGRectMake(0, 0, 44, 44);
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        [leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        leftButton.hidden=YES;
        [self addSubview:leftButton];

        rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame=CGRectMake(IPHONE_WIDTH-44, 0, 44, 44);
        [rightButton setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        [rightButton  setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        rightButton.hidden=YES;
        [self addSubview:rightButton];
        
        line = [[UIView alloc] init];
        line.frame = CGRectMake(0, self.HEIGHT-1, IPHONE_WIDTH, 1);
        line.backgroundColor = LineCOLOR;
        [self addSubview:line];
    }
    return self;
}

- (void)setTitleImage:(NSString *)titleImageName size:(CGSize)imageSize{
    self.titleImageView.image=IMAGE(titleImageName);
//    self.titleImageView.frame=CGRectMake(0, 0, imageSize.width, imageSize.height);
//    self.titleImageView.center=CGPointMake(self.center.x, self.center.y-TOPEDGE);
}
- (void)setTitle:(NSString *)title {
    //CGSize maxSize=CGSizeMake(210, 44);
    self.titleLabel.backgroundColor=[UIColor clearColor];
    self.titleLabel.text=title;
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    self.titleLabel.font=[UIFont fontWithName:@"Arial" size:18];
//    UIFont * font = [UIFont fontWithName:@"Arial" size:21];
//    self.titleLabel.font=font;
//    CGSize  size = [title sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
//    titleLabel.frame=CGRectMake(0, 0, size.width, size.height);
//    self.titleLabel.center=CGPointMake(self.center.x, self.center.y-TOPEDGE);
}
- (void)backButtonClicked{
    if (delegate && [delegate respondsToSelector:@selector(enterBackLast)]) {
        [delegate enterBackLast];
    }
}
- (void)searchButtonClicked{
    if (delegate && [delegate respondsToSelector:@selector(enterSearchView)]) {
        [delegate enterSearchView];
    }
}
- (void)cityButtonClicked{
    [self.cityButton setSelected:YES];
    if (delegate && [delegate respondsToSelector:@selector(enterCitySelect)]) {
        [delegate enterCitySelect];
    }
}
- (void)screenButtonClicked{
    //[self.screenButton setSelected:YES];
    if (delegate && [delegate respondsToSelector:@selector(enterScreenView)]) {
        [delegate enterScreenView];
    }
}
- (void)collectionButtonClicked{
    if (delegate && [delegate respondsToSelector:@selector(enterCollection)]) {
        [delegate enterCollection];
    }
}
- (void)shareButtonClicked{
    if (delegate && [delegate respondsToSelector:@selector(enterShareView)]) {
        [delegate enterShareView];
    }
}

- (void)filmCityButtonClicked{
    [self.filmCityButton setSelected:YES];
    if (delegate && [delegate respondsToSelector:@selector(enterFilmCitySelect)]) {
        [delegate enterFilmCitySelect];
    }
}

- (void)leftButtonClicked{
    if (delegate && [delegate respondsToSelector:@selector(enterLeftButton)]) {
        [delegate enterLeftButton];
    }
}

- (void)rightButtonClicked{
    if (delegate && [delegate respondsToSelector:@selector(enterRightButton)]) {
        [delegate enterRightButton];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
