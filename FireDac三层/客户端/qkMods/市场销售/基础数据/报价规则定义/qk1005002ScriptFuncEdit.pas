unit qk1005002ScriptFuncEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, Data.DB, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ExtCtrls, RzButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls;

type
  Tfrmqk1005002ScriptFuncEdit = class(Tfrmqkbaseeditvgrid)
    mt1: TFDMemTable;
    pnl1: TPanel;
    dbmmof: TDBMemo;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitEdit(AModID: Int64;AIDKey: Int64);
  end;

var
  frmqk1005002ScriptFuncEdit: Tfrmqk1005002ScriptFuncEdit;

implementation

uses
  qkFunc.Commfunc;

{$R *.dfm}

{ Tfrmqk1005002ScriptFuncEdit }

procedure Tfrmqk1005002ScriptFuncEdit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(mt1);
  inherited;
end;

procedure Tfrmqk1005002ScriptFuncEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk1005002ScriptFuncEdit := nil;
end;

procedure Tfrmqk1005002ScriptFuncEdit.InitEdit(AModID,AIDKey: Int64);
begin
  ModID := AModID;
  InitGrid(1005002001);

  if not qkDataIntf.GetTableData(mt1,'Script_Func',' IDKey=' + aidkey.ToString) then
    Exit;

  PostDsList.Clear;
  PostDsList.Add(mt1);
  PostTableArr := 'Script_Func';

end;

end.
