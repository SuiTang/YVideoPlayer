//
//  YVideoNavigationController.m
//  YVideoPlayer
//
//  Created by 彦鹏 on 16/3/31.
//  Copyright © 2016年 Huyp. All rights reserved.
//

#import "YVideoNavigationController.h"

@interface YVideoNavigationController ()

@end

@implementation YVideoNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//锁定转向
- (BOOL)shouldAutorotate {
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
/*   push方法
 NSLog(@"[self.topViewController.class description]=%@",[self.topViewController.class description]);
 
 ShowViewController * s = [[ShowViewController alloc]init];
 if (self.topViewController.class == s.class) {
 return UIInterfaceOrientationMaskAllButUpsideDown;
 }
 else {
 return UIInterfaceOrientationMaskPortrait;
 }
*/


@end
