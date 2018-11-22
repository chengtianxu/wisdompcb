unit uXSMB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus
  ,Excel2000,ComObj,math,DB;

type
  TfrmXSMB = class(TForm)
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
    Splitter1: TSplitter;
    GroupBox3: TGroupBox;
    DBGridEh2: TDBGridEh;
    Splitter2: TSplitter;
    GroupBox2: TGroupBox;
    DBGridEh3: TDBGridEh;
    Splitter3: TSplitter;
    GroupBox1: TGroupBox;
    DBGridEh4: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    PopupMenu5: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    _FN:string;
    procedure item_click(sender:TObject);
    function checkchar(const pstr:string;const pkey:char):boolean;
  public

  end;

var
  frmXSMB: TfrmXSMB;

implementation

uses uDM, uShowXSMB, uZGKH, uKFKH, uSKJH;

{$R *.dfm}
function TfrmXSMB.checkchar(const pstr:string;const pkey:char):boolean;
begin
if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  begin
    result:=false
  end
 else
   result:=true;
end;
//增删字段
procedure TfrmXSMB.item_click(sender:TObject);
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
     end;// end while
   end;//end if
  pStrgrids[j].DataSource.DataSet.EnableControls;
 end;
 XlApp.Visible := True;
 Screen.Cursor := crDefault;
end;
procedure TfrmXSMB.FormShow(Sender: TObject);
var
 i:integer;
 item:TmenuItem;
begin
  dm.ADS705.Open;
  dm.ADS706.Open;
  dm.ADS707.Open;
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
//导出
procedure TfrmXSMB.BitBtn2Click(Sender: TObject);
begin
 if dm.AQery704.Active=false then exit;
 if dm.AQery704.RecordCount=0 then exit;

 ExPortExcel([dbgrideh2,dbgrideh3,dbgrideh4,dbgrideh1],['主管客户','计划开发客户','计划收款','销售计划']);

end;
//过滤
procedure TfrmXSMB.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if (Column.FieldName='CStatus') or
  (Column.FieldName='CZYStatus') then exit;

 if column.Title.SortMarker =smDownEh then
   column.Title.SortMarker:=smUpEh
 else
   column.Title.SortMarker:=smDownEh;
 if column.Title.SortMarker =smDownEh then
   dm.AQery704.Sort:=Column.FieldName
 else
   dm.AQery704.Sort:=Column.FieldName+' DESC';
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
 //label1.Left:=edit1.Left- label1.Width-3;
 label1.Caption:=column.Title.Caption+'：';
end;

procedure TfrmXSMB.BitBtn3Click(Sender: TObject);
begin
 popupmenu5.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmXSMB.Edit1Change(Sender: TObject);
begin
  if trim(edit1.text)<>'' then
    dm.AQery704.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AQery704.Filter :='';
end;

procedure TfrmXSMB.Edit2Change(Sender: TObject);
begin
 if trim(edit2.text)<>'' then
    dm.AQery704.Filter :=_FN+' >='+trim(edit2.text)
  else
    dm.AQery704.Filter :='';
end;
//日期过滤
procedure TfrmXSMB.DateTimePicker1Change(Sender: TObject);
var
 vstr:string;
begin
  vstr:=_FN+' >= '+datetostr(DateTimePicker1.Date);
  vstr:=vstr+' and '+_FN+' <='+datetostr(DateTimePicker2.Date);
  dm.AQery704.Filter :=vstr;

end;

procedure TfrmXSMB.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if  checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;
//退出
procedure TfrmXSMB.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmXSMB.FormActivate(Sender: TObject);
begin
 DBGridEh1TitleClick(DBGridEh1.Columns[0])
end;
//查看主表
procedure TfrmXSMB.N1Click(Sender: TObject);
begin
  if dm.AQery704.RecordCount=0 then exit;
  Application.CreateForm(TfrmshowXSMB, frmshowXSMB);
  frmshowXSMB.ShowModal();
  frmshowXSMB.Free;
end;

procedure TfrmXSMB.N2Click(Sender: TObject);
begin
 if dm.ADS705.RecordCount=0 then exit; 
  Application.CreateForm(TfrmZGKH, frmZGKH);
  frmZGKH.ShowModal();
  frmZGKH.Free;
end;

procedure TfrmXSMB.N3Click(Sender: TObject);
begin
 if dm.ADS706.RecordCount=0 then exit;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;

procedure TfrmXSMB.N4Click(Sender: TObject);
begin
 if dm.ADS706.RecordCount=0 then exit;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;

procedure TfrmXSMB.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AQery704.SQL.Text)
end;

end.
