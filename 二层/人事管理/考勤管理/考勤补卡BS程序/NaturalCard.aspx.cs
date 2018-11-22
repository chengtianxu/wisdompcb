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

public partial class NaturalCard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Mgr.CheckLogin( this,1 );
        if (!IsPostBack)
        {
            BeginTime.Text = System.DateTime.Now.Date.ToString("yyyy-MM-dd");
            EndTime.Text = System.DateTime.Now.AddDays( 1 ).Date.ToString( "yyyy-MM-dd" );
            GetAllDepart( );
        }
    }

    private void GetAllDepart()
    {
        DBBase db = new DBBase( );
        string s = "SELECT Rkey, departmentname FROm datadepartment";
        DataTable dt  = new DataTable( );
        dt = db.SqlOpen( s );
        cbx_depart.DataSource = dt;
        cbx_depart.DataTextField = "departmentname";
        cbx_depart.DataValueField = "Rkey";
        cbx_depart.DataBind( );
    }

    private void GetSelectData()
    {
        DBBase db = new DBBase( );
        if (!Mgr.CheckDate(BeginTime.Text) || !Mgr.CheckDate(EndTime.Text))
        {
            Mgr.ShowAlert( this,"时间格式不正确" );
            return;
        }

        string s = "SELECT top 100 d2.chinesename AS 姓名,d2.employeecode AS 工号, d1.CheckDate AS 日期, d1.OnDutytime1 AS 签到1 , d1.OffDutytime1 AS 签退1, d1.OnDutytime2 AS 签到2 , d1.OffDutytime2 AS 签退2,d1.OnDutytime3 AS 签到3 , d1.OffDutytime3 AS 签退3, d1.YTNote AS 异常, d1.RWT AS 正班 , d1.ROT AS 加班 , d1.SWT AS 需正, d1.OWT AS 需加  FROM OnOffDutyData d1 ";
        s += "INNER JOIN employeemsg d2 ON d1.EmployeeID = d2.Rkey ";
        s += "  LEFT JOIN class d4 ON d1.ClassID = d4.RKey ";
        s += " LEFT JOIN resttypemsg d3 ON d1.RestType = d3.rkey ";
        s += " INNER JOIN datadepartment d5 ON d2.departmentid = d5.RKey ";
        s += " WHERE d1.CheckDate BETWEEN " + Mgr.QuoteStr(BeginTime.Text) + " AND " + Mgr.QuoteStr(EndTime.Text);
        if (!string.IsNullOrEmpty(tbx_GH.Text))
        {
            s += " AND d2.employeecode = " + Mgr.QuoteStr( tbx_GH.Text );
        }
        s += " AND d5.RKey=" + cbx_depart.SelectedValue.ToString( );
        DataTable dt = new DataTable( );
        dt = db.SqlOpen( s );
        NaturalView.DataSource = dt;
        NaturalView.DataBind();
    }

    protected void Button2_Click( object sender , EventArgs e )
    {
        GetSelectData( );
    }
    protected void NaturalView_PageIndexChanging( object sender , GridViewPageEventArgs e )
    {
        NaturalView.PageIndex = e.NewPageIndex;
        GetSelectData( );
    }
}
