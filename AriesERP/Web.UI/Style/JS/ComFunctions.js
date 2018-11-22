
//=============以下是自定义扩展================
var companyArr = parent.companyArr;
function BindCompany(obj) {
    var companyData = [];
    companyData.push({ value: "", text: AR.Lang.select });
    companyData.push({ value: "ALL", text: AR.Lang.allCompany });
    companyData = companyData.concat(AR.Utility.cloneArray(companyArr, true));
    $('#' + obj).combobox({
        data: companyData,
        valueField: 'value',
        textField: 'text',
        editable: false,
        multiple: true,
        onLoadSuccess: function () {
            //$('#'+obj).combobox('select', AR.Utility.Cookie.get('aries_company'));
            $('#' + obj).combobox('select', "");
        },
        onSelect: function (record) {
            if (record.value != "") { $('#' + obj).combobox('unselect', ""); }
            if (record.value == "ALL") {
                while ($('#' + obj).combobox('getValue') != "ALL") {
                    $('#' + obj).combobox('unselect', $('#' + obj).combobox('getValue'));
                }
            } else {
                if (record.value != "") { $('#' + obj).combobox('unselect', "ALL"); }
                if ($('#' + obj).combobox('getValue')) { $('#' + obj).combobox('unselect', ""); }
            }
            var selFun = eval($(this).attr("onchange"));
            if (typeof (eval(selFun)) == "function") {
                eval(selFun).call(this, $(this).combobox('getValues'), $(this).combobox('getText'));
            }
        },
        onUnselect: function (record) {
            if (!$('#' + obj).combobox('getValue')) { $('#' + obj).combobox('select', ""); }
            var selFun = eval($(this).attr("onchange"));
            if (typeof (eval(selFun)) == "function") {
                eval(selFun).call(this, $(this).combobox('getValues'), $(this).combobox('getText'));
            }
        }
    })
}
function BindCompanyOnly(obj) {
    var companyData = [];
    companyData.push({ value: "", text: AR.Lang.select });
    companyData = companyData.concat(AR.Utility.cloneArray(companyArr, true));
    $('#' + obj).combobox({
        data: companyData,
        valueField: 'value',
        textField: 'text',
        editable: false,
        multiple: false,
        onLoadSuccess: function () {
            $('#' + obj).combobox('select', "");
        }
    })
}
/*日期加减天数或月份或年份得到新日期*/
function AddDate(date, num, type) {
    var val = date;
    var dArr = date.split("-");
    var d = new Date(dArr[0], parseInt(dArr[1], 10) - 1, parseInt(dArr[2], 10));
    //if (d.getDate() != parseInt(dArr[2])) { num--; }
    switch (type) {
        case "year":
            d.setYear(d.getFullYear() + num);
            var month = d.getMonth() + 1;
            var day = d.getDate();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            val = d.getFullYear() + "-" + month + "-" + day;
            break;
        case "month":
            d.setMonth(d.getMonth() + num);
            var month = d.getMonth() + 1;
            var day = d.getDate();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            val = d.getFullYear() + "-" + month + "-" + day;
            break;
        default:
            d.setDate(d.getDate() + num);
            var month = d.getMonth() + 1;
            var day = d.getDate();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            val = d.getFullYear() + "-" + month + "-" + day;
            break;
    }
    return val;
}
/*两日期相减得到天数*/
function dateDiff(cdt1, cdt2) {
    var sArr = cdt2.split("-");
    var eArr = cdt1.split("-");
    var sRDate = new Date(sArr[0], sArr[1], sArr[2]);
    var eRDate = new Date(eArr[0], eArr[1], eArr[2]);
    var days = (sRDate - eRDate) / (24 * 60 * 60 * 1000);
    return days;
}
/*取数据库服务器当前日期*/
function getServerDate() {
    var reDate = "";
    return reDate = $.ajax({
        url: "ajax.html?sys_method=GetDate",
        async: false
    }).responseText;
}

