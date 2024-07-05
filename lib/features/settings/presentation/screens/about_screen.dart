import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_color.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.grey1,
        ),
        title: Text(
          'About',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          """Welcome to Quiz'ko, the educational application designed for students at the Ecole Nationale d'Informatique Fianarantsoa in Madagascar!
          \nQuiz'ko is a fun, interactive platform designed to enrich your computer knowledge and prepare you for the challenges of today's digital world. Whether you're in your first year or your final year, Quiz'ko offers a wide range of features to support you throughout your course.
          \nFonctionnalités principales:
          \u2022 Quiz variés sur des sujets informatiques essentiels: Approfondissez vos connaissances sur des thèmes tels que le hardware, le software, la programmation, les réseaux informatiques, la cybersécurité et bien plus encore.
          \u2022 Niveaux de difficulté ajustables: Choisissez un niveau de difficulté adapté à vos compétences et progressez à votre rythme.
          \u2022 Système de points et de récompenses: Gagnez des points en répondant correctement aux questions et débloquez des récompenses motivantes.
          \u2022 Suivi des progrès: Suivez vos performances individuelles et identifiez vos points forts et faibles pour une meilleure maîtrise des concepts informatiques.
          \u2022 Apprentissage par le jeu: Participez à des quiz divertissants et interactifs qui rendent l'apprentissage plus agréable et stimulant.
          \u2022 Confrontation entre pairs: Défiez vos camarades de classe et mesurez vos connaissances informatiques dans des classements amusants.
          \u2022 Accès hors ligne: Étudiez à votre rythme, où que vous soyez, même sans connexion internet.
          \nDeveloped by a talented team of ENI students themselves: Mialy Rakotonirina, Aina Tiavina, Antonio Ramanandraibe and Manohisafidy Robuste.
          """,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColor.purple1),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: const [
        Text('v1.0.0')
      ],
    );
  }
}
