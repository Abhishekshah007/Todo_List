import 'package:dart_practice/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'bloc.dart';
import 'event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => CrudBloc(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter CRUD Demo'),
      ),
      body: Column(
        children: [
          CreateItemWidget(),
          const SizedBox(height: 16),
          const Expanded(child: ItemListWidget()),
        ],
      ),
    );
  }
}

class CreateItemWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  CreateItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: nameController),
        TextField(controller: ageController),
        ElevatedButton(
          onPressed: () {
            final String name = nameController.text;
            final int age = int.parse(ageController.text);
            final CreateEvent event = CreateEvent(name: name, age: age);
            BlocProvider.of<CrudBloc>(context).add(event);
            nameController.clear();
            ageController.clear();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CrudBloc, CrudState>(
      builder: (BuildContext context, CrudState state) {
        if (state is CrudLoaded) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              final Item item = state.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.age.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    final DeleteEvent event = DeleteEvent(id: item.id);
                    BlocProvider.of<CrudBloc>(context).add(event);
                  },
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class Item extends Equatable {
  final int id;
  final String name;
  final int age;

  const Item({required this.id, required this.name, required this.age});

  @override
  List<Object?> get props => [id, name, age];
}
