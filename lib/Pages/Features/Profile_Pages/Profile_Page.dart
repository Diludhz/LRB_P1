import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Features/Profile_Pages/Settings_page.dart';
import 'package:p1/Pages/Other/Custom_BottomNav.dart';
import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
          
            _buildProfileCard(context),
          
            _buildMenuList(context),
          ],
        ),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customfloatingActionButton(context),
      bottomNavigationBar: custombottomNavigationBar(context),
      
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,top: 11,right: 24,bottom: 51),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: GoogleFonts.almarai(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            child: Image.asset(
              AppIcons.settingsIcon,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,bottom: 63),
      child: Container(
        height: 215,
        width: 351,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 1,
              color:Theme.of(context).colorScheme.onPrimaryContainer,
            )
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(225, 250, 249, 246),
              Color.fromARGB(255, 0, 12, 44),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildStarRating(),
              const SizedBox(height: 13),
           
              _buildProfileDetails(),
            
              _buildBalanceDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Padding(
      padding: const EdgeInsets.only(left: 89,top: 10,right: 105,),
      child: Container(
        height: 25,
        width: 151,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return Image.asset(
              index < 3 ? AppIcons.activestarIcon : AppIcons.nonactivestarIcon,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            );
          }),
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14,bottom: 20),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 0, 191, 255),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppIcons.profilesquareIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Obinna Michael',
              style: GoogleFonts.workSans(
                color: AppColors.purewhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'obinna@hands.com',
              style: GoogleFonts.workSans(
                color: AppColors.greylight,
                fontSize: 14,
              ),
            ),
            Text(
              '+971 554591212',
              style: GoogleFonts.workSans(
                color: AppColors.greylight,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceDetails() {
    return Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Available Balance',
                style: GoogleFonts.workSans(
                  color: AppColors.bgcolor,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'AED ',
                      style: GoogleFonts.workSans(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '8,640.00',
                      style: GoogleFonts.workSans(
                        color: AppColors.darkstheme,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25,bottom: 15,top: 12),
          child: _buildEditButton(),
        ),
      ],
    );
  }

  Widget _buildEditButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Image.asset(
            AppIcons.editIcon,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 23,right: 25,bottom: 24),
        child: ListView.separated(
          itemCount: 11,
          separatorBuilder: (context, index) =>  Divider(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
            thickness: 0.5,
            indent: 16.0,
            endIndent: 16.0,
          ),
          itemBuilder: (context, index) {
            final menuItems = [
              {'icon': AppIcons.bankIcon, 'title': 'Bank Account'},
              {'icon': AppIcons.creditcardIcon, 'title': 'Payment'},
              {'icon': AppIcons.idIcon, 'title': 'Verify Your Id'},
              {'icon': AppIcons.dashboardIcon, 'title': 'Subscribed Categories'},
              {'icon': AppIcons.locationIcon, 'title': 'Address'},
              {'icon': AppIcons.jobsIcon, 'title': 'My Jobs'},
              {'icon': AppIcons.bookingsIcon, 'title': 'My Bookings'},
              {'icon': AppIcons.starIcon, 'title': 'Rate Us'},
              {'icon': AppIcons.informationIcon, 'title': 'About App'},
              {'icon': AppIcons.supportIcon, 'title': 'Support'},
              {'icon': AppIcons.logoutIcon, 'title': 'Log Out'},
            ];
            return buildMenuItem(
              context,
              menuItems[index]['icon']!,
              menuItems[index]['title']!,
            );
          },
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String assetPath, String title) {
    return ListTile(
      leading: Image.asset(
        assetPath,
        width: 24.0,
        height: 24.0,
        color: Theme.of(context).colorScheme.surface,
      ),
      title: Text(
        title,
        style: GoogleFonts.almarai(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.surface,
      ),
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen1()));
      },
    );
  }
}



class ProfileScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
          
            _buildProfileCard(context),
          
            _buildMenuList(context),
          ],
        ),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customfloatingActionButton(context),
      bottomNavigationBar: custombottomNavigationBar(context),
      
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,top: 11,right: 24,bottom: 51),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: GoogleFonts.almarai(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            child: Image.asset(
              AppIcons.settingsIcon,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,bottom: 63),
      child: Container(
        height: 215,
        width: 351,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 1,
              color:Theme.of(context).colorScheme.onPrimaryContainer,
            )
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(225, 250, 249, 246),
               Color.fromARGB(255, 253, 63, 171),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildStarRating(),
              const SizedBox(height: 13),
           
              _buildProfileDetails(),
            
              _buildBalanceDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Padding(
      padding: const EdgeInsets.only(left: 89,top: 10,right: 105,),
      child: Container(
        height: 25,
        width: 151,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return Image.asset(
              index < 3 ? AppIcons.activestarIcon : AppIcons.nonactivestarIcon,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            );
          }),
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14,bottom: 20),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 253, 63, 171),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppIcons.femaleprofileIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Obinna Michael',
              style: GoogleFonts.workSans(
                color: AppColors.purewhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'obinna@hands.com',
              style: GoogleFonts.workSans(
                color: AppColors.greylight,
                fontSize: 14,
              ),
            ),
            Text(
              '+971 554591212',
              style: GoogleFonts.workSans(
                color: AppColors.greylight,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceDetails() {
    return Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Available Balance',
                style: GoogleFonts.workSans(
                  color: AppColors.bgcolor,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'AED ',
                      style: GoogleFonts.workSans(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '8,640.00',
                      style: GoogleFonts.workSans(
                        color: AppColors.darkstheme,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25,bottom: 15,top: 12),
          child: _buildEditButton(),
        ),
      ],
    );
  }

  Widget _buildEditButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Image.asset(
            AppIcons.editIcon,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 23,right: 25,bottom: 24),
        child: ListView.separated(
          itemCount: 11,
          separatorBuilder: (context, index) =>  Divider(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
            thickness: 0.5,
            indent: 16.0,
            endIndent: 16.0,
          ),
          itemBuilder: (context, index) {
            final menuItems = [
              {'icon': AppIcons.bankIcon, 'title': 'Bank Account'},
              {'icon': AppIcons.creditcardIcon, 'title': 'Payment'},
              {'icon': AppIcons.idIcon, 'title': 'Verify Your Id'},
              {'icon': AppIcons.dashboardIcon, 'title': 'Subscribed Categories'},
              {'icon': AppIcons.locationIcon, 'title': 'Address'},
              {'icon': AppIcons.jobsIcon, 'title': 'My Jobs'},
              {'icon': AppIcons.bookingsIcon, 'title': 'My Bookings'},
              {'icon': AppIcons.starIcon, 'title': 'Rate Us'},
              {'icon': AppIcons.informationIcon, 'title': 'About App'},
              {'icon': AppIcons.supportIcon, 'title': 'Support'},
              {'icon': AppIcons.logoutIcon, 'title': 'Log Out'},
            ];
            return buildMenuItem(
              context,
              menuItems[index]['icon']!,
              menuItems[index]['title']!,
            );
          },
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String assetPath, String title) {
    return ListTile(
      leading: Image.asset(
        assetPath,
        width: 24.0,
        height: 24.0,
        color: Theme.of(context).colorScheme.surface,
      ),
      title: Text(
        title,
        style: GoogleFonts.almarai(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.surface,
      ),
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen1()));
      },
    );
  }
}











