//
//  RequestManager.m
//  TestShangRuiInterface
//
//  Created by Jany on 17/2/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RequestManager.h"
#import "GetNetWorkState.h"

@interface RequestManager ()
{
    BOOL _getFlag;
    BOOL _postFlag;
}
@end
static NSString *requestHead = @"http://srapi.fashioncomm.com/";
///http://srapi.fashioncomm.com/Help
@implementation RequestManager
    
RequestManager *manager = nil;
+(instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RequestManager alloc] initWithBaseURL:[NSURL URLWithString:requestHead] sessionConfiguration:[self setConfiguration]];
    });
    
    return manager;
}
    
+ (NSURLSessionConfiguration *)setConfiguration
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [sessionConfiguration setTimeoutIntervalForRequest:30.f];
    [sessionConfiguration setTimeoutIntervalForResource:30.f];
    
    return sessionConfiguration;
}

- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (self) {
        
        _getFlag = YES;
        _postFlag = YES;
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    }
    
    return self;
}

- (id)getRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameter success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    
    NSURLSessionDataTask *dataTask = [self GET:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * task, id responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSDictionary *headers = nil;
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)(task.response);
        if ([httpResponse respondsToSelector:@selector(allHeaderFields)]) {
            headers = [httpResponse allHeaderFields];
        }
        
        //判断网路状态
        if (![[GetNetWorkState getNetWorkStateManager] getNetWorkState] && _getFlag) {
            
            _getFlag = NO;
            [self performSelector:@selector(after3GetScond) withObject:nil afterDelay:3];
            //UIWindow *window =[[UIApplication sharedApplication].delegate window];
            //[window makeToast:localizedString(@"not_net") duration:3];
            failBlock(task,nil);
        }else{
            failBlock(task,nil);
        }
    }];
    
    return dataTask;
}

- (void)after3GetScond
{
    _getFlag = YES;
}

- (id)postRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameter success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSURLSessionDataTask *dataTask = [self POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * task, id responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSDictionary *headers = nil;
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)(task.response);
        if ([httpResponse respondsToSelector:@selector(allHeaderFields)]) {
            headers = [httpResponse allHeaderFields];
        }
        
        //判断网络状态
        if (![[GetNetWorkState getNetWorkStateManager] getNetWorkState] && _postFlag) {
            
            _postFlag = NO;
            [self performSelector:@selector(after3scond) withObject:nil afterDelay:3];
            //UIWindow *window =[[UIApplication sharedApplication].delegate window];
            //[window makeToast:localizedString(@"not_net") duration:3];
            failBlock(task,nil);
        }else{
            failBlock(task,nil);
        }
    }];
    
    return dataTask;
}

- (void)after3scond
{
    _postFlag = YES;
}

- (void)registerANewUserWithUserName:(NSString *)Username LoginName:(NSString *)LoginName Email:(NSString *)Email Password:(NSString *)Password SerialNumber:(NSString *)SerialNumber Contact:(NSString *)Contact ContactPhone:(NSString *)ContactPhone ThirdName:(NSString *)ThirdName ThirdID:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdImg:(NSString *)ThirdImg SMSCode:(NSString *)SMSCode Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Username forKey:@"Username"];
    [parameters setObject:LoginName forKey:@"LoginName"];
    [parameters setObject:Email forKey:@"Email"];
    [parameters setObject:Password forKey:@"Password"];
    [parameters setObject:SerialNumber forKey:@"SerialNumber"];
    [parameters setObject:Contact forKey:@"Contact"];
    [parameters setObject:ContactPhone forKey:@"ContactPhone"];
    [parameters setObject:ThirdName forKey:@"ThirdName"];
    [parameters setObject:ThirdID forKey:@"ThirdID"];
    [parameters setObject:ThirdType forKey:@"ThirdType"];
    [parameters setObject:ThirdImg forKey:@"ThirdImg"];
    [parameters setObject:SMSCode forKey:@"SMSCode"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];

    [self postRequestWithURL:@"api/User/Register" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}

