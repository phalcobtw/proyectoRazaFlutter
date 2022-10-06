const String mensajeRegistroRaza = 'Error de registro de raza';
const String mensajeCampoVacio = 'Sin Raza/Subrazas';

class RegistroRaza{
  late final String raza;
  late final String subraza;
  RegistroRaza._(this.raza,this.subraza);
  factory RegistroRaza.constructor(
    {
      required String propuestaRaza,
      required String propuestasubRaza
    }
  ){
    if (propuestaRaza.trim().isEmpty) {
      throw mensajeRegistroRaza;
    }
    RegistroRaza._(propuestaRaza, propuestasubRaza);
    final resultado = RegistroRaza._(propuestaRaza, propuestasubRaza);
    return resultado;
  }
}