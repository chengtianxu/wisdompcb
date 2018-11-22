<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NaturalCard.aspx.cs" Inherits="NaturalCard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head id="Head1" runat="server">
    <title>卡原始记录</title>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h4>考勤记录</h4>
    <div>
        <asp:Label ID="Label1" runat="server" Text="起始时间："></asp:Label>
        <asp:TextBox ID="BeginTime" runat="server" onclick="WdatePicker()" Text="1900-01-01" 
            Width="80px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="结束时间："></asp:Label>
        <asp:TextBox ID="EndTime" runat="server" onclick="WdatePicker()" Width="80px" Text="1900-01-01" ></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="部门："></asp:Label>
        <asp:DropDownList ID="cbx_depart" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label5" runat="server" Text="类型："></asp:Label>
        <asp:DropDownList ID="cbx_SelectType" runat="server">
            <asp:ListItem Value="0">考勤数据</asp:ListItem>
            <asp:ListItem Value="1">原始数据</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="工号："></asp:Label>
        <asp:TextBox ID="tbx_GH" runat="server" Width="68px"></asp:TextBox>
        <asp:Button ID="Btn_Search" runat="server" Text="查询" onclick="Button2_Click" />
        <asp:GridView ID="NaturalView" runat="server" AllowPaging="True" Height="100%" 
            Width="100%" onpageindexchanging="NaturalView_PageIndexChanging">    
        </asp:GridView>                
    </div>
    </form>
</body>
</html>
