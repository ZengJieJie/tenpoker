//
//  ScriptMESS.m
//  Pateapi
//
//  Created by adin on 2024/4/1.
//

#import "TENPmess.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation TENPmess
static NSString* af_uuid = @"";

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    // 获取消息的名称和参数
    NSString *name = message.name;
    NSDictionary *body = message.body;
    NSLog(@"userContentController ");
    if ([name isEqualToString:@"getImei"]) {
        [self getImei];
    } else if ([name isEqualToString:@"getAfid"]) {
        [self getAfid];
    }
    else if([name isEqualToString:@"openUrl"]){
        NSString *urlString = message.body;
        NSURL*url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
    
}

- (void)getImei
{
    NSString *imei = [self getPhoneDeviceID];
    NSString *jsStr = [NSString stringWithFormat:@"getImeiCallback('%@')", imei];
    [self.webView evaluateJavaScript:jsStr completionHandler:nil];
}

- (void)getAfid
{
    NSString *afid = af_uuid;
    NSString *jsStr = [NSString stringWithFormat:@"getAfidCallback('%@')", afid];
    [self.webView evaluateJavaScript:jsStr completionHandler:nil];
}



+ (void)setAfuuid:(NSString *)uuidstr {
    af_uuid = uuidstr;
}





- (NSString *)getPhoneDeviceID {
    NSString* device_id = [self mgneg1uuid];
    if (device_id == nil || device_id.length == 0) {
        CFUUIDRef xcgeruuid = CFUUIDCreate(nil);
        CFStringRef xcgeruuid_str = CFUUIDCreateString(nil, xcgeruuid);
        NSString* uuid = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, xcgeruuid_str));
        CFRelease(xcgeruuid);
        CFRelease(xcgeruuid_str);
        device_id = [self brtnrxcuuid2:uuid];
        [self mnxetywvhfuuid3:device_id];
    }
    return device_id;
}

- (NSString*)mgneg1uuid {
    NSString* nameKeys = @"com.h55.PattiMastermind";
    NSString* uuid = nil;
    NSMutableDictionary *tableDictionarykey = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (id)kSecClassGenericPassword,(id)kSecClass,
                                               nameKeys, (id)kSecAttrService,
                                               nameKeys, (id)kSecAttrAccount,
                                          (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
                                          nil];
    [tableDictionarykey setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [tableDictionarykey setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef cfdataref_key = NULL;
    OSStatus osstatus =  SecItemCopyMatching((CFDictionaryRef)tableDictionarykey, (CFTypeRef *)&cfdataref_key);
    if (osstatus == noErr) {
        @try {
            uuid = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)cfdataref_key];
        }
        @catch (NSException *e) {
            return @"";
        }
    }
    else if (osstatus != errSecItemNotFound)
    {
        return @"";
    }
    if (cfdataref_key){
        CFRelease(cfdataref_key);
    }
    return uuid;
}

- (NSString*)brtnrxcuuid2:(NSString *)data
{
    if (data == nil || data.length == 0) {
        return @"";
    }

    const char *cData = [data UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cData, (CC_LONG)strlen(cData), digest);
    NSMutableString *resultdigest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [resultdigest appendFormat:@"%02x", digest[i]];
    }
    return resultdigest;
}

- (void)mnxetywvhfuuid3:(NSString*)uuid {
    NSString* nameKeys = @"com.h55.PattiMastermind";
    NSMutableDictionary *tableDictionarykey = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (id)kSecClassGenericPassword,(id)kSecClass,
                                               nameKeys, (id)kSecAttrService,
                                               nameKeys, (id)kSecAttrAccount,
                                          (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
                                          nil];
    SecItemDelete((CFDictionaryRef)tableDictionarykey);
    [tableDictionarykey setObject:[NSKeyedArchiver archivedDataWithRootObject:uuid] forKey:(id)kSecValueData];
    SecItemAdd((CFDictionaryRef)tableDictionarykey, NULL);
}

@end
