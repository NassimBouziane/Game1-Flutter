import 'package:flame/components.dart';
import '../helpers/direction.dart';

class Player extends SpriteComponent with HasGameRef {
  Player() : super(size: Vector2.all(50.0));
  Direction direction = Direction.none;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('player.png');
    position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }
  void updatePosition(double dt){
  switch (direction) {
        case Direction.up:
          position.y -=5 ;
          break;
        case Direction.down:
          position.y +=5;
          break;
        case Direction.left:
          position.x -=5;
          break;
        case Direction.right:
          position.x +=5;
          break;
        case Direction.none:
          break;
      }

  }
}
