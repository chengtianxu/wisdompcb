using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class yearholiday : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Mgr.CheckLogin( this , 1 );
        if ( !IsPostBack )
        {
            Years.Text = YearTime.Text;
            GetAllDepart( );
        }
    }

    private void GetAllDepart( )
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

    protected void SelectType_SelectedIndexChanged( object sender , EventArgs e )
    {
        if ( SelectType.SelectedIndex == 0 )
        {
            LeiXing.Text = "工号：";
            GH.Visible = true;
            cbx_depart.Visible = false;
        }
        if ( SelectType.SelectedIndex == 1 )
        {
            LeiXing.Text = "部门：";
            GH.Visible = false;
            cbx_depart.Visible = true;
        }
    }
    protected void Button1_Click( object sender , EventArgs e )
    {
        DBBase db = new DBBase( );
        string s = "";
        DataTable dt = new DataTable( );
        switch ( SelectType.SelectedIndex )
        {
            case 0:
                if ( !Mgr.CheckStr( GH.Text ) )
                {
                    Mgr.ShowAlert( this , "工号不正确" );
                    return;
                }
                s = "select departmentname AS '部门名字', employeecode AS '工号', chinesename AS '姓名',ondutytime AS '入职日期',qualified as '休假资格',year_s3 as '年假产生年',year_s1 AS '休假年',shouldhav AS '年假天数', h_used AS '已休天数',h_left AS '剩余天数' from  dbo.V_employee_yearholiday ";
                s += " WHERE employeecode = " + GH.Text ;
                s += " AND year_s1 = " + Mgr.QuoteStr( Convert.ToDateTime( YearTime.Text ).Year.ToString( ) );
                s += " order By employeecode ASC";
                dt = db.SqlOpen( s );
                GridView1.DataSource = dt;
                GridView1.DataBind( );
                break;
            case 1:
                s = "select departmentname AS '部门名字', employeecode AS '工号', chinesename AS '姓名',ondutytime AS '入职日期',qualified as '休假资格',year_s3 as '年假产生年',year_s1 AS '休假年',shouldhav AS '年假天数', h_used AS '已休天数',h_left AS '剩余天数' from  dbo.V_employee_yearholiday ";
                s += " WHERE departmentname = " + Mgr.QuoteStr( cbx_depart.SelectedItem.Text );
                s += " AND year_s1 = " + Mgr.QuoteStr( Convert.ToDateTime( YearTime.Text ).Year.ToString( ) );
                s += " order By employeecode ASC";
                dt = db.SqlOpen( s );
                GridView1.DataSource = dt;
                GridView1.DataBind( );
                break;
            default:
                break;
        }
        
    }
}
