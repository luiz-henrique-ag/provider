import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/person_provider.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  TextEditingController enderecoController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController numEndController = TextEditingController();

  @override
  void initState() {
    final activeData = context.read<PersonProvider>();
    enderecoController.text = activeData.endereco;
    bairroController.text = activeData.bairro;
    numEndController.text = activeData.numEndereco;
    super.initState();
  }

  @override
  void dispose() {
    enderecoController.dispose();
    bairroController.dispose();
    numEndController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endereço"),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: enderecoController,
              decoration: const InputDecoration(
                hintText: "Endereço",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),
            TextField(
              controller: bairroController,
              decoration: const InputDecoration(
                hintText: "Bairro",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),
            TextField(
              controller: numEndController,
              decoration: const InputDecoration(
                hintText: "Número",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
            context.read<PersonProvider>().setEndereco(enderecoController.text);
            context.read<PersonProvider>().setBairro(bairroController.text);
            context.read<PersonProvider>().setNumEndereco(numEndController.text);
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Icon(Icons.check, color: Colors.white,)
      ),
    );
  }
}