unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, Buttons, StdCtrls, ExtCtrls;

type
  TForm_Supplier = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnEnter: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    ADO23: TADODataSet;
    DataSource1: TDataSource;
    ADO23RKEY: TAutoIncField;
    ADO23CODE: TStringField;
    ADO23SUPPLIER_NAME: TStringField;
    ADO189: TADODataSet;
    ADO189STATE_TAX: TBCDField;
    ADO23ABBR_NAME: TStringField;
    ADO23ANALYSIS_CODE1: TStringField;
    ADO23EDI_ID: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_Supplier: TForm_Supplier;

implementation

uses dmo;

{$R *.dfm}

procedure TForm_Supplier.FormCreate(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TForm_Supplier.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Supplier.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO23.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADO23.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn.Title.Color:=clBtnFace;
    Column.Title.Color:=clRed;
    preColumn:=Column;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;

end;

procedure TForm_Supplier.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO23.Filter:= preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO23.Filter:='';
end;

procedure TForm_Supplier.BitBtn1Click(Sender: TObject);
begin
  ADO23.Close;
  ADO23.Parameters[0].Value:='';
  ADO23.Open;
  Edit1.Text:='';
  Edit1.SetFocus;
end;

procedure TForm_Supplier.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm_Supplier.btnEnterClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
