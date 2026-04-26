extends Node

# ── 플레이어 ──────────────────────────────────────────────
var player_speed := 200.0
var player_max_health := 100

# ── 무기 ─────────────────────────────────────────────────
var weapon_fire_rate := 0.6       # 발사 간격 (초)
var weapon_damage := 15

# ── 발사체 ────────────────────────────────────────────────
var projectile_speed := 400.0
var projectile_lifetime := 3.0    # 소멸까지의 시간 (초)

# ── 적 (난이도 1 기준 기본값) ─────────────────────────────
var enemy_base_health := 15
var enemy_base_speed := 80.0
var enemy_contact_damage := 10
var enemy_damage_cooldown := 1.0  # 피해 간격 (초)

# ── 적 스포너 ─────────────────────────────────────────────
var spawn_interval_initial := 2.0    # 초기 스폰 간격 (초)
var spawn_interval_min := 0.5        # 최소 스폰 간격
var spawn_interval_decrease := 0.3   # 난이도 단계당 감소량
var spawn_radius := 600.0            # 플레이어로부터의 스폰 거리
var difficulty_scale_interval := 30.0   # 난이도 상승 주기 (초)
var enemy_health_per_difficulty := 20   # 단계당 체력 증가량
var enemy_speed_per_difficulty := 15.0  # 단계당 속도 증가량

# ── 경험치 ────────────────────────────────────────────────
var gem_xp_value := 5
var xp_to_next_level := 20
var xp_level_multiplier := 1.4

# ── 레벨업 강화 ───────────────────────────────────────────
var upgrade_fire_rate_min := 0.2  # 연사속도 최솟값 (초)
var upgrades := [
	{"name": "Damage Up",  "desc": "+5 Damage",       "type": "damage",    "value": 5},
	{"name": "Rapid Fire", "desc": "Attack -0.2s",    "type": "fire_rate", "value": -0.2},
	{"name": "Speed Up",   "desc": "+30 Move Speed",  "type": "speed",     "value": 30.0},
	{"name": "Vitality",   "desc": "+20 Max HP",      "type": "health",    "value": 20},
]
