unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, ImgList,ComCtrls,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, StrUtils, DBGrids;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    N4: TMenuItem;
    N5: TMenuItem;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    BitBtn2: TBitBtn;
    pnl1: TPanel;
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Sqltext: string;
    procedure init;
    procedure CreateNode(ParentNode:TTreeNode;Query:TADOQuery);
    procedure CreateTree();
    procedure item_click(sender:TObject);
    { Private declarations }
  public
    SGrid_tmp1: TStringGrid;
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses common, UDM, UDetail, UQuery, rpt_model;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
   if not App_Init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title; 
   ///------
 {dm.ADOConnection1.Open;
  rkey73:= '96';
  user_ptr := '110';
  vprev := '4';   
  ////------  }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
  Sqltext := DM.employee_msg.SQL.Text;
end;

//初始化
procedure TMain_Form.init;
begin
  field_name := DBGridEh1.Columns[1].FieldName;
  PreColumn := DBGridEh1.Columns[1];
  DBGridEh1.Columns[1].Title.Color := clred ;
  Self.sSql:= DM.employee_msg.SQL.Text;
  with dm.tmp1 do
  begin
    dm.employee_department.Close;
    dm.employee_department.Open;
    dm.employee_msg.Close;
    dm.employee_msg.Open;
    CreateTree;
  end;
  DBGridEh1.Columns[9].Visible := False;
  DBGridEh1.Columns[18].Visible := False;
  DBGridEh1.Columns[19].Visible := False;
  DBGridEh1.Columns[20].Visible := False;
  DBGridEh1.Columns[21].Visible := False;
  DBGridEh1.Columns[22].Visible := False;
  DBGridEh1.Columns[26].Visible := False;
  DBGridEh1.Columns[27].Visible := False;
  DBGridEh1.Columns[29].Visible := False;
  DBGridEh1.Columns[30].Visible := False;
  DBGridEh1.Columns[31].Visible := False;
  
end;

procedure TMain_Form.CreateTree();
var
  BootNode: TTreeNode; //根结点
  NodeInfo: ^Integer; //rkey
begin
  TreeView1.Items.Clear;
  with DM.employee_department do
  begin
    Filtered := False;
    Filter := 'superior=0';
    Filtered := True;
    First;
    while not Eof do
    begin
      New(NodeInfo);
      NodeInfo^ := FieldByName('rkey').AsInteger;
      BootNode := TreeView1.Items.AddChildObject(nil,FieldByName('departmentname').AsString,NodeInfo); //添加根结点，并关联根结点信息
      CreateNode(BootNode,DM.employee_department);
      Next;
    end;
    First;
  end;
  TreeView1.ReadOnly := true;
  TreeView1.DragMode := dmAutomatic;
end;

procedure TMain_Form.CreateNode(ParentNode: TTreeNode;Query: TADOQuery);
var
ChildNode:TTreeNode; //孩子结点
NodeInfo:^Integer; //rkey
QueryTmp:TADOQuery;
begin
    QueryTmp := TADOQuery.Create(Self);
    QueryTmp.Clone(Query);
    with QueryTmp do
    begin
      Filtered := False;
      Filter := 'superior ='+IntToStr(Integer(ParentNode.Data^));
      Filtered := true; 
      while not Eof do
      begin
       New(NodeInfo);
       NodeInfo^:=FieldByName('rkey').AsInteger;
       ChildNode:=TreeView1.Items.AddChildObject(ParentNode,FieldByName('departmentname').AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
       CreateNode(ChildNode,Query); //递归
       Next;
      end;
      Free; //释放无用的query
    end;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if DM.employee_msg.IsEmpty then exit;
  i := DM.employee_msgrkey.AsInteger ;
  DM.employee_msg.Close;
  DM.employee_msg.Open;
  DM.employee_msg.Locate('rkey',i,[]);
  with dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select distinct(model_name) from dbo.employeemsg_rpt_model';
    Open;
  end;
  RadioGroup1.Items.Clear;
  for i := 0 to dm.tmp.RecordCount - 1 do
  begin
    RadioGroup1.Items.Add(dm.tmp.FieldValues['model_name']);
    dm.tmp.Next;
  end;
  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    DBGridEh1.Columns[i].Visible := True;
  end;
  DBGridEh1.Columns[9].Visible := False;
  DBGridEh1.Columns[18].Visible := False;
  DBGridEh1.Columns[19].Visible := False;
  DBGridEh1.Columns[20].Visible := False;
  DBGridEh1.Columns[21].Visible := False;
  DBGridEh1.Columns[22].Visible := False;
  DBGridEh1.Columns[26].Visible := False;
  DBGridEh1.Columns[27].Visible := False;
  DBGridEh1.Columns[29].Visible := False;
  DBGridEh1.Columns[30].Visible := False;
  DBGridEh1.Columns[31].Visible := False;
  Label3.Caption := IntToStr(DM.employee_msg.RecordCount);
end;

procedure TMain_Form.BtQryClick(Sender: TObject);
var
 i:byte;
begin
  with Query_Form do
  begin
     if ShowModal=mrok then
     begin
          with dm.employee_msg do
          begin
            close;
            SQL.Text:=self.sSql+#13;
            for i:=1 to SGrid1.RowCount-2 do
                SQL.Text:= SQL.Text+SGrid1.Cells[2,i]+#13;
                open;
          end;
     end;
  end;
    BitBtn3Click(Sender);
    Label3.Caption := inttostr( DM.employee_msg.RecordCount );
end;

procedure TMain_Form.BitBtn4Click(Sender: TObject);
begin
  if (StrToInt(vprev) <> 3) then
  begin
    ShowMessage('您的权限不够，需读银权限，请联系管理员！');
    Exit;
  end;
  if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'员工信息') ;
end;

procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin

 if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin

    column.Title.SortMarker:=smUpEh;
    DM.employee_msg.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_msg.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        label1.Caption:=column.Title.Caption;
        self.field_name:=column.FieldName;
        edit1.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
  end
  else
      edit1.SetFocus;
end;

procedure TMain_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.employee_msg.SQL.Text);
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TMain_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;

