unit inv_serach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmInvSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_PART_DESCRIPTION: TStringField;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1unit_code: TStringField;
    ADOQuery1STD_COST: TFloatField;
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
  FrmInvSearch: TFrmInvSearch;

implementation
uses Mainmenu;
{$R *.dfm}

procedure TFrmInvSearch.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   Adoquery1.Filter :='INV_PART_NUMBER like '''+Trim(Edit1.Text)+'%'''
  else
   Adoquery1.filter:='';
end;

procedure TFrmInvSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TFrmInvSearch.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmInvSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
end;

procedure TFrmInvSearch.Button1Click(Sender: TObject);
begin
  if Adoquery1.Eof then exit;
  modalresult:=mrok;
end;

procedure TFrmInvSearch.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmInvSearch.FormCreate(Sender: TObject);
begin
  Adoquery1.Open ;
end;

procedure TFrmInvSearch.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus ;
  Edit1.SelectAll;
end;

end.
