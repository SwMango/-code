

#import <Foundation/Foundation.h>
#import "WXUtil.h"
#import "ApiXml.h"
/*
 // 签名实例
 // 更新时间：2015年3月3日
 // 负责人：李启波（marcyli）
 // 该Demo用于ios sdk 1.4
 
 //微信支付服务器签名支付请求请求类
 //============================================================================
 //api说明：
 //初始化商户参数，默认给一些参数赋值，如cmdno,date等。
 -(BOOL) init:(NSString *)app_id (NSString *)mch_id;
 
 //设置商户API密钥
 -(void) setKey:(NSString *)key;
 
 //生成签名
 -(NSString*) createMd5Sign:(NSMutableDictionary*)dict;
 
 //获取XML格式的数据
 -(NSString *) genPackage:(NSMutableDictionary*)packageParams;
 
 //提交预支付交易，获取预支付交易会话标识
 -(NSString *) sendPrepay:(NSMutableDictionary *);
 
 //签名实例测试
 - ( NSMutableDictionary *)sendPay_demo;
 
 //获取debug信息日志
 -(NSString *) getDebugifo;
 
 //获取最后返回的错误代码
 -(long) getLasterrCode;
 //============================================================================
 */

// 账号帐户资料
//更改商户把相关参数后可测试

#define APP_ID          @"wx874d472ed726004d"               //APPID
#define APP_SECRET      @"b1fa4eb59719abc0bc56010b62ca5a7d" //appsecret
//商户号，填写商户对应参数
#define MCH_ID          @"1270026401"
//商户API密钥，填写相应参数
#define PARTNER_ID      @"df64g56sd4gh654sd6f5h465df4h56sd"
//支付结果回调页面
#define NOTIFY_URL      @"http://www.zyxschool.com/trade/pay/wxpay/native_notify"
//获取服务器端支付数据地址（商户自定义）
#define SP_URL          @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php"


@interface wechat_qrcodePayHandler : NSObject{
    //预支付网关url地址
    NSString *payUrl;
    
    //lash_errcode;
    long     last_errcode;
    //debug信息
    NSMutableString *debugInfo;
    NSString *appid,*mchid,*spkey;
    
    
    
    
}
//初始化函数
-(BOOL) init:(NSString *)app_id mch_id:(NSString *)mch_id dic:(NSDictionary *)dic;
-(NSString *) getDebugifo;
-(long) getLasterrCode;
//设置商户密钥
-(void) setKey:(NSString *)key;
//创建package签名
-(NSString*) createMd5Sign:(NSMutableDictionary*)dict;
//获取package带参数的签名包
-(NSString *)genPackage:(NSMutableDictionary*)packageParams;
//提交预支付
-(NSString *)sendPrepay:(NSMutableDictionary *)prePayParams;
//签名实例测试
- ( NSMutableDictionary *)sendPay_WithInfoDic:(NSDictionary *)infoDic;


//    传入字典;
@property (nonatomic,retain) NSMutableDictionary *infoDic;


@end