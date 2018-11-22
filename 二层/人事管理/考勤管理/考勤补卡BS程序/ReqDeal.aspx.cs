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

//ReqState 0 = 未提交  1 = 提交   2 = 已经审核 3 = 退回
//ReqType 0 = 补卡 1 = 请假    2=修改工时 

public partial class ReqDeal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Mgr.CheckLogin( this , 3 );
        if (!IsPostBack)
        {
            BeginTime.Text = System.DateTime.Now.Date.ToString( "yyyy-MM-dd" );
            EndTime.Text = System.DateTime.Now.AddDays( 1 ).ToString( "yyyy-MM-dd" );
        }
    }

    private void GetData()
    {
        if (!Mgr.CheckLogin( this , 3 ))
        {
            return;
        }

        string s = "SELECT d1.rkey ,d2.employeecode as 工号, d2.chinesename as 姓名,  ";
        s += " (case reqstate when 0 then '未提交' when 1 then '已提交' when 2 then '已审核' when 3 then '退回' end) as 状态, reqinfo as 备注, reqperson as 提交人,";
        s += " reqtime as 提交时间, (case reqtype when 0 then '补卡' when 1 then '请假' when 2 then '修改工时' end ) as 类型, req_cardtime as 时间, req_starttime as 始,";
        s += " req_endtime as 终, zbhour as 正班, jbhour as 加班, dealperson as 受理人, dealtime as 受理时间 , d1.Cardno, d1.employeeid , d1.AskForLeaveRK, d3.LeaveType";
        s += " FROM Req d1 INNER JOIN employeemsg d2 ON d1.employeeid = d2.rkey ";
        s += " LEFT JOIN AskForLeave d3 ON d1.AskForLeaveRK = d3.RKey ";
        s += " WHERE Reqtime BETWEEN " + Mgr.QuoteStr( BeginTime.Text ) + " AND ";
        s += " dateadd(day,2," + Mgr.QuoteStr( EndTime.Text )  +  ") " + " AND ReqState = " + cbx_type.SelectedValue.ToString( );
        if (!string.IsNullOrEmpty(tbxEmployID.Text))
        {
            if (!Mgr.CheckInt(tbxEmployID.Text))
            {
                Mgr.ShowAlert( this , "工号只能是数字!" );
                return;
            }
            s += " AND d2.employeecode=" + tbxEmployID.Text;
        }
        s += " ORDER BY 工号";
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

    private bool DealReq(int n, int rn)
    {
        string s = "";
        switch (n)
        {
            case 0:
                string cardtime = ReqDataView.Rows[rn].Cells[10].Text;
                string tmp = Convert.ToDateTime( cardtime ).ToString( "yyyy-MM-dd" );
                s = "INSERT INTO OriginalCheckData VALUES(" + Mgr.QuoteStr( ReqDataView.DataKeys[rn].Values[1].ToString() ) + ",";
                s += Mgr.QuoteStr( cardtime ) + "," + Mgr.QuoteStr( tmp ) + ",'00:00:00',0," + ReqDataView.DataKeys[rn].Values[2].ToString( );
                s += ",0,0,0, '手工补卡')";
                break;
            case 1:
                string btime = ReqDataView.Rows[rn].Cells[11].Text;
                string etime = ReqDataView.Rows[rn].Cells[12].Text;
                string lr = ReqDataView.Rows[rn].Cells[6].Text;
                s = " INSERT INTO AskLeaveRegister VALUES(" + ReqDataView.DataKeys[rn].Values[2].ToString( ) + "," + ReqDataView.DataKeys[rn].Values[3].ToString( ) + ",";
                s += Mgr.QuoteStr( btime ) + "," + Mgr.QuoteStr( btime ) + "," + Mgr.QuoteStr( etime ) + "," +Mgr.QuoteStr( etime ) + "," + Session["RKey"].ToString( ) + ",";
                s += Mgr.QuoteStr( lr ) + ", '手工请假' , getdate(),1)"; 
                break;
            case 2:
                string rwt = ReqDataView.Rows[rn].Cells[13].Text;
                string rot = ReqDataView.Rows[rn].Cells[14].Text;
                string cd = ReqDataView.Rows[rn].Cells[10].Text;
                s = "UPDATE Onoffdutydata SET locked=1,SumCN = 0,SumCT=0,SumZN=0,SumZT=0,SumKN=0,SumKT=0 ,YTNote='修改工时', RWT = " + rwt.ToString( ) + ", ROT=" + rot.ToString( );
                s += " WHERE checkdate=" + Mgr.QuoteStr( cd ) + " AND employeeid=" + Mgr.QuoteStr( ReqDataView.DataKeys[rn].Values[2].ToString( ) );
                break;
            default:
                return false;
                break;
        }
        
        DBBase db = new DBBase( );
        if ( db.SqlExec( s ) <= 0 )
        {
            //errstr += "第 " + rn.ToString( ) + " 条 处理失败!!\\n";
            return false;
        }
        else
        {
            //errstr += "第 " + rn.ToString( ) + " 条 处理成功!!\\n";
            s = "UPDATE Req SET Reqstate = 2, Dealtime=getdate(), dealPerson=" + Mgr.QuoteStr( Session["USER_FULL_NAME"].ToString( ) ) + " WHERE RKey = " + ReqDataView.DataKeys[rn].Values[0].ToString( );
            db.SqlExec( s );
            return true;
        }
       
    }

    private int GetReqType(int rn)
    {
        if (ReqDataView.Rows[rn].Cells[4].Text == "补卡")
        {
            return 0;
        }
        if ( ReqDataView.Rows[rn].Cells[4].Text == "请假" )
        {
            return 1;
        }
        if ( ReqDataView.Rows[rn].Cells[4].Text == "修改工时" )
        {
            return 2;
        }
        return -1;
    }

    protected void Btn_Deal_Click( object sender , EventArgs e )
    {
         if ( !Mgr.CheckLogin( this , 2 ) )
            return;
        bool b = false;
        string errstr= "";
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
                int ReqRkey = Convert.ToInt32( ReqDataView.DataKeys[n].Values[0].ToString( ) );
                int nState = Mgr.GetReqState( ReqRkey );
                string estr = "";
                if ( !Mgr.CheckState( nState , new int[] { 1 } , ref estr ) )
                {
                    errstr += "第 " + ntotal.ToString( )+ " 条 "+ estr + "\\n";
                }
                else
                {
                    if ( !DealReq( GetReqType( row.RowIndex ) , row.RowIndex ) )
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
    protected void Btn_PostBack_Click( object sender , EventArgs e )
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
                int ReqRkey = Convert.ToInt32( ReqDataView.DataKeys[n].Values[0].ToString( ) );
                int nState = Mgr.GetReqState( ReqRkey );
                string estr = "";
                if ( !Mgr.CheckState( nState , new int[] { 1 } , ref estr ) )
                {
                    errstr += "第 " + ntotal.ToString( )+ " 条 "+ estr + "\\n";
                }
                else
                {
                    s = "UPDATE Req SET reqstate = 3 WHERE RKey= " + ReqRkey.ToString( );
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
