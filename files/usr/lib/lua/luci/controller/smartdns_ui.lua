module("luci.controller.smartdns_ui", package.seeall)

function index()
    entry({"admin", "services", "smartdns_ui"}, call("action_index"), _("SmartDNS UI"), 61).dependent = false
end

function action_index()
    local http = require "luci.http"
    local util = require "luci.util"

    -- 尽可能获取访问者看到的 OpenWrt IP，用于 iframe 嵌入 SmartDNS Dashboard
    local ip = http.getenv("SERVER_NAME") or luci.sys.exec("uci get network.lan.ipaddr 2>/dev/null"):gsub("\n", "") or "127.0.0.1"

    -- 渲染视图模板并传递 IP
    luci.template.render("smartdns_ui", {
        server_ip = ip
    })
end

