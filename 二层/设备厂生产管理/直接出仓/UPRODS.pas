unit UPRODS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, Grids, DBGrids, StdCtrls;

type
  TProdS_Form = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1qty_on_hand: TBCDField;
    ADOQuery1location_ptr: TIntegerField;
    ADOQuery1proc_ptr: TIntegerField;
    ADOQuery1code: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
  fieldname:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProdS_Form: TProdS_Form;

implementation

{$R *.dfm}

procedure TProdS_Form.FormCreate(Sender: TObject);
begin
 ADoquery1.Open;
 self.fieldname:='PROD_CODE';
end;

procedure TProdS_Form.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  Adoquery1.Filter :=self.fieldname+' like ''%'+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TProdS_Form.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then modalresult:=mrok;
end;

procedure TProdS_Form.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then modalresult:=mrok;
end;

procedure TProdS_Form.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (fieldname<>column.FieldName) and (column.ReadOnly) then
 begin
  label1.Caption:=column.Title.Caption;
  self.fieldname:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

end.