- (void)loginByUserNameAndPasswordWithName:(NSString *)Name Pass:(NSString *)Pass AppId:(NSString *)AppId Language:(NSString *)Language LoginType:(NSString *)LoginType success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Name forKey:@"Name"];
    [parameters setObject:Pass forKey:@"Pass"];
    [parameters setObject:AppId forKey:@"AppId"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:LoginType forKey:@"LoginType"];
    
    [self postRequestWithURL:@"api/User/Login" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}

- (void)requestInformationWithId:(NSString *)Id LoginType:(NSString *)LoginType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Id forKey:@"Id"];
    [parameters setObject:LoginType forKey:@"LoginType"];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Push/GetPushSetting" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}
- (void)savePushSetingWithId:(NSString *)Id LoginType:(NSString *)LoginType Client:(NSString *)Client IsPush:(NSString *)IsPush Sound:(NSString *)Sound Shock:(NSString *)Shock AllDayPush:(NSString *)AllDayPush StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Id forKey:@"Id"];
    [parameters setObject:LoginType forKey:@"LoginType"];
    [parameters setObject:Client forKey:@"Client"];
    [parameters setObject:IsPush forKey:@"IsPush"];
    [parameters setObject:Sound forKey:@"Sound"];
    [parameters setObject:Shock forKey:@"Shock"];
    [parameters setObject:AllDayPush forKey:@"AllDayPush"];
    [parameters setObject:StartTime forKey:@"StartTime"];
    [parameters setObject:EndTime forKey:@"EndTime"];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Push/SavePushSetting" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}
- (void)getRealTimeTrackingDataForADeviceWithDeviceId:(NSString *)DeviceId MapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:DeviceId forKey:@"DeviceId"];
    [parameters setObject:MapType forKey:@"MapType"];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Location/Tracking" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}

- (void)getHistoryLocationDataForADeviceInAtTimeRangeWithDeviceId:(NSString *)DeviceId StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime ShowLbs:(NSString *)ShowLbs MapType:(NSString *)MapType SelectCount:(NSString *)SelectCount Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:DeviceId forKey:@"DeviceId"];
    [parameters setObject:MapType forKey:@"MapType"];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    [parameters setObject:StartTime forKey:@"StartTime"];
    [parameters setObject:EndTime forKey:@"EndTime"];
    [parameters setObject:SelectCount forKey:@"SelectCount"];
    [parameters setObject:ShowLbs forKey:@"ShowLbs"];
    
    [self postRequestWithURL:@"api/Location/History" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}

- (void)getTimeZoneInformationWithToken:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/DataList/TimeZoneList" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}
- (void)languageListWithToken:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/DataList/LanguageList" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}


- (void)getVoiceWithFileId:(NSString *)FileId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    [parameters setObject:FileId forKey:@"FileId"];
    
    [self postRequestWithURL:@"api/Files/GetVoice" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}

- (void)zcChatListWithUserId:(NSString *)UserId Imei:(NSString *)Imei PageNo:(NSString *)PageNo PageCount:(NSString *)PageCount Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:UserId forKey:@"UserId"];
    [parameters setObject:Imei forKey:@"Imei"];
    [parameters setObject:PageNo forKey:@"PageNo"];
    [parameters setObject:PageCount forKey:@"PageCount"];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];

    [self postRequestWithURL:@"api/Files/ZcChatList" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}
- (void)voiceFileByTimeWithPageCount:(NSString *)pageCount pageNo:(NSString *)pageNo UserId:(NSString *)UserId Imei:(NSString *)Imei Start:(NSString *)Start End:(NSString *)End FileType:(NSString *)FileType GetTop:(NSString *)GetTop Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:pageCount forKey:@"pageCount"];
    [parameters setObject:pageNo forKey:@"pageNo"];
    [parameters setObject:UserId forKey:@"UserId"];
    [parameters setObject:Imei forKey:@"Imei"];
    [parameters setObject:Start forKey:@"Start"];
    [parameters setObject:End forKey:@"End"];
    [parameters setObject:FileType forKey:@"FileType"];
    [parameters setObject:GetTop forKey:@"GetTop"];
    [parameters setObject:Token forKey:@"Token"];
    
    [self postRequestWithURL:@"api/Files/VoiceFileListByTime" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}
