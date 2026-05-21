# plan.md — 탱크 이동 애니메이션

## 목표
Player 캐릭터를 탱크 스프라이트로 교체하고, 이동 방향에 따라 스프라이트가 회전하는 애니메이션을 구현한다.

## 사용 리소스
- `assets/sprites/tank/default_tank_up_6.png` — 6프레임 이동 애니메이션 (3열×2행, 각 프레임 512×512)
- `assets/sprites/tank/default_tank_8.png` — 방향 포즈 스프라이트 (이번 작업에서는 미사용)

## 구현 방식
- **애니메이션**: AnimatedSprite2D + SpriteFrames
  - `idle`: 1프레임 (정지 시)
  - `walk`: 6프레임 루프 (이동 시)
- **방향 처리**: `rotation = direction.angle() + PI/2`
  - 스프라이트가 위쪽(UP)을 향하므로 +PI/2 오프셋 필요
  - 정지 시 마지막 방향 유지 (last_direction 변수)
- **스케일**: `Vector2(0.15, 0.15)` — 512px 원본을 약 76px으로 축소

## 변경 파일
- `scenes/Player.tscn`
- `scripts/Player.gd`
