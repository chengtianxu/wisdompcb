unit qk1604001MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel,
  MemTableDataEh, MemTableEh, Vcl.Menus, System.ImageList, Vcl.ImgList, qkFunc.Commfunc,
  qkSvrIntf.ClientIntf, RzDBEdit, qk1604001PeopList;

type
  Tfrmqk1604001MainFrm = class(TfrmqkBaseMain)
    mteh1: TMemTableEh;
    pm1: TPopupMenu;
    mniDept: TMenuItem;
    mniWork: TMenuItem;
    il1: TImageList;
    mniNewDept: TMenuItem;
    mniNewChildDept: TMenuItem;
    mniNewWork: TMenuItem;
    mniEditWork: TMenuItem;
    mniEditDept: TMenuItem;
    mniN10: TMenuItem;
    mniDeleDept: TMenuItem;
    mniN12: TMenuItem;
    mniDeleWork: TMenuItem;
    mniSetErpRight: TMenuItem;
    mniN1: TMenuItem;
    mniNewPeop: TMenuItem;
    spl1: TSplitter;
    pnlPeop: TPanel;
    procedure mniNewDeptClick(Sender: TObject);
    procedure mniNewChildDeptClick(Sender: TObject);
    procedure mniEditDeptClick(Sender: TObject);
    procedure eh1CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure btnRefreshClick(Sender: TObject);
    procedure mniDeleDeptClick(Sender: TObject);
    procedure mteh1AfterScroll(DataSet: TDataSet);
    procedure pm1Popup(Sender: TObject);
    procedure eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniNewWorkClick(Sender: TObject);
    procedure mniNewPeopClick(Sender: TObject);
    procedure mniSetErpRightClick(Sender: TObject);
  private
    { Private declarations }
    FPeopListFrm: Tfrmqk1604001PeopList;
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure DeleteNodeWithChildren(TreeNode: TMemRecViewEh);
  public
    { Public declarations }
    procedure InitMainFrm(AModID: int64;AMainSqlIDKey: Int64);override;
    procedure AfterInit;
    procedure GetPoepList(ADeptIDkey: Int64;ADeptorWork: Integer);
  end;

implementation

uses
  qk1604001EditTreeNode, qk1604001PeopEdit, qk1604001DeptErpRights;

{$R *.dfm}
procedure Tfrmqk1604001MainFrm.DeleteNodeWithChildren(TreeNode: TMemRecViewEh);
var
  i: Integer;
  tmpInt: Int64;
begin
  for I := TreeNode.NodesCount-1 downto 0 do
    DeleteNodeWithChildren(TreeNode.NodeItems[I]);
  tmpInt := TreeNode.Rec.DataValues['IDKey',TDataValueVersionEh.dvvCurValueEh];
  mteh1.RecordsView.MemTableData.RecordsList.DeleteRecord(TreeNode.Rec.Index);
  if mt1.Locate('IDKey',tmpInt,[]) then
    mt1.Delete;
end;



{ Tfrmqk1604001MainFrm }

procedure Tfrmqk1604001MainFrm.AfterInit;
//var
//  LCol: TColumnEh;
begin
  mteh1.AfterScroll := nil;
  mteh1.LoadFromDataSet(mt1,mt1.RecordCount,TLoadMode.lmCopy,True);
  mteh1.TreeList.KeyFieldName := 'IDKey';
  mteh1.TreeList.RefParentFieldName := 'ParentNodeIDkey';
  mteh1.TreeList.Active := True;
  mteh1.AfterScroll := mteh1AfterScroll;
  mteh1.First;
//下面用来显示图标
//  LCol := eh1.FieldColumns['Struct'];
//  if LCol <> nil then
//  begin
//    LCol.ImageList := il1;
//    LCol.OnGetCellParams := DBGridEh1Columns0GetCellParams;
//  end;

  ds1.DataSet := mteh1;
  eh1.DataSource := ds1;

end;

procedure Tfrmqk1604001MainFrm.btnRefreshClick(Sender: TObject);
begin
  inherited;
  AfterInit;
end;

procedure Tfrmqk1604001MainFrm.DBGridEh1Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  //这里用来显示图标
  //Params.ImageIndex := mteh1.TreeNodeLevel; //MemTableEh1.FieldByName('ImageIndex').AsInteger;
end;

procedure Tfrmqk1604001MainFrm.eh1CellMouseClick(Grid: TCustomGridEh;
  Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);
