import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'imovel_basic_data_model.dart';
import 'imovel_all_data_model.dart';

class ImovelDAO {
  final CollectionReference imovelCollection =
      FirebaseFirestore.instance.collection('imoveis');

  // Upload de imagem para o Firebase Storage
  Future<String> uploadImagem(File imagem, String path) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(path);
      final uploadTask = await storageRef.putFile(imagem);
      final url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Erro ao fazer upload da imagem: $e');
      throw e;
    }
  }

  // Listar imóveis básicos por categoria
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

  // Listar imóveis completos por categoria
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

  // Salvar imóvel completo com imagens
  Future<void> salvarImovelCompleto(ImovelAllData_Model imovel, File imagemTitulo, List<File> outrasImagens) async {
    try {
      // Upload da imagem do título
      String imagemTituloUrl = await uploadImagem(imagemTitulo, 'imoveis/${imovel.titulo}/imagemTitulo.jpg');

      // Upload das outras 4 imagens
      List<String> outrasImagensUrls = [];
      for (int i = 0; i < outrasImagens.length; i++) {
        String url = await uploadImagem(outrasImagens[i], 'imoveis/${imovel.titulo}/outrasImagens_$i.jpg');
        outrasImagensUrls.add(url);
      }

      // Salvar os dados do imóvel no Firestore
      await imovelCollection.add({
        'titulo': imovel.titulo,
        'endereco': imovel.endereco,
        'preco': imovel.preco,
        'basicDesc': imovel.basicDesc,
        'nameProprietario': imovel.nameProprietario,
        'numeroProprietario': imovel.numeroProprietario,
        'completeDesc': imovel.completeDesc,
        'bedrooms': imovel.bedrooms,
        'bathrooms': imovel.bathrooms,
        'categoria': imovel.categoria,
        'imagemTitulo': imagemTituloUrl, // Adicionada
        'outrasImagens': outrasImagensUrls, // Adicionada
      });
    } catch (e) {
      print('Erro ao salvar imóvel completo: $e');
      throw e;
    }
  }
}
