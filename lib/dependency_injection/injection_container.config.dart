// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/networking/api_client.dart' as _i62;
import '../core/service/home_service.dart' as _i827;
import '../core/service/user_profile_service.dart' as _i801;
import '../features/home/data/datasource/post_remote_data_source.dart' as _i44;
import '../features/home/data/repositories/post_repository_impl.dart' as _i181;
import '../features/home/domain/usercases/create_post_usecase.dart' as _i428;
import '../features/home/domain/usercases/get_post_usecase.dart' as _i538;
import '../features/login/data/datasource/login_datasource.dart' as _i959;
import '../features/login/data/repositories/login_repository_impl.dart'
    as _i667;
import '../features/login/domain/usercases/login_usecase.dart' as _i505;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i62.APIClient>(() => _i62.APIClient());
    gh.lazySingleton<_i827.HomeService>(() => _i827.HomeService());
    gh.lazySingleton<_i801.UserProfileService>(
      () => _i801.UserProfileService(),
    );
    gh.lazySingleton<_i44.PostRemoteDataSourceImpl>(
      () => _i44.PostRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i181.PostRepositoryImpl>(
      () => _i181.PostRepositoryImpl(),
    );
    gh.lazySingleton<_i428.CreatePostUseCase>(() => _i428.CreatePostUseCase());
    gh.lazySingleton<_i538.GetPostUseCase>(() => _i538.GetPostUseCase());
    gh.lazySingleton<_i959.LoginDatasourceImpl>(
      () => _i959.LoginDatasourceImpl(),
    );
    gh.lazySingleton<_i667.LoginRepositoryImpl>(
      () => _i667.LoginRepositoryImpl(),
    );
    gh.lazySingleton<_i505.LoginUsecase>(() => _i505.LoginUsecase());
    return this;
  }
}
