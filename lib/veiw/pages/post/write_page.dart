import 'package:flutter/material.dart';

import '../../../util/vaildator_util.dart';
import '../../components/custom_elevated_buttom.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: _title,
                hint: "Title",
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                controller: _content,
                hint: "Content",
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "글쓰기",
                funPageRoute: () async {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
