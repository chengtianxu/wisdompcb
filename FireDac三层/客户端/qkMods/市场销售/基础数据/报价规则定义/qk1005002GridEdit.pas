unit qk1005002GridEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseEditFrm, RzButton, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MemTableDataEh,
  Data.DB, MemTableEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus,qk1005002GridEditDetail;

type
  Tfrmqk1005002GridEdit = class(Tfrmqkbaseedit)
    pnl1: TPanel;
    pnl2: TPanel;
    mtGrid: TFDMemTable;
    mtGridDetail: TFDMemTable;
    eh1: TDBGridEh;
    dsGrid: TDataSource;
    mteh1: TMemTableEh;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    spl1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mteh1AfterScroll(DataSet: TDataSet);
    procedure pm1Popup(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure mniN4Click(Sender: TObject);
  private
    { Private declarations }
    FDetailFrm: Tfrmqk1005002GridEditDetail;
  public
    { Public declarations }
    procedure InitEdit(AModID,AIDKey: Int64);
  end;

var
  frmqk1005002GridEdit: Tfrmqk1005002GridEdit;

implementation

uses
  qkSvrIntf.ClientIntf, qkFunc.Commfunc;

{$R *.dfm}

{ Tfrmqk1005002GridEdit }

procedure Tfrmqk1005002GridEdit.btnSaveClick(Sender: TObject);
begin
  //
  inherited;

end;

procedure Tfrmqk1005002GridEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk1005002GridEdit := nil;
end;

procedure Tfrmqk1005002GridEdit.InitEdit(AModID, AIDKey: Int64);
begin
  qkTmp.ClearAll;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('20',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    exit;
  if not qkTmp.CopyDsLstToMT([mtGrid,mtGridDetail]) then
    Exit;

  PostDsList.Clear;
  PostDsList.Add(mtGrid);
  PostDsList.Add(mtGridDetail);
  PostTableArr := 'gBase_2DTable;gBase_2DTable_Detail';

  {$REGION '加载树'}
  mteh1.AfterScroll := nil;
  mteh1.TreeList.KeyFieldName := 'IDKey';
  mteh1.TreeList.RefParentFieldName := 'ParentNodeIDkey';
  mteh1.TreeList.Active := True;
  mteh1.TreeList.DefaultNodeExpanded := True;
  mteh1.LoadFromDataSet(mtGrid,mtGrid.RecordCount,TLoadMode.lmCopy,True);
  mteh1.AfterScroll := mteh1AfterScroll;
  mteh1.First;
  {$ENDREGION}

  FDetailFrm := Tfrmqk1005002GridEditDetail.Create(Self);
  FDetailFrm.pnl1.Parent := pnl2;
end;

procedure Tfrmqk1005002GridEdit.mniN1Click(Sender: TObject);
var
  LTitle,LValue: array [0..1] of string;
  LIDKey,LParentIDKey: Int64;
begin
  inherited;
  LTitle[0] := '表格名称:';
  LTitle[1] := '表格说明:';
  if InputQuery('表格',LTitle,LValue) then
  begin
    if LValue[0].Trim = '' then
    begin
      ShowMessage('表名不能为空');
      Exit;
    end;
    if mteh1.Locate('TName',LValue[0],[loCaseInsensitive]) then
    begin
      ShowMessage('已经存在表名：' + lvalue[0]);
      Exit;
    end;

    if (Sender as TMenuItem).Tag = 200 then
      LParentIDKey := mteh1.FieldByName('ParentNodeIDKey').AsLargeInt;
    if (Sender as TMenuItem).Tag = 201 then
      LParentIDKey := mteh1.FieldByName('IDKey').AsLargeInt;
    LIDKey := qkCommfunc.CreateIDKey();
    //--eh
    mteh1.Append;
    mteh1.FieldByName('idkey').AsLargeInt := LIDKey;
    mteh1.FieldByName('ParentNodeIDKey').AsLargeInt := LParentIDKey;
    mteh1.FieldByName('TName').AsString := LValue[0];
    mteh1.FieldByName('BakNote').AsString := LValue[1];
    mteh1.FieldByName('UseFor').AsInteger := 0;
    mteh1.FieldByName('XCount').AsInteger := 0;
    mteh1.FieldByName('YCount').AsInteger := 0;
    mteh1.FieldByName('XVType').AsInteger := 0;
    mteh1.FieldByName('YVType').AsInteger := 0;
    mteh1.FieldByName('XType').AsInteger := 0;
    mteh1.FieldByName('YType').AsInteger := 0;
    mteh1.Post;
    //--firedac
    mtGrid.Append;
    mtGrid.FieldByName('idkey').AsLargeInt := LIDKey;
    mtGrid.FieldByName('ParentNodeIDKey').AsLargeInt := LParentIDKey;
    mtGrid.FieldByName('TName').AsString := LValue[0];
    mtGrid.FieldByName('BakNote').AsString := LValue[1];
    mtGrid.FieldByName('UseFor').AsInteger := 0;
    mtGrid.Post;
  end;
end;

procedure Tfrmqk1005002GridEdit.mniN3Click(Sender: TObject);
var
  LTitle,LValue: array [0..1] of string;
begin
  inherited;
  LTitle[0] := '表格名称:';
  LTitle[1] := '表格说明:';
  LValue[0] := mteh1.FieldByName('TName').AsString;
  LValue[1] := mteh1.FieldByName('BakNote').AsString;
  if InputQuery('表格',LTitle,LValue) then
  begin
    if LValue[0].Trim = '' then
    begin
      ShowMessage('表名不能为空');
      Exit;
    end;

    //--eh
    mteh1.Edit;
    mteh1.FieldByName('TName').AsString := LValue[0];
    mteh1.FieldByName('BakNote').AsString := LValue[1];
    mteh1.Post;
    //--firedac
    mtGrid.Edit;
    mtGrid.FieldByName('TName').AsString := LValue[0];
    mtGrid.FieldByName('BakNote').AsString := LValue[1];
    mtGrid.Post;
  end;
end;

procedure Tfrmqk1005002GridEdit.mniN4Click(Sender: TObject);
begin
  inherited;
  if mteh1.TreeNode.NodeHasChildren then
  begin
    ShowMessage('必须从最下级，逐级删除');
    Exit;
  end;
  if qkDialog.DeleConfig then
  begin
    while mtGridDetail.Locate('ParentNodeIDkey',mteh1.FieldByName('IDKey').AsLargeInt,[loCaseInsensitive]) do
      mtGridDetail.Delete;


    mtGrid.Delete;//在前面，mteh删除后locate会变动
    mteh1.Delete;

  end;
end;

procedure Tfrmqk1005002GridEdit.mteh1AfterScroll(DataSet: TDataSet);
begin
  if FDetailFrm <> nil then
  begin
    if FDetailFrm.btn1.Enabled = True then
    begin
      if MessageBox(Handle,'是否保存当前表格','提示',MB_YESNO) = IDYES then
      begin
        FDetailFrm.btn1Click(FDetailFrm.btn1);
      end;
    end;
  end;
  mtGrid.Locate('IDKey',mteh1.FieldByName('IDKey').AsLargeInt,[loCaseInsensitive]);
  mtGridDetail.Filter := 'Parent_Ptr = ' + mtGrid.FieldByName('IDKey').AsLargeInt.ToString;
  mtGridDetail.Filtered := True;
  if FDetailFrm <> nil then
    FDetailFrm.InitEdit(mtGrid,mtGridDetail);
end;

procedure Tfrmqk1005002GridEdit.pm1Popup(Sender: TObject);
begin
  inherited;
  if mteh1.FieldByName('ParentNodeIDKey').AsLargeInt = 0 then
  begin
    mniN1.Enabled := False;
    mniN2.Enabled := True;
    mniN3.Enabled := False;
    mniN4.Enabled := False;
  end else
  begin
    mniN1.Enabled := True;
    mniN2.Enabled := True;
    mniN3.Enabled := True;
    mniN4.Enabled := True;
  end;
end;

end.
