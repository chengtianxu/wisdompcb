unit rep_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  Tform_rep = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1REP_CODE: TStringField;
    ADOQuery1SALES_REP_NAME: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
  public
    { Public declarations }
  end;

var
  form_rep: Tform_rep;

implementation
uses damo;
{$R *.dfm}

procedure Tform_rep.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure Tform_rep.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
 Adoquery1.Filter :=field_name+' like '''+Trim(Edit1.Text)+'%'''
else
 Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true; 
end;

procedure Tform_rep.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Tform_rep.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true; 
end;

procedure Tform_rep.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure Tform_rep.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  adoquery1.IndexFieldNames:=column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;
  self.Edit1.SetFocus;
 end
else
 self.Edit1.SetFocus;
end;

end.
