import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool validarCPF(String cpf) {
// Remover caracteres indesejados

  cpf = cpf.replaceAll(RegExp(r'[^\d]'), '');
  //Remover hífen "-" e ponto "."
  cpf = cpf.replaceAll("-", "").replaceAll(".", "");
  if (cpf.length != 11) {
    return false;
  }

  // Verificar se todos os dígitos são iguais
  for (int i = 0; i < 10; i++) {
    if (new RegExp(r'^[$i]{11}$').hasMatch(cpf)) {
      return false;
    }
  }

  // Calcular o primeiro dígito verificador
  int sum = 0;
  for (int i = 0; i < 9; i++) {
    int weight = 10 - i;
    sum += int.parse(cpf[i]) * weight;
  }
  int firstCheckDigit = 11 - (sum % 11);
  if (firstCheckDigit >= 10) {
    firstCheckDigit = 0;
  }

  // Calcular o segundo dígito verificador
  sum = 0;
  for (int i = 0; i < 10; i++) {
    int weight = 11 - i;
    sum += int.parse(cpf[i]) * weight;
  }
  int secondCheckDigit = 11 - (sum % 11);
  if (secondCheckDigit >= 10) {
    secondCheckDigit = 0;
  }

  // Verificar se os dígitos verificadores calculados são iguais
  // aos dígitos verificadores fornecidos
  return (int.parse(cpf[9]) == firstCheckDigit) &&
      (int.parse(cpf[10]) == secondCheckDigit);
}

List<String> gerarKeywords(
  String nome,
  String cpf,
) {
  // Junta o nome e o CPF num único texto
  String textoCompleto = nome + " " + cpf;

  // Converte para minúsculas e divide numa lista de palavras
  List<String> palavrasChave = textoCompleto.toLowerCase().split(' ');

  // Remove itens vazios da lista, caso haja espaços duplos
  palavrasChave.removeWhere((item) => item.isEmpty);

  return palavrasChave;
}

List<dynamic> prepararDadosGrafico(List<GraficosSintomasRecord>? docs) {
  // Cria um mapa para contar a frequência
  // 1. ADICIONE ESTA LINHA AQUI NO TOPO:
  // Se 'docs' for nulo (erro de rede, etc), usa uma lista vazia []
  docs = docs ?? [];

  // Cria um mapa para contar a frequência
  Map<String, int> contador = {};

  for (var doc in docs) {
    // Acessa o campo nomeSintoma direto do documento
    var sintoma = doc.nomeSintoma;

    if (sintoma != null && sintoma.isNotEmpty) {
      // Se já existe, soma 1. Se não, inicia com 1.
      contador[sintoma] = (contador[sintoma] ?? 0) + 1;
    }
  }

  // Transforma no formato que o Gráfico do FlutterFlow exige
  List<dynamic> resultado = [];

  contador.forEach((key, value) {
    // --- LÓGICA DE CORTAR O TEXTO ---
    String nomeExibicao = key;

    // Se o nome for maior que 15 letras, corta e adiciona "..."
    if (nomeExibicao.length > 15) {
      nomeExibicao = nomeExibicao.substring(0, 15) + '...';
    }
    // --------------------------------

    resultado.add({
      'name': nomeExibicao, // Usa o nome curto aqui
      'value': value // A quantidade
    });
  });

  // Ordena do maior para o menor para ficar bonito
  resultado.sort((a, b) => b['value'].compareTo(a['value']));

  return resultado;
}
