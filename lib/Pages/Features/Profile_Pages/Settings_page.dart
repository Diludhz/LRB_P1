import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          customAppBar(context),
          const SizedBox(height: 30),
          _buildSettingsOption(
            context,
            icon: AppIcons.notificationIcon,
            title: 'Notification',
            trailing: Switch(
              value: _isNotificationEnabled,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
          ),
          _buildDivider(context),
          _buildSettingsOption(
            context,
            icon: AppIcons.languageIcon,
            title: 'App Language',
            trailing: Image.asset(
              AppIcons.arrowforwardIcon,
              width: 24,
              height: 24,
              color: Theme.of(context).colorScheme.surface,
            ),
            onTap: () {},
          ),
          _buildDivider(context),
          _buildSettingsOption(
            context,
            icon: AppIcons.themeIcon,
            title: 'App Theme',
            trailing: Image.asset(
              AppIcons.arrowforwardIcon,
              width: 24,
              height: 24,
              color: Theme.of(context).colorScheme.surface,
            ),
            onTap: () {},
          ),
          _buildDivider(context),
          _buildSettingsOption(
            context,
            icon: AppIcons.passwordIcon,
            title: 'Change Password',
            trailing: Image.asset(
              AppIcons.arrowforwardIcon,
              width: 24,
              height: 24,
              color: Theme.of(context).colorScheme.surface,
            ),
            onTap: () {},
          ),
          _buildDivider(context),
          _buildSettingsOption(
            context,
            icon: AppIcons.informationIcon,
            title: 'About App',
            trailing: Image.asset(
              AppIcons.arrowforwardIcon,
              width: 24,
              height: 24,
              color: Theme.of(context).colorScheme.surface,
            ),
            onTap: () {},
          ),
          _buildDivider(context),
          _buildSettingsOption(
            context,
            icon: AppIcons.deleteIcon,
            title: 'Delete Account',
            trailing: Image.asset(
              AppIcons.arrowforwardIcon,
              width: 24,
              height: 24,
              color: Theme.of(context).colorScheme.surface,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          customIconButton(context),
          const SizedBox(width: 15),
          Text(
            "Settings",
            style: GoogleFonts.almarai(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget customIconButton(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.purewhite,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 1,
            color: AppColors.greylight,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, size: 20),
      ),
    );
  }

  Widget _buildSettingsOption(
    BuildContext context, {
    required String icon,
    required String title,
    required Widget trailing,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ListTile(
        leading: Image.asset(
          icon,
          width: 24,
          height: 24,
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        trailing: trailing,
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        height: 0, 
        thickness: 1, 
      ),
    );
  }
}
