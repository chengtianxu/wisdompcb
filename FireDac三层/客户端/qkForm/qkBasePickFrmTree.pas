unit qkBasePickFrmTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBasePickFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel,
  MemTableDataEh, MemTableEh, Vcl.Menus;

type
  TfrmqkbasePickTree = class(TfrmqkBasepick)
    mteh1: TMemTableEh;
  private
    { Private declarations }
  protected
    function GetRetKey: Variant;override;
    function GetRetDisplay: Variant;override;
  public
    { Public declarations }
    function InitPick(APickID: Int64;AWhere: string = '';bAutoShow: Boolean = True;ARightModID: Int64 = 0): boolean;override;
    procedure AfterInit;
  end;


implementation

{$R *.dfm}

{ TfrmqkbasePickTree }

function TfrmqkbasePickTree.GetRetKey: Variant;
var
  LField: TField;
begin
  LField := mteh1.FindField(FRetKeyFieldName);
  if LField <> nil then
    Result := LField.Value
  else
    ShowMessage('没有找到 RetDisplayName');
end;

function TfrmqkbasePickTree.GetRetDisplay: Variant;
var
  LField: TField;
begin
  LField := mteh1.FindField(FRetDisplayName);
  if LField <> nil then
    Result := LField.Value
  else
    ShowMessage('没有找到 RetKeyFiled');
end;


procedure TfrmqkbasePickTree.AfterInit;
begin
  mteh1.LoadFromDataSet(mt1,mt1.RecordCount,TLoadMode.lmCopy,True);
  mteh1.TreeList.KeyFieldName := 'IDKey';
  mteh1.TreeList.RefParentFieldName := 'ParentNodeIDkey';
  mteh1.TreeList.Active := True;
  ds1.DataSet := mteh1;
end;

function TfrmqkbasePickTree.InitPick(APickID: Int64;AWhere: string = '';bAutoShow: Boolean = True;ARightModID: Int64 = 0): boolean;
begin
  Result := inherited InitPick(APickID,AWhere,False,ARightModID);
  if Result then
    AfterInit;
  Result := ShowModal = mrOk;
end;

end.
