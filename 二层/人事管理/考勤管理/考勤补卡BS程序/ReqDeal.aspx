<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReqDeal.aspx.cs" Inherits="ReqDeal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>申请处理</title>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h4>
        处理申请</h4>    
    <div>
        <asp:Label ID="Label1" runat="server" Text="时间"></asp:Label>
        <asp:TextBox ID="BeginTime" runat="server" onclick="WdatePicker()" Width="80px" Text="1900-01-01"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="至"></asp:Label>
        <asp:TextBox ID="EndTime" runat="server" onclick="WdatePicker()" Width="80px" Text="1900-01-01"></asp:TextBox>
        <asp:Button ID="Btn_Search" runat="server" Text="查看" 
            onclick="Btn_Search_Click" />
        <asp:DropDownList ID="cbx_type" runat="server">
            <asp:ListItem Value="1">未处理</asp:ListItem>
            <asp:ListItem Value="2">已处理</asp:ListItem>
            <asp:ListItem Value="3">退回</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="工号："></asp:Label>
        <asp:TextBox ID="tbxEmployID" runat="server" Width="67px"></asp:TextBox>
        <asp:GridView ID="ReqDataView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="RKey,Cardno,employeeid,AskForLeaveRK" 
            onpageindexchanging="ReqDataView_PageIndexChanging" PageSize="200">
            <Columns>
                <asp:TemplateField HeaderText="选">
                    <ItemStyle Height="25px" HorizontalAlign="Center" Width="30px" />
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RKey" HeaderText="RKey" SortExpression="RKey" 
                    Visible="False" />
                <asp:BoundField DataField="工号" HeaderText="工号" SortExpression="工号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="类型" HeaderText="类型" SortExpression="类型" />
                <asp:BoundField DataField="LeaveType" HeaderText="请假类型" />
                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                <asp:BoundField DataField="提交人" HeaderText="提交人" SortExpression="提交人" />
                <asp:BoundField DataField="提交时间" HeaderText="提交时间" SortExpression="提交时间" />
                <asp:BoundField DataField="状态" HeaderText="状态" SortExpression="状态" />
                <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="req_cardtime" />
                <asp:BoundField DataField="始" HeaderText="始" SortExpression="req_starttime" />
                <asp:BoundField DataField="终" HeaderText="终" SortExpression="req_endtime" />
                <asp:BoundField DataField="正班" HeaderText="正班" SortExpression="ZBHour" />
                <asp:BoundField DataField="加班" HeaderText="加班" SortExpression="JBHour" />
                <asp:BoundField DataField="受理人" HeaderText="受理人" SortExpression="DealPerson" />
                <asp:BoundField DataField="受理时间" HeaderText="受理时间" SortExpression="DealTime" />
                <asp:BoundField DataField="Cardno" SortExpression="Cardno" Visible="False" />
                <asp:BoundField DataField="employeeid" SortExpression="employeeid" 
                    Visible="False" />
                <asp:BoundField DataField="AskForLeaveRK" SortExpression="AskForLeaveRK" 
                    Visible="False" />
            </Columns>
        </asp:GridView>    
    </div>
    <div>
        <asp:Button ID="Btn_Deal" runat="server" Text="处理" onclick="Btn_Deal_Click" />
        <asp:Button ID="Btn_PostBack" runat="server" Text="退回" 
            onclick="Btn_PostBack_Click" />
    </div>
    </form>
</body>
</html>
