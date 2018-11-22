unit SysuserEdit_Mod474;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ImgList, Datasnap.DBClient, Data.DB,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus;

type
  TfrmSysuserEdit_Mod474 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    il1: TImageList;
    grp1: TGroupBox;
    grp2: TGroupBox;
    tv1: TTreeView;
    cdsModUserAuthCards: TClientDataSet;
    dsModUserAuthCards: TDataSource;
    ehUserCards: TDBGridEh;
    pm1: TPopupMenu;
    mniDeleteCard: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pnl5: TPanel;
    btnAddOne: TButton;
    btnDeleOne: TButton;
    btnMutiAdd: TButton;
    btnMutiDele: TButton;
    pmAddOne: TPopupMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btnSaveClick(Sender: TObject);
    procedure mniAddCardClick(Sender: TObject);
    procedure mniDeleteCardClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddOneClick(Sender: TObject);
    procedure btnMutiDeleClick(Sender: TObject);
    procedure btnMutiAddClick(Sender: TObject);
  private
    { Private declarations }
    function GetTreeChildNodeModID(ANode: TTreeNode): string;
  public
    { Public declarations }
    FTargetUser73: string;
    //FNowSelectModID: Integer;
    procedure Init;
    procedure GetData(AModID: string);
    procedure get_treedate(ATreeView: TTreeView);
  end;

var
  frmSysuserEdit_Mod474: TfrmSysuserEdit_Mod474;

implementation

uses
  uCommFunc;

{$R *.dfm}

function TfrmSysuserEdit_Mod474.GetTreeChildNodeModID(ANode: TTreeNode): string;
var
  I: Integer;
begin
  if ANode.Data <> nil then
    Result := IntToStr(Integer(ANode.Data))
  else
    Result := '-1';
  if ANode.HasChildren then
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      Result := Result + ',' + GetTreeChildNodeModID(ANode.Item[I]);
    end;
  end else
  begin

  end;
end;

procedure TfrmSysuserEdit_Mod474.btnAddOneClick(Sender: TObject);
var
  LCds: TClientDataSet;
  LModID: string;
  LItem: TMenuItem;
  LPoint: TPoint;
begin
  inherited;
  while pmAddOne.Items.Count > 0 do
  begin
    pmAddOne.Items[0].Free;
  end;

  if tv1.Selected.HasChildren or (tv1.Selected.Data = nil) then Exit;

  LModID := IntToStr(Integer(tv1.Selected.Data));

  LCds := TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql('select * from Tier3_ModAuthCard where modid = ' + LModID,LCds) then
    begin
      if not LCds.IsEmpty then
      begin
        LCds.First;
        while not LCds.Eof do
        begin
          LItem := TMenuItem.Create(pmAddOne);
          LItem.Caption := LCds.FieldByName('AuthCardName').AsString + ' : ' + LCds.FieldByName('AuthCardDesc').AsString + ' ';
          LItem.Hint := LCds.FieldByName('IDKEy').AsString;
          LItem.OnClick := mniAddCardClick;
          pmAddOne.Items.Add(LItem);
          LCds.Next;
        end;
      end;
    end;

    LPoint := pnl5.ClientToScreen(Point(btnAddOne.Left + btnAddOne.Width,btnAddOne.Top));
    if pmAddOne.Items.Count > 0 then
      pmAddOne.Popup(LPoint.X,LPoint.Y);
  finally
    LCds.Free;
  end;
end;

procedure TfrmSysuserEdit_Mod474.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSysuserEdit_Mod474.btnMutiAddClick(Sender: TObject);
var
  LCds: TClientDataSet;
  LModArr: string;
  LSql: string;
  LNowTime: TDateTime;
