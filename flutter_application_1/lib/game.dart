import 'dart:ui';
import 'package:flame/game.dart';
import 'components/player.dart';
import 'components/background.dart';
import 'helpers/direction.dart';

class GameTest extends FlameGame {
  Player _player = Player();
  World _world = World();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    await add(_player);
    _player.position = _world.size / 1.40;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  void onArrowKeyChanged(Direction direction) {
    _player.direction = direction;
  }
}
