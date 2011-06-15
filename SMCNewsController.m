#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BBWeeAppController-Protocol.h"

@interface SMCNewsController : NSObject <BBWeeAppController>
{
    UIView *_view;
    UIWebView *webView;
}

+ (void)initialize;
- (UIView *)view;

@end

@implementation SMCNewsController

+ (void)initialize
{

}

- (void)dealloc
{
    [_view release];
    [super dealloc];
}

- (UIView *)view
{
    if (_view == nil)
    {
        _view = [[UIView alloc] initWithFrame:CGRectMake(2, 0, 316, 71)];

        UIImage *bg = [[UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/SMCNews.bundle/WeeAppBackground.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:71];
        UIImageView *bgView = [[UIImageView alloc] initWithImage:bg];
        bgView.frame = CGRectMake(0, 0, 316, 71);
        [_view addSubview:bgView];
        [bgView release];
	
        CGRect webFrame = CGRectMake(0, 0, 316, 71);
        webView = [[UIWebView alloc] initWithFrame:webFrame];
        [webView setBackgroundColor:[UIColor clearColor]];
        NSString *urlAddress = @"http://www.smctechnologies.org/ticker";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [webView loadRequest:requestObj];
        webView.userInteractionEnabled = YES;
        [_view addSubview:webView];
        [webView release];
    }
return _view;
}

-  (void)goHome: (id)sender{
    NSString *urlAddress = @"http://www.smctechnologies.org/ticker";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
}

- (float)viewHeight
{
    return 71.0f;
}

- (void)willAnimateRotationToInterfaceOrientation:(int)arg1
{
        if (UIInterfaceOrientationIsLandscape(arg1)) {
                CGRect rect=[self view].frame;
                rect.size.width=476;
                [self view].frame=rect;
                for(UIView* v__ in [[self view] subviews]){
                        CGRect rect=v__.frame;
                        rect.size.width=476;
                        v__.frame=rect;
                }
        } else {
                CGRect rect=[self view].frame;
                rect.size.width=316;
                [self view].frame=rect;
                for(UIView* v__ in [[self view] subviews]){
                        CGRect rect=v__.frame;
                        rect.size.width=316;
                        v__.frame=rect;
                }
        }
}

@end

