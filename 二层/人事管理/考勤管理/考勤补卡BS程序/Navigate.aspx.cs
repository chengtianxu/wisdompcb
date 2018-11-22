using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Navigate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Mgr.CheckLogin( this );
    }
    protected void btn_exit_Click( object sender , EventArgs e )
    {
        Mgr.quit( this);
    }
}
