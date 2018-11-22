unit employee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TFrm_employee = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADO05: TADODataSet;
    DataSource1: TDataSource;
    ADO05empl_code: TStringField;
    ADO05employee_name: TStringField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Frm_employee: TFrm_employee;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_employee.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO05.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADO05.IndexFieldNames:=Column.FieldName;
  end;
  if Column.FieldName<>preColumn.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn:=Column;
  end;

end;

procedure TFrm_employee.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TFrm_employee.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO05.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO05.Filter:=preColumn.FieldName;
end;

procedure TFrm_employee.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_employee.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_employee.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
