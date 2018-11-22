<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>五洲人事管理系统</title>
</head>
<body>
    <form id="default" method="post" runat="server">
    <div align="center">
        <table id="Table2" style="height: 289px" cellspacing="1" cellpadding="1" width="98%"
            align="center" border="1">
            <tr>
                <td style="height: 60px" align="center" bgcolor="#cccccc">
                    <font size="6"><strong>人事管理系统</strong></font>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table id="Table1" style="width: 300px; height: 101px" cellspacing="1" cellpadding="1"
                        width="300" border="0">
                        <tr>
                            <td>
                                用户编号
                            </td>
                            <td>
                                <asp:TextBox ID="Tbx_userID" runat="server" width="130"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                密码
                            </td>
                            <td>
                                <asp:TextBox ID="Tbx_userpwd" runat="server" TextMode="Password" Width="130"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="Btn_login" runat="server" Text="登录" Width="52px" 
                                    onclick="Btn_login_Click1"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Btn_Reset" runat="server" Text="重置" Width="52px" 
                                    onclick="Btn_Reset_Click1"/>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <asp:Label ID="Lbl_message" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
        <h1>
        </h1>
    </div>
    <div align="center">
    </div>
    <font face="宋体"></font>
    <br />
    <div align="center">
        <font face="宋体"></font>&nbsp;</div>
    </form>
</body>
</html>
