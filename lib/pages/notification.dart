import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.green],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          NotificationCard(
            title: 'Weather Update',
            description: 'It\'s going to rain today. Carry an umbrella!',
            icon: Icons.cloud,
            color: Colors.blue,
          ),
          NotificationCard(
            title: 'Emergency Alert',
            description: 'There is a fire hazard reported in your area. Stay safe!',
            icon: Icons.warning,
            color: Colors.red,
          ),
          NotificationCard(
            title: 'Road Changes',
            description: 'The main street will be closed for maintenance.',
            icon: Icons.traffic,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const NotificationCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