begin  if dm.ADOConnection1.Connected then
  begin
      DBGridEh1TitleClick(PreColumn);
      for i:=1 to DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

          if DBGridEh1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              PopupMenu2.Items.Add(item) ;
      end;
  end;
    DM.employee_msg.Close;
    DM.employee_msg.SQL.Text := DM.employee_msg.SQL.Text + ' and employeemsg.status = 1';
    DM.employee_msg.Open;
    Label3.Caption := inttostr( DM.employee_msg.RecordCount );
    SGrid_tmp1 := TStringGrid.Create(Self);
    BitBtn3Click(nil);
end;

procedure TMain_Form.BitBtn6Click(Sender: TObject);
begin
 if (StrToInt(vprev) <> 3)  then
  begin
    ShowMessage('您的权限不够，需读银权限，请联系管理员！');
    Exit;
  end;
    popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.N1Click(Sender: TObject);
var
  QueryTmp: TADOQuery;
  i: Integer;
begin
  if (StrToInt(vprev) <> 1) and (StrToInt(vprev) <> 3)  then
  begin
    ShowMessage('您的权限不够，请联系管理员！');
    Exit;
  end;
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  case Tmenuitem(Sender).Tag of
    0, 1, 4:
    with TDetail_Form.Create(nil) do
    try
         Ftag := Tmenuitem(Sender).Tag;
         initd ;
         ShowModal;
         {if ShowModal = mrok then
         begin
           DM.employee_msg.Close;
           DM.employee_msg.Open;
           DM.employee_msg.Locate('rkey', Frkeymsg, []);

           DM.ADOConnection1.BeginTrans;
           try
                DM.ADOEFR.Close;
                DM.ADOEFR.Parameters[0].Value := DM.employee_msgrkey.Value;
                DM.ADOEFR.Open;
                while not DM.ADOEFR.IsEmpty do
                DM.ADOEFR.Delete;
                for i := 1 to SGrid_tmp1.RowCount-1 do
                begin
                      DM.ADOEFR.Append;
                      DM.ADOEFR.FieldByName('employeeid').Value :=DM.employee_msgrkey.Value;
                      DM.ADOEFR.FieldByName('relationship').Value := SGrid_tmp1.Cells[0,i];
                      DM.ADOEFR.FieldByName('chinesename').Value := SGrid_tmp1.Cells[1,i];
                      DM.ADOEFR.FieldByName('birth').Value := SGrid_tmp1.Cells[2,i];
                      DM.ADOEFR.FieldByName('addr').Value := SGrid_tmp1.Cells[3,i];
                      DM.ADOEFR.FieldByName('workplace').Value := SGrid_tmp1.Cells[4,i];

                      DM.ADOEFR.FieldByName('remark').AsString := SGrid_tmp1.Cells[5,i];
                      with QueryTmp do
                      begin
                          close;
                          sql.Text:='select getdate() as sys_date';
                          open;
                          DM.ADOEFR.FieldByName('inputdate').AsString  := fieldvalues['sys_date'];
                      end;
                      if user_ptr <> '' then
                      DM.ADOEFR.FieldByName('opration_person').AsInteger  := StrToInt(Trim(user_ptr));
                      DM.ADOEFR.Post;
                end;
                DM.ADOEFR.UpdateBatch(arAll);
                DM.ADOConnection1.CommitTrans;
           except
            on e:Exception do
            begin
              DM.ADOConnection1.RollbackTrans;
              ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
            end;
           end;

         end; }
    finally
         free;
         DM.employee_msg_1.Close;
    end;
    {3:
    begin
      with dm.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from employeemsg where rkey='+dm.employee_msgrkey.AsString;
        Open;
        if FieldByName('roomcode').AsString <> '' then
        begin
          ShowMessage('该员工已有住宿记录，不能删除档案, 只能做离职处理！');
          Exit;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'select * from OnOffDutyData where employeeid='+dm.employee_msgrkey.AsString;
        Open;
        if FieldByName('CheckDate').AsString <> '' then
        begin
          ShowMessage('该员工已有打卡记录，不能删除档案, 只能做离职处理！');
          Exit;
        end;
      end;
      if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
      DM.ADOConnection1.BeginTrans;
      try
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from employeemsg  where rkey = '+dm.employee_msgRkey.AsString;
        if DM.tmp.ExecSQL=0 then
        begin
                DM.ADOConnection1.RollbackTrans;
                showmessage('删除数据失败,数据状态已发生变化...');
        end else
                DM.ADOConnection1.CommitTrans;
        BitBtn3Click(nil);
      except
        DM.ADOConnection1.RollbackTrans;
        showmessage('删除数据失败...');
      end;
     BitBtn3Click(nil);
    end;}
  end;
  QueryTmp.Free;
  //BitBtn3Click(nil)
