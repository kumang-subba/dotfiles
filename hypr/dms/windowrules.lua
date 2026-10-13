-- DMS Window Rules — managed by DankMaterialShell
-- Do not edit manually; changes may be overwritten

-- DMS-RULE: id=dms_rule_0, name=
hl.window_rule({ match = { class = ".*(Steam)$" }, workspace = "5" })

-- DMS-RULE: id=dms_rule_1, name=
hl.window_rule({ match = { class = ".*(Lutris)$" }, workspace = "5" })

-- DMS-RULE: id=dms_rule_2, name=
hl.window_rule({ match = { class = ".*(Slack)$" }, workspace = "5" })

-- DMS-RULE: id=dms_rule_3, name=
hl.window_rule({ match = { class = ".*(Discord)$" }, workspace = "6" })

-- DMS-RULE: id=dms_rule_4, name=
hl.window_rule({ match = { class = ".*(Webcord)$" }, workspace = "6" })

-- DMS-RULE: id=dms-floating-windows, name=DMS Floating Windows
hl.window_rule({ match = { class = "^com.danklinux.dms$" }, float = true })
