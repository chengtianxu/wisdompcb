<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReqSubmit.aspx.cs" Inherits="ReqSubmit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>提交申请</title>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:700px;">
            <tr>
                <td>
                    工号：
                </td>
                <td>
                    <asp:TextBox ID="tbx_EmpID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    姓名：
                </td>
                <td>
                    <asp:TextBox ID="tbx_EmpName" runat="server"></asp:TextBox>
                </td>            
            </tr>
            <tr>
                <td>
                    类型：
                </td>
                <td>
                    <asp:DropDownList ID="cbx_ReqType" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="cbx_ReqType_SelectedIndexChanged">
                        <asp:ListItem Value="0">补签卡</asp:ListItem>
                        <asp:ListItem Value="1">请假</asp:ListItem>
                        <asp:ListItem Value="2">修改工时</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="cbx_RestType" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="lbl_Time" runat="server" Text="时间："></asp:Label>
                    <asp:TextBox ID="tbx_time1" runat="server"  Text="1900-01-01 00:00:00"></asp:TextBox>
                    <asp:Image ID="Imaget1" runat="server" onclick="WdatePicker({el:'tbx_time1',dateFmt:'yyyy-MM-dd HH:mm:ss',errDealMode:2,autoPickDate:true})" src="My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"></asp:Image>
                    <asp:Label ID="lbl_To" runat="server" Text="至"></asp:Label>
                    <asp:TextBox ID="tbx_time2" runat="server"  Text="1900-01-01 00:00:00"></asp:TextBox>
                    <asp:Image ID="Imaget2" runat="server" onclick="WdatePicker({el:'tbx_time2',dateFmt:'yyyy-MM-dd HH:mm:ss',errDealMode:2,autoPickDate:true})" src="My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"></asp:Image>                    
                    <asp:TextBox ID="tbx_date" runat="server" onclick="WdatePicker()" Text="1900-01-01"></asp:TextBox>
                    <asp:Image ID="Imagetdt" runat="server" onclick="WdatePicker({el:'tbx_date',dateFmt:'yyyy-MM-dd',errDealMode:2})" src="My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"></asp:Image>                                        
                    <asp:Label ID="lbl_ZB" runat="server" Text="正班："></asp:Label>
                    <asp:TextBox ID="tbx_ZB" runat="server" Width="30px"></asp:TextBox>
                    <asp:Label ID="lbl_JB" runat="server" Text="加班："></asp:Label>
                    <asp:TextBox ID="tbx_JB" runat="server" Width="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    说明：
                </td>
                <td>
                    <asp:TextBox ID="tbx_ReqNote" runat="server" TextMode="MultiLine" Width="60%" Height="80px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    提交人：
                </td>
                <td>
                    <asp:Label ID="lbl_ReqName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btn_Submit" runat="server" Text="提交" 
                        onclick="btn_Submit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_Save" runat="server" Text="保存" onclick="btn_Save_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
