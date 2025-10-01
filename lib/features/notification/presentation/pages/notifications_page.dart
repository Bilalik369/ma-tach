import 'package:flutter/material.dart';
import '../widgets/notification_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationItem(
            icon: Icons.campaign,
            iconColor: Color(0xFF4CAF50),
            title: 'Mises à jour de la campagne',
            subtitle: 'Votre candidature pour « Summer Road Trip » a été approuvée!',
            time: '2 h',
            hasRedDot: true,
          ),
          SizedBox(height: 12),
          NotificationItem(
            icon: Icons.payment,
            iconColor: Color(0xFF2196F3),
            title: 'Alertes de paiement',
            subtitle: 'Votre paiement de 250.000F Summer Road Trip a été reçu.',
            time: '4 h',
            hasRedDot: false,
          ),
          SizedBox(height: 12),
          NotificationItem(
            icon: Icons.check_circle_outline,
            iconColor: Color(0xFF4CAF50),
            title: 'Rappels d\'action',
            subtitle: 'N\'oubliez pas de soumettre vos documents pour cette semaine',
            time: '6 h',
            hasRedDot: false,
          ),
          SizedBox(height: 12),
          NotificationItem(
            icon: Icons.system_update,
            iconColor: Color(0xFF9C27B0),
            title: 'Mises à jour de l\'application',
            subtitle: 'Découvrez nos nouvelles fonctionnalités dans la version 2.1.0',
            time: '1 j',
            hasRedDot: false,
          ),
        ],
      ),
    );
  }
}
