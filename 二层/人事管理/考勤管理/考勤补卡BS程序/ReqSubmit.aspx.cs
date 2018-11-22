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

public partial class ReqSubmit : System.Web.UI.Page
{
    private string Cardno, rkey;
    protected void Page_Load(object sender, EventArgs e)
    {
        Mgr.CheckLogin( this , 2 );
        if (!IsPostBack)
        {
            tbx_date.Text = System.DateTime.Now.Date.ToString("yyyy-MM-dd" );
            tbx_time1.Text = System.DateTime.Now.ToString( );
            tbx_time2.Text = System.DateTime.Now.ToString( );
            cbx_ReqType_SelectedIndexChanged( sender , e );
            GetRestType( );    
        }
    }

    protected void GetRestType()
    {
        string s = "SELECT Rkey,leavetype FROM askforleave";
        DBBase db = new DBBase( );
        DataTable tb = new DataTable( );
        tb = db.SqlOpen( s );
        cbx_RestType.DataSource = tb;
        cbx_RestType.DataTextField = "leavetype";
        cbx_RestType.DataValueField = "Rkey";
        cbx_RestType.DataBind( );
    }

    protected void cbx_ReqType_SelectedIndexChanged( object sender , EventArgs e )
    {
        switch (cbx_ReqType.SelectedIndex)
        {
            case 0:
                tbx_time1.Visible = true;
                Imaget1.Visible = true;
                cbx_RestType.Visible = false;
                lbl_To.Visible = false;
                tbx_time2.Visible = false;
                Imaget2.Visible = false;
                tbx_date.Visible = false;
                Imagetdt.Visible = false;
                lbl_ZB.Visible = false;
                tbx_ZB.Visible = false;
                lbl_JB.Visible = false;
                tbx_JB.Visible = false;
                break;
            case 1:
                tbx_time1.Visible = true;
                Imaget1.Visible = true;
                cbx_RestType.Visible = true;
                lbl_To.Visible = true;
                tbx_time2.Visible = true;
                Imaget2.Visible = true;
                tbx_date.Visible = false;
                Imagetdt.Visible = false;
                lbl_ZB.Visible = false;
                tbx_ZB.Visible = false;
                lbl_JB.Visible = false;
                tbx_JB.Visible = false;
                break;
            case 2:
                tbx_time1.Visible = false;
                Imaget1.Visible = false;
                cbx_RestType.Visible = false;
                lbl_To.Visible = false;
                tbx_time2.Visible = false;
                Imaget2.Visible = false;
                tbx_date.Visible = true;
                Imagetdt.Visible = true;
                lbl_ZB.Visible = true;
                tbx_ZB.Visible = true;
                lbl_JB.Visible = true;
                tbx_JB.Visible = true;
                break;
            case 3:
                break;
            default:
                break;
        }
    }
    
    private bool checkuser(string username, string usercode)
    {
        string s = "SELECT Rkey,chinesename, employeecode , Cardno FROM employeemsg WHERE chinesename=" + Mgr.QuoteStr( username ) + " AND employeecode=" +  Mgr.QuoteStr( usercode );
        DBBase db = new DBBase( );
        DataTable dt = new DataTable( );
        dt = db.SqlOpen( s );
        if (dt.Rows.Count > 0)
        {
            Cardno = dt.Rows[0]["Cardno"].ToString( );
            rkey = dt.Rows[0]["Rkey"].ToString( );
            return true;
        }
        return false;
    }

    private void Reqsub(int n)
    {
        if ( !checkuser( tbx_EmpName.Text , tbx_EmpID.Text ) )
        {
            Mgr.ShowAlert( this , "姓名工号不匹配" );
            return;
        }

        string s = " ";
        switch ( cbx_ReqType.SelectedIndex )
        {
            //补卡
            case 0:
                if ( !Mgr.CheckDate( tbx_time1.Text ) )
                {
                    Mgr.ShowAlert( this , "时间格式错误" );
                    return;
                }
                s = "INSERT INTO Req VALUES(" + rkey.ToString( ) + ", " + Mgr.QuoteStr( Cardno.ToString( ) ) + ", getdate(), " + Mgr.QuoteStr( Session["USER_FULL_NAME"].ToString( ) )+ "," + Mgr.QuoteStr( tbx_ReqNote.Text ) + ","+n.ToString()+"," + cbx_ReqType.SelectedValue.ToString( ) + ",null,null,null,null," + Mgr.QuoteStr( tbx_time1.Text ) + ",null,null,null)";
                break;
            //请假
            case 1:
                if ( !Mgr.CheckDate( tbx_time1.Text ) || !Mgr.CheckDate( tbx_time2.Text ) )
                {
                    Mgr.ShowAlert( this , "时间格式错误" );
                    return;
                }
                s = "INSERT INTO Req VALUES(" + rkey.ToString( ) + ", " + Mgr.QuoteStr( Cardno.ToString( ) ) + ", getdate(), " + Mgr.QuoteStr( Session["USER_FULL_NAME"].ToString( ) )+ "," + Mgr.QuoteStr( tbx_ReqNote.Text ) + ","+n.ToString( )+"," + cbx_ReqType.SelectedValue.ToString( ) + ",null,null," + Mgr.QuoteStr( tbx_time1.Text ) + "," + Mgr.QuoteStr( tbx_time2.Text ) + ",null,null,null," + cbx_RestType.SelectedValue.ToString( ) + ")";
                break;
            //手动修改工时
            case 2:
                if ( !Mgr.CheckDate( tbx_date.Text ) )
                {
                    Mgr.ShowAlert( this , "日期格式不正确" );
                    return;
                }
                if ( !Mgr.CheckDoule( tbx_ZB.Text ) || !Mgr.CheckDoule( tbx_JB.Text ) )
                {
                    Mgr.ShowAlert( this , "工时不正确" );
                    return;
                }
                s = "INSERT INTO Req VALUES(" + rkey.ToString( ) + ", " + Mgr.QuoteStr( Cardno.ToString( ) ) + ", getdate(), " + Mgr.QuoteStr( Session["USER_FULL_NAME"].ToString( ) )+ "," + Mgr.QuoteStr( tbx_ReqNote.Text ) + ","+n.ToString( )+"," + cbx_ReqType.SelectedValue.ToString( ) + ",null,null,null,null," + Mgr.QuoteStr( tbx_date.Text ) + "," + tbx_ZB.Text.ToString( ) + "," + tbx_JB.Text.ToString( ) +  ",null)";

                break;

        }
        DBBase db = new DBBase( );
        if ( db.SqlExec( s ) == 1 )
        {
            Mgr.ShowAlert( this , "添加成功" );
            Response.Write( "<script>window.location.href='ReqSubmit.aspx'</script>" );
        }
        else
        {
            Mgr.ShowAlert( this , "添加失败" );
        }
    }

    protected void btn_Submit_Click( object sender , EventArgs e )
    {
        if (! Mgr.CheckLogin( this , 2 ))
        {
            return;
        }
        Reqsub( 1 );
    }
    protected void btn_Save_Click( object sender , EventArgs e )
    {
        if ( !Mgr.CheckLogin( this , 2 ) )
        {
            return;
        }
        Reqsub( 0 );
    }
}
