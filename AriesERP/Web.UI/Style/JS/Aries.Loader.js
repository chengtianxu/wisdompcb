/// <reference path="/Style/JS/jquery-1.7.1.min.js" />
/// <reference path="/Style/JS/json2.js" />
/// <reference path="/Style/JS/EasyUI/jquery.easyui.min.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Global.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Utility.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Upload.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Common.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Combobox.js" />
/// <reference path="/Style/JS/AriesJS/Aries.DataGrid.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Form.js" />
//语言设置
var catalog = window.location.pathname;
catalog = catalog.substr(0, catalog.lastIndexOf("/"));
catalog = catalog.substr(catalog.lastIndexOf("/") + 1);
window.AR || (window.AR = {});
(function ($Core) {
    $Core.Lang || ($Core.Lang = {});
    $Core.Lang = getLang(catalog);
})(window.AR)
function getLang(module) { return parent.getLang(catalog); }

//取Cookie
function getCookie(name) {
    var c = document.cookie;
    var start = c.indexOf(name);
    if (start > -1) {
        start = start + name.length + 1;
        var end = c.indexOf(';', start);
        if (end > start) {
            return c.substr(start, end - start);
        }
        return c.substr(start, c.length - start);
    }
    return "";
}
var themeName = getCookie('sys_theme') || 'default';
var ui = getCookie('sys_ui');
var vs = Math.random() * 10;
document.write('<link id="lk_theme" href="' + ui + '/Style/JS/EasyUI/themes/' + themeName + '/easyui.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + ui + '/Style/CSS/main.css" rel="stylesheet" />');
document.write('<link href="' + ui + '/Style/JS/EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />');
document.write('<script src="' + ui + '/Style/JS/jquery-1.7.1.min.js"></script>');
document.write('<script src="' + ui + '/Style/JS/json2.js" ></script>');
document.write('<script src="' + ui + '/Style/JS/EasyUI/jquery.easyui.min.js?"></script>');
if (getCookie('aries_lang') == "English") {
    document.write('<script src="' + ui + '/Style/JS/EasyUI/locale/easyui-lang-en.js"></script>');
} else {
    document.write('<script src="' + ui + '/Style/JS/EasyUI/locale/easyui-lang-zh_CN.js"></script>');
}
//document.write('<script src="' + ui + '/Style/JS/LangSet/Aries.Lang-PB.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Global.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.EasyUIExtend.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Utility.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Upload.js?v=' + vs + '"></script> ');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Common.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Combobox.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.DataGrid.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Form.js?v=' + vs + '"></script>');
document.write('<script src="' + ui + '/Style/JS/ComFunctions.js?v=' + vs + '"></script>');