end;

procedure TMain_Form.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
{  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := $00FFC4C4;
  If DM.employee_msg.FieldByName('status').AsInteger = 2 then
  Begin
      DBGridEh1.Canvas.Brush.Color := clMoneyGreen;
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed, gdFocused, gdSelected]);
  End;  }
end;

function isparent(child,parent:TTreeNode):Boolean;
var
  NodeTmp:TTreeNode;
begin
  NodeTmp:=child;
  while NodeTmp.Parent<>nil do
  begin
    if Integer(parent.Data^)=Integer(NodeTmp.Parent.Data^) then
      begin
        Result:=True;
        Exit;
      end;
    NodeTmp:=NodeTmp.Parent;
  end;
  Result:=False;
end;

procedure TMain_Form.TreeView1Click(Sender: TObject);
var
NodeSlt:TTreeNode;
P:TPoint;
Dep_Filter : string;
begin
    GetCursorPos(P);
    P := TreeView1.ScreenToClient(P);
    if (htOnButton in TreeView1.GetHitTestInfoAt(P.X,P.Y)) then exit;
    Dep_Filter := '';
    if TreeView1.Selected <> nil then
    begin
         NodeSlt:=TreeView1.Selected;
         Dep_Filter := 'rkeydep =   ' + IntToStr(Integer(NodeSlt.Data^));
         IF not( TreeView1.Selected.HasChildren ) then
         begin
                Dep_Filter := '';
                NodeSlt:=TreeView1.Selected;
                Dep_Filter := ' rkeydep = ' + IntToStr(Integer(NodeSlt.Data^)) + ' or ' + Dep_Filter;
                delete(Dep_Filter,length(Dep_Filter)-2,2);
         end else BEGIN
                NodeSlt := TreeView1.Selected.GetFirstChild;
                if TreeView1.Selected.Level = 0 then
                begin
                     Dep_Filter := '';
                end else begin
                        while  (NodeSlt <> nil) and (NodeSlt.Level > TreeView1.Selected.Level) do
                        begin
                              Dep_Filter := ' rkeydep = ' + IntToStr(Integer(NodeSlt.Data^)) + ' or ' + Dep_Filter;
                              //ShowMessage(Dep_Filter);
                              NodeSlt := NodeSlt.GetNext;
                        end;
                        //delete(Dep_Filter,length(Dep_Filter)-2,2);
                end;
         end;
    end;
    // ShowMessage(Dep_Filter);
    with DM.employee_msg do
    begin
          Filtered:=False;
          Filter:= Dep_Filter;
          Filtered:=true;
          Label3.Caption := inttostr( RecordCount );
    end;
