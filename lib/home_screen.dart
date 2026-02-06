import 'package:flutter/material.dart';
import 'app_state.dart';
import 'insight_engine.dart';
import 'reflection.dart';
import 'reflection_history.dart';
import 'reflection_charts.dart';
import 'weekly_report_screen.dart';
import 'widgets/index_ring.dart';
import 'ui/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final today = LifeOSState.today;

    return Scaffold(
      appBar: AppBar(title: const Text("LifeOS")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            const Text("Today", style: LifeText.section),

            const SizedBox(height: 16),

            Center(
              child: IndexRing(
                value: today?.index ?? 0,
              ),
            ),

            const SizedBox(height: 32),

            const _InsightCard(),

            const SizedBox(height: 32),

            const Text("Actions", style: LifeText.section),

            const SizedBox(height: 12),

            _ActionTile(
              label: "Reflect",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ReflectionScreen(),
                  ),
                );
                setState(() {});
              },
            ),
            _ActionTile(
              label: "History",
              onTap: () => _go(const HistoryScreen()),
            ),
            _ActionTile(
              label: "Charts",
              onTap: () => _go(const ChartsScreen()),
            ),
            _ActionTile(
              label: "Weekly Report",
              onTap: () => _go(const WeeklyReportScreen()),
            ),
          ],
        ),
      ),
    );
  }

  void _go(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF141418),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        InsightEngine.primary(),
        style: LifeText.body,
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ActionTile({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF141418),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(label, style: LifeText.button),
              const Spacer(),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }
}
