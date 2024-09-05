import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  // Function to handle account deletion
  void deleteAccount(BuildContext context) async {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Delete Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: const Text(
            "Are you sure you want to delete your account? This action cannot be undone.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "No",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Delete the user from Firebase
                  await FirebaseAuth.instance.currentUser?.delete();
                  Navigator.of(context).pop(); // Close the dialog

                  // Optionally, you can redirect the user to the login screen or another page after deletion
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                } catch (e) {
                  // Handle errors (e.g., re-authentication required)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Error deleting account: $e"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                "Yes",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
                offset: const Offset(0, 3),
                blurRadius: 8,
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          child: AppBar(
            title: Text(
              "Settings",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Delete Account option
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              leading: Icon(Icons.delete_forever_rounded, color: Theme.of(context).colorScheme.error, size: 30),
              title: const Text(
                "Delete Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text("Permanently delete your account", style: TextStyle(fontSize: 14)),
              trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
              onTap: () => deleteAccount(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: Theme.of(context).colorScheme.surface.withOpacity(0.05),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
