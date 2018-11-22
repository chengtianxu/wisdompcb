unit misctooliv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, ExtCtrls;

type
  TForm_misctooliv = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ads112: TADODataSet;
    ads112rkey: TIntegerField;
    ads112invoice_number: TStringField;
    ads112INVOICE_DATE: TDateTimeField;
    ads112TOOLING_CHARGES: TBCDField;
    ads112ship_tax_amount: TBCDField;
    ads112INVOICE_TOTAL: TBCDField;
    ads112DSDesigner: TStringField;
    ads112INVOICE_TYPE: TWordField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CheckBox1: TCheckBox;
    ads112ship_amount: TBCDField;
    ads112FED_TAX_AMOUNT: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_misctooliv: TForm_misctooliv;

implementation

uses damo;

{$R *.dfm}

procedure TForm_misctooliv.Button1Click(Sender: TObject);
begin
  if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;

procedure TForm_misctooliv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS112.CommandText);
end;

procedure TForm_misctooliv.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads112RKEY.Value;
  self.ads112.DisableControls;
  ads112.First;
  while not ads112.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ads112.Next;
  end;
  self.ads112.EnableControls;
  ads112.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads112RKEY.Value;
  self.ads112.DisableControls;
  ads112.First;
  while not ads112.Eof do
  begin
   if self.ads112RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ads112.Next;
  end;
  self.ads112.EnableControls;
  ads112.Locate('rkey',rkey,[]);
 end;
end;


procedure TForm_misctooliv.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads112.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
