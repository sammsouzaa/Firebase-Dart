import 'imovel_dao.dart';
import 'imovel_basic_data_model.dart';
import 'imovel_all_data_model.dart';

class ImovelController {
  final ImovelDAO _imovelDAO = ImovelDAO();

  // Listar imóveis básicos por categoria
  Future<List<ImovelBasicData_Model>> listarImoveisBasicosPorCategoria(
      String categoria) async {
    if (categoria.isNotEmpty) {
      return await _imovelDAO.listarImoveisBasicosPorCategoria(categoria);
    } else {
      throw Exception('A categoria não pode ser vazia!');
    }
  }

  // Listar imóveis completos por categoria
  Future<List<ImovelAllData_Model>> listarImoveisCompletosPorCategoria(
      String categoria) async {
    if (categoria.isNotEmpty) {
      return await _imovelDAO.listarImoveisCompletosPorCategoria(categoria);
    } else {
      throw Exception('A categoria não pode ser vazia!');
    }
  }

  // Obter um imóvel completo por ID
  Future<ImovelAllData_Model?> obterImovelCompletoPorId(String id) async {
    if (id.isNotEmpty) {
      return await _imovelDAO.obterImovelCompletoPorId(id);
    } else {
      throw Exception('O ID não pode ser vazio!');
    }
  }
}
