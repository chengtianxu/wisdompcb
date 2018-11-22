unit cust_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB;

type
  TFrmCustSearch = class(TForm)
    DBGrid1: TDBGrid;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOStoredProc;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TFrmCustSearch.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then modalresult:=mrok;
end;

procedure TFrmCustSearch.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TFrmCustSearch.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

procedure TFrmCustSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then self.ModalResult:=mrok;
end;

end.
