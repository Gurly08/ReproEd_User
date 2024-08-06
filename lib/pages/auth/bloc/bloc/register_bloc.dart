// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/datasource/auth_datasource_remote.dart';
import 'package:reproeduser/data/model/request/register_request_models.dart';

import '../../../../data/model/response/auth_response_models.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDataSource().register(event.data);
      response.fold(
        (l) => emit(_Error(message: l)), 
        (r) => emit(_Success(r)),
      );
    });
  }
}
