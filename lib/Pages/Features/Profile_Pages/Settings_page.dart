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
         
         Padding(
           padding: const EdgeInsets.only(left: 24,right: 24),
           child: ListTile(
                   leading: Image.asset(AppIcons.notificationIcon, width: 24, height: 24,  color: Theme.of(context).colorScheme.surface,),
                   title:  Text('Notification', style: TextStyle( color: Theme.of(context).colorScheme.surface,)),
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
             
              if (value) {
            
              } else {
               
              }
            },
                   ),
                 ),
         ),
      
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Divider( color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: ListTile(
              leading: Image.asset(AppIcons.languageIcon, width: 24, height: 24, color: Theme.of(context).colorScheme.surface,),
              title:  Text('App Language', style: TextStyle( color: Theme.of(context).colorScheme.surface,)),
              trailing:  Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.surface,),
              onTap: () {
               
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Divider( color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: ListTile(
              leading: Image.asset(AppIcons.themeIcon, width: 24, height: 24, color: Theme.of(context).colorScheme.surface,),
              title:  Text('App Theme', style: TextStyle( color: Theme.of(context).colorScheme.surface,)),
              trailing:  Icon(Icons.arrow_forward_ios,  color: Theme.of(context).colorScheme.surface,),
              onTap: () {
               
              },
            ),
          ), Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Divider( color: Theme.of(context).colorScheme.onPrimaryContainer),
          ), 
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: ListTile(
              leading: Image.asset(AppIcons.passwordIcon, width: 24, height: 24,  color: Theme.of(context).colorScheme.surface,),
              title:  Text('Change Password', style: TextStyle( color: Theme.of(context).colorScheme.surface,)),
              trailing:  Icon(Icons.arrow_forward_ios,  color: Theme.of(context).colorScheme.surface,),
              onTap: () {
               
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Divider( color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: ListTile(
              leading: Image.asset(AppIcons.informationIcon, width: 24, height: 24,  color: Theme.of(context).colorScheme.surface,),
              title:  Text('About App', style: TextStyle( color: Theme.of(context).colorScheme.surface,)),
              trailing:  Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.surface,),
              onTap: () {
              
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Divider( color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: ListTile(
              leading: Image.asset(AppIcons.deleteIcon, width: 24, height: 24,  color: Theme.of(context).colorScheme.surface,),
              title:  Text('Delete Account', style: TextStyle( color: Theme.of(context).colorScheme.surface,)),
              trailing:  Icon(Icons.arrow_forward_ios, color:Theme.of(context).colorScheme.surface,),
              onTap: () {
              
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget customAppBar(BuildContext context) {
    return Row(
      children: [
        customIconButton(context),
       
        Padding(
          padding: const EdgeInsets.only(left: 14,right: 24,top: 10,bottom: 51),
          child: Text(
            "Settings",
            style: GoogleFonts.almarai(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget customIconButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,top: 2,bottom: 51),
      child: Container(
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
      ),
    );
  }
}



