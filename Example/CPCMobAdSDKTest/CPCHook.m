//
//  CPCHook.m
//  CPCMobAdSDKTest_Example
//
//  Created by dinghao on 2018/11/14.
//  Copyright © 2018年 丁昊. All rights reserved.
//

#import "CPCHook.h"
#import "fishhook.h"
#import <Security/SecureTransport.h>

@implementation CPCHook

static OSStatus (*original_SSLSetSessionOption)(
                                                SSLContextRef context,
                                                SSLSessionOption option,
                                                Boolean value);

static OSStatus replaced_SSLSetSessionOption(
                                             SSLContextRef context,
                                             SSLSessionOption option,
                                             Boolean value) {
    
    // Remove the ability to modify the value of the kSSLSessionOptionBreakOnServerAuth option
    if (option == kSSLSessionOptionBreakOnServerAuth)
        return noErr;
    else
        return original_SSLSetSessionOption(context, option, value);
}


// Hook SSLCreateContext()
static SSLContextRef (*original_SSLCreateContext) (
                                                   CFAllocatorRef alloc,
                                                   SSLProtocolSide protocolSide,
                                                   SSLConnectionType connectionType
                                                   );

static SSLContextRef replaced_SSLCreateContext (
                                                CFAllocatorRef alloc,
                                                SSLProtocolSide protocolSide,
                                                SSLConnectionType connectionType
                                                ) {
    SSLContextRef sslContext = original_SSLCreateContext(alloc, protocolSide, connectionType);
    
    // Immediately set the kSSLSessionOptionBreakOnServerAuth option in order to disable cert validation
    original_SSLSetSessionOption(sslContext, kSSLSessionOptionBreakOnServerAuth, true);
    return sslContext;
}


// Hook SSLHandshake()
static OSStatus (*original_SSLHandshake)(
                                         SSLContextRef context
                                         );

static OSStatus replaced_SSLHandshake(
                                      SSLContextRef context
                                      ) {
    OSStatus result = original_SSLHandshake(context);
    
    // Hijack the flow when breaking on server authentication
    if (result == errSSLServerAuthCompleted) {
        // Do not check the cert and call SSLHandshake() again
        return original_SSLHandshake(context);
    }
    else
        return result;
}




+(void)load
{
    rebind_symbols((struct rebinding[3]){
        
        {"SSLHandshake",replaced_SSLHandshake ,(void*)&original_SSLHandshake},
        {"SSLSetSessionOption",replaced_SSLSetSessionOption ,(void*)&original_SSLSetSessionOption},
        {"SSLCreateContext",replaced_SSLCreateContext ,(void*)&original_SSLCreateContext},

        
    }, 3);
    
   
}
@end
