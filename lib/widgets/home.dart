import 'package:flutter/material.dart';
import 'package:imc_calc/widgets/scaffold_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScaffoldWidget(),
    );
  }
}
