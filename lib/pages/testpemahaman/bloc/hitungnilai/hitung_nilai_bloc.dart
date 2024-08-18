// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hitung_nilai_event.dart';
part 'hitung_nilai_state.dart';
part 'hitung_nilai_bloc.freezed.dart';

class HitungNilaiBloc extends Bloc<HitungNilaiEvent, HitungNilaiState> {
  HitungNilaiBloc() : super(const _Initial()) {
    on<_GetNilai>((event, emit) {
      emit(const _Loading());
      emit(const _Success(100));
    });
  }
}