begin
  inherited;
  LNowTime := gFunc.GetSvrDateTime;
  LCds := TClientDataSet.Create(Self);
  try
    LModArr := '(' + GetTreeChildNodeModID(tv1.Selected) + ')';

    LSql := ' SELECT t1.ModID,t1.IDKey, t1.AuthCardName,t1.AuthCardDesc,d419.DESCRIPTION FROM Tier3_ModAuthCard t1 ' +
            ' INNER JOIN Data0419 d419 ON d419.ModID = t1.ModID ' +
            ' WHERE t1.modid in ' + LModArr +
            ' ORDER BY d419.manu_ptr,d419.SEQ_NO asc ';

    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      if not LCds.IsEmpty then
      begin
        cdsModUserAuthCards.DisableControls;
        try
          while not LCds.Eof do
          begin
            if not cdsModUserAuthCards.Locate('ModAuthCard_IDKey',LCds.FieldByName('IDKey').AsString,[loCaseInsensitive]) then
            begin
              cdsModUserAuthCards.Append;
              cdsModUserAuthCards.FieldByName('D73_Ptr').AsString := FTargetUser73;
              cdsModUserAuthCards.FieldByName('AdminD73_Ptr').AsString := gVar.rkey73;
              cdsModUserAuthCards.FieldByName('Createtime').AsDateTime := LNowTime;
              cdsModUserAuthCards.FieldByName('IDKey').AsString := gFunc.CreateIDKey;
              cdsModUserAuthCards.FieldByName('ModID').AsString := LCds.FieldByName('ModID').AsString;
              cdsModUserAuthCards.FieldByName('ModAuthCard_IDKey').AsString := LCds.FieldByName('IDKey').AsString;
              cdsModUserAuthCards.FieldByName('Status').AsInteger := 1;

              //辅助字段
              cdsModUserAuthCards.FieldByName('AuthCardName').AsString := LCds.FieldByName('AuthCardName').AsString;
              cdsModUserAuthCards.FieldByName('AuthCardDesc').AsString := LCds.FieldByName('AuthCardDesc').AsString;
              cdsModUserAuthCards.FieldByName('DESCRIPTION').AsString := LCds.FieldByName('DESCRIPTION').AsString;

              cdsModUserAuthCards.Post;
            end;

            LCds.Next;
          end;
        finally
          cdsModUserAuthCards.EnableControls;
        end;

      end;
    end;

  finally
    LCds.Free;
  end;
end;

procedure TfrmSysuserEdit_Mod474.btnMutiDeleClick(Sender: TObject);
begin
  inherited;
  while not cdsModUserAuthCards.IsEmpty do
    cdsModUserAuthCards.Delete;
end;

procedure TfrmSysuserEdit_Mod474.btnSaveClick(Sender: TObject);
begin
  inherited;
  if cdsModUserAuthCards.State in [dsEdit,dsInsert] then cdsModUserAuthCards.Post;
  if cdsModUserAuthCards.ChangeCount > 0 then
  begin
    if gSvrIntf.IntfPostDataByTable('Tier3_UserModAuthCards',cdsModUserAuthCards.Delta) then
    begin
      cdsModUserAuthCards.MergeChangeLog;
      ShowMessage('保存成功');
    end;
  end;
end;

procedure TfrmSysuserEdit_Mod474.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmSysuserEdit_Mod474 := nil;
end;

procedure TfrmSysuserEdit_Mod474.GetData(AModID: string);
var
  LSql1: string;
begin
  FModID := StrToInt(AModID);

  LSql1 := cdsModUserAuthCards.CommandText;
  LSql1 := StringReplace(LSql1,':p1',FTargetUser73,[rfReplaceAll, rfIgnoreCase]);

  if gSvrIntf.IntfGetDataBySql(LSql1,cdsModUserAuthCards) then
  begin

  end;
end;

procedure TfrmSysuserEdit_Mod474.get_treedate(ATreeView: TTreeView);
var
  LNode,LNode2,LNode3: ttreenode; // treeview控件的节点变量
  LCds1, LCds2, LCds3: TClientDataSet;
  LSql1, LSql2, LSql3: string;
