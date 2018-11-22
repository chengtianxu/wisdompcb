unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils,
  DBGridEh, ComCtrls;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtExcel: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Grd1: TDBGridEh;
    PM: TPopupMenu;
    N2: TMenuItem;
    BtBack: TBitBtn;
    Grd2: TDBGridEh;
    procedure BtCloseClick(Sender: TObject);
    procedure BtExcelClick(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure N2Click(Sender: TObject);
    procedure BtBackClick(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1Enter(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd2DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsSearch :string;

    FactGrd:TObject;
    procedure init;
  public
    function ExistInventory(HD:THandle;Qry:TADOQuery):Boolean;
  end;

var
  Frm_main: TFrm_main;

implementation

USES
   common,DM_u,Frm_Enter_u ,Frm_back_u,Frm_QrySet_u;

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


 { dm.ADOCon.Open;
  user_ptr := '3';
  vprev := '4';}

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

function TFrm_main.ExistInventory(HD:THandle;Qry:TADOQuery):Boolean;
begin                          //用于检查是否存在未结的成品盘点记录。彭华于20121101
  Result:=False;
  with Qry do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey from data0214 where STATUS=0';
    Open;
    if IsEmpty=False then
    begin
      MessageBox(HD,'现存在未结的成品盘点记录，请先处理！','错误',MB_ok+MB_iconStop);
      Result:=True;
    end;
    Close;
  end;
end;

procedure TFrm_main.BtExcelClick(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.RecordCount > 0 then
      Export_dbGridEH_to_Excel(TDBGridEh(FactGrd),'生产入仓') ;
end;

procedure TFrm_main.Grd1Enter(Sender: TObject);
begin
  FactGrd:=Sender;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADOQ416.IsEmpty then exit;
  i := DM.ADOQ416rkey.AsInteger ;
  DM.ADOQ416.Close;
  DM.ADOQ416.Open;
  DM.ADOQ416.Locate('rkey',i,[]);
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    Grd1.DataSource.DataSet.Filter := '';
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      begin
        if Grd1.DataSource.DataSet.Filter <> '' then
            Grd1.DataSource.DataSet.Filter := Grd1.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edit1.text) + '%'''
        else
            Grd1.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edit1.text) + '%''' ;
      end else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      begin
        if Grd1.DataSource.DataSet.Filter <> '' then
            Grd1.DataSource.DataSet.Filter := Grd1.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))
        else
            Grd1.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edit1.text,0)) ;
      end;
    end ;
  end;

end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADOQ416.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADOQ416.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADOQ416AfterScroll(DM.ADOQ416);
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
var
  i:byte;
  item:TMenuItem;
  VT2:TTIME;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  sSql := dm.ADOQ416.SQL.Text ;
  FsSearch:=' where data0416.type=2 and data0416.sys_date>getdate()-7 ';
  dm.ADOQ416.SQL.Text:=sSql+FsSearch;
  dm.ADOQ416.Open ;
  DM.ADOQ416.Sort := field_name + ' ASC';
  FactGrd:=Grd1;
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
  if   ExistInventory(Self.Handle,DM.Tmp) then
    Exit;

  if (vprev = '1') or (vprev = '3')  then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;
 { DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select rkey from data0214 where status=''0''';
  DM.Tmp.Open;
  if not DM.Tmp.IsEmpty then
  begin
    showmessage('当前正在盘点中,不能进行入库....');
    exit;
  end;}
  with TFrm_Enter.Create(nil) do  //add
  try
   initd;
   ShowModal ;
  finally
   Free ;
   DM.ADO53_1.Close;
   DM.ADO416_1.Close;
  end;
end;

procedure TFrm_main.BtBackClick(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3')  then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;
  with TFrm_back.Create(nil) do
  try
   ShowModal ;
  finally
   Free ;
  end;
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
    FsSearch:=' where data0416.type=2 and data0416.sys_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and data0416.sys_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    dm.ADOQ416.SQL.Text:=sSql+FsSearch;
    dm.ADOQ416.Open ;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADOQ416.SQL.Text);
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  close;
end;



procedure TFrm_main.Grd2DblClick(Sender: TObject);
begin
      if DM.ADOQ53remark8.AsString = '' then
      showmessage('无备注说明')
      else
      showmessage(DM.ADOQ53remark8.AsString);
end;

end.