//var
//  TreeAreaWidth: Integer;
begin
//  inherited;
//  if not (ssDouble in Shift) and (Cell.X = 1) and (Cell.Y = TDBGridEh(Grid).Row) then
//  begin
//    TreeAreaWidth := mteh1.TreeNodeLevel * 18;
//    if (X > TreeAreaWidth) and (X < TreeAreaWidth + il1.Width) then
//    begin
//      mteh1.Edit;
//      if mteh1.FieldByName('ImageIndex').AsInteger = 0
//        then mteh1.FieldByName('ImageIndex').AsInteger := 1
//        else mteh1.FieldByName('ImageIndex').AsInteger := 0;
//      mteh1.Post;
//    end;
//  end;
end;

procedure Tfrmqk1604001MainFrm.eh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName.ToUpper = UpperCase('PeopNowNum') then
  begin
    if mteh1.FieldByName('PeopNowNum').AsInteger > mteh1.FieldByName('PeopPlanNum').AsInteger then
    begin
      eh1.Canvas.Font.Color := clRed;
      eh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
  end;
end;

procedure Tfrmqk1604001MainFrm.GetPoepList(ADeptIDkey: Int64;ADeptorWork: Integer);
begin
  if FPeopListFrm <> nil then
  begin
    if ADeptIDkey = 0 then
      FPeopListFrm.FWhere := ' 1=1'
    else
    begin
      if ADeptorWork = 0 then
        FPeopListFrm.FWhere := ' Local_DeptIDkey = ' + adeptidkey.ToString;
      if ADeptorWork = 1 then
        FPeopListFrm.FWhere := ' Local_DeptWorkIDkey = ' + adeptidkey.ToString;
    end;
    FPeopListFrm.btnRefreshClick(btnRefresh);
  end;
end;

procedure Tfrmqk1604001MainFrm.InitMainFrm(AModID: int64;AMainSqlIDKey: Int64);
begin
  inherited;
  AfterInit;

  FPeopListFrm := Tfrmqk1604001PeopList.Create(pnlPeop);
  FPeopListFrm.InitMainFrm(AModID,160400101);
  FPeopListFrm.pnlbase.Parent := pnlPeop;
  GetPoepList(mteh1.FieldByName('IDKey').AsLargeInt,mteh1.FieldByName('DeptOrWork').AsInteger);
end;

procedure Tfrmqk1604001MainFrm.mniEditDeptClick(Sender: TObject);
var
  Lfrm: Tfrmqk1604001edittreenode;
  Ltmp: Int64;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  Lfrm := Tfrmqk1604001edittreenode.Create(Self);
  try
    Lfrm.Fmteh := mteh1;  //用来检测父节点选择是否成功
    Lfrm.InitGrid(1604001);
    Ltmp := mteh1.FieldByName('IDKey').AsLargeInt;
    mt1.Locate('IDKey',Ltmp,[loCaseInsensitive]);
    Lfrm.DataSet := mt1;
    Lfrm.SetToMousePositon;
    mteh1.Edit; //--编辑
    mt1.Edit; //编辑
    if Lfrm.ShowModal = mrOk then
    begin
      mt1.MergeChangeLog;
      mteh1.MergeChangeLog;
    end else
    begin
      mt1.UndoLastChange(False);
    end;
  finally
    Lfrm.Free;
    if mt1.State in [dsInsert,dsEdit] then
    begin
      mt1.Cancel;
    end;
    if mteh1.State in [dsInsert,dsEdit] then
    begin
      mteh1.Cancel;
    end;
  end;
end;

procedure Tfrmqk1604001MainFrm.mniDeleDeptClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  if qkDialog.DeleConfig then
  begin
    DeleteNodeWithChildren(mteh1.TreeNode);
    if dmSvrIntf.PostDataByTable(mt1,'HR_DeptDef') then
    begin
      mteh1.MergeChangeLog;
      qkDialog.DeleSucc;
    end else
    begin
      mt1.CancelUpdates;
      mteh1.CancelUpdates;
    end;
  end;
end;