begin
  LSql1 := 'select DESCRIPTION,RKey,image_index from SYSTEM_MAIN order by seq_no';
  LSql2 := 'select DESCRIPTION,main_ptr,rkey,image_index from SYSTEM_MENU order by main_ptr, seq_no';
  LSql3 := 'SELECT DESCRIPTION,manu_ptr,ModID FROM Data0419 where manu_ptr>0 ORDER BY manu_ptr,SEQ_NO';

  LCds1 := TClientDataSet.Create(Self);
  LCds2 := TClientDataSet.Create(Self);
  LCds3 := TClientDataSet.Create(Self);

  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql1, LSql2,LSql3]), [LCds1, LCds2,LCds3]);
  try
    while not LCds1.Eof do
    begin
      LNode := ATreeView.Items.AddChild(nil,LCds1.FieldByName('DESCRIPTION').AsString);
      LNode.ImageIndex := LCds1.FieldByName('image_index').AsInteger;
      LNode.SelectedIndex := 40;

      LCds2.Filter := 'main_ptr=' + LCds1.fieldbyname('rkey').AsString;
      LCds2.Filtered := True;
      lcds2.First;
      while not LCds2.Eof do
      begin
        LNode2 := ATreeView.Items.AddChild(LNode,LCds2.FieldByName('DESCRIPTION').AsString);
        LNode2.ImageIndex := LCds2.FieldByName('image_index').AsInteger + 10;
        LNode2.SelectedIndex := 40;

        LCds3.Filter := 'manu_ptr=' + LCds2.fieldbyname('rkey').AsString;
        LCds3.Filtered := True;
        LCds3.First;
        while not LCds3.Eof do
        begin
          LNode3 := ATreeView.Items.AddChildObject(LNode2,LCds3.FieldByName('DESCRIPTION').AsString,
            Pointer(LCds3.FieldByName('ModID').AsInteger));
          LNode3.ImageIndex := -1;
          LNode3.SelectedIndex := 40;
          LCds3.Next;
        end;
        LCds2.Next;
      end;
      LCds1.Next;
    end;
  finally
    LCds1.Free;
    LCds2.Free;
    LCds3.Free;
  end;
  ATreeView.FullCollapse; // 全部折叠
  ATreeView.Items[0].Selected := true;
end;

procedure TfrmSysuserEdit_Mod474.Init;
//var
//  LLKField: TField;
//  I: Integer;
begin
  (*
  gSvrIntf.IntfGetDataBySql('SELECT * FROM Tier3_UserModAuthCards WHERE 1=0',cdsModUserAuthCards);
  //在数据集关闭的情况下新增加一个字段
  try
    cdsModUserAuthCards.Close;
    cdsModUserAuthCards.FieldDefs.BeginUpdate;
    for i := 0 to cdsModUserAuthCards.FieldDefList.Count - 1 do
    begin
      cdsModUserAuthCards.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    //Add New Field
   //增加新的字段
    LLKField := TStringField.Create(cdsModUserAuthCards);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'AuthCardName';
    LLKField.KeyFields := 'ModAuthCard_IDKey';
    LLKField.LookupDataSet := cdsLookUpAuthCard;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'AuthCardName';
    LLKField.DataSet := cdsModUserAuthCards;

    LLKField := TStringField.Create(cdsModUserAuthCards);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'AuthCardDesc';
    LLKField.KeyFields := 'ModAuthCard_IDKey';
    LLKField.LookupDataSet := cdsLookUpAuthCard;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'AuthCardDesc';
    LLKField.DataSet := cdsModUserAuthCards;

  finally
    cdsModUserAuthCards.FieldDefs.EndUpdate;
  end;

  gSvrIntf.IntfGetDataBySql('SELECT * FROM Tier3_UserAddsModOperator WHERE 1=0',cdsUserAddsModOperator);
  //在数据集关闭的情况下新增加一个字段
  try
    cdsUserAddsModOperator.Close;
    cdsUserAddsModOperator.FieldDefs.BeginUpdate;
    for i := 0 to cdsUserAddsModOperator.FieldDefList.Count - 1 do
    begin
      cdsUserAddsModOperator.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    //Add New Field
   //增加新的字段
    LLKField := TStringField.Create(cdsUserAddsModOperator);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'OperatorID';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsLookupUserAddOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'OperatorID';
    LLKField.DataSet := cdsUserAddsModOperator;

    LLKField := TStringField.Create(cdsUserAddsModOperator);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'OperatorName';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsLookupUserAddOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'OperatorName';
    LLKField.DataSet := cdsUserAddsModOperator;

    LLKField := TStringField.Create(cdsUserAddsModOperator);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'OperatorDesc';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsLookupUserAddOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'OperatorDesc';
    LLKField.DataSet := cdsUserAddsModOperator;

    LLKField := TStringField.Create(cdsUserAddsModOperator);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'USER_FULL_NAME';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsLookupUserAddOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'USER_FULL_NAME';
    LLKField.DataSet := cdsUserAddsModOperator;

  finally
    cdsUserAddsModOperator.FieldDefs.EndUpdate;
  end;
   *)
  get_treedate(tv1);
