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

public partial class ReqView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Mgr.CheckLogin( this , 2 );
        if (!IsPostBack)
        {
            BeginTime.Text = System.DateTime.Now.Date.ToString( "yyyy-MM-dd" );
            EndTime.Text = System.DateTime.Now.AddDays( 1 ).ToString( "yyyy-MM-dd" );
        }
    }

    private void GetData()
    {
        if (!Mgr.CheckLogin( this , 2 ) ) return;
        string s = "SELECT d1.rkey ,d2.employeecode as 工号, d2.chinesename as 姓名,  ";
        s += " (case reqstate when 0 then '未提交' when 1 then '已提交' when 2 then '已审核' when 3 then '退回' end) as 状态, reqinfo as 备注, reqperson as 提交人,";
        s += " reqtime as 提交时间, (case reqtype when 0 then '补卡' when 1 then '请假' when 2 then '修改工时' end ) as 类型, req_cardtime as 时间, req_starttime as 始,";
        s += " req_endtime as 终, zbhour as 正班, jbhour as 加班, dealperson as 受理人, dealtime as 受理时间 ";
        s += " FROM Req d1 INNER JOIN employeemsg d2 ON d1.employeeid = d2.rkey ";
        s += " WHERE ReqPerson = " + Mgr.QuoteStr( Session["USER_FULL_NAME"].ToString( ) ) + " AND Reqtime BETWEEN " + Mgr.QuoteStr( BeginTime.Text ) + " AND ";
        s += " dateadd(day,2," + Mgr.QuoteStr( EndTime.Text )  +  ") " + " AND ReqState = " + cbx_type.SelectedValue.ToString( );
        s += " ORDER BY Reqtime";
        DBBase db = new DBBase( );
        DataTable tb = new DataTable( );
        tb = db.SqlOpen( s );
        ReqDataView.DataSource = tb;
        ReqDataView.DataBind( );
    }

    protected void Btn_Search_Click( object sender , EventArgs e )
    {
        GetData( );
    }
    protected void Btn_Submit_Click( object sender , EventArgs e )
    {
        if ( !Mgr.CheckLogin( this , 2 ) )
            return;
        bool b = false;
        string errstr= "" , s;
        int nSucc= 0;
        int ntotal = 0;
        for (int nn=0; nn<ReqDataView.Rows.Count; nn++) 
        {
            GridViewRow row = ReqDataView.Rows[nn];
            Control ctrl = row.FindControl( "CheckBox1" );
            if ( ( ctrl as CheckBox ).Checked )
            {
                ntotal++;
                int n = row.RowIndex;
                //TableCellCollection cell = row.Cells;
                int ReqRkey = Convert.ToInt32(ReqDataView.DataKeys[n].Value.ToString());
                int nState = Mgr.GetReqState(ReqRkey );
                string estr = "";
                if ( !Mgr.CheckState( nState ,new int [] {0,3} , ref estr ) )
                {
                    errstr += "第 " + ntotal.ToString( )+ " 条 "+ estr + "\\n";
                }
                else
                {
                    s = "UPDATE Req SET reqstate = 1 WHERE RKey= " + ReqRkey.ToString( ) + " AND reqstate <> 2";
                    DBBase db = new DBBase( );
                    if ( db.SqlExec( s ) <= 0 )
                    {
                        errstr += "第 " + ntotal.ToString( ) + "条 返回0,操作失败 \\n";
                    }
                    else
                    {
                        nSucc++;
                        errstr += "第 " + ntotal.ToString( ) + "条 操作成功 \\n";
                    }
                }
                b = true;
            }
        }
        if ( !b )
            errstr = "数据为空";
        else
            errstr += "总共: " + ntotal.ToString( ) + "条    成功:" + nSucc.ToString( ) + "条";
        Mgr.ShowAlert( this , errstr );
        GetData( );

    }
    protected void Btn_Dele_Click( object sender , EventArgs e )
    {
        if ( !Mgr.CheckLogin( this , 2 ) )
            return;
        bool b = false;
        string errstr= "" , s;
        int nSucc= 0;
        int ntotal = 0;
        for ( int nn=0 ; nn<ReqDataView.Rows.Count ; nn++ )
        {
            GridViewRow row = ReqDataView.Rows[nn];
            Control ctrl = row.FindControl( "CheckBox1" );
            if ( ( ctrl as CheckBox ).Checked )
            {
                ntotal++;
                int n = row.RowIndex;
                //TableCellCollection cell = row.Cells;
                int ReqRkey = Convert.ToInt32( ReqDataView.DataKeys[n].Value.ToString( ) );
                int nState = Mgr.GetReqState( ReqRkey );
                string estr = "";
                if ( !Mgr.CheckState( nState ,new int [] {0,1,3} , ref estr ) )
                {
                    errstr += "第 " + ntotal.ToString( )+ " 条 "+ estr + "\\n";
                }
                else
                {
                    s = "DELETE FROM Req  WHERE RKey= " + ReqRkey.ToString( );
                    DBBase db = new DBBase( );
                    if ( db.SqlExec( s ) <= 0 )
                    {
                        errstr += "第 " + ntotal.ToString( ) + "条 返回0,操作失败 \\n";
                    }
                    else
                    {
                        nSucc++;
                        errstr += "第 " + ntotal.ToString( ) + "条 操作成功 \\n";
                    }
                }
                b = true;
            }
        }
        if ( !b )
            errstr = "数据为空";
        else
            errstr += "总共: " + ntotal.ToString( ) + "条    成功:" + nSucc.ToString( ) + "条";
        Mgr.ShowAlert( this , errstr );
        GetData( );

    }
    protected void ReqDataView_PageIndexChanging( object sender , GridViewPageEventArgs e )
    {
        ReqDataView.PageIndex = e.NewPageIndex;
        GetData( );
    }
}
