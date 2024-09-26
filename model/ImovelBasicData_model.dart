class ImovelBasicData_Model {
  String titulo;
  String endereco;
  double preco;
  String basicDesc;
  String completeDesc;
  String imagemTitulo; // Nova propriedade para imagem principal

  // Construtor
  ImovelBasicData_Model({
    required this.titulo,
    required this.endereco,
    required this.preco,
    required this.basicDesc,
    required this.completeDesc,
    required this.imagemTitulo, // Adicionada
  });

  // Método para converter um objeto JSON em uma instância do modelo
  factory ImovelBasicData_Model.fromJson(Map<String, dynamic> json) {
    return ImovelBasicData_Model(
      titulo: json['titulo'],
      endereco: json['endereco'],
      preco: json['preco'],
      basicDesc: json['basicDesc'],
      completeDesc: json['completeDesc'],
      imagemTitulo: json['imagemTitulo'], // Adicionada
    );
  }

  // Método para converter uma instância do modelo em um objeto JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'endereco': endereco,
      'preco': preco,
      'basicDesc': basicDesc,
      'completeDesc': completeDesc,
      'imagemTitulo': imagemTitulo, // Adicionada
    };
  }
}
