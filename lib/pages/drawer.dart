import 'package:flutter/material.dart';
import '../colors.dart';
import '../pages/blog.dart';
import '../pages/donationpage.dart';
import '../pages/userdashboard.dart';
import '../pages/volunteerpages.dart';

class AppDra extends StatelessWidget {
  const AppDra({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: Column(
        children: [
          AppBar(
            title: const Text('Menu'),
            backgroundColor: btncolor,
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: btncolor,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserDashboard.routeName),
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(
              Icons.add,
              color: btncolor,
            ),
            title: const Text(
              'Donation Page',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(DonationPage.routeName),
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: btncolor,
            ),
            title: const Text(
              'Volunteers',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(VolunteerPage.routeName),
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(
              Icons.add_to_photos_rounded,
              color: btncolor,
            ),
            title: const Text(
              'Blog and Post',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Blog.routeName),
          ),
        ],
      ),
    );
  }
}
