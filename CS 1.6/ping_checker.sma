#include <amxmodx>
#include <amxmisc>
#include <ColorChat>

#define PLUGIN "Ping Checker"
#define VERSION "1.0"
#define AUTHOR "Pavel Vodochnikov (github.com/FlemixCodes)"

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)

	register_clcmd("say /ping", "get_user_ping_func")
	register_clcmd("ping" "get_user_ping_func")
	
	new plugin_init_string[] = "Плагин [%s] загружен. Автор: %s"
	server_print(plugin_init_string, PLUGIN, AUTHOR)
}

public get_user_ping_func(id) {
	new user_ping
	new user_loss
	
	get_user_ping(id, user_ping, user_loss)
	
	ColorChat(id, GREEN, "^1Ваш пинг: ^3%d", user_ping)
	ColorChat(id, GREEN, "^1Потеря пакетов: ^3%d", user_loss)
}

public plugin_end() {
	new plugin_end_string[] = "Плагин [%s] выгружен. Автор: %s"
	server_print(plugin_end_string, PLUGIN, AUTHOR)
}
