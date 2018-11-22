unit customer_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TFrmCustSearch = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
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
  FrmCustSearch: TFrmCustSearch;

implementation
uses damo;
{$R *.DFM}

procedure TFrmCustSearch.MaskEdit1Change(Sender: TObject);
begin
 if trim(MaskEdit1.text)<>'' then
  Adoquery1.Filter :='Cust_code like '''+Trim(MaskEdit1.Text)+'%'''
 else
  Adoquery1.filter:='';

end;

procedure TFrmCustSearch.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 modalresult:=mrok;
end;

procedure TFrmCustSearch.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TFrmCustSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
end;

procedure TFrmCustSearch.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

procedure TFrmCustSearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
