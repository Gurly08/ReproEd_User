part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = Started;
  const factory RegisterEvent.register({
    required String name,
    required String email,
    required String password,
  }) = Register;
  const factory RegisterEvent.loading() = Loading;
  const factory RegisterEvent.loaded(AuthResponseModels authResponseModels) = Loaded;
}
