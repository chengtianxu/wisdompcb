unit Single1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, ExtCtrls;

type
  TForm_Single1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADO0073: TADODataSet;
    ADO0073employee_ptr: TIntegerField;
    ADO0073user_login_name: TStringField;
    ADO0073user_full_name: TStringField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_Single1: TForm_Single1;

implementation

uses dmo;

{$R *.dfm}

procedure TForm_Single1.FormCreate(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;


procedure TForm_Single1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO0073.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADO0073.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn:=Column;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TForm_Single1.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm_Single1.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm_Single1.Button2Click(Sender: TObject);
begin
  ADO0073.Filter:='';
  Close;
end;

procedure TForm_Single1.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO0073.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO0073.Filter:='';
end;

end.
