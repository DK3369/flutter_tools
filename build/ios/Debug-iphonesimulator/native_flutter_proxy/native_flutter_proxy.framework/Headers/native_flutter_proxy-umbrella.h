#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FlutterProxyPlugin.h"

FOUNDATION_EXPORT double native_flutter_proxyVersionNumber;
FOUNDATION_EXPORT const unsigned char native_flutter_proxyVersionString[];

