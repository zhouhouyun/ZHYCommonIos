//
//  CommonTools.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/27.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools

+(NSString *)getAppVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+(UIAlertController *)alertUpdateInformation:(NSDictionary *)jsonObject{
    UIAlertController *contro;
    NSArray *results = jsonObject[@"results"];
    if([results isKindOfClass:[NSArray class]]){
        NSDictionary *dict = [results firstObject];
        //appStore版本
        NSString *storeVersion = dict[@"version"];
        //更新内容
        NSString *releaseNotes = dict[@"releaseNotes"];
        //跳转URL
        NSString *trackViewUrl = dict[@"trackViewUrl"];
        NSURL *trackViewURL = [NSURL URLWithString:trackViewUrl];
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        //NSOrderedAscending是升序，如果app_Version<storeVersion用这个函数相比较那么就等于升序。
        if ([app_Version compare:storeVersion options:NSNumericSearch] == NSOrderedAscending){
            //弹框提示有升级版本
            NSString *title = [NSString stringWithFormat:@"发现新版本%@",storeVersion];
            UIAlertController *contro = [UIAlertController alertControllerWithTitle:title message:releaseNotes preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"去更新" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                if (@available(iOS 10.0, *)) {
                    if([[UIApplication sharedApplication] canOpenURL:trackViewURL]){
                        [[UIApplication sharedApplication] openURL:trackViewURL options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @NO} completionHandler:^(BOOL success) {

                        }];
                    }else{
                        //不能打开
                    }
                } else {
                    if([[UIApplication sharedApplication] canOpenURL:trackViewURL]){
                        [[UIApplication sharedApplication] openURL:trackViewURL];
                    }else{
                        //不能打开
                    }
                }
            }];
            [contro addAction:sure];
            
            UIAlertAction *canel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [contro addAction:canel];
            
//            NSString *deviceType = [UIDevice currentDevice].model;
//            if([deviceType isEqualToString:@"iPad"]){
//                UIPopoverPresentationController *popPresenter = [contro popoverPresentationController];
//                popPresenter.sourceView = self.view;
//                popPresenter.sourceRect = self.view.bounds;
//                popPresenter.permittedArrowDirections = UIPopoverArrowDirectionUp;
//                [self presentViewController:contro animated:YES completion:nil];
//            }else
//                [self presentViewController:contro animated:YES completion:nil];
//            }
        }
    }
    
    return contro;
}

@end
