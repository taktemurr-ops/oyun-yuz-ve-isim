import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yuz_ve_isim/oyun_yuz_ve_isim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yuzIsimConfig.title.length, 33);
    expect(yuzIsimConfig.tagline.length, 33);
    for (final s in yuzIsimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(yuzIsimConfig.gameId, yuzIsimId);
    expect(yuzIsimRules.gameId, yuzIsimId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yuzIsimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yuzIsimId, optionalMechanics: yuzIsimRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yuzIsimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
