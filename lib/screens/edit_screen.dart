import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regis_me/providers/entreprise_provider.dart';
import 'package:regis_me/widgets/entrepriseListWidget.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entrpriseData = Provider.of<EntrepriseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Prospects'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: entrpriseData.allItems().length,
          itemBuilder: (_, i) => Column(
            children: [
         EntrepriseListWidget(entreprise: entrpriseData.allItems()[i]),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
