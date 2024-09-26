import 'package:cloud_firestore/cloud_firestore.dart';
import 'imovel_basic_data_model.dart';
import 'imovel_all_data_model.dart';

class ImovelDAO {
  final CollectionReference imovelCollection =
      FirebaseFirestore.instance.collection('imoveis');

  // Obter lista de ImovelBasicData_Model por categoria
  Future<List<ImovelBasicData_Model>> listarImoveisBasicosPorCategoria(
      String categoria) async {
    try {
      QuerySnapshot snapshot = await imovelCollection
          .where('categoria', isEqualTo: categoria)
          .get();

      return snapshot.docs.map((doc) {
        return ImovelBasicData_Model.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Erro ao listar imóveis básicos por categoria: $e');
      throw e;
    }
  }

  // Obter lista de ImovelAllData_Model por categoria
  Future<List<ImovelAllData_Model>> listarImoveisCompletosPorCategoria(
      String categoria) async {
    try {
      QuerySnapshot snapshot = await imovelCollection
          .where('categoria', isEqualTo: categoria)
          .get();

      return snapshot.docs.map((doc) {
        return ImovelAllData_Model.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Erro ao listar imóveis completos por categoria: $e');
      throw e;
    }
  }

  // Obter um imóvel completo por ID
  Future<ImovelAllData_Model?> obterImovelCompletoPorId(String id) async {
    try {
      DocumentSnapshot doc = await imovelCollection.doc(id).get();

      if (doc.exists) {
        return ImovelAllData_Model.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter imóvel completo por ID: $e');
      throw e;
    }
  }
}