//在子页面中打开tab页(同index页的菜单点击功能,区别为子页面需要使用top.jQuery的方式取到相关对象)
function showTab(url, text, isAddBackUrl) {
    if (typeof (url) == 'string') {
        if (url.length > 4) {
            var tab = addTab(url, text, isAddBackUrl);
            tabCloseFunc(tab);
            return false;
        }
    }
    return true;
}

//传入tab添加关闭功能
function tabCloseFunc(tab) {
    var span = tab.panel('options').tab.find('.tabs-inner');
    span.unbind("dblclick").dblclick(function () {
        var subtitle = $(this).children("span").text();
        var jq = top.jQuery;
        jq('#tabs').tabs('close', subtitle);
    });

    span.unbind('contextmenu').bind('contextmenu', function (e) {
        var jq = top.jQuery;
        var mm = jq('#mm');
        mm.menu('show', {
            left: e.pageX,
            top: e.pageY
        });
        var subtitle = $(this).children("span").text();
        mm.data("currtab", subtitle);
        return false;
    });
}
//添加选项卡方法，根据iframe模式
function addTab(url, title, isAddHistory) {
    var h = 42;
    var jq = top.jQuery;
    var TabContainer = jq("#tabs");
    var iframe = $("<iframe frameborder='0' />");
    iframe.attr({ "src": url, "id": "f_center" }).css({ width: "100%", height: TabContainer.height() - h });
    //判断选项卡不存在则新增一个选项卡
    var tab = null;
    if (!TabContainer.tabs("exists", title)) {
        if (TabContainer.tabs("tabs").length >= 12) {
            $.messager.alert("提示", "打开的页面太多！请先关闭部分页面。", "info")
            return;
        }
        tab = TabContainer.tabs('add', {
            title: title,
            content: iframe,
            closable: true,
            tools: [{
                iconCls: 'icon-mini-refresh',
                handler: function () {
                    var tab = $("#tabs").tabs("getTab", title);
                    tab.panel('refresh');//ie8下没反应
                    //this.iframe[0].src = url;
                }
            }]
        });
    } else {
        tab = TabContainer.tabs("getTab", title);
        var oldSrc = tab.panel().panel('body').find('#f_center').attr('src');
        if (isAddHistory == true) {
            if (typeof (tab.historyUrl) == 'undefined')
                tab.historyUrl = new Array();
            tab.historyUrl.push(oldSrc);
        }
        tab.panel("options").content = iframe;
        TabContainer.tabs("select", title);
        //TabContainer.tabs('update', { tab: tab, options: { content: iframe } });
        // tab.panel('refresh');
    }
    //不自动关闭，改为提示
    //if (TabContainer.tabs("tabs").length > 12) {
    //    TabContainer.tabs("close", 0);
    //}
    return TabContainer.tabs('getTab', title);
}

