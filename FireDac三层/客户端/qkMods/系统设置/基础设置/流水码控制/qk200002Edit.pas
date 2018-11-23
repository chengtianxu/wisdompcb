unit qk200002Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditFrm, RzButton, Vcl.ExtCtrls,
  RzPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, RzLabel,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.Mask, RzEdit,
  RzDBEdit, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  Tfrmqk200002Edit = class(Tfrmqkbaseedit)
    mtSeed: TFDMemTable;
    mtheader: TFDMemTable;
    mtEnd: TFDMemTable;
    pnl1: TPanel;
    lbl1: TLabel;
    gp1: TRzGroupBox;
    gp2: TRzGroupBox;
    gp3: TRzGroupBox;
    lbl2: TLabel;
    pnl2: TPanel;
    eh1: TDBGridEh;
    edtseed: TRzDBEdit;
    dsSeed: TDataSource;
    dsHeader: TDataSource;
    dsEnd: TDataSource;
    eh2: TDBGridEh;
    lblView: TLabel;
    btn1: TRzButton;
    lbl3: TLabel;
    edtseed1: TRzDBEdit;
    lbl4: TLabel;
    edtseedName: TRzDBEdit;
    lbl5: TLabel;
    edtType: TRzDBEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitEdit(ASeedName: string): boolean;
  end;

var
  frmqk200002Edit: Tfrmqk200002Edit = nil;

implementation

uses
  qkFunc.Commfunc,qkSvrIntf.ClientIntf;

{$R *.dfm}

{ Tfrmqk200002Edit }

procedure Tfrmqk200002Edit.btn1Click(Sender: TObject);
var
  LStr,lend: string;
begin
  inherited;
  mtheader.First;
  while not mtheader.Eof do
  begin
    LStr := LStr + mtheader.FieldByName('value').AsString;
    mtheader.Next;
  end;
  mtEnd.First;
  while not mtEnd.Eof do
  begin
    lend := lend + mtEnd.FieldByName('value').AsString;
    mtEnd.Next;
  end;
  lblView.Caption := LStr + mtSeed.FieldByName('seed').AsString + lend;
end;

procedure Tfrmqk200002Edit.btnSaveClick(Sender: TObject);
begin
  mtheader.First;
  while not mtheader.Eof do
  begin
    mtheader.Edit;
    mtheader.FieldByName('HeaderOrEnd').AsBoolean := False;
    mtheader.Post;
    mtheader.Next;
  end;
  mtEnd.First;
  while not mtEnd.Eof do
  begin
    mtEnd.Edit;
    mtEnd.FieldByName('HeaderOrEnd').AsBoolean := True;
    mtEnd.Post;
    mtEnd.Next;
  end;

  qkCommfunc.SetCurrIDKey(mtSeed);
  qkCommfunc.SetFK(mtheader,mtSeed.FieldByName('IDKey').AsLargeInt,'SeedPtr');
  qkCommfunc.SetFK(mtEnd,mtSeed.FieldByName('IDKey').AsLargeInt,'SeedPtr');

  inherited;

end;

procedure Tfrmqk200002Edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk200002Edit := nil;
end;

function Tfrmqk200002Edit.InitEdit(ASeedName: string): boolean;
begin
  Result := False;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := ASeedName;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('14',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    Exit;

  if not qkTmp.CopyDsLstToMT([mtSeed,mtheader,mtEnd]) then Exit;

  PostDsList.Clear;
  PostDsList.Add(mtSeed);
  PostDsList.Add(mtheader);
  PostDsList.Add(mtEnd);

  PostTableArr := 'gsys_seed;gsys_seed_Detail;gsys_seed_Detail';

  Result := True;
end;

end.
