#include <napi.h>

Napi::String GetScrollerStyle(const Napi::CallbackInfo& info) {
    Napi::Env env = info.Env();
    return Napi::String::New(env, "legacy");
}

Napi::Object Init(Napi::Env env, Napi::Object exports) {
    exports.Set(Napi::String::New(env, "getScrollerStyle"),
                Napi::Function::New(env, GetScrollerStyle));
    return exports;
}

NODE_API_MODULE(NODE_GYP_MODULE_NAME, Init);
