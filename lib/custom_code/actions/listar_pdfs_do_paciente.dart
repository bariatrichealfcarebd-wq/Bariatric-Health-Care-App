// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future<List<dynamic>> listarPdfsDoPaciente(String pacienteNome) async {
  // Se o nome não for fornecido, retorna uma lista vazia.
  if (pacienteNome == null || pacienteNome.isEmpty) {
    print('Nome do paciente está nulo ou vazio. Retornando lista vazia.');
    return [];
  }

  // Prepara o nome para a busca (minúsculas e substitui espaços por underscores)
  // para corresponder ao formato do nome do ficheiro.
  final nomeParaBusca = pacienteNome.replaceAll(' ', '_').toLowerCase();

  final List<dynamic> listaDePdfs = [];

  try {
    // 1. Acede à pasta "relatorios" no Firebase Storage
    final listResult =
        await FirebaseStorage.instance.ref('relatorios').listAll();

    // 2. Percorre cada ficheiro encontrado na pasta
    for (var item in listResult.items) {
      // Converte o nome do ficheiro para minúsculas para uma comparação segura
      final nomeFicheiroMinusculo = item.name.toLowerCase();

      // Verificamos se o nome do ficheiro contém o nome do paciente.
      if (nomeFicheiroMinusculo.contains(nomeParaBusca)) {
        // 3. Se pertence ao paciente, obtém a URL de download
        final String downloadUrl = await item.getDownloadURL();

        // 4. Cria um objeto JSON e adiciona à lista
        listaDePdfs.add({
          "nome": item.name,
          "url": downloadUrl,
        });
      }
    }

    print(
        'Encontrados ${listaDePdfs.length} PDFs para o paciente: $pacienteNome');
    return listaDePdfs;
  } catch (e) {
    print('ERRO CRÍTICO ao listar PDFs do Storage: $e');
    return []; // Retorna uma lista vazia em caso de erro
  }
}
