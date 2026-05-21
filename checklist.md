# checklist.md — 탱크 이동 애니메이션

- [ ] 날짜 브랜치 생성 (2026-05-21)
- [ ] Player.tscn: 탱크 텍스처로 ext_resource 교체
- [ ] Player.tscn: AtlasTexture 6개 (walk 프레임) 정의
- [ ] Player.tscn: SpriteFrames 업데이트 (idle 1프레임, walk 6프레임)
- [ ] Player.tscn: AnimatedSprite2D scale 조정
- [ ] Player.gd: flip_h 제거
- [ ] Player.gd: last_direction 변수 추가
- [ ] Player.gd: rotation = direction.angle() + PI/2 적용
- [ ] CHANGELOG.md 업데이트
- [ ] 세션 로그 작성
