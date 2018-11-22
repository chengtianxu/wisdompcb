unit invoice_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ADODB, Grids, DBGrids;

type
  TForm_invoice = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    Button1: TButton;
    Button2: TButton;
    ADODataSet1invoice_no: TStringField;
    ADODataSet1due_date: TDateTimeField;
    ADODataSet1INV_TOTAL: TBCDField;
    ADODataSet1EX_RATE: TFloatField;
    ADODataSet1rkey: TIntegerField;
    ADODataSet1yisou: TBCDField;
    ADODataSet1yinsou: TBCDField;
    ADODataSet1type: TStringField;
    ADODataSet1CURR_NAME: TStringField;
    ADODataSet1INV_DATE: TDateTimeField;
    CheckBox1: TCheckBox;
    ADODataSet1abbr_name: TStringField;
    ADODataSet1DSDesigner: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_invoice: TForm_invoice;

implementation

uses  datamd;

{$R *.dfm}
procedure TForm_invoice.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm_invoice.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  adodataset1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  adodataset1.filter := '';
 if adodataset1.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true; 
end;

procedure TForm_invoice.FormActivate(Sender: TObject);
begin
field_name:='invoice_no';
end;

procedure TForm_invoice.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>adodataset1.IndexFieldNames) then
 adodataset1.IndexFieldNames:=column.FieldName;

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

procedure TForm_invoice.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adodataset1.IsEmpty) then button1.OnClick(sender);
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adodataset1.CommandText);
end;

procedure TForm_invoice.DBGrid1DblClick(Sender: TObject);
begin
if not adodataset1.IsEmpty then button1.OnClick(sender);
end;

procedure TForm_invoice.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_invoice.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ADODataSet1rkey.Value;
  self.ADODataSet1.DisableControls;
  ADODataSet1.First;
  while not ADODataSet1.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ADODataSet1.Next;
  end;
  self.ADODataSet1.EnableControls;
   ADODataSet1.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ADODataSet1RKEY.Value;
  self.ADODataSet1.DisableControls;
  ADODataSet1.First;
  while not ADODataSet1.Eof do
  begin
   if self.ADODataSet1rkey.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ADODataSet1.Next;
  end;
  self.ADODataSet1.EnableControls;
   ADODataSet1.Locate('rkey',rkey,[]);
 end;
end;

procedure TForm_invoice.Button1Click(Sender: TObject);
begin
if dbgrid1.SelectedRows.Count=0 then
 dbgrid1.SelectedRows.CurrentRowSelected:=true;

self.ModalResult:=mrok;
end;

end.
