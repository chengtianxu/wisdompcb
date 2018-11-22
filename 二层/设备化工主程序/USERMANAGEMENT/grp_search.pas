unit grp_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmGrp = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGrp: TFrmGrp;

implementation

uses datamodule;
{$R *.dfm}

procedure TFrmGrp.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmGrp.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
 DM.ADO0073.Filter :='';
end;

procedure TFrmGrp.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    DM.Ado0073.Filter:='user_id like '''+trim(EDIT1.TEXT)+'%'''
  ELSE
    DM.Ado0073.FILTER:='';

end;

procedure TFrmGrp.Button1Click(Sender: TObject);
begin
  if DM.ADO0073.Eof then exit;
  Modalresult:=mrok;
end;

procedure TFrmGrp.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then   Modalresult:=mrok;
end;

procedure TFrmGrp.FormCreate(Sender: TObject);
begin
  DM.ADO0073.Close ;
  DM.ADO0073.Open ;
end;

procedure TFrmGrp.FormActivate(Sender: TObject);
begin
  DM.ADO0073.Filter :='';
end;

end.
