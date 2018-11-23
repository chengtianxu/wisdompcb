unit qk1604001DeptErpRights;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseEditFrm, RzTabs, RzButton,
  Vcl.ExtCtrls, RzPanel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Data.DB, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, qkFunc.Commfunc,qkSvrIntf.ClientIntf,
  MemTableDataEh, MemTableEh, Vcl.ComCtrls;

type
  Tfrmqk1604001DepterpRights = class(Tfrmqkbaseedit)
    ds1: TDataSource;
    mt1: TFDMemTable;
    mtRights: TFDMemTable;
    mteh1: TMemTableEh;
    mtBaseRight: TFDMemTable;
    ds2: TDataSource;
    pgc2: TPageControl;
    ts1: TTabSheet;
    eh1: TDBGridEh;
    pgc1: TPageControl;
    ts2: TTabSheet;
    eh2: TDBGridEh;
    procedure mteh1AfterScroll(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure mtBaseRightAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FDeptID: Int64;
    function InitEdit(AdeptID: Int64): Boolean;
  end;



implementation

{$R *.dfm}

{ Tfrmqk1604001DepterpRights }

procedure Tfrmqk1604001DepterpRights.btnSaveClick(Sender: TObject);
begin
  if mtBaseRight.State in [dsEdit,dsInsert] then mtBaseRight.Post;
  qkCommfunc.SetFK(mtRights,FDeptID,'DeptIDKey');
  inherited;

end;

function Tfrmqk1604001DepterpRights.InitEdit(AdeptID: Int64): Boolean;
var
  LArr: TArray<string>;
  I: Integer;
begin
  FDeptID := AdeptID;
  Result := False;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := AdeptID;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('4',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    exit;
  qkTmp.CopyDsLstToMT([mt1,mtRights,mtBaseRight]);
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


  PostTableArr := 'HR_DeptErpRights';
  PostDsList.Add(mtRights);

  Result := True;
end;

procedure Tfrmqk1604001DepterpRights.mtBaseRightAfterPost(DataSet: TDataSet);
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

procedure Tfrmqk1604001DepterpRights.mteh1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  mtBaseRight.Filter := ' MODIDkey = ' + mteh1.FieldByName('IDKey').AsLargeInt.ToString;
  mtBaseRight.Filtered := True;
end;

end.