end;

procedure TfrmSysuserEdit_Mod474.mniAddCardClick(Sender: TObject);
var
  LIDKey: string;
  LModID: string;
  LStrArr: TArray<string>;
begin
  inherited;

  if tv1.Selected.HasChildren or (tv1.Selected.Data = nil) then Exit;
  LIDKey := (Sender as TMenuItem).Hint;
  LModID := IntToStr(Integer(tv1.Selected.Data));
  LStrArr := (Sender as TMenuItem).Caption.Split([':']);

  if not cdsModUserAuthCards.Locate('ModAuthCard_IDKey',LIDKey,[loCaseInsensitive]) then
  begin
    cdsModUserAuthCards.Append;
    cdsModUserAuthCards.FieldByName('D73_Ptr').AsString := FTargetUser73;
    cdsModUserAuthCards.FieldByName('AdminD73_Ptr').AsString := gVar.rkey73;
    cdsModUserAuthCards.FieldByName('Createtime').AsDateTime := gFunc.GetSvrDateTime;
    cdsModUserAuthCards.FieldByName('IDKey').AsString := gFunc.CreateIDKey;
    cdsModUserAuthCards.FieldByName('ModID').AsString := LModID;
    cdsModUserAuthCards.FieldByName('ModAuthCard_IDKey').AsString := LIDKey;
    cdsModUserAuthCards.FieldByName('Status').AsInteger := 1;

    //辅助字段
    cdsModUserAuthCards.FieldByName('AuthCardName').AsString := LStrArr[0];
    cdsModUserAuthCards.FieldByName('AuthCardDesc').AsString := LStrArr[1];
    cdsModUserAuthCards.FieldByName('DESCRIPTION').AsString := tv1.Selected.Text;

    cdsModUserAuthCards.Post;
  end;

end;

procedure TfrmSysuserEdit_Mod474.N3Click(Sender: TObject);
var
  LSql: string;
  LCds: TClientDataSet;
  LStr: string;
begin
  inherited;
  LStr := '令牌包含功能：' + #13;
  LSql := ' SELECT OperatorID,OperatorName,OperatorDesc FROM Tier3_ModAuthCard ' +
          ' INNER JOIN Tier3_ModAuthCardOperators ON Tier3_ModAuthCard.IDKey = ModAuthCard_IDKey ' +
          ' INNER JOIN Tier3_ModOperators ON ModOperator_IDKey = Tier3_ModOperators.IDKey ' +
          ' WHERE Tier3_ModAuthCard.IDKey = ' + QuotedStr(cdsModUserAuthCards.FieldByName('ModAuthCard_IDKey').AsString);
  LCds := TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        LStr := LStr + LCds.FieldByName('OperatorID').AsString + ' : ' + LCds.FieldByName('OperatorName').AsString + '(' + LCds.FieldByName('OperatorDesc').AsString + ')' + #13;
        LCds.Next;
      end;
    end;
    ShowMessage(LStr);
  finally
    LCds.Free;
  end;
end;

procedure TfrmSysuserEdit_Mod474.mniDeleteCardClick(Sender: TObject);
begin
  inherited;
  if cdsModUserAuthCards.Active and (not cdsModUserAuthCards.IsEmpty) then
    cdsModUserAuthCards.Delete;
end;

procedure TfrmSysuserEdit_Mod474.pm1Popup(Sender: TObject);
begin
  inherited;
  mniDeleteCard.Enabled := not cdsModUserAuthCards.IsEmpty;
end;

procedure TfrmSysuserEdit_Mod474.tv1Change(Sender: TObject; Node: TTreeNode);
var
  LModIDStr: string;
begin
  inherited;
  btnAddOne.Enabled := not Node.HasChildren;

  LModIDStr := GetTreeChildNodeModID(Node);
  LModIDStr := '(' + LModIDStr + ')';

  cdsModUserAuthCards.Filter := 'ModId IN ' + LModIDStr;
  cdsModUserAuthCards.Filtered := True;

  if cdsModUserAuthCards.Active then
    cdsModUserAuthCards.First;
end;

end.
