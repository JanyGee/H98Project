//
//  RequestManager.h
//  TestShangRuiInterface
//
//  Created by Jany on 17/2/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^RequestSuccessBlock)(id responseObject);
typedef void(^RequestFailBlck)(NSURLSessionDataTask *task, NSError *error);

@interface RequestManager : AFHTTPSessionManager

/**
 实例化

 @return self
 */
+ (instancetype)shareManager;

/**
 注册
 
 @param Username     用户名
 @param LoginName    登录名
 @param Email        邮箱
 @param Password     密码
 @param SerialNumber IMEI
 @param Contact      联系人
 @param ContactPhone 联系人电话
 @param ThirdName    第三方用户名
 @param ThirdID      第三方用户ID
 @param ThirdType    第三方登录方式
 @param ThirdImg     第三方头像
 @param SMSCode      短信验证码
 @param Language     语言
 @param AppId        AppId
 @param successBlock 成功
 @param failBlock    失败
 */
- (void)registerANewUserWithUserName:(NSString *)Username LoginName:(NSString *)LoginName Email:(NSString *)Email Password:(NSString *)Password SerialNumber:(NSString *)SerialNumber Contact:(NSString *)Contact ContactPhone:(NSString *)ContactPhone ThirdName:(NSString *)ThirdName ThirdID:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdImg:(NSString *)ThirdImg SMSCode:(NSString *)SMSCode Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;



/**
 登录

 @param Name         用户名 [或IMEI]
 @param Pass         密码
 @param AppId        APP应用标识
 @param Language     用户语方言
 @param LoginType    LoginType
 @param successBlock successBlock
 @param failBlock    failBlock description
 */
- (void)loginByUserNameAndPasswordWithName:(NSString *)Name Pass:(NSString *)Pass AppId:(NSString *)AppId Language:(NSString *)Language LoginType:(NSString *)LoginType success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 获取推送设置

 @param Id           Id
 @param LoginType    登录类型
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)requestInformationWithId:(NSString *)Id LoginType:(NSString *)LoginType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 保存用户推送设置

 @param Id           用户或设备 id
 @param LoginType    登录类型
 @param Client       客户端
 @param IsPush       是否推送
 @param Sound        推送声音
 @param Shock        震动
 @param AllDayPush   是否开户免打扰
 @param StartTime    开始时间
 @param EndTime      结束时间
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)savePushSetingWithId:(NSString *)Id LoginType:(NSString *)LoginType Client:(NSString *)Client IsPush:(NSString *)IsPush Sound:(NSString *)Sound Shock:(NSString *)Shock AllDayPush:(NSString *)AllDayPush StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 Get real time tracking data for a device

 @param DeviceId     id
 @param MapType      地图类型
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)getRealTimeTrackingDataForADeviceWithDeviceId:(NSString *)DeviceId MapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 Get history location data for a device in a time range

 @param DeviceId     设备id
 @param StartTime    开始时间
 @param EndTime      结束时间
 @param ShowLbs      1:显示lbs 2:显示wifi
 @param MapType      地图类型
 @param SelectCount  返回数量
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)getHistoryLocationDataForADeviceInAtTimeRangeWithDeviceId:(NSString *)DeviceId StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime ShowLbs:(NSString *)ShowLbs MapType:(NSString *)MapType SelectCount:(NSString *)SelectCount Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 时区列表获取接口

 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)getTimeZoneInformationWithToken:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 语言列表

 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)languageListWithToken:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 获取单个语音信息

 @param FileId       文件 id
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)getVoiceWithFileId:(NSString *)FileId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 聊天信息列表获取，分页形式 [专用接口]

 @param UserId       用户id
 @param Imei         设备 imei
 @param PageNo       查询的页数
 @param PageCount    每页条数
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)zcChatListWithUserId:(NSString *)UserId Imei:(NSString *)Imei PageNo:(NSString *)PageNo PageCount:(NSString *)PageCount Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 通过用户获取语音聊天记录

 @param pageCount    每页数量
 @param pageNo       当前页面
 @param UserId       用户 id
 @param Imei         设备imei
 @param Start        开始时间 UTC
 @param End          结束时间 UTC
 @param FileType     文件类型
 @param GetTop       时间段无数据时。取前100条数据
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)voiceFileByTimeWithPageCount:(NSString *)pageCount pageNo:(NSString *)pageNo UserId:(NSString *)UserId Imei:(NSString *)Imei Start:(NSString *)Start End:(NSString *)End FileType:(NSString *)FileType GetTop:(NSString *)GetTop Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


