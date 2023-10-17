//Api get https://praticle-service.s3.ap-south-1.amazonaws.com/sugar_home.json
import 'package:flutter/material.dart';

class Commen_tax extends StatelessWidget {
  final hint;
  final controll;
  final void Function(String)? onchange;
  final VoidCallback ontap;
  final String? Function(String?)? validations;
  const Commen_tax({
    Key? key,
    this.hint,
    this.validations,
    this.onchange,
    required this.ontap,
    this.controll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onTap: ontap,
        controller: controll,
        onChanged: onchange,
        validator: validations,
        decoration: InputDecoration(
            hintText: hint,
            focusColor: Colors.grey,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
