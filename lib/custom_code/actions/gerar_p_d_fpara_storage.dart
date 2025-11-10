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
// Importe o intl para formatação de data
import 'package:intl/intl.dart';

// MUDANÇA 1: A função agora recebe o 'patientUid' em vez de 'userName' e 'userId'.
// O 'patientUid' é o campo 'uid' do seu documento de Paciente.
Future<String> gerarPDFparaStorage(
  List<DocumentReference> selectedItems,
  String patientUid, // <-- Este é o 'uid' do paciente
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

    // 2. Gerar o conteúdo do PDF, passando o UID do paciente para pseudonimização
    // MUDANÇA 2: Passando 'patientUid' em vez de 'userName'
    final pdf = await _generatePdfContent(selectedDocs, patientUid);
    final Uint8List pdfBytes = await pdf.save();

    // 3. Fazer o upload para o Firebase Storage usando o UID
    // MUDANÇA 3: O nome do arquivo é genérico e o caminho usa o UID do paciente.
    final timestamp = DateTime.now().toIso8601String();
    final fileName = 'relatorio_$timestamp.pdf';
    // O caminho agora é 'relatorios/[UID_DO_PACIENTE]/[NOME_DO_ARQUIVO]'
    // Isso facilita apagar todos os relatórios de um usuário
    final filePath = 'relatorios/$patientUid/$fileName';

    final ref = FirebaseStorage.instance.ref().child(filePath);
    await ref.putData(pdfBytes);
    final String downloadUrl = await ref.getDownloadURL();

    // 4. Guardar as informações do PDF na coleção de índice
    // MUDANÇA 4: Removemos 'nome_paciente' e usamos 'user_id' (que é o patientUid)
    await FirebaseFirestore.instance.collection('relatorios_Questionario').add({
      // 'nome_paciente': userName, // <-- REMOVIDO (PII)
      'url_pdf': downloadUrl,
      'data_criacao': FieldValue.serverTimestamp(),
      'nome_do_arquivo': fileName,
      'user_id': patientUid, // <-- Este é o link para o paciente (pseudônimo)
    });

    return downloadUrl;
  } catch (e) {
    print('Erro ao gerar ou enviar PDF para o Storage: $e');
    return Future.error('Falha ao processar o PDF: $e');
  }
}

// Função auxiliar com todas as personalizações de layout
// MUDANÇA 5: Recebe 'patientUid' em vez de 'userName'
Future<pw.Document> _generatePdfContent(
    List<DocumentSnapshot> documents, String patientUid) async {
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

  // MUDANÇA 6: Gerar um ID curto e pseudônimo para exibir no PDF
  // (Ex: usa os últimos 6 caracteres do UID)
  final shortUid = patientUid.length > 6
      ? patientUid.substring(patientUid.length - 6)
      : patientUid;

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

          // MUDANÇA 7: Substituído o nome pelo ID pseudônimo
          pw.Text('Paciente ID: ...$shortUid',
              style: pw.TextStyle(font: font, fontSize: 14)),

          pw.SizedBox(height: 5),
          pw.Text(
              'Gerado em: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
              style: pw.TextStyle(font: font, fontSize: 10)),
          pw.Divider(height: 30),
          pw.SizedBox(height: 10),

          // Tabela (sem alteração)
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
