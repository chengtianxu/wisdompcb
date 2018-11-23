unit qk200000001Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, Data.DB, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ExtCtrls, RzButton, RzPanel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrmqk20000001Edit = class(Tfrmqkbaseeditvgrid)
    mt1: TFDMemTable;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitEdit(AModID,IDKey: Int64);
  end;

var
  frmqk20000001Edit:Tfrmqk20000001Edit;

implementation

uses
  qkSvrIntf.ClientIntf,qkFunc.Commfunc;

{$R *.dfm}

{ Tfrmqk20000001Edit }

procedure Tfrmqk20000001Edit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(mt1);
  inherited;
end;

procedure Tfrmqk20000001Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk20000001Edit := nil;
end;

procedure Tfrmqk20000001Edit.InitEdit(AModID,IDKey: Int64);
begin
  ModID := AModID;
  InitGrid(200001);
  if not qkDataIntf.GetTableData(mt1,'gBase_Unit',' IDkey =' + IDKey.ToString) then
    Exit;
  DataSet := mt1;
  PostTableArr := 'gBase_unit';
  PostDsList.Add(mt1);
end;

end.
