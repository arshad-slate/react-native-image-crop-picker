//
//  VideoPreviewViewController.m
//  RNImageCropPicker
//
//  Created by SL8 on 16/06/23.
//

#import "VideoPreviewViewController.h"

@interface VideoPreviewViewController ()

@end

@implementation VideoPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *stringVideoName = @"video.m4v";
    NSLog(@"video url === %@", _url);
//        NSString *stringVideoPath = [[NSBundle mainBundle] pathForResource:stringVideoName ofType:nil];
//        NSAssert(stringVideoPath, @"Expected not nil video file");

//        NSURL *urlVideoFile = [NSURL fileURLWithPath:stringVideoPath];
//        NSAssert(urlVideoFile, @"Expected not nil video url");
            NSURL *urlVideoFile = [NSURL URLWithString:_url];
    

        _playerViewController = [[AVPlayerViewController alloc] init];
        _playerViewController.player = [AVPlayer playerWithURL:urlVideoFile];
         CGRect frame = self.view.bounds;
         frame.origin.y = 90;
         frame.size.height = frame.size.height - 180;
        _playerViewController.view.frame = frame;
        _playerViewController.showsPlaybackControls = YES;

        [self.view addSubview:_playerViewController.view];
        self.view.autoresizesSubviews = YES;
    
    CGRect frame1, remain;
    CGRectDivide(self.view.bounds, &frame1, &remain, 44, CGRectMaxYEdge);
    if (@available(iOS 11.0, *)) {
        CGFloat height = 44;
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - self.view.safeAreaInsets.bottom - height - 30, self.view.frame.size.width, 44)];
    
        [toolbar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
        [self.view addSubview:toolbar];
        
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonPressed:)];
        [leftButton setTintColor:[UIColor colorWithRed:51.0/255.0 green:84.0/255.0 blue:166.0/255.0 alpha:1]];
                
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed:)];
        [rightButton setTintColor:[UIColor colorWithRed:239.0/255.0 green:207.0/255.0 blue:95.0/255.0 alpha:1]];

        
        [toolbar setTranslucent:NO];
        [toolbar setBackgroundColor:[UIColor blackColor]];
        [toolbar setTintColor:[UIColor blackColor]];
        toolbar.barStyle = UIBarStyleBlack;
        [toolbar setItems:@[leftButton, flex, rightButton]];
        self.view.backgroundColor = [UIColor blackColor];
        
        [toolbar setItems:@[leftButton, flex, rightButton]];
    } else {
        // Fallback on earlier versions
    }
}

- (void) rightButtonPressed: (id) sender {
    typeof(self) __weak weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (weakSelf.callback) {
            weakSelf.callback();
        }
    }];

}

- (void) leftButtonPressed: (id) sender {

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
