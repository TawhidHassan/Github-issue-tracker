part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initSplash();
  _initHome();





  serviceLocator.registerFactory(() => InternetConnection());

  /// core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  ///db
  serviceLocator.registerFactory<DBHelper>(
    () => DBHelper(),
  );

  ///Api client
  serviceLocator.registerFactory<ApiMethod>(
    () => ApiMethod(),
  );
}





void _initSplash(){
  /// Datasource
  serviceLocator
    ..registerFactory<SplashScreenRemoteSource>(
          () => SplashScreenRemoteSourceImpl(
                apiMethod:  serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<SplashScreenRepository>(
          () => SplashScreenRepository(
         connectionChecker:  serviceLocator(),
         remoteSource:  serviceLocator()
      ),
    );
}


/// home init
void _initHome(){
  /// Datasource
  serviceLocator
    ..registerFactory<HomeRemoteSource>(
          () => HomeRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<HomeRepository>(
          () => HomeRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => HomeUseCase(
        homeRepository:   serviceLocator(),
      ),
    );
}






