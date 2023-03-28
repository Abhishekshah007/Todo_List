import 'package:equatable/equatable.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object?> get props => [];
}

class CreateEvent extends CrudEvent {
  final String name;
  final int age;

  const CreateEvent({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

class ReadEvent extends CrudEvent {}

class UpdateEvent extends CrudEvent {
  final int id;
  final String name;
  final int age;

  const UpdateEvent({required this.id, required this.name, required this.age});

  @override
  List<Object?> get props => [id, name, age];
}

class DeleteEvent extends CrudEvent {
  final int id;

  const DeleteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
