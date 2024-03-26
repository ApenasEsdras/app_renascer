// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sistemarenascerdaesperanca/app/modules/cadastro/cadastraResponsavel/cadastro_responsavel_controller.dart';
import 'package:sistemarenascerdaesperanca/app/modules/cadastro/cadastraResponsavel/cadastro_responsavel_form.dart';
import 'package:sistemarenascerdaesperanca/styles/colors_app.dart';
import 'package:sistemarenascerdaesperanca/widgets/appbar_custom.dart';

class CadastroResponsavelPage extends StatefulWidget {
  const CadastroResponsavelPage({Key? key}) : super(key: key);

  @override
  _CadastroResponsavelPageState createState() =>
      _CadastroResponsavelPageState();
}

class _CadastroResponsavelPageState extends State<CadastroResponsavelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showFilterIcon: false,
        leftContent: Text(
          'Cadastrar Responsável',
          style: TextStyle(
            color: ColorsApp.instance.CinzaMedio2,
            fontSize: 24,
            fontFamily: 'roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CadastroResponsavelForm(
                  controller: CadastroResponsavelController(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
