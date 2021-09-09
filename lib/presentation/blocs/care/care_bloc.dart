import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:inspire/data/data_source/care_api.dart';
import 'package:meta/meta.dart';

part 'care_event.dart';
part 'care_state.dart';

class CareBloc extends Bloc<CareEvent, CareState> {
  final CareApi careApi;
  CareBloc(this.careApi) : super(CareInitial());

  @override
  Stream<CareState> mapEventToState(
    CareEvent event,
  ) async* {
    if (event is LoadCareEvent) {
      var cares = await careApi.getCare();
      yield CareLoadedSuccess(cares);
    }
  }
}
