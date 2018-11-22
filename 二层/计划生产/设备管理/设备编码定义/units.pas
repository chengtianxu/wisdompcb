unit units;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TFrm_units = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADO02: TADODataSet;
    DataSource1: TDataSource;
    ADO02rkey: TAutoIncField;
    ADO02unit_code: TStringField;
    ADO02unit_name: TStringField;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
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
  Frm_units: TFrm_units;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_units.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TFrm_units.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO02.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO02.IndexFieldNames:=Column.FieldName;
  end;
  if Column.FieldName<>preColumn.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn:=Column;
  end;
end;

procedure TFrm_units.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO02.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO02.Filter:='';
end;

procedure TFrm_units.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_units.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_units.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
