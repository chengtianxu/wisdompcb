unit SelectAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm_SelectAll = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    BitBtn5: TBitBtn;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1code23: TStringField;
    ADOQuery1QUAN_ON_HAND: TBCDField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1tax_price: TBCDField;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1EXPIRE_DATE: TDateTimeField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1GRN_NUMBER: TStringField;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1ship_DATE: TDateTimeField;
    ADOQuery1rohs: TStringField;
    ADOQuery1SUPPLIER2: TStringField;
    ADOQuery1exch_rate: TBCDField;
    ADOQuery1inv_group_name: TStringField;
    ADOQuery1po_number: TStringField;
    PopupMenu1: TPopupMenu;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    ADOQuery1amount_notax: TBCDField;
    ADOQuery1amount_tax: TBCDField;
    ADOQuery1L_no_taxprice: TBCDField;
    ADOQuery1L_tax_price: TBCDField;
    ADOQuery1manu_date: TDateTimeField;
    ADOQuery1cust_decl: TStringField;
    ADOQuery1reason: TStringField;
    ADOQuery1CONSIGN_ONHAND_QTY: TFloatField;
    ADOQuery1eff_day: TIntegerField;
    ADOQuery1name23: TStringField;
    ADOQuery1employee_name: TStringField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    ADOQuery1rkey134: TAutoIncField;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    ADOQuery1InDays: TIntegerField;
    N3: TMenuItem;
    ADOQuery1rkey391: TIntegerField;
    procedure CopyDbDataToExcel(Args:array of const);
    procedure Button2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject); 
  public
    { Public declarations }
  end;

var
  Form_SelectAll: TForm_SelectAll;

implementation

uses demo,common, BzReport,ppCtrls, pasCode;

{$R *.dfm}

procedure TForm_SelectAll.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
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
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm_SelectAll.Button2Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_SelectAll.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 adoquery1.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 adoquery1.Filter := '';
end;

procedure TForm_SelectAll.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm_SelectAll.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm_SelectAll.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm_SelectAll.DBGrid1TitleClick(Column: TColumn);
begin
 if(column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  adoquery1.Sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm_SelectAll.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_SelectAll.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm_SelectAll.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=self.item_click;
   self.PopupMenu1.Items.Add(item);
  end;
  if form_SelectAll.PopupMenu1.tag<=2 then
  begin
    for i:=9 to 13 do self.PopupMenu1.Items[i].Enabled:=false;
  end;

end;

procedure TForm_SelectAll.FormShow(Sender: TObject);
begin
  if Self.PopupMenu1.Tag=4 then
  begin
    Self.ADOQuery1EXPIRE_DATE.ReadOnly:=false; //有效期
    Self.ADOQuery1SUPPLIER2.ReadOnly:=False;//详细位置
    Self.ADOQuery1cust_decl.ReadOnly:=False;//报关单号
  end;
end;

procedure TForm_SelectAll.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ((ADOQuery1eff_day.Value>0) and (ADOQuery1eff_day.Value <= 30)) or ((ADOQuery1.fieldbyname('indays').value>=335)  and (ADOQuery1.fieldbyname('indays').value<=365) ) then      //取将过期和即将呆滞
    DBGrid1.Canvas.Font.Color := clBlue
  else  if ADOQuery1.fieldbyname('indays').value>365  then //呆滞料
   DBGrid1.Canvas.Font.Color :=clPurple
   else if ADOQuery1eff_day.Value < 0 then      //过期的
    DBGrid1.Canvas.Font.Color := clred;
// if (ADOQuery1eff_day.AsString<>'') and (ADOQuery1eff_day.Value <= 30) then
//    DBGrid1.Canvas.Font.Color := clBlue;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_SelectAll.N1Click(Sender: TObject);
begin
 form_bzreport:=tform_bzreport.Create(application);
 form_bzreport.ado22.close;
 form_bzreport.ado22.Parameters[0].Value:=ADOQuery1rkey134.Value;
 form_bzreport.ado22.open;

 form_bzreport.ADO493.Close;
 form_bzreport.ADO493.Open;

 Form_bzreport.ppReport1.Reset;
 Form_bzreport.ppReport1.Template.FileName :=
     StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'Wlbzreport.rtm';
 Form_bzreport.ppReport1.Template.LoadFromFile;
 form_bzreport.ppReport1.SaveAsTemplate:=false;
 form_bzreport.ppReport1.Print;
 form_bzreport.free;
end;

procedure TForm_SelectAll.N2Click(Sender: TObject);
begin
 Edit3.CopyToClipboard;
end;

procedure TForm_SelectAll.N3Click(Sender: TObject);
var
  LFrm:TfrmCode ;
  Img2DBar: TppImage;
  I,J: Integer;
  LText: string;
begin
  LFrm:=TfrmCode.Create(application);
  try
    LFrm.qryCode.Close;
    LFrm.qryCode.Parameters[0].Value:= ADOQuery1rkey391.Value;
    LFrm.qryCode.Open;
    if LFrm.qryCode.IsEmpty then
    begin
      ShowMessage('无可打印标签');
      Exit;
    end;
    LFrm.ppReportCode.Reset;
    LFrm.ppReportCode.Template.FileName :=
              StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'IQCCode.rtm';
    LFrm.ppReportCode.Template.LoadFromFile;


    LFrm.ppReportCode.ObjectByName(I,J,'ppImage1');

    Img2DBar := LFrm.ppReportCode.Bands[I].Objects[J] as TppImage;
    LText := LFrm.qryCode.fieldbyname('条码编号').AsString;
    LFrm.Get2DCodeBmp(LText,Img2DBar.Picture);

    LFrm.ppReportCode.SaveAsTemplate:= False;
    LFrm.ppReportCode.SaveAsTemplate:= False;
    LFrm.ppReportCode.Print;
  finally
    LFrm.Free;
  end;
end;

end.
