const String mensajeRegistroRaza = 'Error de registro de raza';
const String mensajeCampoVacio = 'Sin Valor';

class RegistroRaza{
  late String raza;
  late String subraza;
  RegistroRaza._(this.raza,this.subraza);
  factory RegistroRaza.constructor(
    {
      required String propuestaRaza,
      required String propuestaSubRaza
    }
  ){
    String valorRaza = propuestaRaza;
    if (valorRaza.isEmpty) {
      throw mensajeRegistroRaza;
    }
    propuestaRaza = propuestaRaza.trim().isEmpty ? mensajeCampoVacio : propuestaRaza;
    propuestaSubRaza = propuestaSubRaza.trim().isEmpty ? mensajeCampoVacio : propuestaSubRaza;

    final resultado = RegistroRaza._(propuestaRaza, propuestaSubRaza);

    return resultado;
    
  }
}