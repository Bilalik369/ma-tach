import 'package:flutter/material.dart';
import '../../models/gains_models.dart';

class GainsScreen extends StatefulWidget {
  const GainsScreen({Key? key}) : super(key: key);

  @override
  State<GainsScreen> createState() => _GainsScreenState();
}

class _GainsScreenState extends State<GainsScreen> {
  String selectedDateFilter = 'Date';
  String selectedCampaignFilter = 'Campagne';

  final List<UpcomingGain> upcomingGains = [
    UpcomingGain(
      id: '1',
      amount: 150.00,
      campaign: 'Campagne : Road Trip d\'été',
      dueDate: 'Dans limite : 15 juillet',
    ),
    UpcomingGain(
      id: '2',
      amount: 75.00,
      campaign: 'Campagne : Escapade week-end',
      dueDate: 'Dans limite : 20 juillet',
    ),
  ];

  final List<GainData> gainsHistory = [
    GainData(
      id: '1',
      amount: 200.00,
      campaign: 'Campagne : Aventure des vacances de printemps',
      date: 'Reçu 10 juin',
      status: GainStatus.received,
    ),
    GainData(
      id: '2',
      amount: 300.00,
      campaign: 'Campagne : Voyage de ski d\'hiver',
      date: 'Reçu : 25 mai',
      status: GainStatus.received,
    ),
    GainData(
      id: '3',
      amount: 250.00,
      campaign: 'Campagne : Tournée des feuillages d\'automne',
      date: 'Reçu : 12 avril',
      status: GainStatus.received,
    ),
    GainData(
      id: '4',
      amount: 275.00,
      campaign: 'Campagne : Road Trip d\'été',
      date: 'Reçu : 5 mars',
      status: GainStatus.received,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Gains',
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
            // Total des gains section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total des gains à vie',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '1 250,00 \$',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Gains à venir section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gains à venir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...upcomingGains.map((gain) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${gain.amount.toStringAsFixed(2)} \$',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                gain.campaign,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          gain.dueDate,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Historique des gains section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Historique des gains',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Filters
                  Row(
                    children: [
                      _buildFilterDropdown(selectedDateFilter, ['Date', 'Cette semaine', 'Ce mois', 'Cette année']),
                      const SizedBox(width: 16),
                      _buildFilterDropdown(selectedCampaignFilter, ['Campagne', 'Road Trip', 'Escapade', 'Aventure']),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // History items
                  ...gainsHistory.map((gain) => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${gain.amount.toStringAsFixed(2)} \$',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                gain.campaign,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          gain.date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String value, List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 20),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
          onChanged: (String? newValue) {
            setState(() {
              if (items.contains('Date')) {
                selectedDateFilter = newValue!;
              } else {
                selectedCampaignFilter = newValue!;
              }
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
