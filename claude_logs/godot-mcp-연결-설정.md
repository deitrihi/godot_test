# godot-mcp-연결-설정
날짜: 2026-05-13

## 세션 개요
Claude Code에서 Godot 프로젝트에 MCP를 연결하기 위한 설정을 완료한다.

## 작업 로그

### MCP 설정 파일 조사
- 요청: CLAUDE.md 확인 및 godot mcp 연결 설정
- 발견: `addons/godot_mcp` 플러그인이 이미 설치되어 있음 (v0.5.0)
- 발견: Claude Code `settings.json`에 `mcpServers` 항목 없었음
- 결정: `claude mcp add` CLI 명령으로 등록 (settings.json이 아닌 .claude.json에 저장됨)

### godot-mcp 설치 확인
- `npx godot-mcp` 실행 시 자동 설치되며 정상 동작 확인
- Godot 경로: `C:\app\Godot_v4.6.2-stable_mono_win64\Godot_v4.6.2-stable_mono_win64.exe`

### MCP 서버 등록
- 명령: `claude mcp add godot npx godot-mcp -s user -e GODOT_PATH="..."`
- 결과: `C:\Users\deitr\.claude.json`에 user 스코프로 등록 완료
- `mcpServers.godot.type = stdio`, `command = npx`, `args = [godot-mcp]`

### 연결 구조
```
Claude Code → npx godot-mcp (stdio) → ws://127.0.0.1:6505 → Godot Editor (addons/godot_mcp)
```

## 다음 단계
- Claude Code 재시작 후 MCP 서버 활성화 확인
- Godot 에디터에서 `addons/godot_mcp` 플러그인 활성화 상태 확인 (Project > Project Settings > Plugins)
- 에디터 툴바에 "MCP: No Agent" 표시되면 연결 성공
