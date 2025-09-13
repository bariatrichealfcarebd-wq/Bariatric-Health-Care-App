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

// Import necessário para o Firebase Storage
import 'package:firebase_storage/firebase_storage.dart';

/// O tipo de retorno agora é uma lista de JSON (representada por dynamic em
/// Dart)
Future<List<dynamic>> listarPdfsDoPaciente(String pacienteCpf) async {
  // --- INÍCIO DA DEPURAÇÃO ---
  print('--- INICIANDO BUSCA DE PDFS ---');
  print('CPF recebido pela função: "$pacienteCpf"');
  // --- FIM DA DEPURAÇÃO ---

  // Se o CPF não for fornecido, retorna uma lista vazia para evitar erros.
  if (pacienteCpf == null || pacienteCpf.isEmpty) {
    print('CPF está nulo ou vazio. Retornando lista vazia.');
    return [];
  }

  // Remove a pontuação do CPF para garantir uma busca consistente
  final cpfSoNumeros = pacienteCpf.replaceAll(RegExp(r'[^\d]'), '');
  // --- INÍCIO DA DEPURAÇÃO ---
  print('CPF (apenas números) para busca: "$cpfSoNumeros"');
  // --- FIM DA DEPURAÇÃO ---

  // Lista para guardar os PDFs encontrados
  final List<dynamic> listaDePdfs = [];

  try {
    // 1. Acede à pasta "relatorios" no Firebase Storage
    final listResult =
        await FirebaseStorage.instance.ref('relatorios').listAll();

    // --- INÍCIO DA DEPURAÇÃO ---
    print(
        'Encontrados ${listResult.items.length} ficheiros na pasta "relatorios".');
    // --- FIM DA DEPURAÇÃO ---

    // 2. Percorre cada ficheiro encontrado na pasta
    for (var item in listResult.items) {
      // Removemos a pontuação do nome do ficheiro para uma comparação segura
      final nomeFicheiroSoNumeros = item.name.replaceAll(RegExp(r'[^\d]'), '');

      // --- INÍCIO DA DEPURAÇÃO ---
      print('Verificando ficheiro: ${item.name}');
      print('Nome do ficheiro (apenas números): "$nomeFicheiroSoNumeros"');
      // --- FIM DA DEPURAÇÃO ---

      // Verificamos se o nome do ficheiro contém os números do CPF do paciente.
      if (nomeFicheiroSoNumeros.contains(cpfSoNumeros)) {
        // --- INÍCIO DA DEPURAÇÃO ---
        print('-> CORRESPONDÊNCIA ENCONTRADA!');
        // --- FIM DA DEPURAÇÃO ---
        // 3. Se pertence ao paciente, obtém a URL de download
        final String downloadUrl = await item.getDownloadURL();

        // 4. Cria um objeto JSON (um Map em Dart) com o nome e a URL e adiciona à lista
        listaDePdfs.add({
          "nome": item.name,
          "url": downloadUrl,
        });
      }
    }

    print('--- BUSCA FINALIZADA ---');
    print('Encontrados ${listaDePdfs.length} PDFs para o CPF: $pacienteCpf');
    return listaDePdfs;
  } catch (e) {
    print('ERRO CRÍTICO ao listar PDFs do Storage: $e');
    return []; // Retorna uma lista vazia em caso de erro
  }
}
