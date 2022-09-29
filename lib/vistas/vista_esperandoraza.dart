import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';


class VistaSolicitandoRaza extends StatelessWidget {
  const VistaSolicitandoRaza({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dame el nombre de la raza'),
        TextField(),
        TextButton(onPressed: () {
          
        }, child: const Text('ERROR'))
      ],
    );
  }
}

class VistaSolicitandoRazaSTF extends StatefulWidget {
  const VistaSolicitandoRazaSTF({super.key});

  @override
  State<VistaSolicitandoRazaSTF> createState() => _VistaSolicitandoRazaSTFState();
}

class _VistaSolicitandoRazaSTFState extends State<VistaSolicitandoRazaSTF> {
  bool isButtonActive = false;
  late TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dame el nombre de la raza'),
        TextField(controller: controller,),
        TextButton(onPressed: isButtonActive ? () {
          setState(() => isButtonActive = false,);
          var bloc = context.read<ClaseBloc>();
          bloc.add(RazaRecibida(controller.text));
          controller.clear();
        }:null, child: Text('Siguiente'))
      ],
    )
  }
}