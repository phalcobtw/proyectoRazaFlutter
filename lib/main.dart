import 'package:dogapi/vistas/vista_creandose.dart';
import 'package:dogapi/vistas/vista_esperandoraza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        ClaseBloc blocVerificacion=ClaseBloc();
        Future.delayed(Duration(seconds: 2),(){
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context){
          var estado = context.watch<ClaseBloc>().state;
          if (estado is Creandose) {
            return VistaCreandose();
          }
          if (estado is SolicitandoRaza) {
            return VistaSolicitandoRazaSTF();
          }
          return const Center(child: Text('ERROR'),);
        }),
      ),
    );
  }
}