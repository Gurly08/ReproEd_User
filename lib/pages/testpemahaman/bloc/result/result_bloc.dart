// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reproeduser/data/datasource/ujian_datasource_remote.dart';
import 'package:reproeduser/data/model/response/result_response_models.dart';
part 'result_event.dart';
part 'result_state.dart';
part 'result_bloc.freezed.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  ResultBloc(
    this.ujianRemoteDatasource
  ) : super(const _Initial()) {
    on<_GetResult>((event, emit) async {
      emit(const _Loading());
      final response =
        await ujianRemoteDatasource.resultTest();
        response.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Success(r)),
        );
    });
  }
}
