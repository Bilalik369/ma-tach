import 'package:flutter/material.dart';
import '../../models/centre_aide_models.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/question_item.dart';
import '../widgets/help_section.dart';

class CentreAideScreen extends StatefulWidget {
  const CentreAideScreen({Key? key}) : super(key: key);

  @override
  State<CentreAideScreen> createState() => _CentreAideScreenState();
}

class _CentreAideScreenState extends State<CentreAideScreen> {
  final TextEditingController searchController = TextEditingController();
  
  final List<FrequentQuestion> frequentQuestions = [
    FrequentQuestion(
      id: '1',
      question: 'Comment suis-je payé ?',
      answer: 'Vous êtes payé via virement bancaire ou PayPal selon vos préférences.',
    ),
    FrequentQuestion(
      id: '2',
      question: 'Que se passe-t-il si j\'ai un accident ?',
      answer: 'En cas d\'accident, contactez immédiatement notre support d\'urgence.',
    ),
    FrequentQuestion(
      id: '3',
      question: 'Comment annuler une course ?',
      answer: 'Vous pouvez annuler une course depuis l\'application jusqu\'à 5 minutes avant le départ.',
    ),
    FrequentQuestion(
      id: '4',
      question: 'Comment signaler un problème ?',
      answer: 'Utilisez la fonction de signalement dans l\'application ou contactez le support.',
    ),
    FrequentQuestion(
      id: '5',
      question: 'Comment puis-je changer mon mode de paiement ?',
      answer: 'Allez dans les paramètres de votre compte pour modifier votre mode de paiement.',
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _handleQuestionTap(FrequentQuestion question) {
    // Handle question tap - could navigate to detail page
    print('Question tapped: ${question.question}');
  }

  void _handleContactSupport() {
    // Handle contact support
    print('Contact support');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Centre d\'aide',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchBarWidget(
                controller: searchController,
                hintText: 'Rechercher de l\'aide',
                onChanged: (value) {
                 
                },
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Questions fréquemment posées',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 16),

         
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: frequentQuestions.map((question) => QuestionItem(
                  question: question,
                  onTap: () => _handleQuestionTap(question),
                )).toList(),
              ),
            ),

            const SizedBox(height: 32),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: HelpSection(
                onContactSupport: _handleContactSupport,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
