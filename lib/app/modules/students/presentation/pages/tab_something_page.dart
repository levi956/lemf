import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabPageSomething2 extends StatefulWidget {
  const TabPageSomething2({super.key});

  @override
  State<TabPageSomething2> createState() => _TabPageSomething2State();
}

class _TabPageSomething2State extends State<TabPageSomething2>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int tabIndex_ = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      tabIndex_ = tabController.index;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TabSomethingPage extends HookWidget {
  const TabSomethingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final tabIndex = useState(0);

    useEffect(() {
      tabController.addListener(() {
        tabIndex.value = tabController.index;
      });
      return () {
        tabController.dispose();
      };
    }, [tabController]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                onTap: (v) {
                  tabIndex.value = v;
                },
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return states.contains(MaterialState.focused)
                        ? null
                        : Colors.transparent;
                  },
                ),
                indicatorColor: Colors.transparent,
                tabs: [
                  Container(
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: tabIndex.value == 0
                          ? Colors.green
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        "first",
                        style: TextStyle(
                          color:
                              tabIndex.value == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: tabIndex.value == 1
                          ? Colors.green
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        "second",
                        style: TextStyle(
                          color:
                              tabIndex.value == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    SizedBox(),
                    SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
