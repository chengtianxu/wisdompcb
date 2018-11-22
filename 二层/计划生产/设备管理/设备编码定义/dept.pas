unit dept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TFrm_dept = class(TForm)
    Panel1: TPanel;
    DBGrd: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADO34: TADODataSet;
    DataSource1: TDataSource;
    ADO34rkey: TAutoIncField;
    ADO34dept_code: TStringField;
    ADO34dept_name: TStringField;
    ADO34xz: TStringField;
    procedure DBGrdTitleClick(Column: TColumnEh);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrdDblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Frm_dept: TFrm_dept;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_dept.DBGrdTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO34.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADO34.IndexFieldNames:=Column.FieldName;
  end;
  if Column.FieldName<>preColumn.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn:=Column;
  end;

end;

procedure TFrm_dept.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_dept.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_dept.FormShow(Sender: TObject);
begin
  preColumn:=DBGrd.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TFrm_dept.DBGrdDblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_dept.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO34.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO34.Filter:='';
end;

end.
