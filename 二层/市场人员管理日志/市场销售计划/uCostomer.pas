unit uCostomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TfrmCostomer = class(TForm)
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    AQery10: TADOQuery;
    AQery10RKEY: TAutoIncField;
    AQery10CUST_CODE: TStringField;
    AQery10CUSTOMER_NAME: TStringField;
    AQery10ABBR_NAME: TStringField;
    AQery10REP_CODE: TStringField;
    AQery10SALES_REP_NAME: TStringField;
    AQery10SALES_REP_PTR: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    _filName:string;
  public
    { Public declarations }
  end;

var
  frmCostomer: TfrmCostomer;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmCostomer.FormCreate(Sender: TObject);
begin
 _filName:='CUST_CODE';
end;

procedure TfrmCostomer.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
  begin
    AQery10.Filter :=_filName+' like '''+trim(edit1.text)+'%'''
  end
 else
  AQery10.filter:='';
 if AQery10.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TfrmCostomer.DBGrid1DblClick(Sender: TObject);
begin
 if not AQery10.IsEmpty then
  ModalResult:=mrOK;
end;

procedure TfrmCostomer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not AQery10.IsEmpty) then ModalResult:=mrOK;
end;

procedure TfrmCostomer.DBGrid1TitleClick(Column: TColumn);
begin
  _filName:=Column.FieldName;
  Label1.Caption:=column.Title.Caption ;
end;

procedure TfrmCostomer.Button1Click(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure TfrmCostomer.BitBtn2Click(Sender: TObject);
begin
 edit1.Text:='';
 AQery10.Filter:='';
end;

end.
