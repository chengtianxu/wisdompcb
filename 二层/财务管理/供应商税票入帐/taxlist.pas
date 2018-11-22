unit taxlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls;

type
  TForm_taxlist = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    ads127: TADODataSet;
    DataSource1: TDataSource;
    ads127invoice_number: TStringField;
    ads127invoice_no: TStringField;
    ads127invoice_date: TDateTimeField;
    ads127account_date: TDateTimeField;
    ads127matl_year: TSmallintField;
    ads127matl_month: TSmallintField;
    ads127MATL_amount: TBCDField;
    ads127tax_amount: TBCDField;
    ads127tax: TBCDField;
    ads127INV_TOTAL: TBCDField;
    ads127remark: TStringField;
    ads127rkey: TIntegerField;
    DBGrid1: TDBGrid;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_taxlist: TForm_taxlist;

implementation

uses damo;

{$R *.dfm}

procedure TForm_taxlist.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS127.CommandText);
end;

procedure TForm_taxlist.Button1Click(Sender: TObject);
begin
  if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;

procedure TForm_taxlist.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads127RKEY.Value;
  self.ads127.DisableControls;
  ads127.First;
  while not ads127.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ads127.Next;
  end;
  self.ads127.EnableControls;
  ads127.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads127RKEY.Value;
  self.ads127.DisableControls;
  ads127.First;
  while not ads127.Eof do
  begin
   if self.ads127RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ads127.Next;
  end;
  self.ads127.EnableControls;
  ads127.Locate('rkey',rkey,[]);
 end;
end;

procedure TForm_taxlist.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads127.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
