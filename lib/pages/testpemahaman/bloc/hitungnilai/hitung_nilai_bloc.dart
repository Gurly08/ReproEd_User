// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/datasource/ujian_datasource_remote.dart';

part 'hitung_nilai_event.dart';
part 'hitung_nilai_state.dart';
part 'hitung_nilai_bloc.freezed.dart';

class HitungNilaiBloc extends Bloc<HitungNilaiEvent, HitungNilaiState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  HitungNilaiBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetNilai>((event, emit) async {
      emit(const _Loading());
      // ignore: unused_local_variable
      final response = await ujianRemoteDatasource.hitungNilai(event.kategori);
      emit(const _Success(100));
    });
  }
}
