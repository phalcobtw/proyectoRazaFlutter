import 'package:dogapi/raza_formada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';


class VistaRazaNoConfirmada extends StatelessWidget {
  final RazaFormada raza;
  const VistaRazaNoConfirmada({super.key, required this.raza});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Nombre: ${raza.valor} no existe'),
          TextButton(onPressed: (){
            final Blocbtw = context.read<ClaseBloc>();
            Blocbtw.add(Creado());
          }, child: const Text('Regresar')),
        ],
      ),
    );
  }
}