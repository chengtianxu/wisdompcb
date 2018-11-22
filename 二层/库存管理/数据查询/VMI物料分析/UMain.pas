unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dbgrdh1: TDBGridEh;
    qry_Main: TADOQuery;
    qry1: TADOQuery;
    ds1: TDataSource;
    lbl_field: TLabel;
    edt_value: TEdit;
    btn_quit: TBitBtn;
    btn_refresh: TBitBtn;
    btn_qry: TBitBtn;
    btn_Outport: TBitBtn;
    strngfld_MainDSDesigner: TStringField;
    strngfld_MainDSDesigner2: TStringField;
    strngfld_MainDSDesigner3: TStringField;
    strngfld_MainDSDesigner4: TStringField;
    strngfld_MainDSDesigner5: TStringField;
    strngfld_MainDSDesigner6: TStringField;
    strngfld_MainDSDesigner7: TStringField;
    strngfld_MainDSDesigner8: TStringField;
    dtmfld_MainDSDesigner9: TDateTimeField;
    dtmfld_MainDSDesigner10: TDateTimeField;
    smlntfld_MainDSDesigner11: TSmallintField;
    strngfld_MainDSDesigner12: TStringField;
    bcdfld_MainDSDesigner13: TBCDField;
    bcdfld_MainDSDesigner14: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_OutportClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure dbgrdh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
     field_name ,Mysql :  string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
             uses  UDM,common, UQry;
{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
//  vprev:='4';

  if not App_init_2(DM.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

   self.Caption:=application.Title;

end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  Mysql:= qry_Main.sql.text;


     if not qry_Main.Active  then qry_Main.open;
      PreColumn:=dbgrdh1.columns[0];
field_name:= dbgrdh1.columns[0].fieldname;
dbgrdh1.columns[0].title.Color:=clRed;
dbgrdh1.columns[4].title.Color:=clOlive;
 dbgrdh1.columns[0].Title.SortMarker:=smUpEh;
qry_main.Sort:=field_name;
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

procedure TFrmMain.btn_OutportClick(Sender: TObject);
begin
 if qry_main.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(dbgrdh1,'VMI物料分析表');
end;

procedure TFrmMain.btn_refreshClick(Sender: TObject);
begin
 //if not qry_Main.Active  then qry_Main.Open;

 with qry_main do
 begin
  close;
  sql.clear;
  sql.text:=mysql;
   open;

 end;
end;

procedure TFrmMain.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btn_qryClick(Sender: TObject);
var
Qrystr: string;
i:Integer;
begin
//
qrystr:='';
  try
   frmQry:=TFrmQry.create(nil);
   if FrmQry.ShowModal=mrok then
   begin
     for i:=0  to FrmQry.strngrdSGrid1.RowCount-2 do
     begin
      qrystr:=qrystr+ frmqry.strngrdSGrid1.Cells[2,i]
     end;
     qry_main.SQL.Text:= Mysql+qrystr;
     try
       qry_main.close;
       qry_main.open;

      except on e: exception do
      begin
      ShowMessage('错误：' +e.Message);
      exit;
      end;
     end;
    end;
  finally
   frmqry.free;

  end;
end;

procedure TFrmMain.dbgrdh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 If qry_main.FieldByName('状态').Value = '超期'  then
  Begin
    dbgrdh1.Canvas.Font.Color := clBlue;
    dbgrdh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End
  else If qry_main.FieldByName('状态').Value = '异常'  then
  Begin
    dbgrdh1.Canvas.Font.Color := clred;
    dbgrdh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End
end;

end.
