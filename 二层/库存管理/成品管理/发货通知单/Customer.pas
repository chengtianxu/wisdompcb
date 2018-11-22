unit Customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TForm_Customer = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    ADOQuery1CUSTOMER_TYPE: TIntegerField;
    ADOQuery1INVOICE_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1DO_SMOOTHING: TWordField;
    ADOQuery1COD_FLAG: TStringField;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Customer: TForm_Customer;

implementation

uses Demo;

{$R *.dfm}

procedure TForm_Customer.MaskEdit1Change(Sender: TObject);
begin
 if trim(MaskEdit1.text)<>'' then
  Adoquery1.Filter :='Cust_code like '''+Trim(MaskEdit1.Text)+'%'''
 else
  Adoquery1.filter:='';
end;

procedure TForm_Customer.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 modalresult:=mrok;
end;

procedure TForm_Customer.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_Customer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_Customer.FormCreate(Sender: TObject);
begin
ADOQuery1.Open;
end;

procedure TForm_Customer.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
