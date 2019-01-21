//
//  ViewController.m
//  WSLImageView
//
//  Created by 王双龙 on 2018/10/11.
//  Copyright © 2018年 https://www.jianshu.com/u/e15d1f644bea. All rights reserved.
//

#import "ViewController.h"
#import "SLImageView.h"
#import "SLImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
//    //加载本地图片
    SLImage * animationImage;
    animationImage = [SLImage imageNamed:@"12"];
    CGSize imageSize = animationImage == nil ?  CGSizeMake(self.view.frame.size.width, 200): animationImage.size;

    __block SLImageView * imageView = [[SLImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * imageSize.height/imageSize.width);
    imageView.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
    imageView.image = animationImage;
    imageView.autoPlayAnimatedImage = YES;
    imageView.currentImageIndex = 0;
    imageView.maxBufferSize = 1024 * 1024 * 5;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    
    //加载二百多帧的网络图片
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://b-ssl.duitang.com/uploads/item/201708/04/20170804014033_kxMeA.gif"]];
//        SLImage * animationImage = [SLImage imageWithData:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * animationImage.size.height/animationImage.size.width);
//            imageView.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
//            imageView.image = animationImage;
//        });
//    });
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView addGestureRecognizer:tap];
    
}

- (void)tap:(UITapGestureRecognizer *)tap{
    SLImageView * imageView = (SLImageView *)tap.view;
    if (imageView.currentIsPlaying) {
        [imageView stopAnimating];
    }else{
        [imageView startAnimating];
    }
}

@end
