import 'package:grpctest/common/grpc_commons.dart';
import 'package:grpctest/model/helloworld.pb.dart';
import 'package:grpctest/model/helloworld.pbgrpc.dart';

class HelloService {
  static Future<HelloReply> SayHello() async{
    var client = GreeterClient(GrpcClientSingleton().client);
    return await client.sayHello(HelloRequest());
  }
}