///**
// 语音聊天提交服务器
//
// @param SerialNumber 设备 imei
// @param Long         语音时长
// @param VoiceTime    录制时间
// @param Command      语音文件内容 将amr文件内容转为 base64字符串
// @param IdentityID   终端唯一 id
// @param UserId       用户 id
// @param Token        登录后获取到的 Token
// @param Language     语言选项
// @param AppId        APP应用标识
// @param successBlock successBlock description
// @param failBlock    failBlock description
// */
- (void)voiceUploadWithSerialNumber:(NSString *)SerialNumber Long:(NSString *)Long VoiceTime:(NSString *)VoiceTime Command:(NSString *)Command IdentityID:(NSString *)IdentityID UserId:(NSString *)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 找回密码

 @param username 用户名
 @param email 注册邮箱
 @param token 登录返回token
 @param language 语言选项
 @param appid APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)findPasswordWithUsername:(NSString*)username Email:(NSString*)email Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**<绑定流程：1.获取DeviceID  2,设置用户分组，获取GroupId 3,绑定设备     >**********************************************************************************/

/**
 获取用户的分组和角色

 @param userid 用户ID
 @param methodtype 方法类型 [暂未使用]
 @param token 登录后获取到的 Token
 @param language 语言选项
 @param appid APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)getGroupListWithUserId:(NSString*)userid MethodType:(NSString*)methodtype Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 添加分组角色

 @param ParentId   上级分组 id
 @param GroupName  角色分组名
 @param Icon       角色分组图标
 @param UserId     用户 id
 @param Token      登录后获取到的 Token
 @param Language   语言选项
 @param AppId      APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)saveUserGroupWithParentId:(NSString*)ParentId GroupName:(NSString*)GroupName Icon:(NSString*)Icon UserId:(NSString*)UserId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 查看设备是否绑定  获取DeviceId

 @param serianumber  设备Imei
 @param userid       用户id
 @param token        登录后获取到的 Token
 @param language     语言选项
 @param appid        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
-(void)cleackDeviceWithSeriaNumber:(NSString*)serianumber UserId:(NSString*)userid Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 绑定设备

 @param userid       用户id
 @param deviceid     角色 id
 @param info         设备 id
 @param relationname 附加信息
 @param relationphone 关系名称
 @param groupid      电话号码
 @param icon         1男2女
 @param token        登录后获取到的 Token
 @param language     语言选项
 @param appid        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
-(void)addDeviceWithUserID:(NSString*)userid DeviceId:(NSString*)deviceid Info:(NSString*)info RelationName:(NSString*)relationname RelationPhone:(NSString*)relationphone GroupId:(NSString*)groupid Icon:(NSString*)icon  Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;



/**
 上传验证到服务器验证是否正确

 @param ValidateCode  验证码
 @param DeviceId      设备ID
 @param Token         登录后获取到的 Token
 @param Language      语言选项
 @param AppId         APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)validateCodeWithValidateCode:(NSString*)ValidateCode DeviceId:(NSString*)DeviceId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 向设备发送指令，触发验证码发送

 @param DeviceId      设备 id
 @param DeviceModel   设备型号
 @param CmdCode       指令编码
 @param Params        指令参数
 @param UserId        用户id
 @param Token         登录后获取到的 Token
 @param Language      语言选项
 @param AppId         APP应用标识
 @param successBlock  successBlock description
 @param failBlock     failBlock description
 */
