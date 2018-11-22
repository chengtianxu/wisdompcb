unit product_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Buttons, StdCtrls;

type
  TForm_product = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    adoquery1: TADODataSet;
    adoquery1rkey: TIntegerField;
    adoquery1MANU_PART_NUMBER: TStringField;
    adoquery1MANU_PART_DESC: TStringField;
    adoquery1PRODUCT_NAME: TStringField;
    adoquery1CUST_CODE: TStringField;
    adoquery1LAYERS: TWordField;
    adoquery1batch_or_former: TStringField;
    adoquery1PROD_CODE_PTR: TIntegerField;
    adoquery1CUSTOMER_PTR: TIntegerField;
    adoquery1prod_code: TStringField;
    adoquery1ttype: TWordField;
    adoquery1overdue: TStringField;
    adoquery1ONHOLD_SALES_FLAG: TWordField;
    adoquery1PROD_ROUTE_PTR: TIntegerField;
    adoquery1quality_status: TBooleanField;
    adoquery1EST_SCRAP: TFloatField;
    adoquery1EST_SCRAP1: TFloatField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
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

uses damo;

{$R *.dfm}

procedure TForm_product.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
 Adoquery1.Filter := self.field_name+' like ''%'+Trim(Edit1.Text)+'%'''
else
 Adoquery1.filter := '';
end;

procedure TForm_product.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_product.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  modalresult:=mrok;
end;

procedure TForm_product.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then modalresult:=mrok;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.CommandText);
end;

procedure TForm_product.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>self.field_name) and
   (column.ReadOnly) then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  self.adoquery1.IndexFieldNames:= column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;
  Edit1.SetFocus;
 end
else
 self.Edit1.SetFocus;
end;

procedure TForm_product.FormCreate(Sender: TObject);
begin
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_product.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