end;

procedure TMain_Form.TreeView1GetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.HasChildren then Node.ImageIndex:=1 else Node.ImageIndex:=2
end;

procedure TMain_Form.CheckBox1Click(Sender: TObject);
begin
    if CheckBox1.Checked = True then
    begin
          DM.employee_msg.Close;
          DM.employee_msg.SQL.Text := Sqltext + ' and dbo.employeemsg.status = 2 ';
          DM.employee_msg.Open;
    end;
    if CheckBox1.Checked = False then
    begin
          DM.employee_msg.Close;
          DM.employee_msg.SQL.Text := Sqltext + ' and dbo.employeemsg.status = 1 ';
          DM.employee_msg.Open;
    end;
    if CheckBox2.Checked = True then
    begin
          DM.employee_msg.Close;
          DM.employee_msg.SQL.Text := Sqltext;
          DM.employee_msg.Open;
    end;
    Label3.Caption := inttostr( DM.employee_msg.RecordCount );
end;

procedure TMain_Form.CheckBox2Click(Sender: TObject);
begin
    if CheckBox2.Checked = True then
    begin
          DM.employee_msg.Close;
          DM.employee_msg.SQL.Text := Sqltext;
          DM.employee_msg.Open;
    end;
    if (CheckBox2.Checked = False) and (CheckBox1.Checked = False) then
    begin
          DM.employee_msg.Close;
          DM.employee_msg.SQL.Text := Sqltext + ' and dbo.employeemsg.status = 1 ';
          DM.employee_msg.Open;
    end;
    if (CheckBox2.Checked = False) and (CheckBox1.Checked = True) then
    begin
          DM.employee_msg.Close;
          DM.employee_msg.SQL.Text := Sqltext + ' and dbo.employeemsg.status = 2 ';
          DM.employee_msg.Open;
    end;
    Label3.Caption := inttostr( DM.employee_msg.RecordCount );
    
end;

procedure TMain_Form.BitBtn2Click(Sender: TObject);
begin
  if (StrToInt(vprev) <> 4)  then
  begin
    ShowMessage('您的权限不够，请联系管理员！');
    Exit;
  end;
  FrmModel := TFrmModel.Create(Application);
  FrmModel.ShowModal;
  FrmModel.Free;
end;

procedure TMain_Form.RadioGroup1Click(Sender: TObject);
var
  ss: string;
  i, j: Integer;
  //A: Array of integer ;
begin
//单击某个模版，过滤相应字段
  for i := 0 to DBGridEh1.Columns.Count - 1 do
  begin
    DBGridEh1.Columns[i].Visible := False;
  end;

  ss := RadioGroup1.Items.Strings[RadioGroup1.ItemIndex];
  with dm.tmp do
  begin
    SQL.Clear;
    SQL.Text := 'select datafield_name from employeemsg_rpt_model where model_name =' +quotedstr(ss) + ' ORDER BY F_INDEX';
    Open;
  end;

  //setlength(A, dm.tmp.RecordCount);

  for j := 0 to dm.tmp.RecordCount - 1 do
  begin
    for i := 0 to DBGridEh1.Columns.Count - 1  do
    begin
      if (dm.tmp.FieldValues['datafield_name'] = DBGridEh1.Columns[i].Title.Caption ) then
      begin
        DBGridEh1.Columns[i].Visible := True;
           if (StrToInt(vprev) <> 3) and (DBGridEh1.Columns[i].Title.Caption='身份证号码')  then
            begin
              DBGridEh1.Columns[i].Visible := False;
            end;
           if (StrToInt(vprev) <> 3) and (DBGridEh1.Columns[i].Title.Caption='身份证地址')  then
            begin
              DBGridEh1.Columns[i].Visible := False;
            end;
        DBGridEh1.Columns[i].Index := j;
      end;//A[j] := i;
    end;
    dm.tmp.Next;
  end;




end;

procedure TMain_Form.DBGridEh1DblClick(Sender: TObject);
begin
  Self.N5.Click;
end;

procedure TMain_Form.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
{  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4; }
end;

end.
