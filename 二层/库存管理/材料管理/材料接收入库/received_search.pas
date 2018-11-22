unit received_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls,ComObj,
  Excel2000,ClipBrd;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ADOQuery1GRN_NUMBER: TStringField;
    ADOQuery1DELIVER_NUMBER: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1QUANTITY: TBCDField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1abbr_warehouse: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1ship_DATE: TDateTimeField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1EXPIRE_DATE: TDateTimeField;
    ADOQuery1TTYPE: TWordField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1exch_rate: TBCDField;
    ADOQuery1rohs: TStringField;
    ADOQuery1v_type: TStringField;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ADOQuery1PRICE: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dtpk1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   field_name:string;
   FsSQL:string ;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses data_module, main,common;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex :=0;
  dtpk1.Date:=form1.dtpk1.Date;
  dtpk2.Date:=form1.DTPk2.Date;
  self.ADOQuery1.Close;
  self.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
  self.ADOQuery1.Parameters[1].Value:=dtpk2.Date+1;
  self.ADOQuery1.Prepared:=true;
  self.ADOQuery1.Open;
  field_name:='GRN_NUMBER';
  Self.ADOQuery1.Sort:=field_name;
  if (strtoint(vprev) < 3) then
   begin
    dbgrid1.Columns[7].Visible:=false;
    dbgrid1.Columns[8].Visible:=false;
   end;
  FsSQL:=Self.ADOQuery1.SQL.Text;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  adoquery1.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  adoquery1.Filter:='';
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;  
 end
else
 edit1.SetFocus;
end;

procedure TForm3.dtpk1Exit(Sender: TObject);
begin
self.ADOQuery1.Close;
self.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
self.ADOQuery1.Parameters[1].Value:=dtpk2.Date+1;
self.ADOQuery1.Prepared:=true;
self.ADOQuery1.Open;
end;

procedure Tform3.CopyDbDataToExcel(Args:array of const);
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

procedure TForm3.Button2Click(Sender: TObject);

begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  Self.ADOQuery1.Close;
  if ComboBox1.ItemIndex=0 then
     Self.ADOQuery1.SQL.Text:=FsSQL
  else
     Self.ADOQuery1.SQL.Text:=FsSQL+' and Stuff_Mesh.ttype='''+inttostr(ComboBox1.ItemIndex)+'''';
     Self.ADOQuery1.Open;
end;



procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADOQuery1.SQL.Text);
end;

end.
