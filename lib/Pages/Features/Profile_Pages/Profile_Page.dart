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
            const SizedBox(height: 25),
            _buildProfileCard(context),
              const SizedBox(height: 63),
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
      padding: const EdgeInsets.only(left: 24,top: 51,right: 24,bottom: 12),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 1,
              color:Theme.of(context).colorScheme.onPrimaryContainer,
            )
          ],
          borderRadius: BorderRadius.circular(15),
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
              const SizedBox(height: 10),
              _buildProfileDetails(),
              const SizedBox(height: 20),
              _buildBalanceDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Container(
      height: 25,
      width: 151,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return Image.asset(
            index < 3 ? AppIcons.activestarIcon : AppIcons.nonactivestarIcon,
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          );
        }),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Row(
      children: [
        Container(
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
            Text(
              'Available Balance',
              style: GoogleFonts.workSans(
                color: AppColors.bgcolor,
                fontSize: 14,
              ),
            ),
            RichText(
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
          ],
        ),
        _buildEditButton(),
      ],
    );
  }

  Widget _buildEditButton() {
    return Container(
      height: 24,
      width: 24,
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
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
            const SizedBox(height: 25),
            _buildProfileCard(context),
              const SizedBox(height: 63),
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
      padding: const EdgeInsets.only(left: 24,top: 51,right: 24,bottom: 12),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 1,
              color:Theme.of(context).colorScheme.onPrimaryContainer,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
               AppColors.purewhite,
                Color.fromARGB(255, 127, 3, 75),
              
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
              const SizedBox(height: 10),
              _buildProfileDetails(),
              const SizedBox(height: 20),
              _buildBalanceDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Container(
      height: 25,
      width: 151,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return Image.asset(
            index < 3 ? AppIcons.activestarIcon : AppIcons.nonactivestarIcon,
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          );
        }),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
             
             color:const Color.fromARGB(255, 127, 3, 75),
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
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fathima Nasrin',
              style: GoogleFonts.workSans(
                color: AppColors.purewhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'fathima@hands.com',
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
            Text(
              'Available Balance',
              style: GoogleFonts.workSans(
                color: AppColors.bgcolor,
                fontSize: 14,
              ),
            ),
            RichText(
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
          ],
        ),
        _buildEditButton(),
      ],
    );
  }

  Widget _buildEditButton() {
    return Container(
      height: 24,
      width: 24,
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
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
       
      },
    );
  }
}
