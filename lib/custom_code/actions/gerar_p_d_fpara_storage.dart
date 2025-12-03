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

// Importações necessárias
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

Future<String> gerarPDFparaStorage(
  List<DocumentReference> selectedItems,
  String patientUid, // ID técnico do Firebase (para organizar pastas)
  String codigoPaciente, // <--- NOVO: O ID bonito (ex: MA-58291)
) async {
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
      return Future.error('Nenhum item selecionado.');
    }

    if (patientUid == null || patientUid.isEmpty) {
      return Future.error('UID do paciente está ausente.');
    }

    // Tratamento caso o código venha vazio
    String displayId = (codigoPaciente != null && codigoPaciente.isNotEmpty)
        ? codigoPaciente
        : 'ID-N/A';

    // Gera o PDF passando o ID bonito
    final pdf = await _generatePdfContent(selectedDocs, displayId);
    final Uint8List pdfBytes = await pdf.save();

    final timestamp = DateTime.now().toIso8601String();

    // --- ALTERAÇÃO AQUI: Nome do arquivo agora usa o ID Personalizado ---
    // Exemplo: Relatorio_MA-58291_2023-10-25.pdf
    final fileName = 'Relatorio_${displayId}_$timestamp.pdf';

    // A pasta continua sendo pelo UID original para segurança e organização do banco
    final filePath = 'relatorios/$patientUid/$fileName';

    final ref = FirebaseStorage.instance.ref().child(filePath);
    await ref.putData(pdfBytes);
    final String downloadUrl = await ref.getDownloadURL();

    // Guardar as informações do PDF na coleção de índice
    await FirebaseFirestore.instance.collection('relatorios_Questionario').add({
      'url_pdf': downloadUrl,
      'data_criacao': FieldValue.serverTimestamp(),
      'nome_do_arquivo': fileName,
      'user_id': patientUid, // Referência técnica
      'codigo_paciente':
          displayId // Referência visual (útil para buscas futuras)
    });

    return downloadUrl;
  } catch (e) {
    print('Erro ao gerar ou enviar PDF para o Storage: $e');
    return Future.error('Falha ao processar o PDF: $e');
  }
}

// Personalização do PDF
Future<pw.Document> _generatePdfContent(
    List<DocumentSnapshot> documents, String displayId) async {
  // Recebe o ID bonito
  final pdf = pw.Document();

  // Carregar as fontes necessárias
  final font = await PdfGoogleFonts.nunitoRegular();
  final boldFont = await PdfGoogleFonts.nunitoBold();
  final titleFont = await PdfGoogleFonts.notoSerifRegular();

  // Definir as cores
  final color1 = PdfColor.fromHex('#B1CEC3');
  final color2 = PdfColors.white;
  final darkGreen = PdfColor.fromHex('#006400');

  // Preparar os dados da tabela
  final dataForTable = documents.map((doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    final String nomeSintoma =
        data['nomeSintoma'] as String? ?? 'Nome não encontrado';
    final List<String> nutrientes =
        List<String>.from(data['id_nutriente'] ?? ['N/A']);
    return [
      nomeSintoma,
      nutrientes.join(', '),
    ];
  }).toList();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return [
          // Cabeçalho
          pw.Center(
            child: pw.Text(
              'Bariatric Health Care',
              style: pw.TextStyle(
                font: titleFont,
                fontSize: 26,
                color: darkGreen,
              ),
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text('Relatório de Sintomas',
              style: pw.TextStyle(font: boldFont, fontSize: 20)),
          pw.SizedBox(height: 10),

          // --- ALTERAÇÃO AQUI: Mostra o ID Personalizado ---
          pw.Text('Paciente ID: $displayId',
              style: pw.TextStyle(font: font, fontSize: 14)),

          pw.SizedBox(height: 5),
          pw.Text(
              'Gerado em: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
              style: pw.TextStyle(font: font, fontSize: 10)),
          pw.Divider(height: 30),
          pw.SizedBox(height: 10),

          // Tabela
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.grey300),
            columnWidths: {
              0: const pw.FlexColumnWidth(1.5),
              1: const pw.FlexColumnWidth(1),
            },
            children: [
              // Cabeçalho da tabela
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                children: ['Sintoma', 'Nutrientes Associados'].map((header) {
                  return pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child:
                          pw.Text(header, style: pw.TextStyle(font: boldFont)));
                }).toList(),
              ),
              // Linhas de dados
              ...dataForTable.asMap().entries.map((entry) {
                final index = entry.key;
                final rowData = entry.value;
                return pw.TableRow(
                  decoration: pw.BoxDecoration(
                    color: index % 2 == 0 ? color1 : color2,
                  ),
                  children: rowData.map((cellData) {
                    return pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child:
                            pw.Text(cellData, style: pw.TextStyle(font: font)));
                  }).toList(),
                );
              }),
            ],
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
                    .copyWith(color: PdfColors.grey)));
      },
    ),
  );
  return pdf;
}
