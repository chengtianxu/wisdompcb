unit qk20000Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, RzButton, Vcl.ExtCtrls,
  RzPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, RzTabs,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBVertGridsEh, Vcl.Menus, Vcl.ComCtrls;

type
  Tfrmqk20000Edit = class(Tfrmqkbaseeditvgrid)
    pnl1: TPanel;
    mtgSysMod: TFDMemTable;
    mtgBaseRight: TFDMemTable;
    dsBaseRight: TDataSource;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    pgc1: TPageControl;
    ts1: TTabSheet;
    eh1: TDBGridEh;
    procedure btnSaveClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitEdit(AModID,AModIDKey: Int64): boolean;
  end;

var
  frmqk20000Edit: Tfrmqk20000Edit;

implementation

uses
  qkFunc.Commfunc,qkSvrIntf.ClientIntf;

{$R *.dfm}

procedure Tfrmqk20000Edit.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure Tfrmqk20000Edit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(mtgSysMod);
  qkCommfunc.SetFK(mtgBaseRight,mtgSysMod.FieldByName('IDKey').AsLargeInt,'ModIDKey');
  ModalResult := mrOk;
  inherited;

end;

procedure Tfrmqk20000Edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk20000Edit := nil;
end;

function Tfrmqk20000Edit.InitEdit(AModID,AModIDKey: Int64): boolean;
begin
  ModID := AModID;
  Result := false;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := AModIDKey;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('8',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    exit;
  qkTmp.CopyDsLstToMT([mtgSysMod,mtgBaseRight]);

  PostTableArr := 'gSys_Mod;gMod_RightBase';
  PostDsList.Add(mtgSysMod);
  PostDsList.Add(mtgBaseRight);

  InitGrid(20000);
  DataSet := mtgSysMod;
  Result := True;
end;

procedure Tfrmqk20000Edit.mniN1Click(Sender: TObject);
begin
  inherited;
  mtgBaseRight.Append;
  mtgBaseRight.FieldByName('RightID').AsInteger := 0;
  mtgBaseRight.FieldByName('RightName').AsString := '显示主数据';
  mtgBaseRight.Post;

  mtgBaseRight.Append;
  mtgBaseRight.FieldByName('RightID').AsInteger := 1;
  mtgBaseRight.FieldByName('RightName').AsString := '新增';
  mtgBaseRight.Post;

  mtgBaseRight.Append;
  mtgBaseRight.FieldByName('RightID').AsInteger := 2;
  mtgBaseRight.FieldByName('RightName').AsString := '编辑';
  mtgBaseRight.Post;

  mtgBaseRight.Append;
  mtgBaseRight.FieldByName('RightID').AsInteger := 3;
  mtgBaseRight.FieldByName('RightName').AsString := '查看明细';
  mtgBaseRight.Post;

  mtgBaseRight.Append;
  mtgBaseRight.FieldByName('RightID').AsInteger := 4;
  mtgBaseRight.FieldByName('RightName').AsString := '删除';
  mtgBaseRight.Post;
end;

end.
