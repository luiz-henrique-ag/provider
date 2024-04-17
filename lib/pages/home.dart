import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/person_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Multi Step Form",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Nome: ${context.watch<PersonProvider>().nome}"),
            ),),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("CPF: ${context.watch<PersonProvider>().cpf}"),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Idade: ${context.watch<PersonProvider>().idade}"),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Endereço: ${context.watch<PersonProvider>().endereco}"),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Bairro: ${context.watch<PersonProvider>().bairro}"),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Número: ${context.watch<PersonProvider>().numEndereco}"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/step_one'),
              icon: Icon(Icons.person, color: Colors.grey.shade200,),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/step_two'),
              icon: Icon(Icons.list, color: Colors.grey.shade200,),
            ),
          ],
        ),
      ),
    );
  }
}