import 'package:flutter/material.dart';
import '../../models/notification_models.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationData> notifications = [
    NotificationData(
      id: '1',
      title: 'Mises à jour de la campagne',
      subtitle: 'Votre candidature pour « Summer Road Trip » a été approuvée !',
      timestamp: 'il y a 2 heures',
      type: NotificationType.campaign,
      isRead: false,
    ),
    NotificationData(
      id: '2',
      title: 'Alertes de paiement',
      subtitle: 'Votre paiement de 25\$ pour \'Summer Road Trip\' a été reçu.',
      timestamp: 'il y a 1 jour',
      type: NotificationType.payment,
      isRead: true,
    ),
    NotificationData(
      id: '3',
      title: 'Rappels d\'action',
      subtitle: 'N\'oubliez pas de soumettre vos photos de campagne pour cette semaine.',
      timestamp: 'il y a 3 jours',
      type: NotificationType.validation,
      isRead: false,
    ),
    NotificationData(
      id: '4',
      title: 'Mises à jour de l\'application',
      subtitle: 'Découvrez nos nouvelles fonctionnalités dans la version 2.0.',
      timestamp: 'il y a 1 semaine',
      type: NotificationType.mission,
      isRead: true,
    ),
  ];

  Widget _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.campaign:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.campaign,
            color: Colors.grey,
            size: 20,
          ),
        );
      case NotificationType.mission:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.settings,
            color: Colors.grey,
            size: 20,
          ),
        );
      case NotificationType.validation:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.grey,
            size: 20,
          ),
        );
      case NotificationType.payment:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.payment,
            color: Colors.grey,
            size: 20,
          ),
        );
      case NotificationType.rejection:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 20,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F7F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                _getNotificationIcon(notification.type),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      notification.timestamp,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                    if (!notification.isRead) ...[
                      const SizedBox(height: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
