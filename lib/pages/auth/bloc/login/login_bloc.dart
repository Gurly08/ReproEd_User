// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/datasource/auth_datasource_remote.dart';
import 'package:reproeduser/data/model/request/login_request_models.dart';
import 'package:reproeduser/data/model/response/auth_response_models.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDataSource().login(event.data);
      response.fold(
      (l) => emit(_Error(l)), 
      (R) => emit(_Success(R)),
      );
    });
  }
}
