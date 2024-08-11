part of 'edukasi_bloc.dart';

@freezed
class EdukasiState with _$EdukasiState {
  const factory EdukasiState.initial() = _Initial;
  const factory EdukasiState.loading() = _Loading;
  const factory EdukasiState.success(EdukasiResponseModel edukasi) = _Success;
  const factory EdukasiState.error(String message) = _Error;
}
