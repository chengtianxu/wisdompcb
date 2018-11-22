unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGridEh,
  Buttons, Menus;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    ds1_process: TDataSource;
    qry_process: TADOQuery;
    qry_day: TADOQuery;
    ds_day: TDataSource;
    pnl2: TPanel;
    pnl3: TPanel;
    pgc1: TPageControl;
    ts2: TTabSheet;
    pnl6: TPanel;
    pnl7: TPanel;
    ts1: TTabSheet;
    pnl4: TPanel;
    lbl1: TLabel;
    pnl5: TPanel;
    dbgrdh2: TDBGridEh;
    lbl_field: TLabel;
    edt_value: TEdit;
    btn_refresh: TBitBtn;
    btn_quit: TBitBtn;
    atncfld_dayrkey: TAutoIncField;
    intgrfld_dayFac_ptr: TIntegerField;
    intgrfld_dayCost_ptr: TIntegerField;
    dtmfld_dayReqDate: TDateTimeField;
    fltfld_dayFreeDays: TFloatField;
    strngfld_dayremark: TStringField;
    strngfld_dayabbr_name: TStringField;
    strngfld_daydept_name: TStringField;
    atncfld_processrkey: TAutoIncField;
    intgrfld_processFac_ptr: TIntegerField;
    intgrfld_processcost_ptr: TIntegerField;
    strngfld_processabbr_name: TStringField;
    strngfld_processdept_name: TStringField;
    dbgrdh1: TDBGridEh;
    pm_day: TPopupMenu;
    mniN_Add: TMenuItem;
    mniN_edit: TMenuItem;
    mni_del: TMenuItem;
    pm_process: TPopupMenu;
    mniN_Add1: TMenuItem;
    mniN_edit1: TMenuItem;
    mni_del1: TMenuItem;
    lbl2: TLabel;
    procedure btn_quitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure dbgrdh2TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure mniN_AddClick(Sender: TObject);
    procedure mniN_Add1Click(Sender: TObject);
    procedure mni_delClick(Sender: TObject);
    procedure mni_del1Click(Sender: TObject);
    procedure mniN_editClick(Sender: TObject);
    procedure mniN_edit1Click(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
  private
    { Private declarations }
      field_name1,field_name2    :  string;
    PreColumn1,PreColumn2: TColumnEh;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
         uses UDM,common, UDayMOdi, UProcessModi;
{$R *.dfm}

procedure TfrmMain.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

       rkey73:= '3023';
 user_ptr := '3301';
  vprev := '4';

    if not App_init_2(DM.con1) then
    begin
      ShowMsg('程序起动失败请联系管理员',1);
      application.Terminate;
      exit;
    end;

   self.Caption:=application.Title;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 pgc1.ActivePageIndex:=0;


 if not qry_day.Active then qry_day.Open;
   if not qry_process.Active then qry_process.Open;


PreColumn1:=dbgrdh1.columns[0];
PreColumn2:=dbgrdh2.columns[0];


field_name1:= dbgrdh1.columns[0].fieldname;
field_name2:= dbgrdh2.columns[0].fieldname;


dbgrdh1.columns[0].title.Color:=clRed;
dbgrdh2.columns[0].title.Color:=clRed;

dbgrdh1.columns[0].Title.SortMarker:=smUpEh;
dbgrdh2.columns[0].Title.SortMarker:=smUpEh;

qry_day.Sort:=field_name1;
qry_process.Sort:=field_name2;

end;

procedure TfrmMain.dbgrdh1TitleClick(Column: TColumnEh);
begin
 if qry_day.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_day.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_day.Sort:=Column.FieldName+' DESC';
  end;

  if qry_day.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name1 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name1 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn1.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn1 := column ;
  end else
    edt_value.SetFocus;
end;

procedure TfrmMain.dbgrdh2TitleClick(Column: TColumnEh);
begin
 if qry_process.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_process.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_process.Sort:=Column.FieldName+' DESC';
  end;

  if qry_process.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name2 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn2.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
  end else
    edt_value.SetFocus;
end;
 

procedure TfrmMain.edt_valueChange(Sender: TObject);
begin
  if   pgc1.ActivePageIndex=0 then
  begin
    qry_day.Filtered:=false;
  if qry_day.FieldByName(field_name1).FieldKind = fkCalculated then  exit;
  if qry_day.FieldByName(field_name1).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_day.FieldByName(field_name1).DataType in  [ftString, ftWideString]  then
        qry_day.Filter:=field_name1 + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_day.FieldByName(field_name1).DataType in  [ftSmallint, ftInteger]  then
        qry_day.Filter:=  field_name1+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_day.Filter:='';
  end;
    qry_day.Filtered:=true;
  end
  else if   pgc1.ActivePageIndex=1 then
  begin
    qry_process.Filtered:=false;
  if qry_process.FieldByName(field_name2).FieldKind = fkCalculated then  exit;
  if qry_process.FieldByName(field_name2).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_process.FieldByName(field_name2).DataType in  [ftString, ftWideString]  then
        qry_process.Filter:=field_name2 + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_process.FieldByName(field_name2).DataType in  [ftSmallint, ftInteger]  then
        qry_process.Filter:=  field_name2+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_process.Filter:='';
  end;
  qry_process.Filtered:=true;
  end
end;

procedure TfrmMain.mniN_AddClick(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
  dm.MFlag:=1;
  try
    FrmDayModi := TFrmDayModi.create(nil);

    FrmDayModi.ShowModal;


    finally
    FrmDayModi.free;
    end;
end;

procedure TfrmMain.mniN_Add1Click(Sender: TObject);
begin
  if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

    dm.PFlag:=1;
  
  try
    FrmProcessModi := TFrmProcessModi.create(nil);

    FrmProcessModi.ShowModal;


    finally
    FrmProcessModi.free;
    end;
end;

procedure TfrmMain.mni_delClick(Sender: TObject);
var
  ssql: string;
begin
   if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
     if qry_day.IsEmpty then exit;

  try
  ssql:='delete  from data0590  where rkey = '+FrmMain.qry_day.fieldbyname('rkey').asstring+' ';
  dm.execsql(dm.qry_temp,ssql);

  qry_day.requery;
  except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;


end;

procedure TfrmMain.mni_del1Click(Sender: TObject);
var
  ssql: string;
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
     if qry_process.IsEmpty then exit;

  try
  ssql:='delete  from data0589  where rkey = '+FrmMain.qry_process.fieldbyname('rkey').asstring+' ';
  dm.execsql(dm.qry_temp,ssql);
    qry_process.requery;
  except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;
end;

procedure TfrmMain.mniN_editClick(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

     if qry_day.IsEmpty then exit;

  dm.MFlag:=2;
  try
    FrmDayModi := TFrmDayModi.create(nil);

    FrmDayModi.ShowModal;


    finally
    FrmDayModi.free;
    end;
end;

procedure TfrmMain.mniN_edit1Click(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
     if qry_process.IsEmpty then exit;
     
   dm.PFlag:=2;
  
  try
    FrmProcessModi := TFrmProcessModi.create(nil);

    FrmProcessModi.ShowModal;


    finally
    FrmProcessModi.free;
    end;
end;

procedure TfrmMain.btn_refreshClick(Sender: TObject);
begin

   if qry_day.Active then  qry_day.close  ;
   qry_day.open;


   if qry_process.Active then  qry_process.close  ;
   qry_process.open;


end;

end.
