import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_data_model.dart';

class UserDataDAO {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  // Cadastrar usuário
  Future<void> cadastrarUser(UserData_Model user) async {
    try {
      await userCollection.add(user.toJson());
    } catch (e) {
      print('Erro ao cadastrar usuário: $e');
      throw e;
    }
  }

  // Alterar usuário
  Future<void> alterarUser(UserData_Model user) async {
    try {
      await userCollection.doc(user.id).update(user.toJson());
    } catch (e) {
      print('Erro ao alterar usuário: $e');
      throw e;
    }
  }

  // Excluir usuário
  Future<void> excluirUser(String userId) async {
    try {
      await userCollection.doc(userId).delete();
    } catch (e) {
      print('Erro ao excluir usuário: $e');
      throw e;
    }
  }

  // Listar usuários por nome
  Future<List<UserData_Model>> listarUsers(String primeironome) async {
    try {
      QuerySnapshot snapshot = await userCollection
          .where('primeironome', isEqualTo: primeironome)
          .get();

      return snapshot.docs.map((doc) {
        return UserData_Model.fromJson(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Erro ao listar usuários: $e');
      throw e;
    }
  }
}
