unit qk10000Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditFrm, RzButton, Vcl.ExtCtrls,
  RzPanel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  MemTableDataEh, Data.DB, MemTableEh, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RzRadChk, RzDBChk, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzDBEdit, RzLabel, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, RzTabs, qkFunc.Commfunc,
  qkSvrIntf.ClientIntf, Vcl.ComCtrls, Vcl.DBCtrls;

type
  Tfrmqk10000Edit = class(Tfrmqkbaseedit)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    ds1: TDataSource;
    mt1: TFDMemTable;
    mteh1: TMemTableEh;
    mtBaseRight: TFDMemTable;
    ds2: TDataSource;
    mtRights: TFDMemTable;
    mtgSysUser: TFDMemTable;
    edtLoginName: TRzDBEdit;
    dsgSysUser: TDataSource;
    pnl3: TPanel;
    pnl4: TPanel;
    btnSelectAll: TRzButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    eh2: TDBGridEh;
    pgc2: TPageControl;
    ts2: TTabSheet;
    eh1: TDBGridEh;
    cbxActive1: TDBCheckBox;
    procedure mteh1AfterScroll(DataSet: TDataSet);
    procedure mtBaseRightAfterPost(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitEdit(AUserIDKey: Int64): boolean;
  end;


implementation


{$R *.dfm}

{ Tfrmqk10000Edit }

procedure Tfrmqk10000Edit.btnSaveClick(Sender: TObject);
begin
  if mtgSysUser.State in [dsEdit,dsInsert] then
    mtgSysUser.Post;
  if mtBaseRight.State in [dsEdit,dsInsert] then mtBaseRight.Post;
  qkCommfunc.SetFK(mtRights,mtgSysUser.FieldByName('IDKey').AsLargeInt,'UserIDkey');
  inherited;

end;

procedure Tfrmqk10000Edit.btnSelectAllClick(Sender: TObject);
begin
  inherited;
  mtBaseRight.First;
  while not mtBaseRight.Eof do
  begin
    mtBaseRight.Edit;
    mtBaseRight.FieldByName('Checked').AsBoolean := True;
    mtBaseRight.Post;
    mtBaseRight.Next;
  end;
end;

function Tfrmqk10000Edit.InitEdit(AUserIDKey: Int64): boolean;
var
  LArr: tArray<string>;
  I: Integer;
begin
  Result := False;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'P1';
    Value := AUserIDKey;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('7',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    exit;
  qkTmp.CopyDsLstToMT([mt1,mtRights,mtgSysUser,mtBaseRight]);

  mteh1.LoadFromDataSet(mt1,mt1.RecordCount,TLoadMode.lmCopy,True);
  mteh1.TreeList.KeyFieldName := 'IDKey';
  mteh1.TreeList.RefParentFieldName := 'ParentIDKey';
  mteh1.TreeList.Active := True;


  mt1.DisableControls;
  mtBaseRight.DisableControls;
  mt1.First;
  while not mt1.Eof do
  begin
    if mtRights.Locate('ModIDKey',mt1.FieldByName('IDKey').AsLargeInt,[loCaseInsensitive]) then
    begin
      LArr := mtRights.FieldByName('ModRights').AsString.Split([';']);
      mtBaseRight.Filter := ' MODIDkey = ' + mt1.FieldByName('IDKey').AsLargeInt.ToString;
      mtBaseRight.Filtered := True;
      mtBaseRight.First;
      while not mtBaseRight.Eof do
      begin
        for I := 0 to Length(LArr) - 1 do
        begin
          if LArr[I] = mtBaseRight.FieldByName('RightID').AsString then
          begin
            mtBaseRight.Edit;
            mtBaseRight.FieldByName('Checked').AsBoolean := True;
            mtBaseRight.Post;
            Break;
          end;
        end;
        mtBaseRight.Next;
      end;
    end;
    mt1.Next;
  end;
  mtBaseRight.MergeChangeLog;
  mt1.EnableControls;
  mtBaseRight.EnableControls;


  PostTableArr := 'gSys_User;Sys_User_Mod';
  PostDsList.Add(mtgSysUser);
  PostDsList.Add(mtRights);

  Result := True;

end;

procedure Tfrmqk10000Edit.mtBaseRightAfterPost(DataSet: TDataSet);
var
  LArr: TArray<string>;
  LS: TStringList;
  I: Integer;
begin
  inherited;
  if mtRights.Locate('ModIDkey',mtBaseRight.FieldByName('ModIDKey').AsLargeInt,[loCaseInsensitive]) then
  begin
    LArr := mtRights.FieldByName('ModRights').AsString.Split([';']);
    mtRights.Edit;
  end else
  begin
    mtRights.Append;
    mtRights.FieldByName('ModIDKey').AsLargeInt := mtBaseRight.FieldByName('ModIDKey').AsLargeInt;
  end;
  LS := TStringList.Create;
  try
    for I := 0 to Length(LArr) - 1 do
      LS.Add(Larr[I]);

    if DataSet.FieldByName('Checked').AsBoolean then
    begin
      if LS.IndexOf(DataSet.FieldByName('RightID').AsString) = -1 then
        LS.Add(DataSet.FieldByName('RightID').AsString);
    end else
    begin
      LS.Delete(LS.IndexOf(DataSet.FieldByName('RightID').AsString));
    end;
    mtRights.FieldByName('ModRights').AsString := '';
    for I := 0 to LS.Count- 1 do
      mtRights.FieldByName('ModRights').AsString :=  mtRights.FieldByName('ModRights').AsString + LS[I] + ';';

    mtRights.Post;
  finally
    LS.Free;
  end;
end;

procedure Tfrmqk10000Edit.mteh1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  mtBaseRight.Filter := ' MODIDkey = ' + mteh1.FieldByName('IDKey').AsLargeInt.ToString;
  mtBaseRight.Filtered := True;
end;

end.
