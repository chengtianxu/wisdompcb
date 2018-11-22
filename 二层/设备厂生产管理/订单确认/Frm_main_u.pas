unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB,
  ComCtrls, DBCtrlsEh, DBCtrls, Mask;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    CKType1: TCheckBox;
    CKType2: TCheckBox;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grd1: TDBGridEh;
    TabSheet2: TTabSheet;
    PnlType1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    PnlType2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch:string;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

//  dm.ADOCon.Open;
//  user_ptr := '3';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO70.IsEmpty then exit;
  i := DM.ADO70rkey.AsInteger ;
  DM.ADO70.Close;
  DM.ADO70.Open;
  DM.ADO70.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO70.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO70.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO70AfterScroll(DM.ADO70);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  sSql:=DM.ADO70.SQL.Text;
  FsSearch:=' where wzcp0070.sales_date>getdate()-14 ';
  CheckBox1Click(nil);
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO70status.Value = 6 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO70status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO70status.Value = 3 then
     Grd1.Canvas.Font.Color := clGreen ;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=not DM.ADO70.IsEmpty and (dm.ADO70status.AsInteger=2);  //确认
  N2.Enabled:=N1.Enabled;                                            //退回
  N3.Enabled:=not DM.ADO70.IsEmpty and (dm.ADO70status.AsInteger=3); //反确认
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    FsSearch:=' where wzcp0070.sales_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and wzcp0070.sales_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    CheckBox1Click(nil);
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO70.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var s:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
 // BtBrushClick(nil);
  case Tmenuitem(Sender).Tag of
   0:begin    //确认
       DM.ADOCon.BeginTrans;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update wzcp0070 set status=3,conf_date=getdate(),conf_by_empl_ptr='+user_ptr+' where rkey='+DM.ADO70rkey.AsString+' and status=2' ;
       if DM.tmp.ExecSQL=0 then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('订单状态发生改变而未能成功确认!');
         exit;
       end;
       DM.tmp.SQL.Text:='update data0008 set new_price=B.price from data0008 A inner join wzcp0071 B '+
                        'on A.rkey=B.prod_ptr where B.so_ptr='+DM.ADO70rkey.AsString;
       if DM.tmp.ExecSQL<>DM.ADO71.RecordCount then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('订单状态发生改变而未能成功确认!');
         exit;
       end;
       DM.ADOCon.CommitTrans;
     end;

   1:begin
       if MessageBox(Handle,'确定退回此订单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
       s:=InputBox('提示', '退回原因:', '');
       if s='' then
       begin
         showmessage('必须输入退回原因');
         exit;
       end;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update wzcp0070 set status=6,conf_date=null,conf_by_empl_ptr=null,remark=''退回原因:'+
       s+''' where rkey='+DM.ADO70rkey.AsString+' and status=2';
       if DM.tmp.ExecSQL<>1 then
         showmessage('退回此订单失败,数据状态已发生变化...');
      end;
   2:begin
       if MessageBox(Handle,'确定取消此订单确认吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
//2014-11-20tang修改订单只要有投产记录492，或者有出货记录wzcp0060不可以返审
       DM.tmp.Close;
       dm.tmp.SQL.Text:='select dbo.data0492.* from dbo.data0492 inner join'
                        +' dbo.data0008 on dbo.data0492.BOM_PTR=dbo.data0008.Rkey inner join'
                        +' dbo.WZCP0070 on dbo.data0492.SO_NO=dbo.WZCP0070.sales_order'
                        +' where dbo.WZCP0070.Rkey=:Rkey and dbo.data0008.PROD_CODE=:PROD_CODE and dbo.data0492.TSTATUS=0 and dbo.WZCP0070.status=3';
       dm.tmp.Parameters.ParamByName('Rkey').Value:=DM.ADO70rkey.AsString;
       dm.tmp.Parameters.ParamByName('PROD_CODE').Value:=DM.ADO71PROD_CODE.AsString;
       dm.tmp.Open;
       if (not dm.tmp.IsEmpty) then
       begin
         showmessage('该订单已设产，不能返审！');
         exit;
       end;
       DM.tmp.Close;
       dm.tmp.SQL.Text:='select dbo.WZCP0060.* from dbo.WZCP0060 inner join'
                        +'  dbo.WZCP0070 on dbo.WZCP0060.SALES_REP_PTR=dbo.WZCP0070.Rkey'
                        +'  where dbo.WZCP0070.Rkey=:Rkey and dbo.WZCP0060.type=1 and dbo.WZCP0070.status=3';
       dm.tmp.Parameters.ParamByName('Rkey').Value:=DM.ADO70rkey.AsString;
       dm.tmp.Open;
       if (not dm.tmp.IsEmpty) then
       begin
         showmessage('该订单已存在销售出货记录，不能返审！');
         exit;
       end;
//end 2014-11-20tang修改---------------------------------------------------
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update wzcp0070 set status=2,conf_date=null,conf_by_empl_ptr=null where rkey='+DM.ADO70rkey.AsString+' and status=3';
       if DM.tmp.ExecSQL<>1 then
         showmessage('取消此订单确认失败,数据状态已发生变化...');
      end;
  end;
  BtBrushClick(nil);
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
    stype:string;
begin
  FsCheck:=' and wzcp0070.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  stype:='-1';
  if CKType1.Checked then stype:=stype+',1';
  if CKType2.Checked then stype:=stype+',2';

  DM.ADO70.SQL.Text:=sSql+FsSearch+FsCheck+' and wzcp0070.type in ('+stype+') order by wzcp0070.sales_order';
  DM.ADO70.Close;
  DM.ADO70.Open;
end;

procedure TFrm_main.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex=1 then
  begin
    PnlType1.Visible:=DM.ADO70type.AsInteger=1 ;
    PnlType2.Visible:=not PnlType1.Visible;
  end;
end;

end.
