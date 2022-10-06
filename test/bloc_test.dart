import 'package:bloc_test/bloc_test.dart';
import 'package:dogapi/bloc.dart';
import 'package:dogapi/repositorio_verificacion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<ClaseBloc, EstadoVerificacion>(
    'emite el estado cuando sucede Creado',
    build: () => ClaseBloc(RepositorioPruebaVerificacion()),
    act: (bloc) => bloc.add(Creado()),
    expect: () => const [isA<SolicitandoRaza>],
  );
}