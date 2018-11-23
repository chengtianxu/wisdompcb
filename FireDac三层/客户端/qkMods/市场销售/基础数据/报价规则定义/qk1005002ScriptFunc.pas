unit qk1005002ScriptFunc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseGridFrm, qkBaseMainFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls;

type
  Tfrmqk1005002ScriptFunc = class(TfrmqkBaseMain)
    cbxUseFor: TComboBox;
    procedure cbxUseForChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitFrm(AModID: Int64);
  end;

var
  frmqk1005002ScriptFunc: Tfrmqk1005002ScriptFunc;

implementation

uses
  qk1005002ScriptFuncEdit, qkFunc.Commfunc;

{$R *.dfm}

{ Tfrmqk1005002ScriptFunc }

procedure Tfrmqk1005002ScriptFunc.btn1Click(Sender: TObject);
begin
  Close;
  //inherited;
end;

procedure Tfrmqk1005002ScriptFunc.cbxUseForChange(Sender: TObject);
begin
  inherited;
  if FAddWhereLst.ContainsKey('UseFor') then
    FAddWhereLst.Items['UseFor'] := ' AND UseFor = ' + cbxUseFor.ItemIndex.ToString
  else
    FAddWhereLst.Add('UseFor',' AND UseFor = ' + cbxUseFor.ItemIndex.ToString);
  btnRefreshClick(btnRefresh);
end;

procedure Tfrmqk1005002ScriptFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk1005002ScriptFunc := nil;
end;

procedure Tfrmqk1005002ScriptFunc.FormCreate(Sender: TObject);
begin
  inherited;
  FAddWhereLst.Add('UseFor',' AND UseFor=' + cbxUseFor.ItemIndex.ToString);
end;

procedure Tfrmqk1005002ScriptFunc.InitFrm(AModID: Int64);
begin
  ModID := AModID;
  InitMainFrm(AModID,1005002001);

end;

procedure Tfrmqk1005002ScriptFunc.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    mt1.Delete;
    if qkDataIntf.PostDataByTable(mt1,'Script_Func') then
    begin
      mt1.MergeChangeLog;
      qkDialog.DeleSucc;
    end;
  end;
end;

procedure Tfrmqk1005002ScriptFunc.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1005002ScriptFuncEdit) then
    Exit;
  frmqk1005002ScriptFuncEdit := Tfrmqk1005002ScriptFuncEdit.Create(Self);
  frmqk1005002ScriptFuncEdit.InitEdit(ModID,mt1.FieldByName('IDKey').AsLargeInt);
  frmqk1005002ScriptFuncEdit.Show;
end;

procedure Tfrmqk1005002ScriptFunc.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1005002ScriptFuncEdit) then
    Exit;
  frmqk1005002ScriptFuncEdit := Tfrmqk1005002ScriptFuncEdit.Create(Self);
  frmqk1005002ScriptFuncEdit.InitEdit(ModID,0);
  frmqk1005002ScriptFuncEdit.Show;
end;

procedure Tfrmqk1005002ScriptFunc.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1005002ScriptFuncEdit) then
    Exit;
  frmqk1005002ScriptFuncEdit := Tfrmqk1005002ScriptFuncEdit.Create(Self);
  frmqk1005002ScriptFuncEdit.InitEdit(ModID,mt1.FieldByName('IDKey').AsLargeInt);
  frmqk1005002ScriptFuncEdit.SetReadOnly;
  frmqk1005002ScriptFuncEdit.Show;
end;

end.
