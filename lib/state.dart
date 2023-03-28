import 'package:equatable/equatable.dart';

import 'main.dart';

abstract class CrudState extends Equatable {
  const CrudState();

  @override
  List<Object?> get props => [];
}

class CrudInitial extends CrudState {}

class CrudLoaded extends CrudState {
  final List<Item> items;

  const CrudLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}
