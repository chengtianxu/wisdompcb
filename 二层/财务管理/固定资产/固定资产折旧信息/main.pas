unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGridEh, StdCtrls, Spin, Buttons,
   Excel2000,ClipBrd,ComObj, Menus,dateutils;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ads517: TADODataSet;
    ads517FYEAR: TIntegerField;
    ads517PERIOD: TIntegerField;
    ads517ORIGINAL_VALUE: TBCDField;
    ads517SUMMED_DEPRE: TBCDField;
    ads517DEPRE_AMOUNT: TBCDField;
    ads517expected_depre_months: TFloatField;
    ads517accu_depre_months: TIntegerField;
    ads517DEPT_CODE: TStringField;
    ads517DEPT_NAME: TStringField;
    ads517FASSET_CODE: TStringField;
    ads517FASSET_NAME: TStringField;
    ads517FASSET_DESC: TStringField;
    ads517id_code: TStringField;
    ads517FASSET_TYPE: TStringField;
    ads517VOUCHER: TStringField;
    ads517GL_ACC_NUMBER: TStringField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    ads517gl_description: TStringField;
    ads517NET_VALUE: TFloatField;
    ads517DEPRE_RATE: TFloatField;
    ads517location: TStringField;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Edit1: TEdit;
    Label1: TLabel;
    ads517percents: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    ADOQuery1: TADOQuery;
    ads517abbr_name: TStringField;
    ads517orig_BOOK_DATE: TDateTimeField;
    ads517orig_original_value: TFloatField;
    ads517BOOK_DATE: TDateTimeField;
    ads517supplier_name: TStringField;
    ads517USER_DATE: TDateTimeField;
    ads517SURPLUS: TFloatField;
    ads517SURPLUS_RATE: TFloatField;
    ads517FASSET_ALT_TYPE: TStringField;
    ads517acc_number_fasset: TStringField;
    ads517description_fasset: TStringField;
    ads517dept_code_1: TStringField;
    ads517dept_name_1: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumneh;
   field_name: string;
    procedure item_click(sender:TObject);    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

 uses common;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not App_Init_2(self.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;
  
  //user_ptr:='4';
 // vprev:='4';
 // ADOConnection1.Open;
  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
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
   XLApp.WorkBooks.Add;
   XLApp.SheetsInNewWorkbook := 1;
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrideh(self.DBGrideh1).DataSource.DataSet.Active then
     begin
      Screen.Cursor := crDefault;
      Exit;
     end;
   TDBGrideh(DBGrideh1).DataSource.DataSet.DisableControls;
   TDBGrideh(DBGrideh1).DataSource.DataSet.first;
   v_cloumn:=TDBGrideh(DBGrideh1).Columns.Count;
   v_cloumn:=trunc(v_cloumn/2);

   Sheet.Cells[1, v_cloumn] :=spinedit1.Text+'年'+spinedit2.Text+'月'+'固定资产折旧信息一览表';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1] :='导出时间:'+DateTimeToStr(Now);
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
     if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
       begin
        Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGrideh(DBGrideh1).Columns.Items[iCount].Title.Caption;
        Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
       end
     else
      inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrideh(DBGrideh1).DataSource.DataSet.Eof do
     begin
      v_cloumn:=0;
      for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
       if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
         begin
          Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
            TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString;
         end
       else
        inc(v_cloumn);
      Inc(jCount);
      TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
     end; //end while
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;
 Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure tform1.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrideh1.FieldCount-1 do
  if dbgrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrideh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrideh1.FieldCount-1 do
  if dbgrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrideh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
if  ADOConnection1.Connected then
 begin

 spinedit1.Value:=yearof(getsystem_date(adoquery1,1));
 spinedit2.Value:=monthof(getsystem_date(adoquery1,1));
 ads517.Close;
 ads517.Parameters[0].Value:=spinedit1.Value;
 ads517.Parameters[1].Value:=spinedit2.Value;
 ads517.Open;
 field_name := DBGrideh1.Columns[2].FieldName;
 PreColumn := DBGrideh1.Columns[2];
 for i:=1 to dbgrideh1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrideh1.Columns[i-1].Title.Caption;
   if dbgrideh1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu2.Items.Add(item);
  end;
 end; 
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
 ads517.Close;
 ads517.Parameters[0].Value:=spinedit1.Value;
 ads517.Parameters[1].Value:=spinedit2.Value;
 ads517.Open;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
if (column.FieldName<>ads517.IndexFieldNames) then
 ads517.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADs517.CommandText);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey:string;
begin
rkey:=self.ads517FASSET_CODE.Value;
self.ads517.Close;
self.ads517.Open;
if rkey<>'' then ads517.Locate('fasset_code',rkey,[]);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ADs517.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs517.filter := '';
end;



end.
