//
//  ShowViewController.m
//  YVideoPlayer
//
//  Created by 彦鹏 on 16/3/30.
//  Copyright © 2016年 Huyp. All rights reserved.
//

#import "ShowViewController.h"
#import "YVideoPlayerView.h"

@interface ShowViewController ()
{
    YVideoPlayerView * yVideoPlayerView;
    NSMutableArray * paths;
    NSMutableArray * names;
}
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table.delegate = self;
    _table.dataSource = self;
    //路径
    NSString * path1 = [[NSBundle mainBundle] pathForResource:@"本地测试横屏" ofType:@"mov"];
    NSString * path2 = [[NSBundle mainBundle] pathForResource:@"本地测试竖屏" ofType:@"mp4"];
    NSString * path3 = @"http://data.vod.itc.cn/?prod=app&new=/10/66/eCGPkAewSVqy9P57hvB11D.mp4";
    paths = [NSMutableArray arrayWithObjects:path1,path2,path3, nil];
    
    //视频名称
    names = [NSMutableArray arrayWithObjects:@"本地测试横屏",@"本地测试竖屏",@"网络视频", nil];
}

- (void)viewDidAppear:(BOOL)animated {
    //加载第一个视频
    yVideoPlayerView = [YVideoPlayerView initWithVideoName:names.firstObject frame:CGRectMake(0, 20, _videoView.frame.size.width, _videoView.frame.size.height) path:paths.firstObject onViewControll:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return paths.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"test";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = names[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //点击 cell 更新视频
    yVideoPlayerView = [yVideoPlayerView updateVideoWithName:names[indexPath.row] path:paths[indexPath.row] onViewController:self];
}

//只让这个页面转动
- (BOOL)shouldAutorotate {
    return YES;
}
//如果需要push 采用YVideoNavigationController 中的push方法(记得隐藏导航栏)
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (yVideoPlayerView.canOrientationChange == YES) {  //刚进入页面是竖屏
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (void)dealloc {
    NSLog(@"delloc");
}

@end
