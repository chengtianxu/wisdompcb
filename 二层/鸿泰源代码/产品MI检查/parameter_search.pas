unit parameter_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TForm_parameter = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1CATEGORY_NAME: TStringField;
    ADOQuery1PARAMETER_NAME: TStringField;
    ADOQuery1PARAMETER_DESC: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1datatype: TStringField;
    ADOQuery1status3: TWordField;
    procedure MaskEdit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;    
  public
    { Public declarations }
  end;

var
  Form_parameter: TForm_parameter;

implementation

{$R *.dfm}

procedure TForm_parameter.MaskEdit1Change(Sender: TObject);
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

procedure TForm_parameter.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_parameter.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  modalresult:=mrok;
end;

procedure TForm_parameter.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.CommandText);
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_parameter.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  adoquery1.IndexFieldNames:=column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;
  self.MaskEdit1.SetFocus;
 end
else
 self.MaskEdit1.SetFocus;
end;

procedure TForm_parameter.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
