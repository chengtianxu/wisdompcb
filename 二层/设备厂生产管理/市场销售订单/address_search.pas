unit address_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, dbcgrids,
  DBCtrls, Mask;

type
  TForm_address = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    ADOQuery1SHIP_TO_CONTACT: TStringField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1location: TStringField;
    ADOQuery1ship_to_address_1: TStringField;
    ADOQuery1state: TStringField;
    ADOQuery1zip: TStringField;
    ADOQuery1SHIP_CTAX_PTR: TIntegerField;
    ADOQuery1SHIP_TO_PHONE: TStringField;
    ADOQuery1SHIP_SHIPPING_METHOD: TStringField;
    ADOQuery1SHIP_FOB: TStringField;
    ADOQuery1STATE_SHIP_TAX_FLAG: TStringField;
    ADOQuery1STATE_PROD_TAX_FLAG: TStringField;
    ADOQuery1STATE_TOOL_TAX_FLAG: TStringField;
    ADOQuery1SHIP_LEAD_TIME: TSmallintField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBCtrlGrid1DblClick(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_address: TForm_address;

implementation
uses dm_u;
{$R *.dfm}

procedure TForm_address.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_address.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter :='location like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
  button1.Enabled:=not adoquery1.IsEmpty ;
end;

procedure TForm_address.DBCtrlGrid1DblClick(Sender: TObject);
begin
  if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_address.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

end.
