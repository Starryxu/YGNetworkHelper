```
@interface YGNetworkHelper : NSObject

/*****************************  网络部分  *****************************/

/**
 是否有网络

 @return 网络YES, 无网:NO
 */
+ (BOOL)isNetwork;


/**
 是否是手机网络

 @return 网络:YES, 反之:NO
 */
+ (BOOL)isWWANNetwork;


/**
 是否是WiFi网络

 @return 网络:YES, 反之:NO
 */
+ (BOOL)isWiFiNetwork;


/**
 取消所有HTTP请求
 */
+ (void)cancelAllRequest;


/**
 实时获取网络状态
 通过Block回调实时获取(此方法可多次调用)

 @param networkStatus 网络状态回调
 */
+ (void)networkStatusWithBlock:(YGNetworkStatusBlock)networkStatus;


/**
 取消指定URL的HTTP请求

 @param URL 请求的地址
 */
+ (void)cancelRequestWithURL:(NSString *)URL;


/**
 开启日志打印, 默认关闭
 */
+ (void)setDebugMode:(BOOL)isDebug;


/**
 GET请求,无缓存
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                           success:(YGRequestSuccessBlock)success
                           failure:(YGRequestFailedBlock)failure;

/**
 GET请求,自动缓存
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                     responseCache:(YGRequestCacheBlock)responseCache
                           success:(YGRequestSuccessBlock)success
                           failure:(YGRequestFailedBlock)failure;

/**
 POST请求,无缓存
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                            success:(YGRequestSuccessBlock)success
                            failure:(YGRequestFailedBlock)failure;


/**
 POST请求,自动缓存
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                      responseCache:(YGRequestCacheBlock)responseCache
                            success:(YGRequestSuccessBlock)success
                            failure:(YGRequestFailedBlock)failure;


/**
 PUT请求
 */
+ (__kindof NSURLSessionTask *)PUT:(NSString *)URL
                        parameters:(id)parameters
                           success:(YGRequestSuccessBlock)success
                           failure:(YGRequestFailedBlock)failure;


/**
 DELETE请求
 */
+ (__kindof NSURLSessionTask *)DELETE:(NSString *)URL
                           parameters:(id)parameters
                              success:(YGRequestSuccessBlock)success
                              failure:(YGRequestFailedBlock)failure;




/**
 上传文件
 
 @param name       文件对应服务器上的字段
 @param filePath   文件本地的沙盒路径
 */
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                        progress:(YGRequestProgress)progress
                                         success:(YGRequestSuccessBlock)success
                                         failure:(YGRequestFailedBlock)failure;

/**
 上传单/多张图片

 @param name       图片对应服务器上的字段
 @param images     图片数组
 @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 
 @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(YGRequestProgress)progress
                                           success:(YGRequestSuccessBlock)success
                                           failure:(YGRequestFailedBlock)failure;

/**
 下载文件
 
 @param fileDir  文件存储目录(默认存储目录为Download)
 */
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(YGRequestProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(YGRequestFailedBlock)failure;







#pragma mark - 设置AFHTTPSessionManager相关属性,全局生效
/**
 开发中可以根据需求调用此方法获取AFHTTPSessionManager实例进行自定义设置
 */
+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager;

/**
 设置网络请求参数的格式
 默认为二进制格式
 
 @param requestSerializer YGRequestSerializerTypeJSON(JSON格式),YGRequestSerializerTypeHTTP(二进制格式),
 */
+ (void)setRequestSerializer:(YGRequestSerializerType)requestSerializer;

/**
 设置服务器响应数据格式
 默认为JSON格式
 
 @param responseSerializer YGResponseSerializerTypeJSON(JSON格式),YGResponseSerializerTypeHTTP(二进制格式)
 */
+ (void)setResponseSerializer:(YGResponseSerializerType)responseSerializer;

/**
 设置请求超时时间
 默认为30S
 
 @param time 时长
 */
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time;


/**
 设置请求头

 @param value 值
 @param field 字段
 */
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;




/**
 是否打开网络状态转圈菊花
 默认打开
 
 @param open YES(打开), NO(关闭)
 */
+ (void)openNetworkActivityIndicator:(BOOL)open;

/**
 配置自建证书的Https请求, 参考链接: http://blog.csdn.net/syg90178aw/article/details/52839103
 
 @param cerPath 自建Https证书的路径
 @param validatesDomainName 是否需要验证域名，默认为YES. 如果证书的域名与请求的域名不一致，需设置为NO; 即服务器使用其他可信任机构颁发
 的证书，也可以建立连接，这个非常危险, 建议打开.validatesDomainName=NO, 主要用于这种情况:客户端请求的是子域名, 而证书上的是另外
 一个域名。因为SSL证书上的域名是独立的,假如证书上注册的域名是www.google.com, 那么mail.google.com是无法验证通过的.
 */
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;



```

    
    
