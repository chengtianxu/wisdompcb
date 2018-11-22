using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class _Default : System.Web.UI.Page 
{
    private void Page_Load( object sender , System.EventArgs e )
    {
        // 在此处放置用户代码以初始化页面
    }

    
    protected void Btn_login_Click1( object sender , EventArgs e )
    {
        string username = Tbx_userID.Text;
        string pwd = Tbx_userpwd.Text;
        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(pwd))
        {
            Mgr.ShowAlert(this, "用户名或密码为空" );
            return;
        }

        if (!Mgr.CheckStr(username) || !Mgr.CheckStr(pwd))
        {
            Mgr.ShowAlert( this,"包含非法字符" );
            return;
        }

        if (Mgr.Login(this,Tbx_userID.Text, Tbx_userpwd.Text))
        {
            Response.Redirect( "Navigate.aspx");
        }
        else
        {
            //Lbl_message.Text = "用户名或密码错误";
        }
        
    }
    protected void Btn_Reset_Click1( object sender , EventArgs e )
    {
        Tbx_userID.Text = "";
        Tbx_userpwd.Text = "";
    }
}
