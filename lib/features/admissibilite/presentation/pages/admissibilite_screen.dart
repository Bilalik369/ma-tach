import 'package:flutter/material.dart';
import '../widgets/eligibility_toggle.dart';
import '../widgets/document_upload_section.dart';
import '../widgets/message_text_field.dart';

class AdmissibiliteScreen extends StatefulWidget {
  const AdmissibiliteScreen({Key? key}) : super(key: key);

  @override
  State<AdmissibiliteScreen> createState() => _AdmissibiliteScreenState();
}

class _AdmissibiliteScreenState extends State<AdmissibiliteScreen> {
  bool isOuiSelected = true;
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void _handleUpload() {
  
    print('Upload documents');
  }

  void _handleSubmit() {
   
    print('Submit form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6f7f8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Admissibilité à la TVA',
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
            const SizedBox(height: 24),
            
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Êtes-vous éligible à la TVA?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  EligibilityToggle(
                    isOuiSelected: isOuiSelected,
                    onChanged: (value) {
                      setState(() {
                        isOuiSelected = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Télécharger les documents justificatifs',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DocumentUploadSection(
                    onUploadTap: _handleUpload,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Zone message ou commentaire',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  MessageTextField(
                    controller: messageController,
                    hintText: '',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E2E48),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Soumettre',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
