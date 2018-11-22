/*20180328 by yjy
图表汇总相关公用函数,有特殊需求重载即可
引用了全局变量groupValue1,groupValue2,curData,rowGroup1,rowGroup2,showUnit需先定义
*/
var _option = null;         //图表选项
var _totFieldname = "汇总"; //汇总要显示的标题

/*按汇总方式赋值*/
function SetRowGroup(data) {
    if (data.rows.length > 0) {
        rowGroup1 = [];
        rowGroup2 = [];
        var curValue1 = "";
        if (!(typeof (isLocal) != "undefined" && isLocal)) { curData.rows = data.rows; }

        for (var i = 0; i < data.rows.length; i++) {
            if (curValue1 != data.rows[i][groupValue1]) {
                curValue1 = data.rows[i][groupValue1];
                rowGroup1.push(curValue1);
            }
            for (var j = 0; j < rowGroup2.length; j++) {
                if (rowGroup2[j] == data.rows[i][groupValue2]) {
                    break;
                }
            }
            if (j == rowGroup2.length) {
                if (groupValue2) {
                    rowGroup2[j] = data.rows[i][groupValue2];
                }
            }
        }
        if (rowGroup2.length == 0) {
            rowGroup2[0] = showUnitTitle;
        }
    }
}
/*显示汇总*/
function ShowTotals(data, dg2) {
    //setTimeout(function () {
        //$.messager.progress({ title: "请稍候..." });
        //重新定义Grid显示格式
        var xcolumns = [];
        if (groupValue1) {
            xcolumns.push({ align: "left", field: groupValue1, title: groupValue1, width: 120 });
        }
        $.each(rowGroup2, function (key, val) {
            xcolumns.push({ align: val.align ? val.align : "right", field: val, title: val, width: val.width ? val.width : 120 });
        });
        if (groupValue2) {
            xcolumns.push({ align: "right", field: _totFieldname, title: _totFieldname, width: 120 });
        }
        dg2.datagrid("options").columns[0] = xcolumns
        dg2.datagrid();
        try{
            dg2Data.rows = [];
        }catch(e){
            dg2Data = curData; 
            dg2Data.rows = [];
        }
        //dg2Data.rows = [];
        dg2Data.rows[rowGroup1.length] = [];
        dg2Data.rows[rowGroup1.length][groupValue1] = _totFieldname + ":";
        dg2Data.total = rowGroup1.length + 1;
        CountItem(data, dg2, dg2Data, 0);
   // }, 5);
}
/*
填充数据及计算汇总,数据量大时会卡死IE,使用分段延时加载
*/
function CountItem(data, dg2,dg2Data, rowGroup1Len) {
    if (rowGroup1Len == rowGroup1.length) {
        if (dg2.options.pagination!=false) {
            var yData = [];
            yData.rows = dg2Data.rows.slice(0, dg2.options.pageSize);
            yData.total = dg2Data.total;
            dg2.datagrid("unselectAll");
            dg2.datagrid('options').pageNumber = 1;
            dg2.datagrid('getPager').data("pagination").options.pageNumber = 1;
            dg2.datagrid("loadData", yData);
        } else {
            dg2.datagrid("loadData", curData);
        }
        //$.messager.progress('close');
        return;
    }
    var n = 1;
    if (rowGroup1Len + n > rowGroup1.length) { n = rowGroup1.length - rowGroup1Len; }
    for (var i = 0; i < rowGroup2.length; i++) {
        var gValue = rowGroup2[i];
        if (!dg2Data.rows[rowGroup1.length][gValue]) { dg2Data.rows[rowGroup1.length][gValue] = 0;}
        for (var j = rowGroup1Len; j < rowGroup1Len + n; j++) {
            if (!dg2Data.rows[j]) {
                dg2Data.rows[j] = [];
                dg2Data.rows[j][groupValue1] = rowGroup1[j]; 
                if (groupValue2) { dg2Data.rows[j][_totFieldname] = 0; }
            }
            for (var k = 0; k < data.rows.length; k++) {
                if (rowGroup1[j] == data.rows[k][groupValue1] && (gValue == data.rows[k][groupValue2] || !groupValue2)) {
                    dg2Data.rows[j][gValue] = data.rows[k][showUnit];
                    if (groupValue2) {
                        //行汇总
                        dg2Data.rows[j][_totFieldname] += dg2Data.rows[j][gValue];
                        dg2Data.rows[j][_totFieldname] = Number(dg2Data.rows[j][_totFieldname].toFixed(4));
                    }
                    //列汇总
                    dg2Data.rows[rowGroup1.length][gValue] += dg2Data.rows[j][gValue];
                    dg2Data.rows[rowGroup1.length][gValue] = Number(dg2Data.rows[rowGroup1.length][gValue].toFixed(4));
                    break;
                }
            }
        }
    }
    setTimeout(function () { CountItem(data, dg2, dg2Data, rowGroup1Len + n); }, 1) //延时分段执行
}
/*显示图表*/
function ShowCharts(data) {

    _option = {
        //color: ['#003366', '#006699', '#4cabce', '#e5323e', '#005eaa','#339ca8','#cda819','#32a487'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: rowGroup2 //取图例数据
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
            feature: {
                //dataZoom: {
                //    yAxisIndex: 'none'
                //},
                //mark: { show: true },
                //dataView: {
                //    //lang: ['数据视图', '关闭', '下载'],
                //    show: true,
                //    readOnly: false,
                //    optionToContent: function (opt) {
                //        return showEchartsView(opt,groupValue1); //设置图表数据视图样式
                //    }
                //},
                magicType: { show: true, type: ['line', 'bar', 'stack', 'tiled'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: rowGroup1
            }
        ],
        yAxis: [
            {
                name: showUnitTitle,
                type: 'value'
            }
        ],
        series: get_series(curData.rows, rowGroup1, rowGroup2) //取图表数据
    };

    if (_option && typeof _option == "object") {
        myChart.setOption(_option, true);
    }
}
/*填充图表数据*/
function get_seriesData(rows, rowGroup1, gValue) {
    var reData = [];
    for (var i = 0; i < rowGroup1.length; i++) {
        reData[i] = 0;
        for (var j = 0; j < rows.length; j++) {
            if (rowGroup1[i] == rows[j][groupValue1] && (gValue == rows[j][groupValue2] || !groupValue2)) {
                reData[i] = rows[j][showUnit];
                break;
            }
        }
    }
    return reData;
}
/*动态设置图表*/
function get_series(rows, rowGroup1, rowGroup2) {
    var reData = [];
    for (var i = 0; i < rowGroup2.length; i++) {
        var str = {
            name: rowGroup2[i],
            type: 'bar',
            label: {
                normal: {
                    show: true,            //显示数字
                    position: 'top'        //这里可以自己选择位置
                }
            },
            barMaxWidth: 60,
            barGap: 0,
            data: get_seriesData(rows, rowGroup1, rowGroup2[i])
        }
        reData.push(str);
    }
    return reData;
}

/*数据汇总中的统计*/
function computeTotal(dg2) {
    return;//旧方法暂时不用
    var rows = dg2.datagrid('getRows');
    var totalArr = [];
    totalArr[0] = {};
    totalArr[0][groupValue1] = _totFieldname+":";
    for (var i = 0; i < rows.length; i++) {
        for (var j = 0; j < rowGroup2.length; j++) {
            if (!totalArr[j + 1]) {
                totalArr[j + 1] = {};
                totalArr[j + 1][rowGroup2[j]] = 0;
            }
            totalArr[j + 1][rowGroup2[j]] += parseInt(rows[i][rowGroup2[j]], 10) ? rows[i][rowGroup2[j]] : 0;
            totalArr[j + 1][rowGroup2[j]] = Number(totalArr[j + 1][rowGroup2[j]].toFixed(4));
        }
        if (groupValue2) {
            if (!totalArr[j + 1]) {
                totalArr[j + 1] = {};
                totalArr[j + 1][_totFieldname] = 0;
            }
            totalArr[j + 1][_totFieldname] += rows[i][_totFieldname];
            totalArr[j + 1][_totFieldname] = Number(totalArr[j + 1][_totFieldname].toFixed(4));
        }
    }
    var test = JSON.stringify(totalArr);
    eval("test = '" + test + "'");
    test = test.replace(/{/g, "").replace(/}/g, "");
    test = "{" + test.substr(1, test.length - 2) + "}";
    test = JSON.parse(test);
    //新增一行显示统计信息
    dg2.datagrid('appendRow', test);

    //dg2.datagrid('reloadFooter',[
    //    {日期: '汇总：', 数量: total1 }
    //]);
}