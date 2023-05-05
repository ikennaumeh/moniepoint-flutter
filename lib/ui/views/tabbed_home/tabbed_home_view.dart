import 'package:flutter/material.dart';
import 'package:moniepoint/ui/utilities/device_scaler.dart';
import 'package:moniepoint/ui/utilities/palette.dart';
import 'package:moniepoint/ui/views/home/home_view.dart';
import 'package:moniepoint/ui/views/settings/settings_view.dart';
import 'package:moniepoint/ui/views/tabbed_home/tabbed_home_view_model.dart';
import 'package:moniepoint/ui/views/voucher/voucher_view.dart';
import 'package:moniepoint/ui/views/wallet/wallet_view.dart';
import 'package:provider/provider.dart';

class TabbedHome extends StatefulWidget {
 
  const TabbedHome({ 
    super.key,
  });

  @override
  State<TabbedHome> createState() => _TabbedHomeState();
}

class _TabbedHomeState extends State<TabbedHome> {
  late TabbedHomeViewModel _model;

  @override
  void initState() {
    _model = TabbedHomeViewModel();
    super.initState();
  }

   @override
  void didChangeDependencies() {
    initializeDimensionScaler();
    super.didChangeDependencies();
  }

  void initializeDimensionScaler() {
    double deviceHeight = MediaQuery.of(context).size.height;
    DeviceScaler().deviceHeight = deviceHeight;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabbedHomeViewModel>(
      create: (_) => _model,
      child: Consumer<TabbedHomeViewModel>(
        builder: (_, model, __) {
          return Scaffold(
            body: GetIndexView(
              index: model.currentIndex,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Palette.white,
              selectedItemColor: Palette.primary,
              unselectedItemColor: Palette.grey,
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled, color: Palette.grey,),
                  activeIcon: Icon(Icons.home_filled, color: Palette.primary,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_number_rounded, color: Palette.grey,),
                  activeIcon: Icon(Icons.confirmation_number_rounded, color: Palette.primary,),
                  label: 'Voucher',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet, color: Palette.grey,),
                  activeIcon: Icon(Icons.wallet, color: Palette.primary,),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Palette.grey,),
                  activeIcon: Icon(Icons.settings, color: Palette.primary,),
                  label: 'Settings',
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}

class GetIndexView extends StatelessWidget {
  final int? index;
  const GetIndexView({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const VoucherView();
      case 2:
        return const WalletView();
      case 3:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }
}


