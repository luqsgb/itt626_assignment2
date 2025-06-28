import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? customTitle;
  final bool showBackButton;
  final bool showAboutButton;
  final VoidCallback? onRefresh;

  const CustomAppBar({
    super.key,
    this.customTitle,
    this.showBackButton = false,
    this.showAboutButton = true,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Background styling
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      // Leading widget (back button or menu)
      leading: showBackButton
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF00FF88), // Green color
        ),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            context.go('/');
          }
        },
      )
          : null,

      // Title with custom styling
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // XRP Icon/Logo
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF00FF88).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF00FF88),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'X',
                style: TextStyle(
                  color: Color(0xFF00FF88),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Title text
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customTitle ?? 'XRP Tracker',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Live Price in MYR',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Actions (refresh and about buttons)
      actions: [
        // Refresh button (if callback provided)
        if (onRefresh != null)
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Color(0xFF00FF88),
            ),
            onPressed: onRefresh,
            tooltip: 'Refresh Data',
          ),

        // About button
        // if (showAboutButton)
        //   PopupMenuButton<String>(
        //     icon: const Icon(
        //       Icons.more_vert,
        //       color: Color(0xFF00FF88),
        //     ),
        //     color: const Color(0xFF1E1E1E),
        //     itemBuilder: (BuildContext context) => [
        //       // PopupMenuItem<String>(
        //       //   value: 'about',
        //       //   child: Row(
        //       //     children: [
        //       //       Icon(
        //       //         Icons.info_outline,
        //       //         color: Colors.grey[300],
        //       //         size: 20,
        //       //       ),
        //       //       const SizedBox(width: 12),
        //       //       Text(
        //       //         'About App',
        //       //         style: TextStyle(
        //       //           color: Colors.grey[300],
        //       //           fontSize: 16,
        //       //         ),
        //       //       ),
        //       //     ],
        //       //   ),
        //       // ),
        //       PopupMenuItem<String>(
        //         value: 'settings',
        //         child: Row(
        //           children: [
        //             Icon(
        //               Icons.settings_outlined,
        //               color: Colors.grey[300],
        //               size: 20,
        //             ),
        //             const SizedBox(width: 12),
        //             Text(
        //               'Settings',
        //               style: TextStyle(
        //                 color: Colors.grey[300],
        //                 fontSize: 16,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //     onSelected: (String value) {
        //       switch (value) {
        //         case 'about':
        //           context.go('/about');
        //           break;
        //         case 'settings':
        //           _showSettingsDialog(context);
        //           break;
        //       }
        //     },
        //   ),

        const SizedBox(width: 8), // Add some padding
      ],

      // Bottom border for visual separation
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                const Color(0xFF00FF88).withOpacity(0.3),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _showSettingsDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: const Color(0xFF1E1E1E),
  //         title: const Text(
  //           'Settings',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               leading: const Icon(
  //                 Icons.notifications_outlined,
  //                 color: Color(0xFF00FF88),
  //               ),
  //               title: const Text(
  //                 'Price Alerts',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //               subtitle: Text(
  //                 'Coming soon...',
  //                 style: TextStyle(color: Colors.grey[400]),
  //               ),
  //               onTap: () {
  //                 // Implement price alerts functionality later
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(
  //                 Icons.update,
  //                 color: Color(0xFF00FF88),
  //               ),
  //               title: const Text(
  //                 'Auto Refresh',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //               subtitle: Text(
  //                 'Every 30 seconds',
  //                 style: TextStyle(color: Colors.grey[400]),
  //               ),
  //               onTap: () {
  //                 // Implement auto refresh settings
  //               },
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text(
  //               'Close',
  //               style: TextStyle(color: Color(0xFF00FF88)),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

// Alternative simpler version for specific pages
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const SimpleAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF00FF88),
        ),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            context.go('/');
          }
        },
      )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: const Color(0xFF00FF88).withOpacity(0.3),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}