

#import <UIKit/UIKit.h>
#import "TopView.h"

#import "AlertMsgView.h"
#import "ErrorView.h"
#import "WWServiceResponse.h"
#import <AFNetworking/AFNetworking.h>


@class YLServiceResponse;

@protocol BaseViewControllerDelegate <NSObject>

//- (void)maskViewTapGuesterResponed;

@end


@interface BaseViewController: UIViewController <TopViewDelegate>{
    
@public
    AlertMsgView* _HUD;
    ErrorView* Errview;
    AFHTTPRequestOperation * Operator;

}

@property (nonatomic,strong) TopView * topView;
@property (nonatomic,strong) UIView * statusBarBackView;
@property (nonatomic, strong)id <BaseViewControllerDelegate> delegate;
@property (nonatomic, strong)UIView * maskView;

- (bool )responseState:(WWServiceResponse *)response error:(NSError* )error;  //每个接口返回都要调用此方法，YES为正常，NO为不正常
- (void)refreshData;
- (void)maskViewTapGuesterResponed;
- (void)popToRootViewController;

@end

//打log用DLog

@interface BaseViewController (Loading)
- (void)startLoading;                //开启等待框
- (void)stopLoading;                 //隐藏等待框
- (void)failedLoading;               //加载失败
- (void)failedLoading:(NSString *)message; //加载失败并指定信息
- (void)successLoading;              //加载成功
- (void)showError:(NSError *)error;  //显示错误信息
- (void)reload;                      //重新加载,每个界面必须重写此方法
- (void)showInfo:(NSString* )aMsg;   //显示内容
- (void)showInfoInWindow:(NSString* )aMsg;
@end
