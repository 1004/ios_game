//配置

// 4.自定义Log
#ifdef DEBUG
#define XkyLog(...) NSLog(__VA_ARGS__)
#else
#define XkyLog(...)
#endif

#define ios7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
