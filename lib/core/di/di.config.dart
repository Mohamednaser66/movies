// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../apis_service/apis_service.dart' as _i113;
import '../../authentication/data/data_source/local_data_source/auth_local_data_source.dart'
    as _i383;
import '../../authentication/data/data_source/local_data_source/auth_shared_prefs_data_source.dart'
    as _i768;
import '../../authentication/data/data_source/remote_data_source/api_data_source_impl.dart'
    as _i907;
import '../../authentication/data/data_source/remote_data_source/remote_data_source.dart'
    as _i998;
import '../../authentication/data/repository_impl/auth_repository_impl.dart'
    as _i450;
import '../../authentication/domain/repository/auth_repository.dart' as _i216;
import '../../authentication/domain/use_case/auth_use_case.dart' as _i806;
import '../../authentication/presentation/Auth_view_model/auth_cubit.dart'
    as _i871;
import '../../presentation/main_layout/tabs/home/data/data_source/movie_data_source.dart'
    as _i18;
import '../../presentation/main_layout/tabs/home/data/data_source/movies_api_data_source.dart'
    as _i453;
import '../../presentation/main_layout/tabs/home/data/repository_impl/movie_repository_impl.dart'
    as _i136;
import '../../presentation/main_layout/tabs/home/domain/repository/repository.dart'
    as _i351;
import '../../presentation/main_layout/tabs/home/domain/use_case/movie_use_case.dart'
    as _i994;
import '../../presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart'
    as _i344;
import '../../presentation/main_layout/tabs/profile/data/profile_data_source_service/profile_data_source_service.dart'
    as _i1010;
import '../../presentation/main_layout/tabs/profile/data/profile_data_source_service/profile_data_source_service_impl.dart'
    as _i251;
import '../../presentation/main_layout/tabs/profile/data/profile_repo_repository/profile_repo_repository_impl.dart'
    as _i132;
import '../../presentation/main_layout/tabs/profile/domain/profile_repo/profile_repo_repository.dart'
    as _i257;
import '../../presentation/main_layout/tabs/profile/domain/use_case/use-case.dart'
    as _i668;
import '../../presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart'
    as _i762;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i113.ApisService>(() => _i113.ApisService());
    gh.factory<_i383.AuthLocalDataSource>(
        () => _i768.AuthSharedPrefsDataSource());
    gh.factory<_i998.RemoteDataSource>(
        () => _i907.ApiDataSourceImpl(gh<_i113.ApisService>()));
    gh.factory<_i1010.ProfileDataSourceService>(
        () => _i251.ProfileDataSourceServiceImpl(
              gh<_i383.AuthLocalDataSource>(),
              gh<_i113.ApisService>(),
            ));
    gh.factory<_i18.MovieDataSource>(
        () => _i453.MoviesApiDataSource(gh<_i113.ApisService>()));
    gh.factory<_i351.MovieRepository>(
        () => _i136.MovieRepositoryImpl(gh<_i18.MovieDataSource>()));
    gh.factory<_i994.MovieUseCase>(
        () => _i994.MovieUseCase(gh<_i351.MovieRepository>()));
    gh.factory<_i216.AuthRepository>(() => _i450.AuthRepositoryImpl(
          gh<_i383.AuthLocalDataSource>(),
          gh<_i998.RemoteDataSource>(),
        ));
    gh.factory<_i344.MovieCubit>(
        () => _i344.MovieCubit(gh<_i994.MovieUseCase>()));
    gh.factory<_i257.ProfileRepository>(() =>
        _i132.ProfileRepoRepositoryImpl(gh<_i1010.ProfileDataSourceService>()));
    gh.factory<_i806.AuthUseCase>(
        () => _i806.AuthUseCase(gh<_i216.AuthRepository>()));
    gh.factory<_i871.AuthCubit>(() => _i871.AuthCubit(gh<_i806.AuthUseCase>()));
    gh.factory<_i668.ProfileUseCase>(
        () => _i668.ProfileUseCase(gh<_i257.ProfileRepository>()));
    gh.factory<_i762.ProfileCubit>(
        () => _i762.ProfileCubit(gh<_i668.ProfileUseCase>()));
    return this;
  }
}