- (void)voiceUploadWithSerialNumber:(NSString *)SerialNumber Long:(NSString *)Long VoiceTime:(NSString *)VoiceTime Command:(NSString *)Command IdentityID:(NSString *)IdentityID UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:SerialNumber forKey:@"SerialNumber"];
    [parameters setObject:Long forKey:@"Long"];
    [parameters setObject:VoiceTime forKey:@"VoiceTime"];
    [parameters setObject:Command forKey:@"Command"];
    [parameters setObject:IdentityID forKey:@"IdentityID"];
    [parameters setObject:UserId forKey:@"UserId"];
    [parameters setObject:Token forKey:@"Token"];
    [parameters setObject:Language forKey:@"Language"];
    [parameters setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Files/VoiceUpload" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];
}

- (void)findPasswordWithUsername:(NSString *)username Email:(NSString *)email Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:username forKey:@"Username"];
    [parameters setObject:email forKey:@"Email"];
    [parameters setObject:@"" forKey:@"Token"];
    [parameters setObject:language forKey:@"Language"];
    [parameters setObject:appid forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/User/FindPassword" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
         failBlock(task,error);
    }];
    
}

- (void)getGroupListWithUserId:(NSString *)userid MethodType:(NSString *)methodtype Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:userid forKey:@"UserId"];
    [parameters setObject:methodtype forKey:@"MethodType"];
    [parameters setObject:token forKey:@"Token"];
    [parameters setObject:language forKey:@"Language"];
    [parameters setObject:appid forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Group/UesrDefaultGroupList" parameters:parameters success:^(id responseObject) {
        successBlock(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        failBlock(task,error);
    }];

}

-(void)addDeviceWithUserID:(NSString *)userid DeviceId:(NSString *)deviceid Info:(NSString *)info RelationName:(NSString *)relationname RelationPhone:(NSString *)relationphone GroupId:(NSString *)groupid Icon:(NSString *)icon Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock

{
    NSMutableDictionary *addDic = [[NSMutableDictionary alloc] init];
    [addDic setObject:userid forKey:@"UserId"];
    [addDic setObject:deviceid forKey:@"DeviceId"];
    [addDic setObject:groupid forKey:@"GroupId"];
    [addDic setObject:info forKey:@"Info"];
    [addDic setObject:icon forKey:@"Icon"];
    [addDic setObject:relationname forKey:@"RelationName"];
    [addDic setObject:relationphone forKey:@"RelationPhone"];
    [addDic setObject:token forKey:@"Token"];
    [addDic setObject:@"zh" forKey:@"Language"];
    [addDic setObject:@"5" forKey:@"LoginType"];
    
    [self postRequestWithURL:@"api/Device/AddDeviceToUserGroup" parameters:addDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
    
}

-(void)cleackDeviceWithSeriaNumber:(NSString *)serianumber UserId:(NSString *)userid Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *cleackDic = [[NSMutableDictionary alloc] init];
    
    [cleackDic setObject:serianumber forKey:@"SerialNumber"];
    [cleackDic setObject:userid forKey:@"UserId"];
    [cleackDic setObject:token forKey:@"Token"];
    [cleackDic setObject:language forKey:@"Language"];
    [cleackDic setObject:appid forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Device/CheckDevice" parameters:cleackDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

-(void)uesrGroupListWithUserId:(NSString *)userid MethodType:(NSString *)methodtype Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock

{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:userid forKey:@"UserId"];
    [groupDic setObject:methodtype forKey:@"MethodType"];
    [groupDic setObject:token forKey:@"Token"];
    [groupDic setObject:language forKey:@"Language"];
    [groupDic setObject:appid forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/Group/UesrGroupList" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
    
}

-(void)validateCodeWithValidateCode:(NSString *)ValidateCode DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:ValidateCode forKey:@"ValidateCode"];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Device/ValidateCode" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}

-(void)sendCommandWithDeviceId:(NSString *)DeviceId DeviceModel:(NSString *)DeviceModel CmdCode:(NSString *)CmdCode Params:(NSString *)Params UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:DeviceModel forKey:@"DeviceModel"];
    [groupDic setObject:CmdCode forKey:@"CmdCode"];
    [groupDic setObject:Params forKey:@"Params"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/Command/SendCommand" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
    
}

