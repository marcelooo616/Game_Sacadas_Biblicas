class Personagem {
  final String? id;
  final String? nome;
  final List<String>? dicas;

  Personagem({this.id,this.nome, this.dicas});

  factory Personagem.fromMap(Map<String, dynamic> map){
    return Personagem(
      id: map['id'],
      nome: map['nome'],
      dicas: List<String>.from(map['dicas'])
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nome': nome,
      'dicas': dicas
    };
  }
}