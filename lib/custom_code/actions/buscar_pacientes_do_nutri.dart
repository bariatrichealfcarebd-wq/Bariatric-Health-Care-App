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

// Import necessário para interagir com o Firestore.
import 'package:cloud_firestore/cloud_firestore.dart';

// MUDANÇA 1: O retorno agora é uma lista de DocumentReference.
Future<List<DocumentReference>> buscarPacientesDoNutri(
  String nutriUID,
  String termoBusca,
) async {
  // Se o termo de busca estiver vazio, retorna uma lista vazia para economizar leituras.
  if (termoBusca.isEmpty) {
    return [];
  }

  final firestore = FirebaseFirestore.instance;
  List<String> pacienteIds = [];

  // MUDANÇA 2: A lista de resultados agora guarda DocumentReference.
  final List<DocumentReference> resultadosFinais = [];

  // ETAPA 1: Buscar os UIDs dos pacientes que pertencem ao nutricionista.
  // Esta parte não muda, continua igual e eficiente.
  final nutriPacienteQuery = await firestore
      .collection('Nutri_Paciente')
      .where('uid_Nutri', isEqualTo: nutriUID)
      .get();

  for (var doc in nutriPacienteQuery.docs) {
    pacienteIds.add(doc.data()['uid_Paciente']);
  }

  // Se o nutricionista não tem pacientes, não há o que buscar.
  if (pacienteIds.isEmpty) {
    return [];
  }

  // ETAPA 2: Buscar na coleção 'Paciente' usando os IDs e o termo de busca.
  final termoNormalizado = termoBusca.toLowerCase();

  List<Future<QuerySnapshot<Map<String, dynamic>>>> queries = [];

  for (var i = 0; i < pacienteIds.length; i += 30) {
    final chunk = pacienteIds.sublist(
        i, i + 30 > pacienteIds.length ? pacienteIds.length : i + 30);

    queries.add(firestore
        .collection('Paciente')
        .where('uid', whereIn: chunk) // Filtra pelos pacientes do nutri
        .where('searchKeywords',
            arrayContains: termoNormalizado) // Filtra pelo nome
        .get());
  }

  final snapshots = await Future.wait(queries);

  for (final snapshot in snapshots) {
    for (final doc in snapshot.docs) {
      // MUDANÇA 3: Adicionamos a REFERÊNCIA do documento, e não o ID.
      resultadosFinais.add(doc.reference);
    }
  }

  return resultadosFinais;
}
