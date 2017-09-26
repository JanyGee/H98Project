//
//  GetNetWorkState.m
//  H91B
//
//  Created by Jany on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GetNetWorkState.h"

@implementation GetNetWorkState
+ (GetNetWorkState *)getNetWorkStateManager
{
    GetNetWorkState *manger = nil;
    if (!manger) {
        manger = [[GetNetWorkState alloc]init];
    }
    
    return manger;
}
- (void)cachState:(BOOL)state
{
    NSUserDefaults *myDefault = [NSUserDefaults standardUserDefaults];
    [myDefault setBool:state forKey:@"MyNetWorkState"];
    [myDefault synchronize];
}
- (BOOL)getNetWorkState
{
    NSUserDefaults *myDefault = [NSUserDefaults standardUserDefaults];
    BOOL state = [myDefault boolForKey:@"MyNetWorkState"];
    [myDefault synchronize];
    
    return state;
}
@end