procedure Tfrmqk1604001MainFrm.mniNewChildDeptClick(Sender: TObject);
var
  Lfrm: Tfrmqk1604001edittreenode;
  Ltmp: Int64;
  lParentDeptName: string;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  Lfrm := Tfrmqk1604001edittreenode.Create(Self);
  try
    Lfrm.Fmteh := mteh1;
    Lfrm.InitGrid(1604001);
    Ltmp := mteh1.FieldByName('IDKey').AsLargeInt;
    lParentDeptName := mteh1.FieldByName('deptname').AsString;
    mteh1.Append;
    mteh1.FieldByName('ParentNodeIDkey').AsLargeInt := Ltmp;
    mt1.Append;
    mt1.FieldByName('SeqNo').AsInteger := 0;
    mt1.FieldByName('DeptOrWork').AsInteger := 0;
    mt1.FieldByName('ParentNodeIDkey').AsLargeInt := Ltmp;
    mt1.FieldByName('parentdeptname').AsString := lParentDeptName;

    Lfrm.DataSet := mt1;
    Lfrm.SetToMousePositon;
    if Lfrm.ShowModal = mrOk then
    begin
      mt1.MergeChangeLog;
      mteh1.MergeChangeLog;
    end else
    begin
      mt1.UndoLastChange(False);
      mteh1.Cancel;
    end;
  finally
    Lfrm.Free;
    if mt1.State in [dsInsert,dsEdit] then
    begin
      mt1.Cancel;
    end;
    if mteh1.State in [dsInsert,dsEdit] then
    begin
      mteh1.Cancel;
    end;
  end;
end;

procedure Tfrmqk1604001MainFrm.mniNewDeptClick(Sender: TObject);
var
  Lfrm: Tfrmqk1604001edittreenode;
  Ltmp: Int64;
  LParentDeptName: string;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;

  Lfrm := Tfrmqk1604001edittreenode.Create(Self);
  try
    Lfrm.Fmteh := mteh1;

    Lfrm.InitGrid(1604001);
    Ltmp := mteh1.FieldByName('ParentNodeIDKey').AsLargeInt;
    LParentDeptName := mteh1.FieldByName('ParentDeptName').AsString;
    mteh1.Append;
    mteh1.FieldByName('ParentNodeIDkey').AsLargeInt := Ltmp;
    mt1.Append;
    mt1.FieldByName('SeqNo').AsInteger := 0;
    mt1.FieldByName('DeptOrWork').AsInteger := 0;
    mt1.FieldByName('ParentNodeIDkey').AsLargeInt := Ltmp;
    mt1.FieldByName('ParentDeptName').AsString := LParentDeptName;
    Lfrm.DataSet := mt1;
    Lfrm.SetToMousePositon;
    if Lfrm.ShowModal = mrOk then
    begin
      mt1.MergeChangeLog;
      mteh1.MergeChangeLog;
    end else
    begin
      mt1.UndoLastChange(True);
      mteh1.Cancel;
    end;
  finally
    Lfrm.Free;
    if mt1.State in [dsInsert,dsEdit] then
    begin
      mt1.Cancel;
    end;
    if mteh1.State in [dsInsert,dsEdit] then
    begin
      mteh1.Cancel;
    end;
  end;
end;


