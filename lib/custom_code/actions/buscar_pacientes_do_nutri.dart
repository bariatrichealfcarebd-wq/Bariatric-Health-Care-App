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

Future<List<DocumentReference>> buscarPacientesDoNutri(
  String nutriUID,
  String termoBusca,
) async {
  final firestore = FirebaseFirestore.instance;
  final List<DocumentReference> resultadosFinais = [];

  // ---------------------------------------------------------
  // ETAPA 1: Buscar TODOS os pacientes deste Nutricionista
  // ---------------------------------------------------------
  // Agora buscamos DIRETO na coleção Paciente, pois você já tem o uid_Nutri lá.
  // Isso elimina o erro de "vínculo perdido" na outra tabela.

  final querySnapshot = await firestore
      .collection('Paciente')
      .where('uid_Nutri', isEqualTo: nutriUID)
      .get();

  // Se não tiver pacientes, retorna vazio
  if (querySnapshot.docs.isEmpty) {
    return [];
  }

  // ---------------------------------------------------------
  // ETAPA 2: Filtrar pelo Nome/Keyword (Na Memória)
  // ---------------------------------------------------------
  final termoNormalizado = termoBusca.toLowerCase().trim();

  for (final doc in querySnapshot.docs) {
    final data = doc.data();
    bool match = false;

    // Se não tiver busca digitada (campo vazio), mostra todos os pacientes do Nutri
    if (termoNormalizado.isEmpty) {
      match = true;
    } else {
      // A. Busca pela lista inteligente (searchKeywords)
      if (data['searchKeywords'] != null) {
        // Convertemos para List<dynamic> para evitar erro de tipagem
        final List<dynamic> keywords = data['searchKeywords'];

        // Verifica se alguma keyword CONTÉM o termo digitado
        // (Ex: se keyword é "silva", buscar "sil" vai achar)
        for (var k in keywords) {
          if (k.toString().contains(termoNormalizado)) {
            match = true;
            break;
          }
        }
      }

      // B. Backup: Busca pelo Nome direto (Para garantir)
      if (!match && data['Nome'] != null) {
        final String nome = data['Nome'].toString().toLowerCase();
        if (nome.contains(termoNormalizado)) {
          match = true;
        }
      }

      // C. Backup: Busca pelo Código
      if (!match && data['codigoPaciente'] != null) {
        final String codigo = data['codigoPaciente'].toString().toLowerCase();
        if (codigo.contains(termoNormalizado)) {
          match = true;
        }
      }
    }

    // Se deu match, adiciona na lista final
    if (match) {
      resultadosFinais.add(doc.reference);
    }
  }

  return resultadosFinais;
}
