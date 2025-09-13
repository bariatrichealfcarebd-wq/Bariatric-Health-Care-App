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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<String> gerarPDFparaStorage(
  List<DocumentReference> selectedItems,
  String userCpf, // CPF do utilizador logado para nomear o ficheiro
) async {
  // Esta ação gera o PDF e faz o upload para o Firebase Storage,
  // retornando a URL de download do ficheiro.

  try {
    // 1. Obter os dados dos documentos selecionados
    final List<DocumentSnapshot> selectedDocs = [];
    if (selectedItems != null && selectedItems.isNotEmpty) {
      for (var itemRef in selectedItems) {
        final doc = await itemRef.get();
        if (doc.exists) {
          selectedDocs.add(doc);
        }
      }
    }

    if (selectedDocs.isEmpty) {
      print('A lista de itens selecionados está vazia.');
      return Future.error('Nenhum item selecionado.');
    }

    // 2. Gerar o conteúdo do PDF
    final pdf = await _generatePdfContent(selectedDocs);
    final Uint8List pdfBytes = await pdf.save();

    // 3. Fazer o upload para o Firebase Storage
    final fileName =
        'relatorio_${userCpf}_${DateTime.now().toIso8601String()}.pdf';
    final filePath =
        'relatorios/$fileName'; // Guarda numa pasta chamada "relatorios"

    // Cria a referência no Firebase Storage
    final ref = FirebaseStorage.instance.ref().child(filePath);

    // Envia os bytes do PDF
    await ref.putData(pdfBytes);

    // Obtém a URL de download do ficheiro
    final String downloadUrl = await ref.getDownloadURL();

    print('PDF enviado para o Firebase Storage com sucesso!');
    print('URL de Download: $downloadUrl');

    // Retorna a URL para que você possa usá-la no FlutterFlow
    return downloadUrl;
  } catch (e) {
    print('Erro ao gerar ou enviar PDF para o Storage: $e');
    return Future.error('Falha ao processar o PDF: $e');
  }
}

// Função auxiliar para gerar o conteúdo do PDF, agora usando os seus campos
Future<pw.Document> _generatePdfContent(
    List<DocumentSnapshot> documents) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.nunitoRegular();
  final boldFont = await PdfGoogleFonts.nunitoBold();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return [
          pw.Header(
            level: 0,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Relatório de Sintomas',
                    style: pw.TextStyle(font: boldFont, fontSize: 24)),
                pw.Text(
                    'Gerado em: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}'),
              ],
            ),
          ),
          pw.Divider(),
          pw.SizedBox(height: 20),
          pw.Table.fromTextArray(
            headerAlignment: pw.Alignment.centerLeft,
            cellAlignment: pw.Alignment.centerLeft,
            headerStyle: pw.TextStyle(font: boldFont, fontSize: 12),
            cellStyle: pw.TextStyle(font: font, fontSize: 10),
            headers: ['Sintoma', 'Nutrientes Associados', 'CPF do Utilizador'],
            data: documents.map((doc) {
              final data = doc.data() as Map<String, dynamic>? ?? {};

              // Usando os nomes dos campos do seu print
              final String nomeSintoma =
                  data['nomeSintoma'] as String? ?? 'Nome não encontrado';
              final String userCpf =
                  data['cpf_usuario'] as String? ?? 'CPF não encontrado';
              final List<String> nutrientes =
                  List<String>.from(data['id_nutriente'] ?? ['N/A']);

              return [
                nomeSintoma,
                nutrientes.join(', '),
                userCpf,
              ];
            }).toList(),
          ),
        ];
      },
      footer: (pw.Context context) {
        return pw.Container(
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: pw.Text(
            'Página ${context.pageNumber} de ${context.pagesCount}',
            style: pw.Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
    ),
  );
  return pdf;
}
