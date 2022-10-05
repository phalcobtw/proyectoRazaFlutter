class RazaFormada{
  late String valor;

  RazaFormada._(this.valor);

  factory RazaFormada.constructor(String propuesta){
    if (propuesta.trim().isEmpty) {
      throw('Raza mal formada');
    }
    return RazaFormada._(propuesta);
  }
}