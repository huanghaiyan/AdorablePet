

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize topView,statusBarBackView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (SYSTEM_VERSION >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets=NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 20)];
        view.backgroundColor = WHITECOLOR;
        [self.view addSubview:view];
        self.statusBarBackView = view;
    }
    
    topView=[[TopView alloc]initWithFrame:CGRectMake(0, TOPEDGE, IPHONE_WIDTH, NavBarHeight)];
    topView.backgroundColor = WHITECOLOR;
    topView.delegate = self;
    [self.view addSubview:topView];
    
    _HUD = [AlertMsgView initAlertView:CGRectMake(0, NAVTOPEDGE, IPHONE_WIDTH, IPHONE_HEIGHT-NAVTOPEDGE-TabBarHeight)];
    _HUD.hidden = YES;
    [self.view addSubview:_HUD];
    
    self.view.backgroundColor = GRAY_BACKGROUND_COLOR;
    [self TestErrorView];
    
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, NAVTOPEDGE, IPHONE_WIDTH, IPHONE_HEIGHT)];
    [self.view addSubview:self.maskView];
    self.maskView.hidden = YES;
    self.maskView.userInteractionEnabled = YES;
    self.maskView.alpha = .3;
    self.maskView.backgroundColor = BLACKCOLOR;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskViewTapGuesterResponed)];
    [self.maskView addGestureRecognizer:tap];
}
- (void)maskViewBeTaped{
//    if ([_delegate respondsToSelector:@selector(maskViewTapGuesterResponed)]) {
//        [_delegate maskViewTapGuesterResponed];
//    }
}
- (void)maskViewTapGuesterResponed{
}
- (void)networkingError{
   
}
- (void)refreshData{
    //子类重写
}
- (void)TestErrorView {
    Errview = [ErrorView shareAlertView];
//    Errview.center = self.view.center;
    Errview.hidden = YES;
    [self.view addSubview:Errview];
    [Errview displayAlert:^( ) {
        [self reload];
    }];
}

- (bool )responseState:(WWServiceResponse *)response error:(NSError* )error {
    if ([response.code intValue] != 0) {
        if (response.msg.length > 0) {
            _SPAlertView(response.msg, @"");
        }
        return NO;
    }
    return YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)popViewController {
    if (self.navigationController.childViewControllers.count == 1)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
}

- (void)enterBackLast{
    [self popViewController];
}

- (void)popToRootViewController {
    NSArray * ctrlArray = self.navigationController.viewControllers;
    for (int i = 0; i < ctrlArray.count; i++) {
        UIViewController* viewController = ctrlArray[i];
        if ([viewController isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:[ctrlArray objectAtIndex:i] animated:YES];
            return;
        }
    }
}

- (void)dealloc {
    
    [self stopLoading];
    [_HUD removeFromSuperview];
    _HUD = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation BaseViewController (Loading)

- (void)startLoading {
    _HUD.hidden = NO;
    [self.view bringSubviewToFront:_HUD];
    [_HUD show:YES];
}

- (void)stopLoading {
    _HUD.hidden = YES;
    [_HUD hide:YES];
}

- (void)failedLoading {
//    Errview.hidden = NO;
//    [Errview setErrorMessage:@"网络连接失败，点击以重新加载。"];
//    [self.view bringSubviewToFront:Errview];
}

- (void)failedLoading:(NSString *)message
{
//    if (Errview) {
//        [Errview removeFromSuperview];
//        [self TestErrorView];
//    }
//    
//    Errview.hidden = NO;
//    [Errview setErrorMessage:message];
//    [self.view bringSubviewToFront:Errview];
}

- (void)successLoading {
    Errview.hidden = YES;
    [self.view sendSubviewToBack:Errview];
}

- (void)reload {
    [self refreshData];
}

- (void)showError:(NSError *)error {
    [self.view makeToast:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
}
- (void)showInfo:(NSString* )aMsg {
    [self.view makeToast:aMsg];
}

- (void)showInfoInWindow:(NSString* )aMsg {
    [self.view.window makeToast:aMsg];
}

@end
