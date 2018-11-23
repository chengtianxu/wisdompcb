unit qk20000003Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, Data.DB, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ExtCtrls, RzButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrmqk20000003Edit = class(Tfrmqkbaseeditvgrid)
    mt1: TFDMemTable;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitEdit(AModID,AIDKey: Int64);
  end;

var
  frmqk20000003Edit: Tfrmqk20000003Edit;

implementation

uses
  qkSvrIntf.ClientIntf, qkFunc.Commfunc;

{$R *.dfm}

{ Tfrmqk20000003Edit }

procedure Tfrmqk20000003Edit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(mt1);
  inherited;
end;

procedure Tfrmqk20000003Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk20000003Edit := nil;
end;

procedure Tfrmqk20000003Edit.InitEdit(AModID, AIDKey: Int64);
begin
  ModID := AModID;

  InitGrid(AModID);
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := AIDKey;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('19',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    Exit;
  if not qkTmp.CopyDsLstToMT([mt1]) then
    exit;

  DataSet := mt1;
  PostDsList.Clear;
  PostDsList.Add(mt1);
  PostTableArr := 'gBase_Param'

end;

end.
