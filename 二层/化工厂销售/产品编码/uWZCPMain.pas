unit uWZCPMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, Menus, ToolWin, ComCtrls, StdCtrls,
  Buttons, ImgList;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    CoolBar1: TCoolBar;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    //pUserXS,pUserRC:boolean;

    procedure NsetCP(var pDt:tadotable);
    procedure UsetCP(var pDt:tadotable);
    function getNum(const pCode:string;const pdt:string):boolean;

  public
    { Public declarations }
    procedure MyPorcprocedure (Sender: TObject; E: Exception);
    //property userXS:boolean read pUserXS;
    //property userRC:boolean read pUserRC;
  end;

var
  Form1: TForm1;

implementation

uses
  uNewForm,uDM, uCPCItem;
{$R *.dfm}
//获取销售数，进仓数
function TForm1.getNum(const pCode:string;const pdt:string):boolean;
var
  mds:TADOdataset;
begin
   //
   mds :=TADOdataset.Create(Application);
   mds.CommandType :=cmdtext;
        mds.Connection := DataModule1.ADOConnection1 ;
        mds.Active :=false;
        mds.CommandText :='SELECT * ';
        mds.CommandText :=mds.CommandText+' FROM  '+pdt;
        mds.CommandText :=mds.CommandText+' WHERE ('+pCode+')';
        mds.Active :=true;
        if mds.Recordset.RecordCount >0 then
           result:=true
        else
        result:=false;
  mds.Free ;

end;
//修改赋值
procedure TForm1.UsetCP(var pDt:tadotable);
begin
      form2.edcode.Text :=DataModule1.ADODataSet1PROD_CODE.AsString;
      form2.Edname.Text :=DataModule1.ADODataSet1PRODUCT_NAME.AsString;
      form2.citemkey :=DataModule1.ADODataSet1PR_GRP_POINTER.AsInteger ;
      form2.Edcitem.Text :=DataModule1.ADODataSet1pr_grp_code.AsString;

      form2.edunit.Text :=DataModule1.ADODataSet1unit_code.AsString;
      form2.UnitKey :=DataModule1.ADODataSet1unit_ptr.AsInteger;
      form2.edprice.Text :=DataModule1.ADODataSet1new_price.AsString;
      form2.edmax.Text :=DataModule1.ADODataSet1max_qty.AsString;
      form2.edmin.Text :=DataModule1.ADODataSet1min_qty.AsString;
end;
//新增赋值
procedure TForm1.NsetCP(var pDt:tadotable);
begin
      form2.edcode.Text :='';
      form2.Edname.Text :='';
      form2.Edcitem.Text :='';
      form2.edunit.Text :='';
      form2.edprice.Text :='0';
      form2.edmax.Text :='0';
      form2.edmin.Text :='0';
end;
//捕获错误
procedure TForm1.MyPorcprocedure (Sender: TObject; E: Exception);
begin
  ShowMessage('This is my execption handler');
end;

//新增记录
procedure TForm1.N1Click(Sender: TObject);

begin
 with form2 do
  begin
   Caption :='产品新增';
   datasource1.DataSet :=DataModule1.ADOTable1;
   DataModule1.ADODSCW.Active :=true ;
   DataModule1.ADODSCW.First ;
   while not DataModule1.ADODSCW.Eof do
      begin
        DataModule1.ADODSCW.Edit ;
        DataModule1.ADODSCWMAX_UNIT_VALUE.Value :=0;
        DataModule1.ADODSCW.Next ;
      end;
   flag :=true;

   NsetCP(DataModule1.ADOTable1);

   DBGrid1.Enabled :=true;
   
   DataModule1.ADOTable1.Active :=false;
   DataModule1.ADOTable1.Active :=true;
   DataModule1.ADOTable1.Append ;
   edprice.Enabled :=false;
   edprice.text :='0';
   //锁定编号

   edcode.Enabled :=true;

   edcitem.text :='';
   label18.Caption := '';
  end;
  form2.ShowModal;

end;
//修改
procedure TForm1.N3Click(Sender: TObject);
var
  mds:TADOdataset;
  mb1,mb2:boolean;
