unit prodcode_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  Tform_prodcode = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    adoquery1: TADODataSet;
    adoquery1rkey: TIntegerField;
    adoquery1prod_code: TStringField;
    adoquery1product_name: TStringField;
    adoquery1EST_SCRAP: TFloatField;
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
  form_prodcode: Tform_prodcode;

implementation

uses damo;
{$R *.dfm}

procedure Tform_prodcode.Edit1Change(Sender: TObject);
begin
  if Edit1.text<>'' then
   Adoquery1.Filter :=field_name+' like ''%'+Trim(Edit1.Text)+'%'''
  else
   Adoquery1.filter:='';
 if adoquery1.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;   
end;

procedure Tform_prodcode.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Tform_prodcode.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then modalresult:=mrok;
end;

procedure Tform_prodcode.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrOk;
end;

procedure Tform_prodcode.FormCreate(Sender: TObject);
begin
adoquery1.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0]; 
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure Tform_prodcode.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>adoquery1.IndexFieldNames) then
 adoquery1.IndexFieldNames:=column.FieldName;

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

end.
