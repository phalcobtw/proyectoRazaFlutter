import 'package:dogapi/raza_formada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';

class VistaSinSubrazas extends StatelessWidget {
  final RazaFormada raza;
  const VistaSinSubrazas({super.key, required this.raza});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Nombre: ${raza.valor}'),
        Text('Esta raza no cuenta con subrazas'),
        TextButton(onPressed: (){
            final Blocbtw = context.read<ClaseBloc>();
            Blocbtw.add(Creado());
          }, child: const Text('Regresar')),
      ],
    );
  }
}