- (void)sendCommandWithDeviceId:(NSString*)DeviceId DeviceModel:(NSString*)DeviceModel CmdCode:(NSString*)CmdCode Params:(NSString*)Params  UserId:(NSString*)UserId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 设置手表主人信息

 @param UserId    用户Id
 @param Username  用户名
 @param Avatar    头像，上传时，此字段值为 图片的Base64字符串
 @param Sim       SIM卡号码
 @param Gender    性别 true男 false 女
 @param Birthday  生日
 @param Weight    体重
 @param Height    身高
 @param Token     登录后获取到的 Token
 @param Language  语言选项
 @param AppId     APP应用标识

 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)editUserInformationWithUserId:(NSString*)UserId Username:(NSString*)Username Avatar:(NSString*)Avatar Sim:(NSString*)Sim cellPhone:(NSString*)CellPhone Gender:(BOOL)Gender Birthday:(NSString*)Birthday Weight:(NSString*)Weight Height:(NSString*)Height Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 设备定位数据

 @param DeviceId id
 @param maptype  地图类型(Google baidu)
 @param token    登录后获取到的 Token
 @param language 语言选项
 @param appid    APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)getLocationInformationWithDeviceId:(NSString *)DeviceId
                                   MapType:(NSString *)maptype
                                     Token:(NSString *)token
                                  Language:(NSString *)language
                                     AppId:(NSString *)appid
                                   success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 上传语音数据

 @param serialnumber  设备 imei
 @param vlong         语音时长
 @param voicetime     录制时间
 @param command       语音文件内容 将amr文件内容转为 base64字符
 @param identityid    终端唯一 id
 @param userid        用户 id
 @param token         登录后获取到的 Token
 @param language      语言
 @param appid         app应用标示
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
//-(void)uploadVoiceWithSerialNumber:(NSString*)serialnumber Vlong:(NSString*)vlong VoiceTime:(NSString*)voicetime Command:(NSString*)command IdentityID:(NSString*)identityid UserId:(NSString*)userid Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;
//
////通过用户获取语音聊天记录
//-(void)voiceFileListWithpageCount:(NSString*)pagecount pageNo:(NSString*)pageno UserId:(NSString*)userid Imei:(NSString*)imei Start:(NSString*)start End:(NSString*)end FileType:(NSString*)filetype GetTop:(NSString*)gettop Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;
//
-(void)UpdateFileForReadFileId:(NSString*)fileid Token:(NSString*)token Language:(NSString*)language AppId:(NSString*)appid success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;




