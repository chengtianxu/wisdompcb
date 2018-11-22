<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Navigate.aspx.cs" Inherits="Navigate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>考勤明细</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="right" style="width: 99%">
        <asp:Button ID="btn_exit" runat="server" Text="退出" Height="22px" 
            onclick="btn_exit_Click" />
    </div>
    <div>
        <table id="Table2" cellspacing="1" cellpadding="1" width="98%" border="1" align="center">
            <tr>
                <td align="center" bgcolor="#cccccc" colspan="2" style="height: 15px">
                    <strong><font size="6">考勤查询</font></strong>
                </td>
            </tr>
            <tr>
                <td style="width: 135px" valign="top" height="600">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/NaturalCard.aspx" 
                        Target="DataFrame">考勤明细</asp:HyperLink>
                        <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Target="DataFrame" NavigateUrl="ReqSubmit.aspx">提交申请</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink3" runat="server" Target="DataFrame" NavigateUrl="ReqView.aspx">查看申请</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink4" runat="server" Target="DataFrame" NavigateUrl="ReqDeal.aspx">处理申请</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink5" runat="server" Target="DataFrame" NavigateUrl="yearholiday.aspx">年假查询</asp:HyperLink>
                </td>
                <td valign="top" align="center" height="600">
                    <iframe name="DataFrame" width="100%" height="100%"></iframe>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
