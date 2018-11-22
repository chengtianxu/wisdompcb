unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB,DateUtils,
  ComCtrls;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    lbl_field: TLabel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    edt_value: TEdit;
    pnl2: TPanel;
    pm_main: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    N1: TMenuItem;
    nAudit: TMenuItem;
    qry_main: TADOQuery;
    ds_main: TDataSource;
    atncfld_mainrkey: TAutoIncField;
    strngfld_mainBNo: TStringField;
    intgrfld_mainCID: TIntegerField;
    intgrfld_mainWHCode: TIntegerField;
    dtmfld_mainBDate: TDateTimeField;
    dtmfld_mainEDate: TDateTimeField;
    intgrfld_mainATTime: TIntegerField;
    intgrfld_mainARTime: TIntegerField;
    dtmfld_mainADate: TDateTimeField;
    intgrfld_mainAMan: TIntegerField;
    strngfld_mainCName: TStringField;
    strngfld_mainuser_full_name: TStringField;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    dbgrdh1: TDBGridEh;
    pnl4: TPanel;
    pnl5: TPanel;
    dbgrdh2: TDBGridEh;
    pnl6: TPanel;
    pnl7: TPanel;
    dbgrdh3: TDBGridEh;
    dtp1: TDateTimePicker;
    dtpt1: TDateTimePicker;
    dtp2: TDateTimePicker;
    dtpt2: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    cbb_craft: TComboBox;
    btn_day: TButton;
    lbl3: TLabel;
    dtp3: TDateTimePicker;
    lbl4: TLabel;
    dtp4: TDateTimePicker;
    dtpt4: TDateTimePicker;
    cbb_craft2: TComboBox;
    btn_week: TButton;
    dtpt3: TDateTimePicker;
    qry_day: TADOQuery;
    qry_week: TADOQuery;
    ds_day: TDataSource;
    ds_week: TDataSource;
    btn_output: TButton;
    bnt_op2: TButton;
    strngfld_mainremark: TStringField;
    fltfld_mainWTRate: TFloatField;
    intgrfld_mainATTime2: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nAuditClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure btn_outputClick(Sender: TObject);
    procedure bnt_op2Click(Sender: TObject);
    procedure btn_dayClick(Sender: TObject);
    procedure btn_weekClick(Sender: TObject);
  private
    { Private declarations }
       field_name  :  string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
    Psql: string;
  end;

var
  FrmMain: TFrmMain;