-(void)saveUserGroupWithParentId:(NSString *)ParentId GroupName:(NSString *)GroupName Icon:(NSString *)Icon UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:ParentId forKey:@"ParentId"];
    [groupDic setObject:GroupName forKey:@"GroupName"];
    [groupDic setObject:Icon forKey:@"Icon"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Group/SaveUserGroup" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

#define IS_EQUAL_TO_NULL(string) (!string || [string isKindOfClass:[NSNull class]] || [string isEqualToString: @"<null>"] || [string isEqualToString: @"(null)"] || [[string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]  isEqualToString: @""])
-(void)editUserInformationWithUserId:(NSString *)UserId Username:(NSString *)Username Avatar:(NSString *)Avatar Sim:(NSString *)Sim cellPhone:(NSString*)CellPhone Gender:(BOOL)Gender Birthday:(NSString *)Birthday Weight:(NSString *)Weight Height:(NSString *)Height Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Username forKey:@"Username"];
    [groupDic setObject:@"" forKey:@"Email"];
    [groupDic setObject:@"sssssss" forKey:@"Address"];
    if(!IS_EQUAL_TO_NULL(Avatar)){
        
       [groupDic setObject:Avatar forKey:@"Avatar"];
    }
    [groupDic setObject:CellPhone forKey:@"CellPhone"];
    [groupDic setObject:Sim forKey:@"Sim"];
    [groupDic setObject:[NSNumber numberWithBool:Gender] forKey:@"Gender"];
    [groupDic setObject:@"56" forKey:@"Weight"];
    [groupDic setObject:@"60" forKey:@"Height"];
    [groupDic setObject:@"22" forKey:@"Steps"];
    [groupDic setObject:@"55" forKey:@"Distance"];
    [groupDic setObject:@"66" forKey:@"SportTime"];
    [groupDic setObject:@"77" forKey:@"Calorie"];
    [groupDic setObject:@"77" forKey:@"Calorie"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Birthday forKey:@"Birthday"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/User/EditUserInfo" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}

-(void)getLocationInformationWithDeviceId:(NSString *)DeviceId MapType:(NSString *)maptype Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:DeviceId forKey:@"DeviceId"];
    [locationDic setObject:maptype forKey:@"MapType"];
    [locationDic setObject:token forKey:@"Token"];
    [locationDic setObject:language forKey:@"Language"];
    [locationDic setObject:appid forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Location/Tracking" parameters:locationDic success:^(id responseObject) {
        
         successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}

-(void)UpdateFileForReadFileId:(NSString *)fileid Token:(NSString *)token Language:(NSString *)language AppId:(NSString *)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *postFileIdDic = [[NSMutableDictionary alloc] init];
    [postFileIdDic setObject:fileid forKey:@"FileId"];
    [postFileIdDic setObject:token forKey:@"Token"];
    [postFileIdDic setObject:language forKey:@"Language"];
    [postFileIdDic setObject:appid forKey:@"AppId"];

    [self postRequestWithURL:@"api/Files/UpdateFileForRead" parameters:postFileIdDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}



