unit uEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons;

type
  TfrmEmployee = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Query1: TADOQuery;
    Query1REP_CODE: TStringField;
    Query1SALES_REP_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    fieldname:string;
  public
    { Public declarations }
  end;

var
  frmEmployee: TfrmEmployee;

implementation

{$R *.dfm}

procedure TfrmEmployee.FormActivate(Sender: TObject);
begin
 Query1.Open;
 fieldname:='EMPL_CODE';
end;

procedure TfrmEmployee.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Query1.Filter :=fieldname+' like ''%'+trim(edit1.text)+'%'''
 else
  Query1.filter:='';

end;

procedure TfrmEmployee.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
end;

procedure TfrmEmployee.DBGrid1DblClick(Sender: TObject);
begin
if not Query1.IsEmpty then
 ModalResult:=mrOK;
end;

procedure TfrmEmployee.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not Query1.IsEmpty) then ModalResult:=mrOK;
end;

procedure TfrmEmployee.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if Query1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TfrmEmployee.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.fieldname then
begin
 label1.Caption:=column.Title.Caption;
 self.fieldname:=column.FieldName;
 edit1.SetFocus;
end;
end;

end.
