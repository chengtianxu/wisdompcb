unit authflow_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TForm_authflow = class(TForm)
  DBGrid1: TDBGrid;
  DataSource1: TDataSource;
  Panel1: TPanel;
  Button1: TButton;
  Button2: TButton;
  ADOQuery1: TADODataSet;
  Panel2: TPanel;
  Label1: TLabel;
  MaskEdit1: TMaskEdit;
  BitBtn2: TBitBtn;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1CODE: TStringField;
    ADOQuery1QTE_APPROV_DESC: TStringField;
  procedure MaskEdit1Change(Sender: TObject);
  procedure DBGrid1DblClick(Sender: TObject);
  procedure BitBtn2Click(Sender: TObject);
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
  Form_authflow: TForm_authflow;

implementation

uses damo;

{$R *.DFM}

procedure TForm_authflow.MaskEdit1Change(Sender: TObject);
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

procedure TForm_authflow.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  modalresult:=mrok;
end;

procedure TForm_authflow.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_authflow.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_authflow.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true; 
end;

procedure TForm_authflow.DBGrid1TitleClick(Column: TColumn);
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

end.
