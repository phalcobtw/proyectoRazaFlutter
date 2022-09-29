import 'package:dogapi/vistas/vista_creandose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

void main() {
  runApp(AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) { 
        ClaseBloc blocVerificacion = ClaseBloc();
        Future.delayed(Duration(seconds: 2),(() {
          blocVerificacion.add(Creado());
        }));
        return blocVerificacion;
      },
      child: Container(),
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
          return const Center(child: Text('ERROR'),);
        }),
      ),
    );
  }
}