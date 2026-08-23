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
import '../features/comments/data/datasource/comment_datasource.dart' as _i168;
import '../features/comments/data/repositories/comment_repository_impl.dart'
    as _i260;
import '../features/comments/domain/usecases/get_comment_usecase.dart' as _i958;
import '../features/login/data/datasource/login_datasource.dart' as _i959;
import '../features/login/data/repositories/login_repository_impl.dart'
    as _i667;
import '../features/login/domain/usercases/login_usecase.dart' as _i505;
import '../features/posts/data/datasource/post_remote_data_source.dart'
    as _i792;
import '../features/posts/data/repositories/post_repository_impl.dart' as _i32;
import '../features/posts/domain/usercases/create_post_usecase.dart' as _i418;
import '../features/posts/domain/usercases/get_post_usecase.dart' as _i294;
import '../features/splash/data/datasource/splash_datasource.dart' as _i131;
import '../features/splash/data/repositories/splash_repository_impl.dart'
    as _i1010;
import '../features/splash/domain/usecases/validate_login_usecase.dart'
    as _i724;

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
    gh.lazySingleton<_i168.CommentDatasourceImpl>(
      () => _i168.CommentDatasourceImpl(),
    );
    gh.lazySingleton<_i260.CommentRepositoryImpl>(
      () => _i260.CommentRepositoryImpl(),
    );
    gh.lazySingleton<_i958.GetCommentUseCase>(() => _i958.GetCommentUseCase());
    gh.lazySingleton<_i959.LoginDatasourceImpl>(
      () => _i959.LoginDatasourceImpl(),
    );
    gh.lazySingleton<_i667.LoginRepositoryImpl>(
      () => _i667.LoginRepositoryImpl(),
    );
    gh.lazySingleton<_i505.LoginUsecase>(() => _i505.LoginUsecase());
    gh.lazySingleton<_i792.PostRemoteDataSourceImpl>(
      () => _i792.PostRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i32.PostRepositoryImpl>(() => _i32.PostRepositoryImpl());
    gh.lazySingleton<_i418.CreatePostUseCase>(() => _i418.CreatePostUseCase());
    gh.lazySingleton<_i294.GetPostUseCase>(() => _i294.GetPostUseCase());
    gh.lazySingleton<_i131.SplashDataSourceImpl>(
      () => _i131.SplashDataSourceImpl(),
    );
    gh.lazySingleton<_i1010.SplashRepositoryImpl>(
      () => _i1010.SplashRepositoryImpl(),
    );
    gh.lazySingleton<_i724.ValidateLoginUsecase>(
      () => _i724.ValidateLoginUsecase(),
    );
    return this;
  }
}
