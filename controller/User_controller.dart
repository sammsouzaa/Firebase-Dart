import 'user_data_model.dart';
import 'user_data_dao.dart';

class UserController {
  final UserDataDAO _userDAO = UserDataDAO();

  // Cadastrar usuário
  Future<void> cadastrarUser(
      String primeironome, String sobrenome, String email, String n_celular) async {
    if (primeironome.isNotEmpty &&
        sobrenome.isNotEmpty &&
        email.isNotEmpty &&
        n_celular.isNotEmpty) {
      UserData_Model user = UserData_Model(
        primeironome: primeironome,
        sobrenome: sobrenome,
        email: email,
        n_celular: n_celular,
      );

      await _userDAO.cadastrarUser(user);
    } else {
      throw Exception('Preencha todos os campos corretamente!');
    }
  }

  // Listar usuários por nome
  Future<List<UserData_Model>> listarUsers(String primeironome) async {
    return await _userDAO.listarUsers(primeironome);
  }

  // Alterar usuário
  Future<void> alterarUser(
      String id, String primeironome, String sobrenome, String email, String n_celular) async {
    if (primeironome.isNotEmpty &&
        sobrenome.isNotEmpty &&
        email.isNotEmpty &&
        n_celular.isNotEmpty) {
      UserData_Model user = UserData_Model(
        id: id,
        primeironome: primeironome,
        sobrenome: sobrenome,
        email: email,
        n_celular: n_celular,
      );

      await _userDAO.alterarUser(user);
    } else {
      throw Exception('Preencha todos os campos corretamente!');
    }
  }

  // Excluir usuário
  Future<void> excluirUser(String id) async {
    await _userDAO.excluirUser(id);
  }
}