procedure Tfrmqk1604001MainFrm.mniNewPeopClick(Sender: TObject);
var
  LFrm: Tfrmqk1604001PeopEdit;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  LFrm := Tfrmqk1604001PeopEdit.Create(Self);
  try
    LFrm.FEditType := 0;//新增

    qkTmp.ClearAll;
    with qkTmp.Pms.Add do
    begin

      Name := 'p1';
      DataType := ftLargeint;
      Value := 0;
    end;
    qkTmp.Dslst := dmSvrIntf.SqlOpen('1',qkTmp.Pms);
    if qkTmp.Dslst = nil then
      Exit;

    if not qkTmp.CopyDsLstToMT([LFrm.FDsGPeop,LFrm.mtPhoto,LFrm.mtgSysUser,LFrm.mtSysUserMod]) then
      Exit;

    qkTmp.ClearAll;
    LFrm.FDsGPeop.Append;
    LFrm.FDsGPeop.FieldByName('Local_DeptIDKey').AsLargeInt := mteh1.FieldByName('ParentNodeIDKey').AsLargeInt;
    LFrm.FDsGPeop.FieldByName('DeptName').AsString := mteh1.FieldByName('ParentDeptName').AsString;
    LFrm.FDsGPeop.FieldByName('Local_DeptWorkIDKey').AsLargeInt := mteh1.FieldByName('IDKey').AsLargeInt;
    LFrm.FDsGPeop.FieldByName('workName').AsString := mteh1.FieldByName('deptname').AsString;
    LFrm.FDsGPeop.FieldByName('local_ondutytime').AsDateTime := Now();
    LFrm.FDsGPeop.FieldByName('Local_BeTrueDatetime').AsDateTime := IncMonth(Now(),2);
    LFrm.FDsGPeop.FieldByName('nation').AsString := '汉族';
    lfrm.FDsGPeop.FieldByName('Sex').AsBoolean := True;
    LFrm.FDsGPeop.FieldByName('PeopIDCode').AsString := LFrm.CreateNewGH;


    if LFrm.ShowModal = mrOk then
    begin

    end else
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk1604001MainFrm.mniNewWorkClick(Sender: TObject);
var
  Lfrm: Tfrmqk1604001edittreenode;
  Ltmp: Int64;
  lParentDeptName: string;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  Lfrm := Tfrmqk1604001edittreenode.Create(Self);
  try
    Lfrm.Fmteh := mteh1;
    Lfrm.InitGrid(1604001);
    Ltmp := mteh1.FieldByName('IDKey').AsLargeInt;
    lParentDeptName := mteh1.FieldByName('deptname').AsString;
    mteh1.Append;
    mteh1.FieldByName('ParentNodeIDkey').AsLargeInt := Ltmp;
    mt1.Append;
    mt1.FieldByName('SeqNo').AsInteger := 0;
    mt1.FieldByName('DeptOrWork').AsInteger := 1;
    mt1.FieldByName('ParentNodeIDkey').AsLargeInt := Ltmp;
    mt1.FieldByName('parentdeptname').AsString := lParentDeptName;

    Lfrm.DataSet := mt1;
    Lfrm.SetToMousePositon;
    if Lfrm.ShowModal = mrOk then
    begin
      mt1.MergeChangeLog;
      mteh1.MergeChangeLog;
    end else
    begin
      mt1.UndoLastChange(False);
      mteh1.Cancel;
    end;
  finally
    Lfrm.Free;
    if mt1.State in [dsInsert,dsEdit] then
    begin
      mt1.Cancel;
    end;
    if mteh1.State in [dsInsert,dsEdit] then
    begin
      mteh1.Cancel;
    end;
  end;
end;

procedure Tfrmqk1604001MainFrm.mniSetErpRightClick(Sender: TObject);
var
  Lfrm: Tfrmqk1604001DepterpRights;
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  Lfrm := Tfrmqk1604001DepterpRights.Create(Self);
  try
    if Lfrm.InitEdit(mteh1.FieldByName('IDKey').AsLargeInt) then
    begin
      if Lfrm.ShowModal = mrOk then
      begin

      end else
      begin

      end;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure Tfrmqk1604001MainFrm.mteh1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if mteh1.FieldByName('ParentNodeIDkey').AsLargeInt = 0 then
    GetPoepList(0,0)
  else
    GetPoepList(mteh1.FieldByName('IDKey').AsLargeInt, mteh1.FieldByName('Deptorwork').AsInteger);
end;

procedure Tfrmqk1604001MainFrm.pm1Popup(Sender: TObject);
begin
  inherited;
  if mteh1.FieldByName('ParentNodeIDkey').AsInteger = 0 then
  begin

    mniNewDept.Enabled := false;
    mniNewChildDept.Enabled := True;
    mniEditDept.Enabled := True;
    mniDeleDept.Enabled := False;


    mniNewWork.Enabled := True;
    mniEditWork.Enabled := False;
    mniDeleWork.Enabled := False;
    mniSetErpRight.Enabled := False;
    mniNewPeop.Enabled := False;
  end else
  begin
    //部门
    if mteh1.FieldByName('DeptOrWork').AsInteger = 0 then
    begin
      mniNewDept.Enabled := True;
      mniNewChildDept.Enabled := True;
      mniEditDept.Enabled := True;
      mniDeleDept.Enabled := True;


      mniNewWork.Enabled := True;
      mniEditWork.Enabled := False;
      mniDeleWork.Enabled := False;
      mniSetErpRight.Enabled := False;
      mniNewPeop.Enabled := False;
    end;
    //岗位
    if mteh1.FieldByName('DeptOrWork').AsInteger = 1 then
    begin
      mniNewDept.Enabled := False;
      mniNewChildDept.Enabled := False;
      mniEditDept.Enabled := False;
      mniDeleDept.Enabled := False;


      mniNewWork.Enabled := False;
      mniEditWork.Enabled := True;
      mniDeleWork.Enabled := True;
      mniSetErpRight.Enabled := True;
      mniNewPeop.Enabled := True;
    end;
  end;
end;

end.