implementation
          uses UDM, common,uqry, UAdd;
{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   rkey73:='3023';
  vprev:='4';

  if not App_Init_2(DM.con1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;

  
  frmMain.Caption:=Application.Title;

end;

procedure TFrmMain.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btnQueryClick(Sender: TObject);
var
 i:integer;
 ssql :string;
begin
  try
 frmQry:=TfrmQry.create(nil);

   try
    if frmQry.ShowModal=mrok then
   begin

    for i:=1 to frmQry.SGrid1.RowCount-2 do
     ssql:=ssql+ frmQry.SGrid1.Cells[2,i]+#13;

     ssql:=psql+ssql;
   //  ShowMessage(ssql);
     with qry_main do
     begin
     Close;
     sql.Clear;
     sql.Add(ssql);
     open;
     end;
    end;

   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
   end;


 finally
   frmQry.free;
 end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var ssql:string;
begin

  psql:=qry_main.SQL.text;
// qry_main.SQL.text:= psql+' and  1=2';
// with qry_main do
// begin
// close;
// open;
// end;

     pgc1.ActivePageIndex:=0;
    if not qry_main.active  then qry_main.open;


 lbl_field.caption:=dbgrdh1.columns[1].Title.caption;
 PreColumn:=dbgrdh1.columns[1];
field_name:= dbgrdh1.columns[1].fieldname;
dbgrdh1.columns[1].title.Color:=clRed;
 dbgrdh1.columns[1].Title.SortMarker:=smUpEh;
qry_main.Sort:=field_name;

try
ssql:='select rkey,cname from data0578';
   dm.openqry(dm.qry_temp,ssql);
   if not dm.qry_temp.isempty then
   begin
      with dm.qry_temp do
      begin
       First;
       cbb_craft.Items.Clear;
       cbb_craft2.Items.Clear;
       while not eof do
       begin
       cbb_craft.Items.AddObject(fieldbyname('cname').AsString,TObject(fieldbyname('rkey').AsInteger));
       cbb_craft2.Items.AddObject(fieldbyname('cname').AsString,TObject(fieldbyname('rkey').AsInteger));
       Next;
       end;
       cbb_craft.ItemIndex:=0;
       cbb_craft2.ItemIndex:=0;

      end;
   end;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

 dtp1.date:=StartOfTheMonth(now);
 dtp2.date:=now;

  dtp3.date:=StartOfTheMonth(now);
 dtp4.date:=now;

end;

procedure TFrmMain.btnRefreshClick(Sender: TObject);
begin
  qry_main.Filtered:=false;
 qry_main.SQL.text:= psql ;
 with qry_main do
 begin
 close;
 open;
 end;
end;

procedure TFrmMain.btnExportClick(Sender: TObject);
begin
  if not qry_main.IsEmpty then 
  common.Export_dbGridEH_to_Excel(dbgrdh1,'工序OEE统计');
end;

procedure TFrmMain.dbgrdh1TitleClick(Column: TColumnEh);
begin
if qry_main.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_main.Sort:=Column.FieldName+' DESC';
  end;

  if qry_Main.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
begin
 qry_Main.Filtered:=false;
  if qry_Main.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if qry_Main.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_main.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        qry_main.Filter:=field_name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_Main.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        qry_Main.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_Main.Filter:='';
  end;

  qry_Main.Filtered:=true;
end;

procedure TFrmMain.nAddClick(Sender: TObject);
begin
     if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


dm.PFLag :=1;
  try
  FrmAdd :=TFrmAdd.create(nil);
  FrmAdd.showmodal;
 // if FrmAdd.modalresult=mrok then
 // qry_main.requery;

 finally
   FrmAdd.free;
 end;


end;


procedure TFrmMain.nEditClick(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;



dm.PFLag :=2;
dm.PBNo:=qry_main.fieldbyname('BNo').asstring;
  try
  FrmAdd :=TFrmAdd.create(nil);
  FrmAdd.showmodal;
  if FrmAdd.modalresult=mrok then
  qry_main.requery;

 finally
   FrmAdd.free;
 end;
 
end;

procedure TFrmMain.nCheckClick(Sender: TObject);
begin
dm.PFLag :=3;
dm.PBNo:=qry_main.fieldbyname('BNo').asstring;
  try
  FrmAdd :=TFrmAdd.create(nil);
  FrmAdd.showmodal;
//  if FrmAdd.modalresult=mrok then
//  qry_main.requery;

 finally
   FrmAdd.free;
 end;

end;

procedure TFrmMain.nAuditClick(Sender: TObject);
begin
 ShowMessage('暂时没有该功能，如有需要再添加');

//    if   (StrToInt(vprev) <> 4) then
//    begin
//      ShowMessage('您的权限不够！');
//      Exit;
//    end;



end;

procedure TFrmMain.nDeleteClick(Sender: TObject);
var
  ssql ,ssql2: string;
begin

      if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


  try
  if qry_main.IsEmpty then     exit;
  ssql:='delete from data0582  where rkey ='+inttostr(qry_main.FieldValues['rkey'])+'  ';
  ssql2:= ' delete from data0583  where subno ='''+qry_main.FieldByName('bno').asstring+''' ';
  dm.execsql(dm.qry_temp,ssql2);
    dm.execsql(dm.qry_temp,ssql);
  qry_main.Requery;
   except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure TFrmMain.dbgrdh1DblClick(Sender: TObject);
begin
  if qry_main.isempty then exit;
  dm.PBNo:=qry_main.fieldbyname('bno').asstring;
dm.PFLag :=3;
  try
  FrmAdd :=TFrmAdd.create(nil);
  FrmAdd.showmodal;

 finally
   FrmAdd.free;
 end;
end;

procedure TFrmMain.btn_outputClick(Sender: TObject);
begin
  if not qry_day.IsEmpty then 
  common.Export_dbGridEH_to_Excel(dbgrdh2,'工序OEE统计');
end;

procedure TFrmMain.bnt_op2Click(Sender: TObject);
begin
if not qry_week.IsEmpty then 
  common.Export_dbGridEH_to_Excel(dbgrdh2,'工序OEE统计');
end;

procedure TFrmMain.btn_dayClick(Sender: TObject);
var
  ssql: string;
begin
  ssql:='  and a.cid='+inttostr(Integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]))+' and  a.BDate>='''''+formatdatetime('yyyy-mm-dd',dtp1.date)+
   formatdatetime(' hh:nn:ss',dtpt1.Time)+
   ''''' and  a.BDate <= '''''+formatdatetime('yyyy-mm-dd',dtp2.date)+
   formatdatetime(' hh:nn:ss',dtpt2.Time)+'''''';
with qry_day do
begin
 close;
 sql.Clear;
 SQL.Add('OPRateCount '''+ssql+''' ');
 Open;
end;
end;

procedure TFrmMain.btn_weekClick(Sender: TObject);
var
  ssql: string;
begin
 
  ssql:=' and a.cid='+inttostr(Integer(cbb_craft2.Items.Objects[cbb_craft2.ItemIndex]))+' and  a.BDate>='''''+formatdatetime('yyyy-mm-dd',dtp3.date)+
   formatdatetime(' hh:nn:ss',dtpt3.Time)+
   ''''' and  a.BDate <= '''''+formatdatetime('yyyy-mm-dd',dtp4.date)+
   formatdatetime(' hh:nn:ss',dtpt4.Time)+'''''';
  // ShowMessage(ssql);
with qry_week do
begin
 close;
 sql.Clear;
 SQL.Add('OPWRateCount '''+ssql+''' ');
 Open;
end;
end;

end.
