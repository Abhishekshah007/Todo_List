import 'package:dart_practice/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial());

  Stream<CrudState> mapEventToState(CrudEvent event) async* {
    if (event is CreateEvent) {
      // TODO: Implement create operation
    } else if (event is ReadEvent) {
      // TODO: Implement read operation
    } else if (event is UpdateEvent) {
      // TODO: Implement update operation
    } else if (event is DeleteEvent) {
      // TODO: Implement delete operation
    }
  }
}
