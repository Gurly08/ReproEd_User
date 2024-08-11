// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/datasource/edukasi_datasource_remote.dart';
import 'package:reproeduser/data/model/response/edukasi_response_models.dart';
part 'edukasi_event.dart';
part 'edukasi_state.dart';
part 'edukasi_bloc.freezed.dart';

class EdukasiBloc extends Bloc<EdukasiEvent, EdukasiState> {
  final EdukasiRemoteDatasource edukasiRemoteDatasource;
  EdukasiBloc(this.edukasiRemoteDatasource) : super(const _Initial()) {
    on<EdukasiEvent>((event, emit) async {
      emit(const EdukasiState.loading());
      final response = await edukasiRemoteDatasource.getEdukasi();
      response.fold(
        (l) => emit(_Error(l)), 
        (r) {
          if (r.edukasi.isNotEmpty) {
            emit(_Success(r));
          } else {
            emit(const _Error('Data edukasi kosong'));
          }
        },
      );
    });
  }
}

