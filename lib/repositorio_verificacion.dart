
import 'dart:convert';

import 'package:dogapi/problemas.dart';
import 'package:dogapi/raza_formada.dart';
import 'package:dogapi/registro_raza.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioVerificacion{
Either<Problema,RegistroRaza> obtenerRegistroRaza(RazaFormada raza);

}





class RepositorioPruebaVerificacion extends RepositorioVerificacion{
final String hound = """{"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"}""";
final String sinsubraza = """{"message":[],"status":"success"}""";
final String noExistente = """{"status":"error","message":"Breed not found (sub breed does not exist)","code":404}""";

Either<Problema, RegistroRaza> obtenerRegistroRazaJSON(String documento, String razaX){
 Map<String,dynamic> documentoJ = jsonDecode(documento);
 Either<Problema,String> subRaza = obtenerValorSubraza(documentoJ);
 Either<Problema,String> raza = obtenerValorSubraza(documentoJ);
 String propuestaSubrazas;
if ([subRaza].any((element) => element.isLeft())) {
  return Left(sinSubRazas());
  
}
else{
  propuestaSubrazas = documentoJ["message"].toString();
}
if ([raza].any((element) => element.isLeft())) {
  return Left(RazaNoRegistrada());
}

return Right(RegistroRaza.constructor(propuestaRaza: razaX, propuestasubRaza: propuestaSubrazas));

}

Either<Problema, String> obtenerValorSubraza(Map<String,dynamic> documentoJson){
  if (documentoJson["message"].isEmpty) return Left(sinSubRazas());
  return right(documentoJson["message"].toString());
}
Either<Problema, String> obtenerValorRaza(Map<String,dynamic> documentoJson){
  if (documentoJson["status"] == "error") return Left(RazaNoRegistrada());
  return right(documentoJson["status"]);
}

@override
Either<Problema,RegistroRaza> obtenerRegistroRaza(RazaFormada raza){
  if (raza.valor == 'hound') {
    return obtenerRegistroRazaJSON(hound,raza.valor);
  }
  if (raza.valor == 'Akita') {
    return obtenerRegistroRazaJSON(sinsubraza,raza.valor);
  }
  if (raza.valor == 'kek') {
    return obtenerRegistroRazaJSON(noExistente,raza.valor);
  }
  return Left(RazaNoRegistrada());
}

}