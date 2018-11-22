unit Customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TFrm_Customer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrd: TDBGridEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure DBGrdTitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrdDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    preCloumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Frm_Customer: TFrm_Customer;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_Customer.DBGrdTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADO10.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADO10.IndexFieldNames:=Column.FieldName;
  end;
  if preCloumn.FieldName<>Column.FieldName then
  begin
    preCloumn:=Column;
    Label1.Caption:=Column.Title.Caption;
    Edit1.SetFocus;
  end;
end;

procedure TFrm_Customer.FormCreate(Sender: TObject);
begin
  preCloumn:=DBGrd.Columns[0];
  Label1.Caption:=preCloumn.Title.Caption;
end;

procedure TFrm_Customer.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADO10.Filter:=preCloumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADO10.Filter:='';
end;

procedure TFrm_Customer.DBGrdDblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_Customer.Button1Click(Sender: TObject);
begin
  DBGrdDblClick(Sender);
end;

procedure TFrm_Customer.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Customer.BitBtn1Click(Sender: TObject);
begin
  DM.ADO10.Close;
  DM.ADO10.Open;
  Edit1.Text:='';
  Edit1.SetFocus;
end;

end.
