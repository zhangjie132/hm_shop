//基于Dio的二次封装
import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest {
  final _dio =Dio();//dio请求对象
  //配置基础地址拦截器
  DioRequest(){
    _dio.options..baseUrl = GlobalConstants.BASE_URL
    ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
    ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
    ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    //拦截器
  _addInterceptor();
  }
  //添加拦截器
  void _addInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (response, handler) {
        //http状态码 200 300 
        if(response.statusCode! >= 200&& response.statusCode! <300){
          handler.next(response);
          return;
        }
        handler.reject(DioException(requestOptions: response.requestOptions));
      },
      onError: (error, handler) {
        handler.reject(error);
      },
    ));
  }
Future<dynamic> get(String url,{Map<String, dynamic>? params}){
    return  _handleResponse (_dio.get(url,queryParameters: params));
  }

//进一步处理返回结果的函数
Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
  try {
      Response<dynamic> res = await task;
  final data = res.data as Map<String, dynamic>;//data才是真实的接口返回的数据
  if(data["code"] == GlobalConstants.SUCCESS_CODE){
    //才认定 http状态和业务状态均正常 就可以放行
    return data["result"];//只要result结果
  }
  //抛出异常
  // throw Exception(data["msg"]?? "数据加载异常");
  } catch (e) {
    throw Exception(e);
  }
}
}
//单例对象
final dioRequest = DioRequest();//单例对象


//dio请求工具发出请求 返回的数据 Response<dynamic>.data
//把所有的接口data解构出来 拿到真正的数据 要判断业务状态码是不是等于1