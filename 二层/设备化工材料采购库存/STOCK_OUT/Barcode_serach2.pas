unit Barcode_serach2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmBCSearch2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBCSearch2: TFrmBCSearch2;

implementation
uses Main4;
{$R *.dfm}

procedure TFrmBCSearch2.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   FrmMain4.ADOQuery1.Filter :='INV_PART_NUMBER like '''+Trim(Edit1.Text)+'%'''
  else
   FrmMain4.ADOQuery1.filter:='';
end;

procedure TFrmBCSearch2.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TFrmBCSearch2.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmBCSearch2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
end;

procedure TFrmBCSearch2.Button1Click(Sender: TObject);
begin
  if FrmMain4.ADOQuery1.Eof then exit;
  modalresult:=mrok;
end;

procedure TFrmBCSearch2.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmBCSearch2.FormCreate(Sender: TObject);
begin
  FrmMain4.ADOQuery1.Open ;
end;

procedure TFrmBCSearch2.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus ;
  Edit1.SelectAll;
end;

end.
