import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  String nome;
  String idade;
  String cpf;
  String endereco;
  String bairro;
  String numEndereco;

  PersonProvider({
    this.nome = "",
    this.idade = "",
    this.cpf = "",
    this.endereco = "",
    this.bairro = "",
    this.numEndereco = ""
  });

  setNome(String nome){
    this.nome = nome;
    notifyListeners();
  }
  setIdade(String idade){
    this.idade = idade;
    notifyListeners();
  }
  setCpf(String cpf){
    this.cpf = cpf;
    notifyListeners();
  }
  setEndereco(String endereco){
    this.endereco = endereco;
    notifyListeners();
  }
  setBairro(String bairro){
    this.bairro = bairro;
    notifyListeners();
  }
  setNumEndereco(String numEndereco){
    this.numEndereco = numEndereco;
    notifyListeners();
  }
}