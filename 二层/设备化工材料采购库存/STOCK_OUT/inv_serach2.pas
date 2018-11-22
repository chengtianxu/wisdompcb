unit inv_serach2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmInvSearch2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1description: TStringField;
    ADOQuery1unit_code: TStringField;
    ADOQuery1curr_code: TStringField;
    ADOQuery1unit_price: TFloatField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1quan_on_hand: TFloatField;
    ADOQuery1Date_Recd: TDateTimeField;
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
  FrmInvSearch2: TFrmInvSearch2;

implementation
uses Mainmenu;
{$R *.dfm}

procedure TFrmInvSearch2.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   Adoquery1.Filter :='Description like ''%'+Trim(Edit1.Text)+'%'''
  else
   Adoquery1.filter:='';
end;

procedure TFrmInvSearch2.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TFrmInvSearch2.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmInvSearch2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
end;

procedure TFrmInvSearch2.Button1Click(Sender: TObject);
begin
  if Adoquery1.Eof then exit;
  modalresult:=mrok;
end;

procedure TFrmInvSearch2.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmInvSearch2.FormCreate(Sender: TObject);
begin
  Adoquery1.Open ;
end;

procedure TFrmInvSearch2.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus ;
  Edit1.SelectAll;
end;

end.
