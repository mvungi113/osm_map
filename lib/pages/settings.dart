import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficopt/auth/auth_service.dart';
import 'package:trafficopt/themes/themeprovide.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting page',
          style: TextStyle(color: Theme.of(context).colorScheme.background),
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
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.green],
                  ),
                ),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Logout  ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.logout,
                        size: 18,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ],
                  ),
                  onTap: () {
                    logout();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
