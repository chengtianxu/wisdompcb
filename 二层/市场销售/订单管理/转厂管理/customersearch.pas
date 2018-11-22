unit customersearch;

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
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    procedure MaskEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustSearch: TFrmCustSearch;

implementation
uses CustomerPart;

{$R *.DFM}

procedure TFrmCustSearch.MaskEdit1Change(Sender: TObject);
begin
  if copy(Dbgrid1.Columns[0].Title.caption,1,1)='*' then
    if trim(MaskEdit1.text)<>'' then
      Adoquery1.Filter :='cust_code like ''%'+MaskEdit1.text+'%'''
    else Adoquery1.filter:=''
  else
    if trim(MaskEdit1.text)<>'' then
      Adoquery1.Filter :='customer_name like ''%'+MaskEdit1.text+'%'''
    else Adoquery1.filter:=''
end;

procedure TFrmCustSearch.FormActivate(Sender: TObject);
begin
 Maskedit1.SetFocus;
end;

procedure TFrmCustSearch.DBGrid1DblClick(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmCustSearch.BitBtn2Click(Sender: TObject);
begin
   Adoquery1.filter:='';
   Maskedit1.Text := '';
   maskedit1.SetFocus;
end;

procedure TFrmCustSearch.FormCreate(Sender: TObject);
begin
  Adoquery1.Open ;
end;

procedure TFrmCustSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=46) and (ssctrl in shift) then
  begin
    abort;
    exit;
  end;
end;

procedure TFrmCustSearch.BitBtn1Click(Sender: TObject);
begin
  if ADOQuery1.Eof then exit;
  Modalresult:=mrok;
end;

procedure TFrmCustSearch.DBGrid1TitleClick(Column: TColumn);
begin
  if column.Index =0 then
  begin
    Dbgrid1.Columns[0].Title.caption :='*客户代号';
    Dbgrid1.Columns[1].Title.Caption :='客户名称';
    Label1.Caption :='客户代号';
    with Adoquery1 do
    begin
      close;
      sql.Clear ;
      sql.Add('select rkey,cust_code,customer_name from data0010 order by cust_code');
      open;
    end;
  end else
  begin
    Dbgrid1.Columns[0].Title.caption :='客户代号';
    Dbgrid1.Columns[1].Title.Caption :='*客户名称';
    Label1.Caption :='客户名称';
    with Adoquery1 do
    begin
      close;
      sql.Clear ;
      sql.Add('select rkey,cust_code,customer_name from data0010 order by customer_name');
      open;
    end;
  end;
end;

end.