/**
 移除用户对设备的共享查看[手表]

 @param UserId       用户Id
 @param GroupId      分组Id
 @param DeviceId     设备Id
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)deviceRemoveShareModelWithUserId:(NSString *)UserId GroupId:(NSString *)GroupId DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 通过设备Imei从账号中删除设备 [车机]

 @param SN           设备IMEI
 @param Token        登录后获取到的 Token
 @param Language     语言选项
 @param AppId        APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)removeDeviceModelWithSN:(NSString *)SN Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 以短信方式发送注册验证码

 @param Phone 手机号
 @param VildateSence 验证情况 1：用户注册 2：修改密码
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)sendSMSCodeWithPhone:(NSString *)Phone VildateSence:(NSString *)VildateSence Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 注册用户通过短信验证

 @param Username 用户名
 @param LoginName 登录名
 @param Email 邮箱
 @param Password 密码
 @param SerialNumber IMEI
 @param Contact 联系人
 @param ContactPhone 联系人电话
 @param ThirdName 第三方用户名
 @param ThirdID 第三方用户ID
 @param ThirdType 第三方登录方式
 @param ThirdImg 第三方头像
 @param SMSCode 短信验证码
 @param Language 语言
 @param AppId AppId
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)registerNeedSMSCodeWithUsername:(NSString *)Username LoginName:(NSString *)LoginName Email:(NSString *)Email Password:(NSString *)Password SerialNumber:(NSString *)SerialNumber Contact:(NSString *)Contact ContactPhone:(NSString *)ContactPhone ThirdName:(NSString *)ThirdName ThirdID:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdImg:(NSString *)ThirdImg SMSCode:(NSString *)SMSCode Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 上传服务器判断验证码是否正确

 @param type 类型
 @param LoginName 登录名
 @param SMSCode 验证码
 @param Language 语言
 @param AppId AppId
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
-(void)checkVaildateCodeByUserType:(NSString*)type LoginName:(NSString*)LoginName SMSCode:(NSString*)SMSCode Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 获取个人设备列表

 @param usreId   用户Id
 @param groupId  分组Id
 @param mapType  地址类型
 @param lastTime 上次获取时间
 @param timeOffset 和Utc0 之间的时间差
 @param token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
-(void)personDeviceListUserId:(NSString*)usreId GroupId:(NSString*)groupId MapType:(NSString*)mapType LastTime:(NSString*)lastTime TimeOffset:(NSString*)timeOffset Token:(NSString*)token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 设备解绑

 @param userId 用户Id
 @param deviceId 设备ID
 @param userGroupId 分组Id
 @param token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
-(void)removeDeviceUserId:(NSString*)userId DeviceId:(NSString*)deviceId UserGroupId:(NSString*)userGroupId Token:(NSString*)token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 发送关机指令

 @param DeviceId 设备ID
 @param DeviceModel 设备model
 @param CmdCode CmdCode == 0010指令编码
 @param Params 指令参数
 @param UserId 用户id
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId  APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
-(void)sendShutdownInstructDeviceId:(NSString*)DeviceId DeviceModel:(NSString*)DeviceModel CmdCode:(NSString*)CmdCode Params:(NSString*)Params  UserId:(NSString*)UserId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;
/**
 发送重启指令
 
 @param DeviceId 设备ID
 @param DeviceModel 设备model
 @param CmdCode CmdCode == 0048指令编码
 @param Params 指令参数
 @param UserId 用户id
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId  APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
-(void)sendRestartInstructDeviceId:(NSString*)DeviceId DeviceModel:(NSString*)DeviceModel CmdCode:(NSString*)CmdCode Params:(NSString*)Params  UserId:(NSString*)UserId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;
/**
 发送拨打电话指令
 
 @param DeviceId 设备ID
 @param DeviceModel 设备model
 @param CmdCode CmdCode == 0084指令编码
 @param Params  Params == 1599959XXXX 指令参数
 @param UserId 用户id
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId  APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
-(void)sendTelephoneInstructDeviceId:(NSString*)DeviceId DeviceModel:(NSString*)DeviceModel CmdCode:(NSString*)CmdCode Params:(NSString*)Params  UserId:(NSString*)UserId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 获取设备列表（如 闹钟）

 @param commandCode 闹钟指令
 @param deviceId 设备ID
 @param token 登录后Token
 @param Language 语言选项
 @param AppId APP应用标示
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)getDeviceCommandListCommandCode:(NSString*)commandCode DeviceId:(NSString*)deviceId Token:(NSString*)token Language:(NSString*)Language AppId:(NSString*)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 Create a new Geofence for a device

 */
- (void)createANewGeofenceForADeviceWithMapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId FenceId:(NSString *)FenceId Latitude:(double)Latitude Longitude:(double)Longitude Radius:(float)Radius FenceType:(NSString *)FenceType AlarmType:(NSString *)AlarmType Address:(NSString *)Address IsDeviceFence:(NSString *)IsDeviceFence AlarmModel:(NSString *)AlarmModel DeviceFenceNo:(NSString *)DeviceFenceNo Description:(NSString *)Description IMEIList:(NSString *)IMEIList Points:(NSString *)Points InUse:(NSString *)InUse StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime DeviceId:(NSString *)DeviceId FenceName:(NSString *)FenceName success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 Edit an exists geofence

 @param Item 围栏信息
 @param MapType 地图类型
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)editAnExistsGeofenceWithItem:(NSDictionary *)Item MapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 Delete a geofence

 @param FenceId 围栏 id
 @param DeviceId 设备 id
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)deleteAGeofenceWithFenceId:(NSString *)FenceId DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 Get geofence list of a specific device

 @param DeviceId 设备 id
 @param MapType 地图类型
 @param Token 地图类型
 @param Language 登录后获取到的 Token
 @param AppId 语言选项
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)getGeofenceListOfASpecificDeviceWithDeviceId:(NSString *)DeviceId MapType:(NSString *)MapType Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 修改围栏使用状态

 @param FenceId 围栏 id
 @param InUse 使用状态 true 为使用 ,false 为关闭
 @param DeviceId 设备 id
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)fenceStatuaChangeModelWithFenceID:(NSString *)FenceId InUse:(NSString *)InUse DeviceId:(NSString *)DeviceId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 删除微聊数据

 @param fileIds 要删除的文件 id 集合,用 逗号 分隔
 @param Token   登录后获取到的 Token
 @param Language 语言选项
 @param AppId    APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)deleteFileBylds:(NSString*)fileIds Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 修改设备用户信息

 @param DeviceId 设备ID
 @param DeviceName 设备显示名称
 @param PhoneNum 设备电话号码
 @param Contact 联系人
 @param ContactPhone 联系人电话
 @param Avatar 头像URL
 @param Icon 头像Icon
 @param CarNum 暂时不需要
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)editDeviceWithDeviceId:(NSString*)DeviceId DeviceNname:(NSString*)DeviceName PhoneNum:(NSString*)PhoneNum Contace:(NSString*)Contact ContactPhone:(NSString*)ContactPhone Avatar:(NSString*)Avatar Icon:(NSString*)Icon CarNum:(NSString*)CarNum Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 获取设备相关对象(人员)信息 [手表]

 @param DeviceId 设备ID
 @param UserId 用户ID
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)getPersonProfileWithDeviceId:(NSString*)DeviceId UserId:(NSString*)UserId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 设备信息

 @param Item 人员信息
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)savePersonProfileWithItem:(NSDictionary*)Item Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 监护人列表

 @param DeviceId 设备 Id
 @param Token    登录后获取到的 Token
 @param Language 语言选项
 @param AppId    APP应用标识
 @param successBlock successBlock description
 @param failBlock    failBlock description
 */
- (void)getGuardianListWithDeviceId:(NSString*)DeviceId Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 同意指令

 @param RequestId 分享ID
 @param TypeId 处理类型1.同意 2.拒绝 3.删除
 @param Token  登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)ProcessWithRequestId:(NSString*)RequestId TypeId:(NSString*)TypeId Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 发送监护申请

 @param UserId 用户ID
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)applicationRequestListWithUserid:(NSString*)UserId Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 修改密码通过短信验证码

 @param LoginName 登录名
 @param NewPass 新密码
 @param SMSCode 短信验证码
 @param Token   登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)changePasswrodWithLoginName:(NSString*)LoginName NewPass:(NSString*)NewPass SMSCode:(NSString*)SMSCode Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 获取用户信息

 @param UserId 用户id
 @param ThirdID 第三方登录id
 @param ThirdType ThirdType description
 @param Token Token description
 @param Language Language description
 @param AppId AppId description
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)getUserInformationWithUserId:(NSString*)UserId ThirdID:(NSString*)ThirdID ThirdType:(NSString*)ThirdType Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 修改设备关系

 @param RelationName 关系名
 @param UserId 用户ID
 @param DeviceId 设备ID
 @param Token Token description
 @param Language <#Language description#>
 @param AppId <#AppId description#>
 @param successBlock <#successBlock description#>
 @param failBlock <#failBlock description#>
 */
- (void)UpdateRelationNameWithRelationName:(NSString*)RelationName UserId:(NSString*)UserId DeviceId:(NSString*)DeviceId Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 获取用户报警消息

 @param Id Id , UserId 或 DeviceId
 @param PageNo 查询的页数
 @param PageCount 每页条数
 @param TypeID TypeId 为 0 表示 Id 为用户Id, 为 1 表示Id 为设备Id
 @param DataCode 报警大类型编码[目前未使用]
 @param UserID 用户ID取昵称
 @param Exclude 排除的报警类型 Id，以逗号分隔
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock <#successBlock description#>
 @param failBlock <#failBlock description#>
 */
