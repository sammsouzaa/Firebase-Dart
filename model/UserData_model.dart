class UserData_Model {
    
  String primeironome;
  String sobrenome;
  String email;
  String n_celular;

  // Construtor
  UserData_Model({
    required this.primeironome,
    required this.sobrenome,
    required this.email,
    required this.n_celular,
  });

  // Método para converter um objeto JSON em uma instância do modelo
  factory UserData_Model.fromJson(Map<String, dynamic> json) {
    return UserData_Model(
      primeironome: json['primeironome'],
      sobrenome: json['sobrenome'],
      email: json['email'],
      n_celular: json['n_celular'],
    );
  }

  // Método para converter uma instância do modelo em um objeto JSON
  Map<String, dynamic> toJson() {
    return {
      'primeironome': primeironome,
      'sobrenome': sobrenome,
      'email': email,
      'n_celular': n_celular,
    };
  }
}
