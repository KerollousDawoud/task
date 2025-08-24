// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_task/domain/usecases/login_user_usecase.dart' as _i550;
import 'package:auth_task/domain/usecases/register_user_usecase.dart' as _i72;
import 'package:auth_task/domain/usecases/reset_password_usecase.dart' as _i566;
import 'package:auth_task/features/auth/bloc/login/login_bloc.dart' as _i569;
import 'package:auth_task/features/auth/bloc/register/register_bloc.dart'
    as _i786;
import 'package:auth_task/features/auth/bloc/reset_password/resetpassword_bloc.dart'
    as _i516;
import 'package:auth_task/features/auth/data/auth_repository.dart' as _i574;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i550.LoginUserUseCase>(
      () => _i550.LoginUserUseCase(gh<_i574.AuthRepository>()),
    );
    gh.factory<_i72.RegisterUserUseCase>(
      () => _i72.RegisterUserUseCase(gh<_i574.AuthRepository>()),
    );
    gh.factory<_i566.ResetPasswordUseCase>(
      () => _i566.ResetPasswordUseCase(gh<_i574.AuthRepository>()),
    );
    gh.factory<_i569.LoginBloc>(
      () => _i569.LoginBloc(gh<_i550.LoginUserUseCase>()),
    );
    gh.factory<_i786.RegisterBloc>(
      () => _i786.RegisterBloc(gh<_i72.RegisterUserUseCase>()),
    );
    gh.factory<_i516.ResetPasswordBloc>(
      () => _i516.ResetPasswordBloc(gh<_i566.ResetPasswordUseCase>()),
    );
    return this;
  }
}
