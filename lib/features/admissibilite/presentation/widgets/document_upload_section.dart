import 'package:flutter/material.dart';

class DocumentUploadSection extends StatelessWidget {
  final VoidCallback onUploadTap;

  const DocumentUploadSection({
    super.key,
    required this.onUploadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Icon(
              Icons.cloud_upload_outlined,
              size: 32,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'Faites glisser et déposez des fichiers ou\n'),
                TextSpan(
                  text: 'parcourir pour télécharger',
                  style: TextStyle(
                    color: Colors.blue[600],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'PNG, JPG, PDF jusqu\'à 10 Mo',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
