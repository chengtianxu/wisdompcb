unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB,
  ComCtrls, Menus;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn_exit: TBitBtn;
    btn_refresh: TBitBtn;
    btn_export: TBitBtn;
    btn_qry: TBitBtn;
    lbl_field: TLabel;
    edt_value: TEdit;
    eh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    rg1: TRadioGroup;
    dtpEndDate: TDateTimePicker;
    dtpStartDate: TDateTimePicker;
    lbl1: TLabel;
    pm1: TPopupMenu;
    mni_editEr: TMenuItem;
    mni_editHour: TMenuItem;
    mniN1: TMenuItem;
    mni_WODetail: TMenuItem;
    procedure eh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure dtpEndDateChange(Sender: TObject);
    procedure dtpStartDateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure mni_editErClick(Sender: TObject);
    procedure mni_editHourClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mni_WODetailClick(Sender: TObject);
    procedure eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);

  private
    { Private declarations }
    Lsql:string; //查询条件
    PreColumn : TColumnEh;
    Field_Name:string;
    Msql,Qsql:string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
        uses UDM,uqry,common,UUpdatLevel,UPause,uWODetail;
{$R *.dfm}

procedure TfrmMain.eh1TitleClick(Column: TColumnEh);
begin
  if qry1.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry1.Sort:=Column.FieldName+' DESC';
  end;

  if qry1.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (Field_Name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    Field_Name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edt_value.SetFocus;
end;

procedure TfrmMain.edt_valueChange(Sender: TObject);
begin
  qry1.Filtered:=false;
  if qry1.FieldByName(Field_Name).FieldKind = fkCalculated then  exit;
  if qry1.FieldByName(Field_Name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry1.FieldByName(Field_Name).DataType in  [ftString, ftWideString]  then
        qry1.Filter:=Field_Name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry1.FieldByName(Field_Name).DataType in  [ftSmallint, ftInteger]  then
        qry1.Filter:= Field_Name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry1.Filter:='';
  end;
  qry1.Filtered:=true;
end;

procedure TfrmMain.btn_qryClick(Sender: TObject);
var
 i:integer;
 ssql:string;
 Lfrm: TfrmQry;
begin
  try

   Screen.Cursor:=crHourGlass;
    eh1.FrozenCols:=0;
    Lfrm:=Tfrmqry.create(self);

    if Lfrm.ShowModal=mrok then
    begin
       for i:=1 to LFrm.SGrid1.RowCount-2 do
        ssql:=ssql+ LFrm.SGrid1.Cells[2,i]+#13;
      // showmessage(ssql);
        Qsql:=ssql;
        qry1.Close;
        qry1.sql.Clear;
       // showmessage('exec sp_GetProdSchedule  '''+ssql+''' ');
        qry1.SQL.Add('exec sp_GetProdSchedule  '''+ssql+''' ');
       if ssql='' then
        qry1.sql.add('exec sp_GetProdSchedule '''' ' );
       qry1.open;

      eh1.Columns[0].Visible:=false;
      if eh1.Columns.Count>8  then
      begin
        eh1.FrozenCols:=8;
        eh1.Columns[1].Width:=80;
        eh1.Columns[2].Width:=120;
        eh1.Columns[3].Width:=120;
        eh1.Columns[4].Width:=60;
        eh1.Columns[5].Width:=120;
        eh1.Columns[7].Width:=80;
        eh1.Columns[8].Width:=80;
        PreColumn:=eh1.Columns[1];
        Field_Name:=eh1.Columns[1].FieldName;
      end;

   end;

 finally
   Lfrm.free;
 Screen.Cursor:= crDefault;
 end;
end;

procedure TfrmMain.rg1Click(Sender: TObject);
begin
  //if  qry1.IsEmpty then Exit;
  qry1.Filtered:=false;
// if self.PreColumn = nil then
// begin
  if rg1.ItemIndex = 5 then
   qry1.Filter := ''
  else qry1.Filter := '作业单状态='+ QuotedStr(rg1.Items[rg1.ItemIndex]);
  qry1.Filtered:=true;
// end
// else begin
//  if PreColumn.Field.DataType in [ftDate, ftDateTime] then
//    dtpStartDateChange(sender)
//  else edt_valueChange(sender);
// end;
end;

procedure TfrmMain.dtpEndDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter,Status_filter:string;
begin
  if not qry1.Active then abort;
  if preColumn.Field.DataType in [ftDate, ftDateTime] then
   begin
    TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
    TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
    if rg1.ItemIndex = 9 then
      Status_filter := ''
    else
      Status_filter := ' and prod_Status_CN='+ QuotedStr(rg1.Items[rg1.ItemIndex]);

    sFilter := preColumn.Field.FieldName+'>='+TmpStr1+ ' AND ' +preColumn.Field.FieldName+'<'+TmpStr2;
    qry1.Filter := sFilter+Status_filter;
    qry1.Filtered:= true;
   end;
end;

procedure TfrmMain.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter,Status_filter:string;
begin
  if not qry1.Active then abort;
  if preColumn.Field.DataType in [ftDate, ftDateTime] then
   begin
    TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
    TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
    if rg1.ItemIndex = 9 then
      Status_filter := ''
    else
      Status_filter := ' and prod_Status_CN='+ QuotedStr(rg1.Items[rg1.ItemIndex]);

    sFilter := preColumn.Field.FieldName+'>='+TmpStr1+ ' AND ' +preColumn.Field.FieldName+'<'+TmpStr2;
    qry1.Filter := sFilter+Status_filter;
    qry1.Filtered:= true;
   end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

Msql:='exec sp_GetProdSchedule '''' ';

end;

procedure TfrmMain.btn_refreshClick(Sender: TObject);
begin
       qry1.Close;
      qry1.sql.Clear;
      if(qsql<>'') then
       qry1.SQL.Add('exec sp_GetProdSchedule  '''+qsql+''' ')
      else
       qry1.sql.add('exec sp_GetProdSchedule '''' ' );
       qry1.open;

  eh1.Columns[0].Visible:=false;
  if eh1.Columns.Count>7  then
  begin
        eh1.FrozenCols:=7;
        eh1.Columns[1].Width:=80;
        eh1.Columns[2].Width:=120;
        eh1.Columns[3].Width:=120;
        eh1.Columns[4].Width:=60;
        eh1.Columns[5].Width:=120;
        eh1.Columns[7].Width:=80;
        PreColumn:=eh1.Columns[1];
        Field_Name:=eh1.Columns[1].FieldName;
  end;
end;

procedure TfrmMain.btn_exportClick(Sender: TObject);
begin
if qry1.isempty then exit;
 common.Export_dbGridEH_to_Excel(eh1,'在线产品生产计划明细');

end;

procedure TfrmMain.mni_editErClick(Sender: TObject);
var
  LFrm:TfrmUpdateLevel;
  Lsql:string;
begin
   if (qry1.IsEmpty) then Exit;
  try
    Lfrm:=TfrmUpdateLevel.create(nil);
//    if (strtoint(vprev)<>4)  then
//    begin
//      showmessage('对不起,您的权限不够');
//      Exit;
//    end;

    if lfrm.ShowModal=mrok then
    begin
      DM.qrytemp.Close;
      Lsql:=  'update data0006 set PRIORITY_CODE='+inttostr(lfrm.BitBtn2.Tag)+' where rkey='+qry1.FieldBYName('Rkey06').asstring;
      //ShowMessage(Lsql);
      DM.qrytemp.SQL.Text:=  Lsql;
      DM.qrytemp.ExecSQL;
    end;
  finally
    lfrm.Free;
  end;
 // btn_refreshClick(sender);
end;

procedure TfrmMain.mni_editHourClick(Sender: TObject);
 var
   LFrm:TfrmPause;
 begin
//  if (strtoint(vprev)<>4)  then
//  begin
//    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
//    Exit;
//  end;
  if (qry1.IsEmpty) then Exit;
   Lfrm:=TfrmPause.Create(nil);
   LFrm.Frkey06:=qry1.fieldbyname('rkey06').asstring;
  try
    if Lfrm.showmodal=mrok then
    begin
//      qry1.Close;
//      qry1.sql.Clear;
//      if(qsql<>'') then
//       qry1.SQL.Add('exec sp_GetProdSchedule  '''+qsql+''' ')
//      else
//       qry1.sql.add('exec sp_GetProdSchedule '''' ' );
//       qry1.open;
    end;
    eh1.Cursor:=crDefault;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  rkey73:= '3202';
  user_ptr := '3301';
  vprev := '4';

  if not App_Init_2(dm.con1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

  Caption := application.Title;
end;

procedure TfrmMain.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry1.SQL.Text);
end;

procedure TfrmMain.mni_WODetailClick(Sender: TObject);
var
  Lfrm:TfrmWoDetail;
begin
if qry1.IsEmpty  then exit;
Lfrm:=TfrmWODEtail.create(self);
try
  Lfrm.GetData(qry1.fieldbyname('rkey06').AsInteger);
  LFrm.ShowModal();
finally
  Lfrm.free;
end;

end;

procedure TfrmMain.eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  var
    i:Integer;
begin
  if qry1.IsEmpty  then exit;
  if Column.Index=1 then Exit;

  if qry1.FieldByName('当前工序').asstring=Column.FieldName  then
     eh1.Canvas.Font.Color:=clred;
     eh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

end.

