unit customersearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TFrmCustSearch = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustSearch: TFrmCustSearch;

implementation
USES main;
{$R *.DFM}

procedure TFrmCustSearch.MaskEdit1Change(Sender: TObject);
begin
  if Radiogroup1.ItemIndex=0 then
  begin
    if trim(MaskEdit1.text)<>''
    then frmMain.Adodata0010.Filter :='Cust_code like '''+Trim(MaskEdit1.Text)+'%'''
    else frmMain.Adodata0010.filter:='';
  end else
  begin
    if trim(MaskEdit1.text)<>''
    then frmMain.Adodata0010.Filter :='customer_name like ''%'+Trim(MaskEdit1.Text)+'%'''
    else frmMain.Adodata0010.filter:='';
  end;
end;

procedure TFrmCustSearch.DBGrid1DblClick(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmCustSearch.BitBtn2Click(Sender: TObject);
begin
   Maskedit1.Text := '';
   maskedit1.SetFocus;
end;

procedure TFrmCustSearch.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then DBGrid1DblClick(sender);
end;

end.
