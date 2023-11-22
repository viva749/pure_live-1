import 'package:get/get.dart';
import 'package:pure_live/common/index.dart';

import 'areas_controller.dart';
import 'areas_grid_view.dart';
import 'favorite_areas_page.dart';

class AreasPage extends GetView<AreasController> {
  const AreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      bool showAction = constraint.maxWidth <= 680;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          leading: showAction ? const MenuButton() : null,
          actions: showAction ? [const SearchButton()] : null,
          title: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: Sites.supportSites.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: Sites.supportSites.map((e) => AreaGridView(e.id)).toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const FavoriteAreasPage()),
          child: const Icon(Icons.favorite_rounded),
        ),
      );
    });
  }
}
