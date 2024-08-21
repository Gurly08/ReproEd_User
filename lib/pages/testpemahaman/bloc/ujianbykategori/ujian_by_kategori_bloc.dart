// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/datasource/ujian_datasource_remote.dart';
import 'package:reproeduser/data/model/response/ujian_response_models.dart';
part 'ujian_by_kategori_event.dart';
part 'ujian_by_kategori_state.dart';
part 'ujian_by_kategori_bloc.freezed.dart';


//
class UjianByKategoriBloc 
  extends Bloc<UjianByKategoriEvent, UjianByKategoriState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  UjianByKategoriBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetUjianByKategori>((event, emit) async {
      emit(const _Loading());
      final response = 
        await ujianRemoteDatasource.getUjianByKategori(event.kategori);
          response.fold((l) => emit(_Error(l)), 
          (r){
            if (r.data.isEmpty) {
              emit(const _NotFund()); 
            } else {
              emit(_Success(r));
            }
          }
        );
    });
  }
}
