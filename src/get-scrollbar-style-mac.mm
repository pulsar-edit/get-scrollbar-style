#include <napi.h>
#import <AppKit/AppKit.h>

Napi::String GetScrollerStyle(const Napi::CallbackInfo& info) {
  Napi::Env env = info.Env();

  @autoreleasepool {
    NSScrollerStyle style = [NSScroller preferredScrollerStyle];

    if (style == NSScrollerStyleLegacy) {
      return Napi::String::New(env, "legacy");
    } else if (style == NSScrollerStyleOverlay) {
      return Napi::String::New(env, "overlay");
    } else {
      return Napi::String::New(env, "unknown");
    }
  }
}

Napi::Object Init(Napi::Env env, Napi::Object exports) {
  exports.Set(Napi::String::New(env, "getScrollerStyle"),
  Napi::Function::New(env, GetScrollerStyle));
  return exports;
}

NODE_API_MODULE(NODE_GYP_MODULE_NAME, Init);
