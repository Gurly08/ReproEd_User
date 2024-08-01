import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/model/response/auth_response_models.dart';

part 'register_event.dart';
part 'register_state.dart';
part '../bloc/register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(_Initial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
