import 'package:flame/components.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  Player() : super(size: Vector2.all(50.0));
  Direction direction = Direction.none;
  late final SpriteAnimation _walkingRightAnimation;
  late final SpriteAnimation _walkingLeftAnimation;
  late final SpriteAnimation _walkingUpAnimation;
  late final SpriteAnimation _walkingDownAnimation;
  late final SpriteAnimation _idleAnimation;
  final double _animationSpeed = .15;

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await gameRef.images.load('player_spritesheet.png'),
        columns: 4,
        rows: 4);
    _idleAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: 0.60, from: 0, to: 2);

    _walkingRightAnimation = spriteSheet.createAnimation(
        row: 3, stepTime: _animationSpeed - .13, from: 0, to: 3);

    _walkingLeftAnimation = spriteSheet.createAnimation(
        row: 1, stepTime: _animationSpeed, from: 0, to: 3);

    _walkingDownAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 3);

    _walkingUpAnimation = spriteSheet.createAnimation(
        row: 2, stepTime: _animationSpeed, from: 0, to: 3);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    //sprite = await gameRef.loadSprite('player.png');
    await _loadAnimations().then((_) => {animation = _idleAnimation});
    position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  void updatePosition(double dt) {
    switch (direction) {
      case Direction.up:
        animation = _walkingUpAnimation;
        position.y -= 5;
        break;
      case Direction.down:
        animation = _walkingDownAnimation;
        position.y += 5;
        break;
      case Direction.left:
        animation = _walkingLeftAnimation;
        position.x -= 5;
        break;
      case Direction.right:
        animation = _walkingRightAnimation;
        position.x += 5;
        break;
      case Direction.none:
        animation = _idleAnimation;
        break;
    }
  }
}
