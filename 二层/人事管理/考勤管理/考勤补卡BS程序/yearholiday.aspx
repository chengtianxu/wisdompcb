<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yearholiday.aspx.cs" Inherits="yearholiday" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>年假查询</title>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <h1>年假查询</h1>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label4" runat="server" Text="查询方式："></asp:Label>
        <asp:DropDownList ID="SelectType" runat="server" AutoPostBack="True" 
            onselectedindexchanged="SelectType_SelectedIndexChanged">
            <asp:ListItem>按工号查</asp:ListItem>
            <asp:ListItem>按部门查</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LeiXing" runat="server" Text="工号："></asp:Label>
    
        <asp:TextBox ID="GH" runat="server"></asp:TextBox>
                <asp:DropDownList ID="cbx_depart" runat="server" Visible = "false">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="年份："></asp:Label>
    <asp:TextBox ID="YearTime" runat="server" onclick="WdatePicker({dateFmt:'yyyy年',startDate:'2013-01-01',alwaysUseStartDate:true,vel:'Years'})" Width="80px" Text="2012-01-01" ></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
    
        <asp:TextBox ID="Years" runat="server" Visible="false"></asp:TextBox>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <RowStyle BackColor="White" ForeColor="#330099" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    </asp:GridView>
    </form>
</body>
</html>
