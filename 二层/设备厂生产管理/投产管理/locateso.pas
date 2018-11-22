unit locateso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB, common;

type
  Tlocateso_Form = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ADScp70: TADODataSet;
    ADScp71: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADScp70sales_order: TStringField;
    ADScp70sales_date: TDateTimeField;
    ADScp70DEPT_CODE: TStringField;
    ADScp70DEPT_NAME: TStringField;
    ADScp70V_TYPE: TStringField;
    ADScp70ABBR_NAME: TStringField;
    ADScp70EMPLOYEE_NAME: TStringField;
    ADScp70remark: TStringField;
    ADScp70rkey: TIntegerField;
    ADScp70DSDesigner: TStringField;
    ADScp70DSDesigner2: TStringField;
    ADScp71PROD_CODE: TStringField;
    ADScp71PRODUCT_NAME: TStringField;
    ADScp71PRODUCT_DESC: TStringField;
    ADScp71complete_date: TDateTimeField;
    ADScp71remark: TStringField;
    ADScp71UNIT_NAME: TStringField;
    ADScp71rkey: TIntegerField;
    ADScp71rkey08: TIntegerField;
    ADScp70produce_deptptr: TIntegerField;
    ADScp71quantity: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ADScp71BeforeOpen(DataSet: TDataSet);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    PreColumn: TColumn;
  public
    { Public declarations }
  end;

var
  locateso_Form: Tlocateso_Form;

implementation

uses DAMO;

{$R *.dfm}

procedure Tlocateso_Form.FormActivate(Sender: TObject);
begin
//self.ADScp70.Open;
self.ADScp71.Open;
 PreColumn := DBGrid1.Columns[0];
end;

procedure Tlocateso_Form.DBGrid1TitleClick(Column: TColumn);
begin
  if (PreColumn.FieldName<>column.FieldName) then
    ADScp70.IndexFieldNames:=Column.FieldName;

  if (PreColumn.FieldName<>column.FieldName) and (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure Tlocateso_Form.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   ADScp70.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else ADScp70.filter := '';
end;

procedure Tlocateso_Form.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure Tlocateso_Form.DBGrid1DblClick(Sender: TObject);
begin
 if not adscp70.IsEmpty then   self.ModalResult:=mrok;
end;

procedure Tlocateso_Form.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  if ADScp70.IsEmpty then
    button1.Enabled:=false
  else
    button1.Enabled:=true;

  if not ADScp70.IsEmpty then
  begin
    ADScp71.Close;
    ADScp71.Parameters.ParamByName('rkey').Value:=ADScp70.Fieldbyname('rkey').AsInteger;
    ADScp71.Open;
  end;


end;

procedure Tlocateso_Form.ADScp71BeforeOpen(DataSet: TDataSet);
begin
  ADScp71.Parameters.ParamByName('uptr1').Value:=StrToInt(rkey73);
  ADScp71.Parameters.ParamByName('uptr2').Value:=StrToInt(rkey73);
end;

procedure Tlocateso_Form.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
  Button1.Enabled:=ADScp71.FieldByName('rkey08').AsString<>'';
end;

end.