- (void)deviceRemoveShareModelWithUserId:(NSString *)UserId GroupId:(NSString *)GroupId DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:DeviceId forKey:@"DeviceId"];
    [locationDic setObject:GroupId forKey:@"GroupId"];
    [locationDic setObject:DeviceId forKey:@"DeviceId"];
    [locationDic setObject:Token forKey:@"Token"];
    [locationDic setObject:Language forKey:@"Language"];
    [locationDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Device/RemoveDeviceShare" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

- (void)removeDeviceModelWithSN:(NSString *)SN Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock

{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:SN forKey:@"SN"];
    [locationDic setObject:Token forKey:@"Token"];
    [locationDic setObject:AppId forKey:@"AppId"];

    
    [self postRequestWithURL:@"api/Device/RemoveDevice" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

- (void)sendSMSCodeWithPhone:(NSString *)Phone VildateSence:(NSString *)VildateSence Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:Phone forKey:@"Phone"];
    [locationDic setObject:VildateSence forKey:@"VildateSence"];
    [locationDic setObject:Token forKey:@"Token"];
    [locationDic setObject:Language forKey:@"Language"];
    [locationDic setObject:@"81" forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/User/SendSMSCode" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
    
}

- (void)registerNeedSMSCodeWithUsername:(NSString *)Username LoginName:(NSString *)LoginName Email:(NSString *)Email Password:(NSString *)Password SerialNumber:(NSString *)SerialNumber Contact:(NSString *)Contact ContactPhone:(NSString *)ContactPhone ThirdName:(NSString *)ThirdName ThirdID:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdImg:(NSString *)ThirdImg SMSCode:(NSString *)SMSCode Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:Username forKey:@"Username"];
    [locationDic setObject:LoginName forKey:@"LoginName"];
    [locationDic setObject:Email forKey:@"Email"];
    [locationDic setObject:Password forKey:@"Password"];
    [locationDic setObject:SerialNumber forKey:@"SerialNumber"];
    [locationDic setObject:Contact forKey:@"Contact"];
    [locationDic setObject:ContactPhone forKey:@"ContactPhone"];
    [locationDic setObject:ThirdName forKey:@"ThirdName"];
    [locationDic setObject:ThirdID forKey:@"ThirdID"];
    [locationDic setObject:ThirdType forKey:@"ThirdType"];
    [locationDic setObject:ThirdImg forKey:@"ThirdImg"];
    [locationDic setObject:SMSCode forKey:@"SMSCode"];
    [locationDic setObject:Language forKey:@"Language"];
    [locationDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/User/RegisterNeedSMSCode" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
    
}

