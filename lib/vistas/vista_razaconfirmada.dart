import 'package:dogapi/raza_formada.dart';
import 'package:dogapi/registro_raza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';

class VistaRazaConfirmada extends StatelessWidget {
  final RegistroRaza registro;
  final RazaFormada raza;
  const VistaRazaConfirmada({super.key, required this.registro, required this.raza});
 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Nombre: ${raza.valor}'),
          Text('SubRazas: ${registro.subraza}'),
          TextButton(onPressed: (){
            final Blocbtw = context.read<ClaseBloc>();
            Blocbtw.add(Creado());
          }, child: const Text('Regresar')),
        ],
      ),
    );
  }
}