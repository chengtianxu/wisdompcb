unit Address;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  Tfrm_Address = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ADO12: TADODataSet;
    DataSource1: TDataSource;
    ADO12rkey: TAutoIncField;
    ADO12ship_to_address_1: TStringField;
    ADO12LOCATION: TStringField;
    ADO12state_tax: TBCDField;
    ADO12SHIP_TO_CONTACT: TStringField;
    ADO12SHIP_TO_PHONE: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  frm_Address: Tfrm_Address;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_Address.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Address.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure Tfrm_Address.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO12.Filter:=preColumn.FieldName+'like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO12.Filter:='';
end;

procedure Tfrm_Address.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure Tfrm_Address.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ADO12.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