-(void)checkVaildateCodeByUserType:(NSString *)type LoginName:(NSString *)LoginName SMSCode:(NSString *)SMSCode Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:type forKey:@"Username"];
    [locationDic setObject:LoginName forKey:@"LoginName"];
    [locationDic setObject:SMSCode forKey:@"SMSCode"];
       [locationDic setObject:Language forKey:@"Language"];
    [locationDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/user/CheckVaildateCodeByUser" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}
-(void)removeDeviceUserId:(NSString *)userId DeviceId:(NSString *)deviceId UserGroupId:(NSString *)userGroupId Token:(NSString *)token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:userId forKey:@"UserId"];
    [locationDic setObject:deviceId forKey:@"DeviceId"];
    [locationDic setObject:userGroupId forKey:@"UserGroupId"];
    [locationDic setObject:token forKey:@"Token"];
    [locationDic setObject:Language forKey:@"Language"];
    [locationDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/AuthShare/RemoveShare" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

-(void)personDeviceListUserId:(NSString *)usreId GroupId:(NSString *)groupId MapType:(NSString *)mapType LastTime:(NSString *)lastTime TimeOffset:(NSString *)timeOffset Token:(NSString *)token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary * locationDic = [[NSMutableDictionary alloc] init];
    
    [locationDic setObject:usreId forKey:@"UserId"];
    [locationDic setObject:groupId forKey:@"GroupId"];
    [locationDic setObject:mapType forKey:@"MapType"];
    [locationDic setObject:lastTime forKey:@"LastTime"];
    [locationDic setObject:timeOffset forKey:@"TimeOffset"];
    [locationDic setObject:token forKey:@"Token"];
    [locationDic setObject:Language forKey:@"Language"];
    [locationDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/Device/PersonDeviceList" parameters:locationDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}

-(void)sendShutdownInstructDeviceId:(NSString *)DeviceId DeviceModel:(NSString *)DeviceModel CmdCode:(NSString *)CmdCode Params:(NSString *)Params UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:DeviceModel forKey:@"DeviceModel"];
    [groupDic setObject:CmdCode forKey:@"CmdCode"];
    [groupDic setObject:Params forKey:@"Params"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/Command/SendCommand" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}
-(void)sendRestartInstructDeviceId:(NSString *)DeviceId DeviceModel:(NSString *)DeviceModel CmdCode:(NSString *)CmdCode Params:(NSString *)Params UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:DeviceModel forKey:@"DeviceModel"];
    [groupDic setObject:CmdCode forKey:@"CmdCode"];
    [groupDic setObject:Params forKey:@"Params"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/Command/SendCommand" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}
-(void)sendTelephoneInstructDeviceId:(NSString *)DeviceId DeviceModel:(NSString *)DeviceModel CmdCode:(NSString *)CmdCode Params:(NSString *)Params UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:DeviceModel forKey:@"DeviceModel"];
    [groupDic setObject:CmdCode forKey:@"CmdCode"];
    [groupDic setObject:Params forKey:@"Params"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    
    [self postRequestWithURL:@"api/Command/SendCommand" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}

- (void)getDeviceCommandListCommandCode:(NSString*)command DeviceId:(NSString *)deviceId Token:(NSString *)token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:command forKey:@"CommandCode"];
    [groupDic setObject:deviceId forKey:@"DeviceId"];
    [groupDic setObject:token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Command/CommandValue" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

- (void)createANewGeofenceForADeviceWithMapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId FenceId:(NSString *)FenceId Latitude:(double)Latitude Longitude:(double)Longitude Radius:(float)Radius FenceType:(NSString *)FenceType AlarmType:(NSString *)AlarmType Address:(NSString *)Address IsDeviceFence:(NSString *)IsDeviceFence AlarmModel:(NSString *)AlarmModel DeviceFenceNo:(NSString *)DeviceFenceNo Description:(NSString *)Description IMEIList:(NSString *)IMEIList Points:(NSString *)Points InUse:(NSString *)InUse StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime DeviceId:(NSString *)DeviceId FenceName:(NSString *)FenceName success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:FenceId forKey:@"FenceId"];
    [dic setObject:DeviceId forKey:@"DeviceId"];
    [dic setObject:FenceName forKey:@"FenceName"];
    [dic setObject:[NSNumber numberWithDouble:Latitude] forKey:@"Latitude"];
    [dic setObject:[NSNumber numberWithDouble:Longitude] forKey:@"Longitude"];
    [dic setObject:[NSNumber numberWithFloat:Radius] forKey:@"Radius"];
    [dic setObject:FenceType forKey:@"FenceType"];
    [dic setObject:AlarmType forKey:@"AlarmType"];
    [dic setObject:IsDeviceFence forKey:@"IsDeviceFence"];
    [dic setObject:AlarmModel forKey:@"AlarmModel"];
    [dic setObject:DeviceFenceNo forKey:@"DeviceFenceNo"];
    [dic setObject:Description forKey:@"Description"];
    [dic setObject:IMEIList forKey:@"IMEIList"];
    [dic setObject:Points forKey:@"Points"];
    [dic setObject:Address forKey:@"Address"];
    [dic setObject:Address forKey:@"InUse"];
    [dic setObject:StartTime forKey:@"StartTime"];
    [dic setObject:EndTime forKey:@"EndTime"];
    
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:dic forKey:@"Item"];
    [groupDic setObject:MapType forKey:@"MapType"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Geofence/CreateGeofence" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

- (void)editAnExistsGeofenceWithItem:(NSDictionary *)Item MapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:Item forKey:@"Item"];
    [groupDic setObject:MapType forKey:@"MapType"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Geofence/EditGeofence" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

- (void)deleteAGeofenceWithFenceId:(NSString *)FenceId DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:FenceId forKey:@"FenceId"];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Geofence/DeleteGeofence" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

- (void)getGeofenceListOfASpecificDeviceWithDeviceId:(NSString *)DeviceId MapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:MapType forKey:@"MapType"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Geofence/GeofenceList" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}

