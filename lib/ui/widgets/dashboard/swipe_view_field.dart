// import 'package:BuildTek/services/storage/store_service.dart';
// import 'package:BuildTek/ui/widgets/common/loading.dart';
// import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
// import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
// import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
// import 'package:flutter/material.dart';

// class SwipeViewWidget extends StatefulWidget {
//   final bool isSwipedUp;
//   final VoidCallback onSwipeToggle;
//   final String department;
//   final String role;

//   const SwipeViewWidget({
//     super.key,
//     required this.role,
//     required this.isSwipedUp,
//     required this.onSwipeToggle,
//     required this.department,
//   });

//   @override
//   State<SwipeViewWidget> createState() => _SwipeViewWidgetState();
// }

// class _SwipeViewWidgetState extends State<SwipeViewWidget> {
//   bool isFirstTab = true;
//   int customerCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadCustomerCount();
//   }

//   Future<void> _loadCustomerCount() async {
//     final customers = await StoreService.getCustomers();
//     setState(() => customerCount = customers.length);
//   }

//   bool get isHR => widget.department == 'HR';
//   bool get isMarketing => widget.department == 'Marketing';
//   bool get isAdmin => widget.department == 'Admin';
//   bool get isSuperAdmin => widget.role == 'Super Admin';

//   Widget _buildTabContent() {
//     if (isFirstTab) {
//       return _buildTaskList();
//     } else {
//       return _buildSecondaryView();
//     }
//   }

//   Widget _buildTaskList() {
//     switch (widget.department) {
//       case 'HR':
//         return const HrTaskList();
//       case 'Marketing':
//         return EmployeeTaskList(isSwipedvalue: widget.isSwipedUp);
//       // case 'Sales':
//       //   return SalesTaskWidget(); // Add these widgets as needed
//       // etc...
//       default:
//         return Center(
//           child: Text('No view available for ${widget.department}'),
//         );
//     }
//   }

//   Widget _buildSecondaryView() {
//     switch (widget.department) {
//       case 'HR':
//         return const HrCompleteLeadsView();

//       case 'Marketing' || 'Sales' || 'Branding' || 'CreditControl':
//         return MarketingLead();

//       // case 'Accounts':
//       //   return SalesLeadsList();

//       // case 'Finance':
//       //   return FinanceCompletedTasks();

//       // case 'Support':
//       //   return SupportClosedTickets();

//       // case 'Development':
//       //   return DevClosedIssuesView();

//       // case 'Admin':
//       //   return AdminCompletedOverview();

//       default:
//         return Center(
//           child: Text('No view available for ${widget.department}'),
//         );
//     }
//   }

//   String get secondTabLabel {
//     return (!isHR && !isSuperAdmin) ? 'My Leads' : 'Completed';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return GestureDetector(
//       onVerticalDragUpdate: (details) {
//         if (details.delta.dy < -10 && !widget.isSwipedUp ||
//             details.delta.dy > 10 && widget.isSwipedUp) {
//           widget.onSwipeToggle();
//         }
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         width: double.infinity,
//         height: widget.isSwipedUp ? screenHeight * 0.8 : screenHeight * 0.4,
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//         decoration: const BoxDecoration(
//           color: Color(0xFFE4DCDC),
//           borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
//         ),
//         child: Column(
//           children: [
//             InkWell(
//               onTap: widget.onSwipeToggle,
//               child: Image.asset(
//                 widget.isSwipedUp
//                     ? 'assets/icons/down_arrow.png'
//                     : 'assets/icons/up_arrow.png',
//                 width: 64,
//                 height: 30,
//                 color: const Color.fromARGB(255, 111, 110, 110),
//               ),
//             ),
//             const SizedBox(height: 10),
//             _buildTabSwitch(),
//             // FilterEmployees(role: widget.role),
//             const ResponsiveSizedBox(width: 0, height: 10),
//             Expanded(child: _buildTabContent()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabSwitch() {
//     return ResponsiveContainer(
//       width: 366,
//       height: 39,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(99),
//       ),
//       child: Row(
//         children: [
//           _buildTabButton(
//             title: 'Task List',
//             selected: isFirstTab,
//             onTap: () {
//               setState(() => isFirstTab = true);
//             },
//           ),
//           _buildTabButton(
//             title: secondTabLabel,
//             selected: !isFirstTab,
//             onTap: () {
//               setState(() => isFirstTab = false);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabButton({
//     required String title,
//     required bool selected,
//     required VoidCallback onTap,
//   }) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           alignment: Alignment.center,
//           height: 39,
//           decoration: BoxDecoration(
//             color: selected ? Colors.black : Colors.white,
//             borderRadius: BorderRadius.circular(99),
//           ),
//           child: FittedBox(
//             fit: BoxFit.scaleDown,
//             child: ResponsiveText(
//               title,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w500,
//                 color: selected ? Colors.white : const Color(0xFF6C6F74),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