/*日期控件只显示年月*/
function init_yearMonth(id) {
    var db = $('#' + id);
    db.datebox({
        editable: false,
        prompt: '选择年月',
        validType: [],
        onShowPanel: function () {//显示日趋选择对象后再触发弹出月份层的事件，初始化时没有生成月份层
            span.trigger('click'); //触发click事件弹出月份层
            if (!tds) setTimeout(function () {//延时触发获取月份对象，因为上面的事件触发和对象生成有时间间隔
                tds = p.find('div.calendar-menu-month-inner td');
                tds.click(function (e) {
                    e.stopPropagation(); //禁止冒泡执行easyui给月份绑定的事件
                    var year = /\d{4}/.exec(span.html())[0]//得到年份
                    , month = parseInt($(this).attr('abbr'), 10); //月份，这里不需要+1
                    db.datebox('hidePanel')//隐藏日期对象
                    .datebox('setValue', year + '-' + (month > 9 ? month : '0' + month)); //设置日期的值
                });
            }, 0);
            yearIpt.unbind();//解绑年份输入框中任何事件
            $(yearIpt).attr('readonly', true);//年份只读
            $(yearIpt).css('border-color', 'white');//边框去掉
        },
        parser: function (s) {
            if (!s) return new Date();
            var arr = s.split('-');
            return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);
        },
        formatter: function (d) {
            var currentMonth = (d.getMonth() + 1);
            var currentMonthStr = currentMonth < 10 ? ('0' + currentMonth) : (currentMonth + '');
            return d.getFullYear() + '-' + currentMonthStr;
        }
    });
    var p = db.datebox('panel'), //日期选择对象
    tds = false, //日期选择对象中月份
    aToday = p.find('a.datebox-current'),
    yearIpt = p.find('input.calendar-menu-year'),//年份输入框
    //显示月份层的触发控件
    span = aToday.length ? p.find('div.calendar-title span') ://1.3.x版本
    p.find('span.calendar-text'); //1.4.x版本
    if (aToday.length) {//1.3.x版本，取消Today按钮的click事件，重新绑定新事件设置日期框为今天，防止弹出日期选择面板
        aToday.unbind('click').click(function () {
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            db.datebox('hidePanel').datebox('setValue', year + '-' + (month > 9 ? month : '0' + month));
        });
    }
}
/*绑定导出按钮到查询区*/
function SearchBind_BtnExport() {
    //延时调用确保取到actionKeys的权限值
    if (!AR.Global.Variable.actionKeys) {
        setTimeout(function () { SearchBind_BtnExport(); }, 5);
        return;
    }
    var actionKeys = AR.Global.Variable.actionKeys || "";
    if (actionKeys.indexOf(',export,') > -1) {
        dg.ToolBar.BtnExport.$target = $('<a href="#" flag=\"btn_export2\"><span class=\"btn-export\">' + AR.Lang.btexport + '</span></a>');
        dg.Search.BtnQuery.$target.parent().parent().append($("<a>").append(dg.ToolBar.BtnExport.$target));

        dg.Search.$target.delegate("[flag = 'btn_export2']", "click", function () {
            dg.ToolBar.BtnExport.onExecute(dg);
        });
    }
}
/*下载文件(从数据库)*/
function Download_DB(method, tableName, searchStr, fileDocField, fileNameField, Extension) {
    var ifrme = $("#div_ifrme_files"), form_export = $("#form_files");
    ifrme && ifrme.remove(); form_export && form_export.remove();
    var iframeName = "framePost";
    ifrme = $("<iframe>").attr("id", "div_ifrme_files").attr("name", iframeName).css({ display: 'none' });
    var url = AR.Utility.Ajax.Settings.url;
    form_export = $("<form>").attr("action", url).attr("target", iframeName).attr("id", "form_files");
    var param = {
        sys_objName: tableName,
        sys_tableName: tableName,
        sys_method: method,
        fileDocField: fileDocField, //文件内容
        fileNameField: fileNameField,//文件名或扩展名
        fileExtension: Extension,//有存文件名或扩展名时,不用再传扩展名
        sys_search: searchStr, //查询条件
        sys_mid: AR.Global.Variable.mid
    };
    for (var k in param) {
        form_export.append($("<input>").attr("name", k).val(param[k]).attr("type", "hidden"));
    }
    $("body").append(ifrme);
    $("body").append(form_export);
    form_export[0].submit();
    form_export.remove();
}
/*下载文件(从FTP服务器)*/
function Download_FTP(method, FtpIDKey) {
    var ifrme = $("#div_ifrme_files"), form_export = $("#form_files");
    ifrme && ifrme.remove(); form_export && form_export.remove();
    var iframeName = "framePost";
    ifrme = $("<iframe>").attr("id", "div_ifrme_files").attr("name", iframeName).css({ display: 'none' });
    var url = AR.Utility.Ajax.Settings.url;
    form_export = $("<form>").attr("action", url).attr("target", iframeName).attr("id", "form_files");
    var param = {
        //sys_objName: tableName,
        //sys_tableName: tableName,
        sys_method: method,
        FtpIDKey: FtpIDKey,
        sys_mid: AR.Global.Variable.mid
    };
    for (var k in param) {
        form_export.append($("<input>").attr("name", k).val(param[k]).attr("type", "hidden"));
    }
    $("body").append(ifrme);
    $("body").append(form_export);
    form_export[0].submit();
    form_export.remove();
}