- (void)fenceStatuaChangeModelWithFenceID:(NSString *)FenceId InUse:(NSString *)InUse DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:FenceId forKey:@"FenceId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [groupDic setObject:InUse forKey:@"InUse"];
    
    [self postRequestWithURL:@"api/Geofence/GeofenceList" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}
- (void)deleteFileBylds:(NSString *)fileIds Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:fileIds forKey:@"FileIds"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Files/DeleteFileByIds" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}
- (void)editDeviceWithDeviceId:(NSString *)DeviceId DeviceNname:(NSString *)DeviceName PhoneNum:(NSString *)PhoneNum Contace:(NSString *)Contact ContactPhone:(NSString *)ContactPhone Avatar:(NSString *)Avatar Icon:(NSString *)Icon CarNum:(NSString *)CarNum Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:DeviceName forKey:@"DeviceName"];
    [groupDic setObject:PhoneNum forKey:@"PhoneNum"];
    [groupDic setObject:Contact forKey:@"Contact"];
    [groupDic setObject:ContactPhone forKey:@"ContactPhone"];
    [groupDic setObject:Avatar forKey:@"Avatar"];
    [groupDic setObject:[NSNumber numberWithInt:2] forKey:@"SpeedLimit"]; //字段暂时随便
    [groupDic setObject:Icon forKey:@"Icon"];
    [groupDic setObject:CarNum forKey:@"CarNum"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Device/EditDevice" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}
- (void)getPersonProfileWithDeviceId:(NSString *)DeviceId UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Person/GetPersonProfile" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];
}
- (void)savePersonProfileWithItem:(NSDictionary *)Item Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:Item forKey:@"Item"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/Person/SavePersonProfile" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}
- (void)getGuardianListWithDeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/AuthShare/ShareList" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}
- (void)applicationRequestListWithUserid:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/AuthShare/RequestList" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
        
    }];

}
- (void)ProcessWithRequestId:(NSString *)RequestId TypeId:(NSString *)TypeId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:RequestId forKey:@"RequestId"];
    [groupDic setObject:TypeId forKey:@"TypeId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/AuthShare/Process" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}
- (void)changePasswrodWithLoginName:(NSString *)LoginName NewPass:(NSString *)NewPass SMSCode:(NSString *)SMSCode Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:LoginName forKey:@"LoginName"];
    [groupDic setObject:NewPass forKey:@"NewPass"];
    [groupDic setObject:SMSCode forKey:@"SMSCode"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/User/ChangePasswordNeedSMSCode" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}
-(void)getUserInformationWithUserId:(NSString *)UserId ThirdID:(NSString *)ThirdID ThirdType:(NSString *)ThirdType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:ThirdID forKey:@"ThirdID"];
    [groupDic setObject:ThirdType forKey:@"ThirdType"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/User/UserInfo" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}

- (void)UpdateRelationNameWithRelationName:(NSString *)RelationName UserId:(NSString *)UserId DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:RelationName forKey:@"RelationName"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/AuthShare/UpdateRelationName" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}
- (void)getExcdeptionListWhitId:(NSString *)Id PageNo:(NSString *)PageNo PageCount:(NSString *)PageCount TypeID:(NSString *)TypeID DataCode:(NSString *)DataCode UserID:(NSString *)UserID Exclude:(NSString *)Exclude MapType:(NSString*)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:Id forKey:@"Id"];
    [groupDic setObject:PageNo forKey:@"PageNo"];
    [groupDic setObject:PageCount forKey:@"PageCount"];
    [groupDic setObject:TypeID forKey:@"TypeID"];
    [groupDic setObject:DataCode forKey:@"DataCode"];
    [groupDic setObject:UserID forKey:@"UserID"];
    [groupDic setObject:MapType forKey:@"MapType"];
    [groupDic setObject:Exclude forKey:@"Exclude"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];

    
    [self postRequestWithURL:@"api/ExceptionMessage/ExcdeptionListWhitoutCode" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}


