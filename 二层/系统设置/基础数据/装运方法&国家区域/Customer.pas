unit Customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, DB, ADODB;

type
  TForm_Customer = class(TForm)
    lbl1: TLabel;
    Edit1: TEdit;
    btn1: TBitBtn;
    ds1: TDataSource;
    btn2: TButton;
    btn3: TButton;
    DBGridEh1: TDBGridEh;
    ds10: TADODataSet;
    ds10RKEY: TAutoIncField;
    ds10CUST_CODE: TStringField;
    ds10CUSTOMER_NAME: TStringField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_Customer: TForm_Customer;

implementation

uses dmo, Insert1;

{$R *.dfm}


procedure TForm_Customer.FormCreate(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  lbl1.Caption:=preColumn.Title.Caption;
end;

procedure TForm_Customer.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ds10.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ds10.IndexFieldNames:=column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    lbl1.Caption:=Column.Title.Caption;
    preColumn.Title.Color:=clBtnFace;
    Column.Title.Color:=clRed;
    preColumn:=Column;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TForm_Customer.Edit1Change(Sender: TObject);
begin
  if Edit1.Text<>'' then
    ds10.Filter:=preColumn.FieldName+' like ''%'+Edit1.Text+'%'''
  else
    ds10.Filter:='';
  if ds10.IsEmpty then
    btn2.Enabled:=False
  else
    btn2.Enabled:=True;
end;

procedure TForm_Customer.btn1Click(Sender: TObject);
begin
  ds10.Close;
  ds10.Open;
  ds10.Refresh;
  Edit1.Text:='';
  Edit1.SetFocus;
end;

procedure TForm_Customer.btn2Click(Sender: TObject);
begin
  if not ds10.IsEmpty then
    ModalResult:=mrOk;
end;

procedure TForm_Customer.DBGridEh1DblClick(Sender: TObject);
begin
  btn2Click(sender);
end;

procedure TForm_Customer.btn3Click(Sender: TObject);
begin
  Close;
end;

end.
