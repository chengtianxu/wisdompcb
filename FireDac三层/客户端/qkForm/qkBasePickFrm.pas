unit qkBasePickFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel,
  qkSvrIntf.ClientIntf, qkFunc.Commfunc, Vcl.Menus;

type
  TfrmqkBasepick = class(TfrmqkBaseMain)
    procedure eh1DblClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetRetKey: Variant;virtual;
    function GetRetDisplay: Variant;virtual;
  public
    { Public declarations }
    FRetKeyFieldName: string;
    FRetDisplayName: string;
    procedure SetToMousePositon;
    function InitPick(APickID: Int64;AWhere: string = '';bAutoShow: Boolean = True;ARightModID: Int64 = 0): boolean;virtual;
    property RetKey: Variant read GetRetKey;
    property RetDisplay: Variant read GetRetDisplay;
  end;


implementation

uses
  System.Generics.Collections;

{$R *.dfm}

{ TfrmqkBasepick }

procedure TfrmqkBasepick.eh1DblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

function TfrmqkBasepick.GetRetDisplay: Variant;
var
  LField: TField;
begin
  LField := DataSet.FindField(FRetDisplayName);
  if LField <> nil then
    Result := LField.Value
  else
    ShowMessage('没有找到 RetKeyFiled');
end;

function TfrmqkBasepick.GetRetKey: Variant;
var
  LField: TField;
begin
  LField := DataSet.FindField(FRetKeyFieldName);
  if LField <> nil then
    Result := LField.Value
  else
    ShowMessage('没有找到 RetDisplayName');
end;

function TfrmqkBasepick.InitPick(APickID: Int64;AWhere: string = '';bAutoShow: Boolean = True;ARightModID: Int64 = 0): boolean;
const
  SPNAME = 'UI_PickIDInit';
var
  Lpms: TFDParams;
  ldslist: TList<TFDMemTable>;
  I: Integer;
  nLen: Integer;
begin
  FNotCheckEnterRight := True;
  SetToMousePositon;
  lblModID.Visible := False;
  lbl1.Visible := False;
  ldslist := nil;
  Caption := 'Pick';
  Result := False;
  Lpms := TFDParams.Create;
  try
    with Lpms.Add do
    begin
      Name := '@IDKey';
      Value := APickID;
    end;
    ldslist := dmSvrIntf.SpOpen(SPNAME,Lpms);
    if not qkCommfunc.CheckSPRetParam(Lpms) then
      Exit;

    pnlWhere.Visible := ldslist[0].FieldByName('TopPnl').AsBoolean;
    pnlTopTool.Visible := ldslist[0].FieldByName('WherePnl').AsBoolean;
    for I := 0 to pnlTopTool.ControlCount - 1 do
    begin
      if pnlTopTool.Controls[I] is TRzButton then
      begin
        if Pos((pnlTopTool.Controls[I] as TRzButton).Caption, ldslist[0].FieldByName('TopPnlBtnVisCaption').AsString) > 0 then
        begin
          pnlTopTool.Controls[I].Visible := True;
        end else
          pnlTopTool.Controls[I].Visible := False;

      end;
    end;

    FRetKeyFieldName := ldslist[0].FieldByName('RetKeyField').AsString;
    FRetDisplayName := ldslist[0].FieldByName('RetDisplayField').AsString;

    if AWhere <> '' then
      FWhere := AWhere//FRetDisplayName + ' LIKE ' + QuotedStr('%'+AWhere+'%')
    else
      FWhere := AWhere;
    InitMainFrm(ARightModID,ldslist[0].FieldByName('MainSqlIDkey').AsLargeInt);
    nLen := 100;
    for I := 0 to eh1.Columns.Count - 1 do
      nLen := nLen + eh1.Columns[I].Width;
    if (nLen > 300) and (nLen < 1024) then
      Width := nLen;
    if nLen <= 300 then
      Width := 300;
    if nLen >= 1024 then
      Width := 1024;
    if bAutoShow then
      Result := ShowModal = mrOk
    else
      Result := true;
  finally
    Lpms.Free;
    qkCommfunc.ReleaseDsList(ldslist);
  end;
end;

procedure TfrmqkBasepick.SetToMousePositon;
begin
//  Self.Position := TPosition.poDesigned;
//  Self.Left := Mouse.CursorPos.X-10;
//  Self.top := Mouse.CursorPos.Y-50;
//  if Self.Left < 100 then
//    Self.Left := 100;
//  if self.Top < 200 then
//    Self.Top := 200;
end;

end.
