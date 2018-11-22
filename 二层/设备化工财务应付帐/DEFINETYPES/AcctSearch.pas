unit AcctSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, StdCtrls, Grids, DBGrids, ADODB, ExtCtrls;

type
  TFrmAcctSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1gl_description: TStringField;
    ADOQuery1db_cr: TStringField;
    ADOQuery1ttype: TStringField;
    ADOQuery1gl_acc_number: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcctSearch: TFrmAcctSearch;

implementation
uses Main;
{$R *.dfm}

procedure TFrmAcctSearch.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    adoQUERY1.Filter:='gl_acc_number like '''+trim(EDIT1.TEXT)+'%'''
  ELSE
    adoQUERY1.FILTER:='';
end;

procedure TFrmAcctSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TFrmAcctSearch.ADOQuery1CalcFields(DataSet: TDataSet);
begin
if adoquery1.Fieldvalues['db_cr']='D' then
  adoquery1.FieldValues['type']:='½èÏî' else
if adoquery1.Fieldvalues['db_cr']='C' then
  adoquery1.FieldValues['type']:='´ûÏî';

end;

procedure TFrmAcctSearch.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmAcctSearch.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TFrmAcctSearch.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmAcctSearch.FormCreate(Sender: TObject);
begin
  ADOQUERY1.Open ;
end;

end.