- (void)thirdPartyValidateThird:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdName:(NSString *)ThirdName ThirdImg:(NSString *)ThirdImg UserID:(NSString *)UserID LoginName:(NSString *)LoginName Password:(NSString *)Password Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:ThirdID forKey:@"ThirdID"];
    [groupDic setObject:ThirdType forKey:@"ThirdType"];
    [groupDic setObject:ThirdName forKey:@"ThirdName"];
    [groupDic setObject:ThirdImg forKey:@"ThirdImg"];
    [groupDic setObject:UserID forKey:@"UserID"];
    [groupDic setObject:LoginName forKey:@"LoginName"];
    [groupDic setObject:Password forKey:@"Password"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/ThirdParty/ValidateThird" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}

- (void)thirdPartyBindThirdParty:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdName:(NSString *)ThirdName ThirdImg:(NSString *)ThirdImg UserID:(NSString *)UserID LoginName:(NSString *)LoginName Password:(NSString *)Password Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:ThirdID forKey:@"ThirdID"];
    [groupDic setObject:ThirdType forKey:@"ThirdType"];
    [groupDic setObject:ThirdName forKey:@"ThirdName"];
    [groupDic setObject:ThirdImg forKey:@"ThirdImg"];
    [groupDic setObject:UserID forKey:@"UserID"];
    [groupDic setObject:LoginName forKey:@"LoginName"];
    [groupDic setObject:Password forKey:@"Password"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/ThirdParty/BindThirdParty" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

- (void)delExceptionMessageWithExceptionId:(NSString *)ExceptionId UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:ExceptionId forKey:@"ExceptionId"];
    [groupDic setObject:UserId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/ExceptionMessage/PLDeleteException" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}
- (void)checkUserNameExistsOrNotWithLoginName:(NSString *)LoginName Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:LoginName forKey:@"LoginName"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/User/CheckUser" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}

-(void)getContactsListByWithDeviceId:(NSString *)DeviceId ContactType:(NSString *)ContactType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
    [groupDic setObject:ContactType forKey:@"ContactType"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/Contact/GetContactsListByLeYuan" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
    

}
- (void)updateUserGroupRelationNamePhoneDeviceId:(NSString *)DeviceId UserId:(NSString *)UserId RelationName:(NSString *)RelationName RelationPhone:(NSString *)RelationPhone Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:DeviceId forKey:@"DeviceId"];
     [groupDic setObject:UserId forKey:@"UserId"];
     [groupDic setObject:RelationName forKey:@"RelationName"];
     [groupDic setObject:RelationPhone forKey:@"RelationPhone"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/User/UpdateUserGroupRelationNamePhone" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

- (void)RequestInformation:(NSString *)Language Lat:(NSString *)Lat Lng:(NSString *)Lng Token:(NSString *)Token AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:Lat forKey:@"Lat"];
    [groupDic setObject:Lng forKey:@"Lng"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:AppId forKey:@"AppId"];
    [self postRequestWithURL:@"api/Weather/GetWeather" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

- (void)checkVersionWithVersionNo:(NSString *)VersionNo AppSystem:(NSString *)AppSystem Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:VersionNo forKey:@"VersionNo"];
    [groupDic setObject:AppSystem forKey:@"AppSystem"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];

    [self postRequestWithURL:@"api/APPInfo/CheckVersion" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];
}

- (void)deleteExceptionMessage:(NSString *)exceptionId UserId:(NSString *)userId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock
{
    NSMutableDictionary *groupDic = [[NSMutableDictionary alloc] init];
    [groupDic setObject:exceptionId forKey:@"ExceptionId"];
    [groupDic setObject:userId forKey:@"UserId"];
    [groupDic setObject:Token forKey:@"Token"];
    [groupDic setObject:Language forKey:@"Language"];
    [groupDic setObject:AppId forKey:@"AppId"];
    
    [self postRequestWithURL:@"api/APPInfo/CheckVersion" parameters:groupDic success:^(id responseObject) {
        
        successBlock(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        failBlock(task,error);
    }];

}
@end