begin
  with form2 do
  begin
   Caption :='产品修改';
   datasource1.DataSet :=DataModule1.ADOTable1;

   flag :=false;
   DataModule1.ADOTable1.Filter :='rkey='+DataModule1.ADODataSet1RKEY.AsString ;
   DataModule1.ADOTable1.Active :=false;
   DataModule1.ADOTable1.Active :=true;
   DataModule1.ADOTable1.Edit ;

   usetCP(DataModule1.ADOTable1);

   DataModule1.ADODSCW.Active :=true;
   //已经入，出仓的要锁定
   mb1 :=getNum('CUST_PART_PTR='+DataModule1.ADODataSet1RKEY.AsString,'data0053');
   mb2 :=getNum('prod_ptr='+DataModule1.ADODataSet1RKEY.AsString,'wzcp0063');
   if (mb1=true) or (mb2=true) then
      DBGrid1.Enabled  :=false
   else
      DBGrid1.enabled :=true;

   //获取库存数量
   mds :=TADOdataset.Create(Application);
   mds.CommandType :=cmdtext;
   DataModule1.ADODSCW.First ;
   while not DataModule1.ADODSCW.Eof do
      begin
        mds.Connection := DataModule1.ADOConnection1 ;
        mds.Active :=false;
        mds.CommandText :='SELECT qty_on_hand, rkey, location_ptr ';
        mds.CommandText :=mds.CommandText+' FROM  WZCP0001 ';
        mds.CommandText :=mds.CommandText+' WHERE (proc_ptr = '+DataModule1.ADODataSet1RKEY.AsString+')';
        mds.CommandText :=mds.CommandText+' and ';
        mds.CommandText :=mds.CommandText+' (location_ptr ='+DataModule1.ADODSCWRKEY.AsString+')';
        mds.Active :=true;
        DataModule1.ADODSCW.Edit;
        if mds.Recordset.RecordCount >0 then
           DataModule1.ADODSCWMAX_UNIT_VALUE.Value :=mds.FieldByName('qty_on_hand').Value
        else
           DataModule1.ADODSCWMAX_UNIT_VALUE.Value :=0 ;

       DataModule1.ADODSCW.Next ;
      end;
      //锁定库存量(已经进出仓)

    mds.Free ;

   DataModule1.ADODSCW.Edit ;

   //锁定编号
   edcode.Enabled :=false;
   edprice.Enabled :=false;
   edcitem.Text := DataModule1.ADODataSet1pr_grp_code.AsString;
   edunit.Text := DataModule1.ADODataSet1unit_code.AsString;
   label18.Caption := DataModule1.ADODataSet1cpitem.AsString;
   label9.Caption := DataModule1.ADODataSet1cpdw.AsString;
  end;
  form2.ShowModal;
end;

//删除
procedure TForm1.N2Click(Sender: TObject);
var
  mtext:string;
  mCOM:TADOCommand;
begin
//application.OnException:=MyPorcprocedure;

try
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
   begin

     mCOM := TADOCommand.Create(Application);

     mcom.Connection :=DataModule1.ADOConnection1 ;
     mcom.CommandType :=cmdText;
     DataModule1.ADOConnection1.BeginTrans ;
     //删除库存表
    // mtext :='delete wzcp0001 where proc_ptr='+DataModule1.ADODataSet1RKEY.AsString;
    // mcom.CommandText :=mtext;
    // mcom.Execute;
     //删除产品
     mtext :='delete data0008 where rkey='+DataModule1.ADODataSet1RKEY.AsString;
     mcom.CommandText :=mtext;

     mcom.Execute;
     DataModule1.ADOConnection1.CommitTrans ;
    //DataModule1.ADODataSet1.Delete;
    DataModule1.ADODataSet1.Active :=false ;
    DataModule1.ADODataSet1.active :=true;
    mcom.Free ;
          //屏蔽删除、修改
      if DataModule1.ADODataSet1.RecordCount =0 then
        begin
          Form1.n2.Enabled :=false;
          Form1.n3.Enabled :=false;
          Form1.BitBtn3.Enabled :=false;
          Form1.BitBtn4.Enabled :=false;
        end
     else
        begin
           Form1.n2.Enabled :=true;
           Form1.n3.Enabled :=true;
          Form1.BitBtn3.Enabled :=true;
          Form1.BitBtn4.Enabled :=true;
        end;
   end;

  except
     DataModule1.ADOConnection1.RollbackTrans ;
     messagedlg('数据已经引用，不能删除!',mtWarning,[mbOk],0);
 //application.HandleException(Self);
 //   on E: Exception do showmessage(E.Message);
 end;
end;


//刷新纪录
procedure TForm1.FormActivate(Sender: TObject);
begin
  DataModule1.ADODataSet1.Active :=false ;
  DataModule1.ADODataSet1.active :=true;
  DataModule1.ADODataSet1.IndexFieldNames := 'PROD_CODE' ;
  
   //屏蔽删除、修改

     if DataModule1.ADODataSet1.RecordCount =0 then
        begin
          Form1.n2.Enabled :=false;
          Form1.n3.Enabled :=false;
          Form1.BitBtn3.Enabled :=false;
          Form1.BitBtn4.Enabled :=false;
        end
     else
        begin
           Form1.n2.Enabled :=true;
           Form1.n3.Enabled :=true;
          Form1.BitBtn3.Enabled :=true;
          Form1.BitBtn4.Enabled :=true;
        end;
end;

//点击GRID列头查询
procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
  i:integer;
begin
 DataModule1.ADODataSet1.IndexFieldNames := Column.FieldName ;
 for i:=0 to  dbgrid1.Columns.Count -1 do
    dbgrid1.Columns[i].Title.Color := clBtnFace;
  column.Title.Color := clRed;
end;
//查询
procedure TForm1.BitBtn1Click(Sender: TObject);
var
 searchoption:tlocateoptions;
begin
    searchoption:=[lopartialkey];
    DataModule1.ADODataSet1.Locate(DataModule1.ADODataSet1.IndexFieldNames,Edit1.Text,searchoption);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 // DataModule1.ADODataSet1.IndexFieldNames := 'PROD_CODE' ;

end;
//退出
procedure TForm1.BitBtn5Click(Sender: TObject);
begin
     close;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  //屏蔽删除、修改
{     if DataModule1.ADODataSet1.RecordCount =0 then
        begin
          n2.Enabled :=false;
          n3.Enabled :=false;
          BitBtn3.Enabled :=false;
          BitBtn4.Enabled :=false;
        end
     else
        begin
           n2.Enabled :=true;
           n3.Enabled :=true;
          BitBtn3.Enabled :=true;
          BitBtn4.Enabled :=true;
        end; }
end;

end.
