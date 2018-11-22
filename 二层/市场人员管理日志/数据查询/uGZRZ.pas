unit uGZRZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls
  ,Excel2000,ComObj,math,DB;

type
  TfrmGZRZ = class(TForm)
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    PopupMenu3: TPopupMenu;
    N3: TMenuItem;
    PopupMenu4: TPopupMenu;
    N4: TMenuItem;
    PopupMenu5: TPopupMenu;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    _FN:string;
    procedure item_click(sender:TObject);
    function checkchar(const pstr:string;const pkey:char):boolean;
  public
    { Public declarations }
  end;

var
  frmGZRZ: TfrmGZRZ;

implementation

uses uDM, uShowGZRZ, uDDJF, uKHTS, uYWYXZ;

{$R *.dfm}
function TfrmGZRZ.checkchar(const pstr:string;const pkey:char):boolean;
begin
if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  begin
    result:=false
  end
 else
   result:=true;
end;
//增删字段
procedure TfrmGZRZ.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.Columns.Count-1  do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGridEh1.Columns.Count-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;
procedure ExPortExcel(const pStrgrids:array of TdbGrideh;pCap:array of string);
var
 iCount, jCount, v_cloumn,j: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin

 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;


 XLApp.SheetsInNewWorkbook :=High(pStrgrids)+1;
 XLApp.WorkBooks.Add;
 for j:=Low(pStrgrids) to High(pStrgrids) do
 begin

   XLApp.WorkBooks[1].WorkSheets[j+1].Name := pCap[j];

   Sheet := XLApp.Workbooks[1].WorkSheets[j+1];

   v_cloumn:=math.Floor(pStrgrids[j].Columns.Count/2);

   Sheet.Cells[1, v_cloumn] :=pCap[j];

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to pStrgrids[j].Columns.Count - 1 do
    if pStrgrids[j].Columns[iCount].Visible=true then
     begin
       Sheet.Cells[3, iCount + 1 - v_cloumn] :=pStrgrids[j].Columns[iCount].Title.Caption;
       Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
     end
    else
     inc(v_cloumn);

   jCount:= 4;
   //行

  pStrgrids[j].DataSource.DataSet.DisableControls;
  if pStrgrids[j].DataSource.DataSet.Active=true then
   begin
    pStrgrids[j].DataSource.DataSet.First ;
     while not pStrgrids[j].DataSource.DataSet.eof do
     begin
       v_cloumn:=0;
       for iCount := 0 to pStrgrids[j].Columns.Count - 1 do
        if pStrgrids[j].Columns[iCount].Visible=true then
         begin
           Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=pStrgrids[j].DataSource.DataSet.FieldValues[pStrgrids[j].Columns[iCount].FieldName];
         end
        else
         inc(v_cloumn);

       Inc(jCount);
       pStrgrids[j].DataSource.DataSet.Next ;
     end;//end while
   end;// end if
  pStrgrids[j].DataSource.DataSet.EnableControls;
 end;
 XlApp.Visible := True;
 Screen.Cursor := crDefault;
end;
procedure TfrmGZRZ.FormShow(Sender: TObject);
var
 i:integer;
 item:TmenuItem;
begin
  dm.ADS709.Open;
  dm.ADS710.Open;
  dm.ADS711.Open;
  for i:=0 to DBGridEh1.Columns.Count-1 do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=DBGridEh1.Columns[i].Title.Caption;
   if DBGridEh1.Columns[i].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   PopupMenu5.Items.Add(item);

  end;
end;
procedure TfrmGZRZ.FormActivate(Sender: TObject);
begin
 DBGridEh1TitleClick(DBGridEh1.Columns[0])
