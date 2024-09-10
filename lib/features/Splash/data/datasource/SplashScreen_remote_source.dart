import '../../../../core/network/api_services.dart';
import '../../../../features/Splash/data/models/SplashScreen_model.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';

abstract class SplashScreenRemoteSource {
 Future<SplashScreenModel> call(bool isPg);

}


class SplashScreenRemoteSourceImpl implements SplashScreenRemoteSource {
   final ApiMethod? apiMethod;
   SplashScreenRemoteSourceImpl({this.apiMethod});

  @override
  Future<SplashScreenModel> call(bool isPg) async{
    // TODO: implement call
    try{
      final result =await apiMethod!.get(url: ApiEndpoint.GET_ALL_CHARACTERS.toString(),showResult: true,isBasic: false,duration: 30);
      var resultx=SplashScreenModel.fromJson(result);
      // Logger().w(result);
      return resultx;
    } catch(e){
      throw ServerException(e.toString());
    }
  }
}
