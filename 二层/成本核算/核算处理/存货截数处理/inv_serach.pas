unit inv_serach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  Tform_inv = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    adoquery1: TADODataSet;
    adoquery1RKEY: TIntegerField;
    adoquery1INV_PART_NUMBER: TStringField;
    adoquery1INV_NAME: TStringField;
    adoquery1INV_DESCRIPTION: TStringField;
    adoquery1UNIT_NAME: TStringField;
    adoquery1std_cost: TFloatField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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
  form_inv: Tform_inv;

implementation

uses uDM;

{$R *.dfm}

procedure Tform_inv.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   Adoquery1.Filter := self.field_name + ' like ''%'+Trim(Edit1.Text)+'%'''
  else
   Adoquery1.filter:='';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure Tform_inv.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure Tform_inv.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure Tform_inv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure Tform_inv.FormCreate(Sender: TObject);
begin
self.field_name:='INV_PART_NUMBER';
end;

procedure Tform_inv.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if column.FieldName<>self.field_name then
 begin
  self.field_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
  self.adoquery1.IndexFieldNames:=column.FieldName;    
 end
else
 edit1.SetFocus; 
end;

end.
