unit product;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TForm_product = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ads50: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ads50ANALYSIS_CODE_2: TStringField;
    ads50set_lngth: TFloatField;
    ads50set_width: TFloatField;
    ads50PROD_CODE_PTR: TIntegerField;
    ads50PROD_CODE: TStringField;
    ads50PRODUCT_NAME: TStringField;
    ads50CUST_CODE: TStringField;
    ads50ABBR_NAME: TStringField;
    ads50rkey25: TIntegerField;
    ads50MANU_PART_NUMBER: TStringField;
    ads50MANU_PART_DESC: TStringField;
    ads50set_qty: TIntegerField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;    
  public
    { Public declarations }
  end;

var
  Form_product: TForm_product;

implementation

uses term;



{$R *.dfm}

procedure TForm_product.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  if radiogroup1.ItemIndex=0 then
   ADs50.Filter := field_name+' like '''+trim(edit1.text)+'%'''
  else
   ADs50.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs50.filter := '';
end;

procedure TForm_product.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_product.FormCreate(Sender: TObject);
begin
 ads50.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_product.DBGrid1DblClick(Sender: TObject);
begin
if not ADs50.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_product.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ADs50.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_product.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>ADs50.IndexFieldNames) then
 ADs50.IndexFieldNames:=column.FieldName;

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

procedure TForm_product.RadioGroup1Click(Sender: TObject);
begin
 edit1.SetFocus;
end;

procedure TForm_product.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ADs50.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
