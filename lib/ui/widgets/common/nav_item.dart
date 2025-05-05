import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:BuildTek/models/constants/common_navbar_model.dart';

final Map<UserDepartment, Map<UserRole, List<NavigationItemModel>>> navItems = {
  UserDepartment.HR: {
    UserRole.Executive: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.Manager: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.HOD: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
  UserDepartment.Sales: {
    UserRole.Executive: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.searchIcon,
        label: 'Search',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.Manager: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.searchIcon,
        label: 'Search',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.HOD: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
  UserDepartment.Marketing: {
    UserRole.Executive: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.searchIcon,
        label: 'Search',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.Manager: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.searchIcon,
        label: 'Search',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
      NavigationItemModel(
        iconPath: 'assets/icons/settings.png',
        label: 'Settings',
        index: 3,
      ),
    ],
    UserRole.HOD: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
  UserDepartment.Branding: {
    UserRole.Executive: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.searchIcon,
        label: 'Search',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.Manager: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.searchIcon,
        label: 'Search',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
      NavigationItemModel(
        iconPath: 'assets/icons/settings.png',
        label: 'Settings',
        index: 3,
      ),
    ],
    UserRole.HOD: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
  UserDepartment.Admin: {
    UserRole.SuperAdmin: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.peopleIcon,
        label: 'People',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
  UserDepartment.Finance: {
    UserRole.Manager: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: 'assets/icons/finance.png',
        label: 'Finance',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
    UserRole.Executive: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.discountIcon,
        label: 'Finance',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
  UserDepartment.Accounts: {
    UserRole.Executive: [
      NavigationItemModel(
        iconPath: AssetConstants.homeIcon,
        label: 'Home',
        index: 0,
      ),
      NavigationItemModel(
        iconPath: 'assets/icons/accounts.png',
        label: 'Accounts',
        index: 1,
      ),
      NavigationItemModel(
        iconPath: AssetConstants.profileIcon,
        label: 'Profile',
        index: 2,
      ),
    ],
  },
};
