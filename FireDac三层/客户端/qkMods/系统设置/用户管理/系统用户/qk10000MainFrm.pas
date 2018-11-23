unit qk10000MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.Menus,
  qk10000Edit, qkFunc.Commfunc;

type
  Tfrmqk10000Main = class(TfrmqkBaseMain)
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    procedure mniEditClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  qkSvrIntf.ClientIntf;

{$R *.dfm}

procedure Tfrmqk10000Main.mniEditClick(Sender: TObject);
var
  LFrm: Tfrmqk10000Edit;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then Exit;

  LFrm := Tfrmqk10000Edit.Create(Self);
  try
    LFrm.InitEdit(DataSet.FieldByName('IDKey').AsLargeInt);
    if LFrm.ShowModal = mrOk then
    begin

    end else
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk10000Main.mniN1Click(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then Exit;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := mt1.FieldByName('IDKey').AsLargeInt;
  end;
  if dmSvrIntf.SqlExec('9',qkTmp.Pms) then
    qkDialog.OperSucc;
end;

procedure Tfrmqk10000Main.mniN2Click(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then Exit;
  if qkDialog.OperConfig then
  begin
    qkTmp.ClearAll;
    with qkTmp.Pms.Add do
    begin
      Name := 'p1';
      Value := mt1.FieldByName('idkey').AsLargeInt;
    end;
    with qkTmp.Pms.Add do
    begin
      Name := 'p2';
      Value := qkCommfunc.MD5Print(mt1.FieldByName('LoginName').AsString);
    end;
    if dmSvrIntf.SqlExec('10',qkTmp.Pms) then
      qkDialog.OperSucc;
  end;
end;

procedure Tfrmqk10000Main.mniViewClick(Sender: TObject);
var
  LFrm: Tfrmqk10000Edit;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then Exit;

  LFrm := Tfrmqk10000Edit.Create(Self);
  try
    LFrm.InitEdit(DataSet.FieldByName('IDKey').AsLargeInt);
    LFrm.SetReadOnly;
    if LFrm.ShowModal = mrOk then
    begin

    end else
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

end.
