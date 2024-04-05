//
//  TENPmess.h
//  Tenpapoker
//
//  Created by adin on 2024/4/5.
//


//
//  ScriptMESS.h
//  Pateapi
//
//  Created by adin on 2024/4/1.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TENPmess : NSObject<WKScriptMessageHandler>
@property (nonatomic, weak) WKWebView *webView;
+(void)setAfuuid:(NSString*)uuidstr;

@end

NS_ASSUME_NONNULL_END
