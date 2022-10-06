import 'package:dogapi/problemas.dart';
import 'package:dogapi/raza_formada.dart';
import 'package:dogapi/repositorio_verificacion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}

class RazaRecibida extends EventoVerificacion{
  final RazaFormada raza;
  RazaRecibida(this.raza);
}

class RazaConfirmada extends EventoVerificacion{}




class EstadoVerificacion{}

class Creandose extends EstadoVerificacion{}

class SolicitandoRaza extends EstadoVerificacion{}

class EsperandoConfirmacionRaza extends EstadoVerificacion{}

class MostrarRaza extends EstadoVerificacion{

}

class MostrarRazaNoConfirmada extends EstadoVerificacion{
  final RazaFormada raza;
  MostrarRazaNoConfirmada(this.raza);
}
class MostrarSinSubraza extends EstadoVerificacion{
  final RazaFormada raza;
  MostrarSinSubraza(this.raza);
}

class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  final RepositorioVerificacion _repositorioVerificacion;
  ClaseBloc(this._repositorioVerificacion) : super((Creandose())) {
    on<Creado>((event, emit) {
      emit(SolicitandoRaza());
    });
    on<RazaRecibida>((event, emit) {
      emit(EsperandoConfirmacionRaza());
      final resultado = _repositorioVerificacion.obtenerRegistroRaza(event.raza);
      resultado.match((l) {
        if (l is VersionIncorrectaJson) emit(MostrarErrorVersion());
        if(l is RazaNoRegistrada) emit(MostrarRazaNoRegistrada());
      }, (r) => null);
    },);
  }
}