end;
//过滤
procedure TfrmGZRZ.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if (Column.FieldName='CSTATUS') OR
    (Column.FieldName='CTJSTATUS') OR
    (Column.FieldName='CYSSTATUS') then exit;

 if column.Title.SortMarker =smDownEh then
   column.Title.SortMarker:=smUpEh
 else
   column.Title.SortMarker:=smDownEh;
 if column.Title.SortMarker =smDownEh then
   dm.AQery708.Sort:=Column.FieldName
 else
   dm.AQery708.Sort:=Column.FieldName+' DESC';
 //查找
 case Column.Field.DataType  of
  ftautoinc,ftInteger,ftBCD	,ftword,ftFloat:
   begin
    edit2.Visible:=true;
    DateTimePicker1.Visible :=not edit2.Visible;
    DateTimePicker2.Visible :=not edit2.Visible;
    edit1.Visible:=not edit2.Visible;

   end;
  ftDateTime:
   begin
    DateTimePicker1.Visible :=true;
    DateTimePicker2.Visible :=true;
    edit1.Visible :=not DateTimePicker1.Visible;
    edit2.Visible:=not DateTimePicker1.Visible;
   end;
 ftString:
  begin
   edit1.Visible :=true;
   edit2.Visible :=not edit1.Visible;
   DateTimePicker1.Visible:=not edit1.Visible;
   DateTimePicker2.Visible :=not edit1.Visible;

  end;

 end;
 DateTimePicker1.Left :=edit1.Left;
 DateTimePicker1.Top:=edit1.Top;
 DateTimePicker2.Top:=edit1.Top;
 edit2.Top:=edit1.Top;
 edit2.Left :=edit1.Left ;
 edit1.Text:='';
 edit2.Text:='';
 _FN:=Column.FieldName;
 label1.Caption:=column.Title.Caption+'：';
end;

procedure TfrmGZRZ.Edit1Change(Sender: TObject);
begin
  if trim(edit1.text)<>'' then
    dm.AQery708.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AQery708.Filter :='';
end;

procedure TfrmGZRZ.Edit2Change(Sender: TObject);
begin
 if trim(edit2.text)<>'' then
   dm.AQery708.Filter :=_FN+' >='+trim(edit2.text)
 else
   dm.AQery708.Filter :='';
end;

procedure TfrmGZRZ.DateTimePicker1Change(Sender: TObject);
var
 vstr:string;
begin
  vstr:=_FN+' >= '+datetostr(DateTimePicker1.Date);
  vstr:=vstr+' and '+_FN+' <='+datetostr(DateTimePicker2.Date);
  dm.AQery708.Filter :=vstr;

end;

procedure TfrmGZRZ.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if  checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;
//查看主表
procedure TfrmGZRZ.N1Click(Sender: TObject);
begin
  if dm.AQery708.RecordCount=0 then exit;
  Application.CreateForm(TfrmShowGZRZ, frmShowGZRZ);
  frmShowGZRZ.ShowModal();
  frmShowGZRZ.Free;
end;
//查看709
procedure TfrmGZRZ.N2Click(Sender: TObject);
begin
  if dm.ADS709.RecordCount=0 then exit;
  Application.CreateForm(TfrmDDJF, frmDDJF);
  frmDDJF.ShowModal();
  frmDDJF.Free;

end;
//查看710
procedure TfrmGZRZ.N3Click(Sender: TObject);
begin
  if dm.ADS710.RecordCount=0 then exit;
  Application.CreateForm(TfrmKHTS, frmKHTS);
  frmKHTS.ShowModal();
  frmKHTS.Free;
end;
//查看712
procedure TfrmGZRZ.N4Click(Sender: TObject);
begin
  if dm.ADS711.RecordCount=0 then exit;
  Application.CreateForm(TfrmYWYXZ, frmYWYXZ);
  frmYWYXZ.ShowModal();
  frmYWYXZ.Free;
end;
//导出EXCEL
procedure TfrmGZRZ.BitBtn2Click(Sender: TObject);
begin
 if dm.AQery708.Active=false then exit;
 if dm.AQery708.RecordCount=0 then exit;

 ExPortExcel([dbgrideh2,dbgrideh3,dbgrideh4,dbgrideh1],['工作日志','客户投诉,退货情况','业务员行踪','订单交付']);

end;
//增删
procedure TfrmGZRZ.BitBtn3Click(Sender: TObject);
begin
 popupmenu5.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmGZRZ.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmGZRZ.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AQery708.SQL.Text)
end;

end.
