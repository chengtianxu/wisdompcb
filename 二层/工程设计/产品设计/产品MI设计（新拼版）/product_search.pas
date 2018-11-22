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
    CheckBox1: TCheckBox;
    adoquery1PROD_CODE_PTR: TIntegerField;
    adoquery1CUSTOMER_PTR: TIntegerField;
    adoquery1PROD_ROUTE_PTR: TIntegerField;
    adoquery1ONHOLD_SALES_FLAG: TWordField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;    
  public
    edit1text :string;
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

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
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

procedure TForm_product.CheckBox1Click(Sender: TObject);
var
  ConditionTmp1,ConditionTmp2 : string;
begin
     ConditionTmp2 := ' and ( standar_FPC is not null )';
     ConditionTmp1 := 'SELECT data0025.rkey,Data0025.MANU_PART_NUMBER, '+#13+
                      '                dbo.Data0025.MANU_PART_DESC, '+#13+
                      '    Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,  '+#13+
                      ' dbo.Data0025.PROD_CODE_PTR,dbo.Data0025.CUSTOMER_PTR,  '+#13+
                      ' dbo.Data0025.PROD_ROUTE_PTR,dbo.Data0025.ONHOLD_SALES_FLAG, '+#13+
                      '  dbo.Data0025.LAYERS,  '+#13+
                      '  case   Data0025.ttype   '+#13+
                      '    when 0 then '+#39+'Á¿²ú'+#39+' when 1 then '+#39+'Ñù°å'+#39+#13+
                      ' end as batch_or_former  '+#13+
                      '  FROM dbo.Data0008 INNER JOIN  '+#13+
                      '        dbo.Data0025 ON   '+#13+
                      '        dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN '+#13+
                      '        dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY  '+#13+
                      '  where ( Data0025.MANU_PART_NUMBER like :part_number )'+#13;
    if CheckBox1.Checked then
    begin
         adoquery1.Close;
         adoquery1.CommandText :=  ConditionTmp1 +  ConditionTmp2;
         if  edit1text <> '' then
         adoquery1.Parameters[0].Value:=edit1text;
         adoquery1.Open;
    end else begin
         adoquery1.Close;
         adoquery1.CommandText :=  ConditionTmp1;
         if  edit1text <> '' then
         adoquery1.Parameters[0].Value:=edit1text;
         adoquery1.Open;
    end;
end;

end.
