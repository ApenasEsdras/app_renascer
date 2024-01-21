// cliente_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sistemarenascerdaesperanca/models/cliente_models.dart';

class ResponsavelRepository {
  Future<List<Responsavel>> fetchResponsavels() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('responsaveis').get();

      if (querySnapshot.docs.isNotEmpty) {
        final clienteList = <Responsavel>[];

        for (final doc in querySnapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;

          final nome = data['nome'];
          final fone = data['fone'];
          final email = data['email'];
          final idade = data['idade'];
          final cpf = data['cpf'];
          final endereco = data['endereco'];

          final clienteData = Responsavel(
            nome: nome,
            fone: fone,
            idade: idade,
            email: email,
            cpf: cpf,
            endereco: endereco,
          );
          clienteList.add(clienteData);
        }

        return clienteList;
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao carregar clientes: $e');
      }
      return [];
    }
  }

  Future<void> deleteResponsavel(Responsavel cliente) async {
    try {
      await FirebaseFirestore.instance
          .collection('responsaveis')
          .doc(cliente.nome!) // Substitua pelo campo identificador correto
          .delete();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao excluir cliente: $e');
      }
    }
  }
}
