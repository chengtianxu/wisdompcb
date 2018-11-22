unit curr_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmCurr = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOData0001: TADODataSet;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCurr: TFrmCurr;

implementation

uses MAIN;
{$R *.dfm}

procedure TFrmCurr.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmCurr.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TFrmCurr.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    Adodata0001.Filter:='curr_code like '''+trim(EDIT1.TEXT)+'%'''
  ELSE
    Adodata0001.FILTER:='';
end;

procedure TFrmCurr.FormCreate(Sender: TObject);
begin
  Adodata0001.Open ;
end;

end.
