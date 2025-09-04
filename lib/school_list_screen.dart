import 'package:flutter/material.dart';
import 'school.dart';
import 'school_card.dart';
import 'school_detail_screen.dart';
import 'page_transition.dart';

class SchoolListScreen extends StatelessWidget {
  const SchoolListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schools in Need"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleSchools.length,
        itemBuilder: (context, index) {
          final school = sampleSchools[index];
          return SchoolCard(
            school: school,
            onTap: () {
              Navigator.of(context).push(FadeSlidePageRoute(page: SchoolDetailScreen(school: school)));
            },
          );
        },
      ),
    );
  }
}