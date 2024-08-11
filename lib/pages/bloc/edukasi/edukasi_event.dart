part of 'edukasi_bloc.dart';

@freezed
class EdukasiEvent with _$EdukasiEvent {
  const factory EdukasiEvent.started() = _Started;
  const factory EdukasiEvent.getEdukasi() = _GetEdukasi;
}