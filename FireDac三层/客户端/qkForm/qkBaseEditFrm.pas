unit qkBaseEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseFrm, RzButton, Vcl.ExtCtrls,
  RzPanel, System.Generics.Collections,FireDAC.Comp.Client,FireDAC.Stan.Param,
  RzEdit, RzBtnEdt, Vcl.StdCtrls, Vcl.DBCtrls, RzDBEdit, Vcl.Mask;

type
  Tfrmqkbaseedit = class(TfrmqkBase)
    pnlBase1: TPanel;
    pnlTop: TPanel;
    pnlTopTool: TPanel;
    btnSave: TRzBitBtn;
    btnClose: TRzBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FPostDsList: TList<TFDMemTable>;
    FPostTbArr: string;
  public
    { Public declarations }
    FInstan: Pointer;
    function PostDataArr: Boolean;virtual;
    procedure SetReadOnly;virtual;
    property PostDsList: TList<TFDMemTable> read FPostDsList;
    property PostTableArr: string read FPostTbArr write FPostTbArr;
  end;


implementation

uses
  qkSvrIntf.ClientIntf,qkFunc.Commfunc;

{$R *.dfm}

procedure Tfrmqkbaseedit.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrmqkbaseedit.btnSaveClick(Sender: TObject);
begin
  inherited;
  if PostDataArr then
  begin
    ShowMessage('保存成功');
  end else
    ShowMessage('保存失败');
end;

procedure Tfrmqkbaseedit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if MessageBox(Handle,'是否退出？','提示',MB_YESNO) = IDYES then
//  begin
//    Action := caFree;
//  end else
//    Action := caNone;
  inherited;
end;

procedure Tfrmqkbaseedit.FormCreate(Sender: TObject);
begin
  inherited;
  FPostDsList := TList<TFDMemTable>.Create;
end;

procedure Tfrmqkbaseedit.FormDestroy(Sender: TObject);
begin
  inherited;
  FPostDsList.Free;
end;

function Tfrmqkbaseedit.PostDataArr: Boolean;
begin
  Result := dmSvrIntf.PostDataByTableArr(FPostDsList,FPostTbArr);
end;

procedure Tfrmqkbaseedit.SetReadOnly;
var
  I: Integer;
begin
  btnSave.Enabled := False;
  for I := 0 to PostDsList.Count - 1 do
    PostDsList[I].ReadOnly := True;
end;

end.
