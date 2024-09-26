class ImovelAllData_Model {
    
  String titulo;
  String endereco;
  double preco;
  String basicDesc;
  String nameProprietario;
  String numeroProprietario;
  String completeDesc;
  int bedrooms;
  int bathrooms;
  String categoria;

  // Construtor
  ImovelAllData_Model({
    required this.titulo,
    required this.endereco,
    required this.preco,
    required this.basicDesc,
    required this.nameProprietario,
    required this.numeroProprietario,
    required this.completeDesc,
    required this.bedrooms,
    required this.bathrooms,
    required this.categoria,
  });

  // Método para converter um objeto JSON em uma instância do modelo
  factory ImovelAllData_Model.fromJson(Map<String, dynamic> json) {
    return ImovelAllData_Model(
      titulo: json['titulo'],
      endereco: json['endereco'],
      preco: json['preco'],
      basicDesc: json['basicDesc'],
      nameProprietario: json['nameProprietario'],
      numeroProprietario: json['numeroProprietario'],
      completeDesc: json['completeDesc'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      categoria: json['categoria'],
    );
  }

  // Método para converter uma instância do modelo em um objeto JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'endereco': endereco,
      'preco': preco,
      'basicDesc': basicDesc,
      'nameProprietario': nameProprietario,
      'numeroProprietario': numeroProprietario,
      'completeDesc': completeDesc,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'categoria': categoria,
    };
  }
}
