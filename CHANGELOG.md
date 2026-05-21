# CHANGELOG

## [미커밋]

- scenes/Player.tscn — 탱크 스프라이트(default_tank_up_6.png)로 교체, 6프레임 walk / idle 애니메이션 정의
- scripts/Player.gd — flip_h 제거, 이동 방향 rotation 적용 (last_direction 기반)
- assets/sprites/tank/default_tank_up_6.png — 흰 배경 투명 처리, 6프레임 탱크 중앙 정렬
- assets/sprites/tank/tank_body.png — 차체 스프라이트 분리 (포탑 영역 투명, 6프레임)
- assets/sprites/tank/tank_turret.png — 포탑 스프라이트 분리 (포신 + 포탑, 단일 프레임)
- scenes/Player.tscn — TurretSprite(Sprite2D) 노드 추가, tank_body.png 교체
- scripts/Player.gd — set_turret_direction() 추가
- scripts/Weapon.gd — 매 프레임 가장 가까운 적 탐색 및 포탑 방향 업데이트로 리팩터
