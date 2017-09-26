//
//  GetNetWorkState.h
//  H91B
//
//  Created by Jany on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetNetWorkState : NSObject
+ (GetNetWorkState *)getNetWorkStateManager;
- (void)cachState:(BOOL)state;
- (BOOL)getNetWorkState;
@end
