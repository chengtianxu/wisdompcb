unit customer_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm_customer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ads10: TADODataSet;
    ads10CUST_CODE: TStringField;
    ads10CUSTOMER_NAME: TStringField;
    RadioGroup1: TRadioGroup;
    ads10abbr_name: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
  public
    { Public declarations }
  end;

var
  Form_customer: TForm_customer;

implementation

uses damo;

{$R *.dfm}

procedure TForm_customer.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  if radiogroup1.ItemIndex=0 then
   ADs10.Filter := field_name+' like '''+trim(edit1.text)+'%'''
  else
   ADs10.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs10.filter := '';
if ADs10.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_customer.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_customer.FormCreate(Sender: TObject);
begin
 self.ads10.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_customer.DBGrid1DblClick(Sender: TObject);
begin
if not ADs10.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_customer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ADs10.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_customer.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>ADs10.IndexFieldNames) then
 ADs10.IndexFieldNames:=column.FieldName;

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

procedure TForm_customer.RadioGroup1Click(Sender: TObject);
begin
 edit1.SetFocus;
end;

end.
