unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, StdCtrls;

type
  TFrm_Supplier = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ADO23: TADODataSet;
    DS23: TDataSource;
    ADO23rkey: TAutoIncField;
    ADO23code: TStringField;
    ADO23supplier_name: TStringField;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Frm_Supplier: TFrm_Supplier;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_Supplier.DBGridEh1TitleClick(Column: TColumnEh);
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
    preColumn:=Column;
  end;
  Edit1.Text:='';
end;

procedure TFrm_Supplier.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TFrm_Supplier.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_Supplier.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_Supplier.Button2Click(Sender: TObject);
begin
  ADO23.Cancel;
  Close;
end;

procedure TFrm_Supplier.Edit1Change(Sender: TObject);
begin
  with ADO23 do
  begin
    if Filtered then
    Filtered:=False  ;
    
    if Edit1.Text<>'' then
    begin
      Filter:=preColumn.FieldName+' like '+QuotedStr('%'+trim(Edit1.Text)+'%');
      Filtered:=True  ;
    end;
  end;
end;

end.
