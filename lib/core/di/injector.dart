import 'package:get_it/get_it.dart';
import 'package:schoolgate/core/services/utils/deeplinking_service.dart';
import 'package:schoolgate/core/services/utils/navigation_service.dart';
import 'package:schoolgate/core/services/utils/storage_service.dart';
import 'package:schoolgate/core/services/utils/validation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.I;

Future<void> dependencyInjections() async {
  di.registerLazySingleton(() => NavigationService());

  di.registerLazySingleton(() => StorageService(sharedPreferences: di()));

  di.registerLazySingleton(() => ValidationService());

  // di.registerLazySingleton<RemoteService>(() => RemoteServiceImpl());
  // di.registerLazySingleton<Repository>(() => RepositoryImpl());
  // di.registerLazySingleton<CachedData>(() => CachedDataImpl(di()));
  // final sharedPreferences = await SharedPreferences.getInstance();

  DeepLinkService _deepLinkService = DeepLinkService(navigationService: di());

  di.registerSingleton<DeepLinkService>(_deepLinkService);

  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
}
