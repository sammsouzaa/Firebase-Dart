import 'dart:io';
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

  // Salvar imóvel completo com imagens
  Future<void> salvarImovelCompleto(ImovelAllData_Model imovel, File imagemTitulo, List<File> outrasImagens) async {
    if (imovel != null && imagemTitulo != null && outrasImagens.length == 4) {
      await _imovelDAO.salvarImovelCompleto(imovel, imagemTitulo, outrasImagens);
    } else {
      throw Exception('É necessário fornecer todas as 5 imagens (1 título + 4 outras).');
    }
  }
}
