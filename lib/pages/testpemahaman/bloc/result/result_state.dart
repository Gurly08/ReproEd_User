part of 'result_bloc.dart';

@freezed
class ResultState with _$ResultState {
  const factory ResultState.initial() = _Initial;
  const factory ResultState.loading() = _Loading;
  const factory ResultState.success(
    ResultResponModels response) = _Success;
  const factory ResultState.error(String message) = _Error;
}
