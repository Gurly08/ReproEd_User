part of 'result_bloc.dart';

@freezed
class ResultEvent with _$ResultEvent {
  const factory ResultEvent.started() = _Started;
  const factory ResultEvent.getResult(String kategori) = _GetResult;
}