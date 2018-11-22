unit prodcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_prodcode = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    adoquery1: TADODataSet;
    adoquery1RKEY: TIntegerField;
    adoquery1PROD_CODE: TStringField;
    adoquery1PRODUCT_NAME: TStringField;
    adoquery1LEAD_TIME: TSmallintField;
    adoquery1OPT_LOT_SIZE: TIntegerField;
    adoquery1MAX_DAYS_EARLY_BUILD: TSmallintField;
    adoquery1EST_SCRAP: TFloatField;
    adoquery1EST_SCRAP1: TFloatField;
    adoquery1IESMODEL_PTR: TIntegerField;
    adoquery1est_scrap_ltm: TFloatField;
    adoquery1est_scrap1_lmt: TFloatField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_prodcode: TForm_prodcode;

implementation

uses demo;

{$R *.dfm}

procedure TForm_prodcode.Edit1Change(Sender: TObject);
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


procedure TForm_prodcode.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_prodcode.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 modalresult:=mrok;
end;

procedure TForm_prodcode.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then modalresult:=mrok;
end;

procedure TForm_prodcode.FormCreate(Sender: TObject);
begin
adoquery1.Open;
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0]; 
end;

procedure TForm_prodcode.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
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

end.