- (void)getExcdeptionListWhitId:(NSString*)Id PageNo:(NSString*)PageNo PageCount:(NSString*)PageCount TypeID:(NSString*)TypeID DataCode:(NSString*)DataCode UserID:(NSString*)UserID Exclude:(NSString*)Exclude MapType:(NSString*)MapType Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;




/**
 第三方登录

 @param ThirdID ThirdID description
 @param ThirdType ThirdType description
 @param ThirdName ThirdName description
 @param ThirdImg ThirdImg description
 @param UserID UserID description
 @param LoginName LoginName description
 @param Password Password description
 @param Language Language description
 @param AppId AppId description
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)thirdPartyValidateThird:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdName:(NSString *)ThirdName ThirdImg:(NSString *)ThirdImg UserID:(NSString *)UserID LoginName:(NSString *)LoginName Password:(NSString *)Password Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 绑定第三方登录

 @param ThirdID ThirdID description
 @param ThirdType ThirdType description
 @param ThirdName ThirdName description
 @param ThirdImg ThirdImg description
 @param UserID UserID description
 @param LoginName LoginName description
 @param Password Password description
 @param Language Language description
 @param AppId AppId description
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)thirdPartyBindThirdParty:(NSString *)ThirdID ThirdType:(NSString *)ThirdType ThirdName:(NSString *)ThirdName ThirdImg:(NSString *)ThirdImg UserID:(NSString *)UserID LoginName:(NSString *)LoginName Password:(NSString *)Password Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 删除报警消息

 @param ExceptionId 报警id
 @param UserId 用户id
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock <#successBlock description#>
 @param failBlock <#failBlock description#>
 */
- (void)delExceptionMessageWithExceptionId:(NSString*)ExceptionId UserId:(NSString*)UserId Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 检查账号是否被注册

 @param LoginName 账号
 @param Token 可以为空
 @param Language 语音
 @param AppId APP应用标识
 @param successBlock <#successBlock description#>
 @param failBlock <#failBlock description#>
 */
- (void)checkUserNameExistsOrNotWithLoginName:(NSString*)LoginName Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 获取联系人列表(乐源)

 @param DeviceId 设备ID
 @param ContactType 目前只有白名单，固定传 1
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock <#successBlock description#>
 @param failBlock <#failBlock description#>
 */
- (void)getContactsListByWithDeviceId:(NSString*)DeviceId ContactType:(NSString*)ContactType Token:(NSString*)Token Language:(NSString*)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;

/**
 修改关系和电话号码

 @param DeviceId 设备ID
 @param UserId   用户Id
 @param RelationName 关系
 @param RelationPhone 联系号码
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock <#successBlock description#>
 @param failBlock <#failBlock description#>
 */
- (void)updateUserGroupRelationNamePhoneDeviceId:(NSString*)DeviceId UserId:(NSString*)UserId RelationName:(NSString*)RelationName RelationPhone:(NSString*)RelationPhone Token:(NSString*)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


- (void)RequestInformation:(NSString *)Language Lat:(NSString *)Lat Lng:(NSString *)Lng Token:(NSString *)Token AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;


/**
 检查是否有新版本

 @param VersionNo 当前APP版本
 @param AppSystem 手机系统 1：android 2:iOS
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)checkVersionWithVersionNo:(NSString *)VersionNo AppSystem:(NSString *)AppSystem Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;
/**
 删除报警信息
 
 @param exceptionId 删除的ID集合
 @param userId      用户ID
 @param Token 登录后获取到的 Token
 @param Language 语言选项
 @param AppId APP应用标识
 @param successBlock successBlock description
 @param failBlock failBlock description
 */
- (void)deleteExceptionMessage:(NSString*)exceptionId UserId:(NSString*)userId Token:(NSString *)Token Language:(NSString *)Language AppId:(NSString *)AppId success:(RequestSuccessBlock)successBlock fail:(RequestFailBlck)failBlock;
@end
