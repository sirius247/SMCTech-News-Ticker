#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BBWeeAppController-Protocol.h"

@interface SMCNewsController : NSObject <BBWeeAppController>
{
    UIView *_view;
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

        UIImage *bg = [[UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/WeeAppTest.bundle/WeeAppBackground.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:71];
        UIImageView *bgView = [[UIImageView alloc] initWithImage:bg];
        bgView.frame = CGRectMake(0, 0, 316, 71);
        [_view addSubview:bgView];
        [bgView release];
	
	UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 316, 71)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor whiteColor];
        lbl.text = @"SMCTech News Ticker Goes here";
        lbl.textAlignment = UITextAlignmentCenter;
        [_view addSubview:lbl];
        [lbl release];
    }
return _view;
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

