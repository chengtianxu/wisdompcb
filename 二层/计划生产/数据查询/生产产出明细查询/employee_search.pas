unit employee_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TForm_employee = class(TForm)
  DBGrid1: TDBGrid;
  DataSource1: TDataSource;
  Panel1: TPanel;
  Button1: TButton;
  Button2: TButton;
  ADOQuery1: TADODataSet;
  ADOQuery1EMPL_CODE: TStringField;
  ADOQuery1RKEY: TIntegerField;
  ADOQuery1EMPLOYEE_NAME: TStringField;
  ADOQuery1abbr_name: TStringField;
  Panel2: TPanel;
  Label1: TLabel;
  MaskEdit1: TMaskEdit;
  BitBtn2: TBitBtn;
  procedure MaskEdit1Change(Sender: TObject);
  procedure DBGrid1DblClick(Sender: TObject);
  procedure BitBtn2Click(Sender: TObject);
  procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  procedure FormCreate(Sender: TObject);
  procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  PreColumn: TColumn;
  field_name:string;
  public
    { Public declarations }
  end;

var
  Form_employee: TForm_employee;

implementation

uses  main;

{$R *.DFM}

procedure TForm_employee.MaskEdit1Change(Sender: TObject);
begin
  if trim(MaskEdit1.text)<>'' then
    Adoquery1.Filter :=field_name+' like ''%'+Trim(MaskEdit1.Text)+'%'''
  else
    Adoquery1.filter:='';
end;

procedure TForm_employee.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  modalresult:=mrok;
end;

procedure TForm_employee.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_employee.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_employee.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_employee.DBGrid1TitleClick(Column: TColumn);
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

procedure TForm_employee.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
