unit account_receivable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB;

type

  TForm_receivable = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    AqD112: TADODataSet;
    DataSource1: TDataSource;
    AqD112invoice_number: TStringField;
    AqD112INVOICE_TOTAL: TBCDField;
    AqD112yisou: TBCDField;
    AqD112yinsou: TBCDField;
    AqD112CURR_NAME: TStringField;
    AqD112EXCHANGE_RATE: TFloatField;
    AqD112INVOICE_DATE: TDateTimeField;
    AqD112due_date: TDateTimeField;
    AqD112CUST_CODE: TStringField;
    AqD112ABBR_NAME: TStringField;
    AqD112type: TStringField;
    Edit1: TEdit;
    Label1: TLabel;
    AqD112INVOICE_NOTE_PAD_PTR: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;


var
  Form_receivable: TForm_receivable;

implementation

uses main, DAMO;

{$R *.dfm}

procedure TForm_receivable.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm_receivable.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(self.AqD112.CommandText);
end;

procedure TForm_receivable.Button2Click(Sender: TObject);
begin
form1.CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_receivable.FormActivate(Sender: TObject);
begin
 field_name:='invoice_number';
 self.AqD112.Open; 
end;

procedure TForm_receivable.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  self.AqD112.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  self.AqD112.filter := '';
end;

procedure TForm_receivable.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>aqd112.IndexFieldNames) then
 self.AqD112.IndexFieldNames:=column.FieldName;

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

procedure TForm_receivable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
self.AqD112.Close;
end;

end.
