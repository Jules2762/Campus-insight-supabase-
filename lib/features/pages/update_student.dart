import 'package:flutter/material.dart';

import 'package:projet_m2/features/widgets/custom_scaffold.dart';
import 'package:projet_m2/features/widgets/input.dart';
import 'package:projet_m2/features/widgets/main_container.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({super.key});
  @override
  State<UpdateStudentPage> createState()=>_StudentPageState();
}
class _StudentPageState extends State<UpdateStudentPage>{
  final TextEditingController numEtController=TextEditingController();
  final TextEditingController nomController=TextEditingController();
  final TextEditingController mathController=TextEditingController();
  final TextEditingController physController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Mise à jour étudiant",
      body: MainContainer(body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Input(controller: numEtController)
        ],
      )),
    );
  }
}
