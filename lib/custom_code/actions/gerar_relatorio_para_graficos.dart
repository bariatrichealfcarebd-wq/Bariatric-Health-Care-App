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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> gerarRelatorioParaGraficos(
  List<DocumentReference> selectedItems,
  String patientUid,
) async {
  try {
    // Validações iniciais
    if (selectedItems == null || selectedItems.isEmpty) return 'Sem itens.';
    if (patientUid == null || patientUid.isEmpty) return 'Sem UID.';

    final firestore = FirebaseFirestore.instance;

    // 1. Configura dados de Data (para filtros de gráfico)
    final now = DateTime.now();
    const meses = [
      '',
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez'
    ];

    final mesNome = meses[now.month];
    final mesNumero = now.month;
    final ano = now.year;

    // 2. Inicia Batch (Gravação em Lote para ser rápido)
    WriteBatch batch = firestore.batch();

    // ATENÇÃO: Garanta que a coleção 'graficosSintomas' existe no seu Firestore
    final collectionRef = firestore.collection('graficosSintomas');

    // 3. Processa cada item selecionado
    for (var itemRef in selectedItems) {
      final doc = await itemRef.get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;

        // Cria uma nova referência para um novo documento
        DocumentReference newDocRef = collectionRef.doc();

        // Adiciona este sintoma ao lote
        batch.set(newDocRef, {
          'id_sintoma': doc.id,
          'nomeSintoma': data['nomeSintoma'] ?? 'Sem Nome',
          'id_nutriente': data['id_nutriente'] ?? [],
          'data_criacao': FieldValue.serverTimestamp(),

          // Campos essenciais para o Gráfico:
          'user_id': patientUid,
          'mes_nome': mesNome,
          'mes_numero': mesNumero,
          'ano': ano,
        });
      }
    }

    // 4. Salva tudo no Firebase de uma só vez
    await batch.commit();
    return 'sucesso';
  } catch (e) {
    return 'Erro: $e';
  }
}
