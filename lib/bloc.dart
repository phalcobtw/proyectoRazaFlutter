import 'package:flutter_bloc/flutter_bloc.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}

class RazaRecibida extends EventoVerificacion{}

class RazaConfirmada extends EventoVerificacion{}


class EstadoVerificacion{}

class Creandose extends EstadoVerificacion{}

class SolicitandoRaza extends EstadoVerificacion{}

class EsperandoConfirmacionRaza extends EstadoVerificacion{}

class MostrarRaza extends EstadoVerificacion{}

class MostrarRazaNoConfirmada extends EstadoVerificacion{}

class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  ClaseBloc() : super((Creandose())) {
    on<Creado>((event, emit) {
      emit(SolicitandoRaza());
    });
  }
}