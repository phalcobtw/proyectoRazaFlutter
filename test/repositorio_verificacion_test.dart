import 'package:dogapi/problemas.dart';
import 'package:dogapi/raza_formada.dart';
import 'package:dogapi/repositorio_verificacion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 group('TEST raza, subrazas y no existentes', (){
  RepositorioPruebaVerificacion repositorio = RepositorioPruebaVerificacion();
  test('solo raza', () {
    var resultado = repositorio.obtenerRegistroRaza(RazaFormada.constructor('Akita'));
    resultado.match((l) {
      expect(l, isA<sinSubRazas>());
    }, ((r) {
    }));
  });
  test('raza con subraza', () {
    var resultado = repositorio.obtenerRegistroRaza(RazaFormada.constructor('hound'));
    resultado.match((l) {

    }, (r) {
      expect(r.raza, equals("hound"));
      expect(r.subraza, equals("[afghan, basset, blood, english, ibizan, plott, walker]"));
    });
  });
  test('no existente', () {
    var resultado = repositorio.obtenerRegistroRaza(RazaFormada.constructor('kek'));
    resultado.match((l) {
      expect(l, isA<RazaNoRegistrada>());
    }, (r) {
      
    });
  });
 });
}