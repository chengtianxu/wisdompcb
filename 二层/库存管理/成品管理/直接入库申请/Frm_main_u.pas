unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB,
  ppEndUsr, ppReport, ppSubRpt, ppBands, ppStrtch, ppMemo, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppComm, ppRelatv, ppDB, ppDBPipe,ComObj, Excel97;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    N6: TMenuItem;
    N10: TMenuItem;
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
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch:string;
    procedure init;
    procedure ExportInf;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u;
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


 // dm.ADOCon.Open;
 // user_ptr := '3';
 // vprev := '4';

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
  if DM.ADO416.IsEmpty then exit;
  i := DM.ADO416rkey.AsInteger ;
  DM.ADO416.Close;
  DM.ADO416.Open;
  DM.ADO416.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO416.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO416.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO416AfterScroll(DM.ADO416);
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
  sSql:=DM.ADO416.SQL.Text;
  FsSearch:=' where data0416.type=1 and data0416.sys_date>getdate()-7 ';
  CheckBox1Click(nil);
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO416status.Value = 3 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO416status.Value = 1 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else
     Grd1.Canvas.Font.Color := clfuchsia ;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO416.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交
    n5.Enabled:=false;    //删除
    n9.Enabled:=false;    //cancel
    n10.Enabled:=false;
  end
  else
  begin
    n2.Enabled:=(dm.ADO416status.AsInteger in [0,3]) ;
    n3.Enabled := true;
    n4.Enabled := dm.ADO416status.AsInteger=0;
    n5.Enabled:=n2.Enabled ;
    n9.Enabled:=dm.ADO416status.AsInteger=1;
    n10.Enabled:=true;
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
    FsSearch:=' where data0416.type=1 and data0416.sys_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and data0416.sys_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    CheckBox1Click(nil);
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO416.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,11]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
  0,1,2: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO416.Close;
           DM.ADO416.Open;
           DM.ADO416.Locate('rkey',Frkey416,[]);
         end;
       finally
         free;
         DM.ADO416_1.Close;
         DM.ADO53_1.Close;
         DM.ADO53_2.Close;
       end;
   3:begin    //提交
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0416 set status=1 where rkey='+DM.ADO416rkey.AsString+' and status=0' ;
       if DM.tmp.ExecSQL=0 then
         showmessage('入库单状态发生改变而未能成功提交!');
       BtBrushClick(nil);
     end;

   4: begin
        if MessageBox(Handle,'确定删除此入库单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from data0416  where rkey='+DM.ADO416rkey.AsString+' and status in (0,3)';
        if DM.tmp.ExecSQL<>1 then
          showmessage('删除数据失败,入库单状态已发生变化...')
        else
          DM.ADO416.Prior;
        BtBrushClick(nil);
      end;
   11: begin
        if MessageBox(Handle,'确定取消提交此入库单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0416 set status=0 where rkey='+DM.ADO416rkey.AsString+' and status=1';
        if DM.tmp.ExecSQL<>1 then
          showmessage('取消提交此入库单失败,数据状态已发生变化...');
        BtBrushClick(nil);
      end;
    12:ExportInf;
  end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  FsCheck:=' and data0416.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  DM.ADO416.SQL.Text:=sSql+FsSearch+FsCheck+' order by data0416.number';
  DM.ADO416.Close;
  DM.ADO416.Open;
end;

procedure TFrm_main.ExportInf;
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
begin
  Screen.Cursor := crHourglass;
  Grd2.DataSource.DataSet.DisableControls;
  bm := Grd2.DataSource.DataSet.GetBookmark;
  Grd2.DataSource.DataSet.First;

  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
  ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

  mem := TMemo.Create(Self);
  mem.Visible := false;
  mem.Parent := self;
  mem.Clear;
  sline := '';

  for col := 0 to Grd1.FieldCount-1 do
    sline := sline + Grd1.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  sline := '';
  for col := 0 to Grd1.FieldCount-1 do
    sline := sline + Grd1.Fields[col].AsString + #9;
  mem.Lines.Add(sline);            //导出编号

  mem.Lines.Add('');//增加一行空行

  sline := '';
  for col := 0 to Grd2.FieldCount-1 do
   sline := sline + Grd2.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  for row := 0 to Grd2.DataSource.DataSet.RecordCount-1 do
  begin
    sline := '';
    for col := 0 to Grd2.FieldCount-1 do
      sline := sline + Grd2.Fields[col].AsString + #9;
    mem.Lines.Add(sline);
    Grd2.DataSource.DataSet.Next;
  end;

  mem.SelectAll;
  mem.CopyToClipboard;

  ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
  ExcelApp.Visible := true;
  FreeAndNil(mem);

  Grd2.DataSource.DataSet.GotoBookmark(bm);
  Grd2.DataSource.DataSet.FreeBookmark(bm);
  Grd2.DataSource.DataSet.EnableControls;
  Screen.Cursor := crDefault;
end;

end.
