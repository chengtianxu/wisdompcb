unit customer_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TForm_Customer = class(TForm)
    DBGrid1: TDBGrid;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADODataSet;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1NET_PAY: TSmallintField;
    ADOQuery1ACC_REC_PTR: TIntegerField;
    ADOQuery1CURRENCY_PTR: TIntegerField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1base_to_other: TFloatField;
    ADOQuery1FED_TAX_ID_NO: TStringField;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  Form_Customer: TForm_Customer;

implementation

uses damo;

{$R *.DFM}

procedure TForm_Customer.MaskEdit1Change(Sender: TObject);
begin
  if trim(MaskEdit1.text)<>'' then
    Adoquery1.Filter :=field_name+' like ''%'+Trim(MaskEdit1.Text)+'%'''
  else
    Adoquery1.filter:='';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;    
end;

procedure TForm_Customer.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
  modalresult:=mrok;
end;

procedure TForm_Customer.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_Customer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADOQuery1.CommandText);
end;

procedure TForm_Customer.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='cust_code';
end;

procedure TForm_Customer.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>self.field_name) and (column.ReadOnly) then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  adoquery1.IndexFieldNames:=column.FieldName;
  self.MaskEdit1.SetFocus;
 end;
end;

end.
