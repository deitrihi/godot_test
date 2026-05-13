# Vampire Survivors Clone

Godot 4.6으로 제작한 Vampire Survivors 스타일의 탑다운 2D 서바이벌 슈터.

플레이어는 끊임없이 몰려오는 적들을 자동으로 공격하며 최대한 오래 생존하는 것이 목표다.
시간이 지날수록 적이 강해지고 스폰 빈도가 증가한다.

---

## 플레이 방법

| 키 | 동작 |
|---|---|
| W / A / S / D | 이동 |
| 방향키 | 이동 (대안) |

무기는 가장 가까운 적을 자동으로 조준해 발사한다. 조작이 필요 없다.

---

## 주요 기능

- **자동 전투** — 가장 가까운 적을 향해 주기적으로 발사체 발사
- **경험치 & 레벨업** — 처치한 적이 경험치 젬을 드롭, 습득 시 XP 획득
- **레벨업 강화** — 레벨 업 시 3개의 강화 중 하나를 선택
- **난이도 스케일링** — 30초마다 적 체력·속도 증가, 스폰 간격 단축
- **HUD** — 레벨, 체력 바, XP 바, 생존 시간 표시
- **게임 오버** — 사망 시 생존 시간 기록 및 재시작/메인 메뉴 선택

### 레벨업 강화 목록

| 이름 | 효과 |
|---|---|
| Damage Up | 공격력 +5 |
| Rapid Fire | 발사 간격 -0.2초 |
| Speed Up | 이동속도 +30 |
| Vitality | 최대 체력 +20 |

---

## 씬 구조

```
scenes/
├── MainMenu.tscn     메인 메뉴 (START GAME 버튼)
├── Game.tscn         게임 메인 씬
│   ├── Player.tscn   플레이어 + Weapon 노드
│   ├── HUD.tscn      체력/XP/타이머 UI
│   └── LevelUpUI.tscn  레벨업 강화 선택 UI
├── Enemy.tscn        적 캐릭터
├── Projectile.tscn   발사체
├── ExperienceGem.tscn  경험치 젬
└── GameOver.tscn     게임 오버 화면
```

---

## 스크립트 구조

```
scripts/
├── GameConfig.gd     AutoLoad — 모든 게임 수치 설정값
├── GameData.gd       AutoLoad — 씬 간 데이터 전달 (생존 시간 등)
├── GameManager.gd    경과 시간 추적, 게임 오버 처리
├── Player.gd         WASD 이동, 체력, 사망 처리
├── Weapon.gd         자동 조준 발사, 연사 속도
├── Projectile.gd     발사체 이동 및 적 피격 처리
├── Enemy.gd          플레이어 추적 AI, 접촉 데미지
├── EnemySpawner.gd   주기적 스폰, 난이도 단계별 스케일링
├── LevelSystem.gd    XP 누적, 레벨업 시그널 emit
├── LevelUpUI.gd      레벨업 강화 선택 UI 제어
├── HUD.gd            체력/XP 바 및 타이머 업데이트
├── ExperienceGem.gd  젬 접촉 시 LevelSystem에 XP 추가
├── MainMenu.gd       START GAME → Game 씬 전환
└── GameOver.gd       재시작 / 메인 메뉴 전환
```

---

## AutoLoad

| 이름 | 파일 | 역할 |
|---|---|---|
| `GameConfig` | `scripts/GameConfig.gd` | 전역 게임 수치 (속도, 데미지, 스폰 간격 등) |
| `GameData` | `scripts/GameData.gd` | 씬 간 데이터 전달 (`survived_time`) |

---

## GameConfig 주요 파라미터

```gdscript
# 플레이어
player_speed          = 200.0
player_max_health     = 100

# 무기 / 발사체
weapon_fire_rate      = 0.6    # 발사 간격 (초)
weapon_damage         = 15
projectile_speed      = 400.0
projectile_lifetime   = 3.0

# 적 (기본값)
enemy_base_health     = 15
enemy_base_speed      = 80.0
enemy_contact_damage  = 10

# 스포너
spawn_interval_initial   = 2.0
spawn_interval_min       = 0.5
difficulty_scale_interval = 30.0  # 난이도 상승 주기

# 경험치
gem_xp_value          = 5
xp_to_next_level      = 20
xp_level_multiplier   = 1.4
```

---

## 실행 환경

- **엔진**: Godot 4.6
- **렌더러**: Mobile (D3D12, Windows)
- **언어**: GDScript
- **플랫폼**: Windows

### 실행 방법

1. Godot 4.6 에디터에서 프로젝트 폴더(`c:/dev/godot/test`)를 열기
2. F5 또는 에디터 상단 ▶ 버튼으로 실행
3. 메인 씬: `scenes/MainMenu.tscn`

---

## 애드온

- **godot_mcp** — MCP 프로토콜을 통한 외부 도구 연동 (`addons/godot_mcp/`)
