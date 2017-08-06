/*
 * Copyright 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppViewController.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface AppViewController ()

@end

@implementation AppViewController {
    UILabel *_label;
    NSString *_helloString;
}

- (instancetype) initWithHelloString:(NSString *)helloString {
    if ((self = [super initWithNibName:nil bundle:nil])) {
        _helloString = helloString;
    }
    return self;
}

- (void)loadView {
    NSURL *jsCodeLocation;

    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"MyReactNativeApp"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    self.view = rootView;
}

@end
