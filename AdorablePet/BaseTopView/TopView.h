//
//  TopView.h
//  TicketApp
//
//  Created by 蒋林春 on 14-6-10.
//  Copyright (c) 2014年 北京春秋永乐文化传播有限公司. All rights reserved.
//  自定义NavBarView

#import <UIKit/UIKit.h>
@protocol TopViewDelegate;

@interface TopView : UIView
@property (strong,nonatomic) UIImageView * titleImageView;//navBar上中间的图片标题，默认隐藏
@property (strong,nonatomic) UILabel * titleLabel;//navBar上中间的文字标题，默认隐藏
@property (strong,nonatomic) UIButton * backButton;//navBar左上角的返回按钮，默认隐藏
@property (strong,nonatomic) UIButton * searchButton;//navBar上的搜索按钮，默认隐藏
@property (strong,nonatomic) UIButton * screenButton;//navBar上的筛选按钮，默认隐藏

@property (strong,nonatomic) UIButton * collectionButton;//navBar上的收藏按钮，默认隐藏
@property (strong,nonatomic) UIButton * shareButton;//navBar上的分享按钮，默认隐藏

@property (weak,nonatomic) id <TopViewDelegate>delegate;//navBar上面的按钮点击的协议

@property (strong,nonatomic) UIButton * cityButton;//navBar上面的城市选择按钮
@property (strong,nonatomic) UIButton * filmCityButton;//navBar左上角上面的电影城市选择按钮

@property (strong,nonatomic) UIButton * leftButton;     //navBar左上角按钮，需要指定标题，默认隐藏
@property (strong,nonatomic) UIButton * rightButton;    //navBar右上角按钮，需要指定标题，默认隐藏

@property (strong,nonatomic) UIView * line;

- (void)setTitleImage:(NSString *)titleImageName size:(CGSize)imageSize;//设置标题图片
- (void)setTitle:(NSString *)title;//设置标题文字
- (void)backButtonClicked;//返回按钮触发
- (void)searchButtonClicked;//搜索按钮触发
- (void)screenButtonClicked;//筛选按钮触发
- (void)filmCityButtonClicked;//选择电影城市按钮触发
- (void)leftButtonClicked;   //左上角自定义按钮触发
- (void)rightButtonClicked;  //右上角自定义按钮触发
@end

@protocol TopViewDelegate <NSObject>
@optional
- (void)enterFilmCitySelect;
- (void)enterCitySelect;
- (void)enterBackLast;
- (void)enterSearchView;
- (void)enterScreenView;
- (void)enterCollection;
- (void)enterShareView;
- (void)enterLeftButton;
- (void)enterRightButton;
@end
