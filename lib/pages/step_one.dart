import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/person_provider.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    cpfController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final activeData = context.read<PersonProvider>();
    nomeController.text = activeData.nome;
    idadeController.text = activeData.idade;
    cpfController.text = activeData.cpf;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Pessoais"),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: nomeController,
              cursorColor: Colors.black,
              
              decoration: const InputDecoration(
                hintText: "Nome",
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Colors.black, width: 2)
                )
              ),
            ),
            TextField(
              controller: idadeController,
              decoration: const InputDecoration(
                hintText: "Idade",
                labelText: "Idade",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Colors.black, width: 2)
                )
              ),
            ),
            TextField(
              controller: cpfController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: "CPF",
                labelText: "CPF",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Colors.black, width: 2)
                )
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
            context.read<PersonProvider>().setNome(nomeController.text);
            context.read<PersonProvider>().setCpf(cpfController.text);
            context.read<PersonProvider>().setIdade(idadeController.text);
            Navigator.pushNamed(context, '/step_two');
          },
          child: const Icon(Icons.arrow_forward, color: Colors.white)
      ),
    );
  }
}