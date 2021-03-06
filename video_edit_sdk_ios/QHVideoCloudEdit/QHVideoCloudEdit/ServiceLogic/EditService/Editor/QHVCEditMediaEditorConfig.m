//
//  QHVCEditMediaEditorConfig.m
//  QHVideoCloudToolSet
//
//  Created by liyue-g on 2018/8/10.
//  Copyright © 2018年 yangkui. All rights reserved.
//

#import "QHVCEditMediaEditorConfig.h"
#import "QHVCEditPrefs.h"

@implementation QHVCEditMediaEditorConfig

+ (instancetype)sharedInstance
{
    static QHVCEditMediaEditorConfig* s_instance = nil;
    static dispatch_once_t predic;
    dispatch_once(&predic, ^{
        s_instance = [[QHVCEditMediaEditorConfig alloc] init];
        [s_instance initialParams];
    });
    return s_instance;
}

- (void)initialParams
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cleanParams) name:QHVCEDIT_DEFINE_NOTIFY_CLEAN_ALL_PARAMS object:nil];
    _playerBgColor = @"FF000000";
    self.musicVolume = 100;
    self.musicHasFIFO = NO;
    self.volume = 100;
    self.pitch = 0;
    self.speed = 1.0;
    self.hasAudioTransfer = NO;
    self.outputSize = CGSizeMake(kOutputVideoWidth, kOutputVideoHeight);
    self.outputFps = 30;
    self.outputVideoBitrate = 4.5 * 1000 * 1000;
    self.mainTrackBgColorIndex = kDefaultBgColorIndex;
    self.overlayItemArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.stickerItemArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.subtitleItemArray = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)cleanParams
{
    //音效
    self.volume = 100;
    self.pitch = 0;
    self.speed = 1.0;
    self.hasAudioTransfer = NO;
    
    //滤镜
    self.filterIndex = 0;
    self.effectFilter = nil;
    
    //水印
    self.effectWaterMark = nil;
    
    //裁剪
    self.mainTrackClipsRadian = 0;
    self.mainTrackClipsFlipX = NO;
    self.mainTrackClipsFlipY = NO;
    self.mainTrackBgColorIndex = kDefaultBgColorIndex;
    self.mainTrackFillModeIndex = kDefaultFillModeIndex;
    
    //背景音乐
    self.musicClipItem = nil;
    self.musicHasFIFO = NO;
    self.musicVolume = 100;
}

@end
