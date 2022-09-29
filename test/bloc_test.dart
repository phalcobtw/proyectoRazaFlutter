import 'package:bloc_test/bloc_test.dart';
import 'package:dogapi/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<ClaseBloc, EstadoVerificacion>(
    'emits [MyState] when MyEvent is added.',
    build: () => ClaseBloc(),
    act: (bloc) => bloc.add(Creado()),
    expect: () => const [isA<SolicitandoRaza>],
  );
}