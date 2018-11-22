unit Prod_Resource;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ADODB, ExtCtrls;

type
  TFrmProdResource = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    ADOQuery1ttype: TStringField;
    ADOQuery1ctype: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdResource: TFrmProdResource;

implementation

{$R *.DFM}
USES Mainmenu;

procedure TFrmProdResource.BitBtn1Click(Sender: TObject);
begin
EDIT1.TEXT:='';
AdoQuery1.FILTER:='';
end;

procedure TFrmProdResource.BitBtn3Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFrmProdResource.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
      Adoquery1.Filter:='DEPT_CODE LIKE '''+TRIM(EDIT1.TEXT)+'%'''
   ELSE
      Adoquery1.FILTER:='';
end;

procedure TFrmProdResource.FormShow(Sender: TObject);
begin
  Edit1.SetFocus ;
end;

procedure TFrmProdResource.DBGrid1DblClick(Sender: TObject);
begin
  Modalresult:=mrOK;
end;

procedure TFrmProdResource.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then modalresult:=mrok;
end;

procedure TFrmProdResource.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
end;

procedure TFrmProdResource.FormCreate(Sender: TObject);
begin
  Adoquery1.Open ;
end;

procedure TFrmProdResource.Button1Click(Sender: TObject);
begin
  if Adoquery1.Eof then exit;
  modalresult:=mrok;
end;

procedure TFrmProdResource.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus ;
  Edit1.SelectAll;
end;

procedure TFrmProdResource.ADOQuery1CalcFields(DataSet: TDataSet);
begin
  if Adoquery1.FieldByName('ttype').AsInteger<>4 then
     Adoquery1.FieldByName('ctype').AsString:='生产'
  else
     Adoquery1.FieldByName('ctype').AsString:='非生产';
end;

end.
