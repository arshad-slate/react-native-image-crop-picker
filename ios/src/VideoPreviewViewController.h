//
//  VideoPreviewViewController.h
//  RNImageCropPicker
//
//  Created by SL8 on 16/06/23.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

typedef void(^CompletionBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface VideoPreviewViewController : UIViewController
@property (nonatomic, retain) AVPlayerViewController *playerViewController;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, copy) CompletionBlock callback;


@end

NS_ASSUME_NONNULL_END
