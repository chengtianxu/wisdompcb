unit invt_recept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TForm_invtship = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    ADODataSet1: TADODataSet;
    ADODataSet1GRN_NUMBER: TStringField;
    ADODataSet1DELIVER_NUMBER: TStringField;
    ADODataSet1INV_NAME: TStringField;
    ADODataSet1INV_DESCRIPTION: TStringField;
    ADODataSet1TDATE: TDateTimeField;
    ADODataSet1QUANTITY: TFloatField;
    ADODataSet1UNIT_NAME: TStringField;
    ADODataSet1PRICE: TBCDField;
    ADODataSet1TAX_2: TBCDField;
    ADODataSet1RKEY: TAutoIncField;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1CURR_NAME: TStringField;
    Label1: TLabel;
    ADODataSet1code: TStringField;
    ADODataSet1abbr_name15: TStringField;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
   field_name : string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);    
  public
    { Public declarations }
  end;

var
  Form_invtship: TForm_invtship;

implementation

uses datamd, main;

{$R *.dfm}
procedure TForm_invtship.NewGridWnd(var Message: TMessage);
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

procedure TForm_invtship.FormActivate(Sender: TObject);
begin
self.ADODataSet1.Open;
self.field_name:='GRN_NUMBER';
end;

procedure TForm_invtship.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_invtship.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
self.ADODataSet1.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
else
 self.ADODataSet1.Filter:='';
end;

procedure TForm_invtship.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
IF column.FieldName<>self.ADODataSet1.IndexFieldNames then
 self.ADODataSet1.IndexFieldNames:=column.FieldName;

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

procedure TForm_invtship.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm_invtship.BitBtn2Click(Sender: TObject);
begin
  if ADODataSet1.RecordCount>0 then Form1.CopyDbDataToExcel([dbgrid1]);
end;

end.
