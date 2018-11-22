unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    SGrid: TStringGrid;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    BtnSave: TBitBtn;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label2: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    N3: TMenuItem;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure SGridExit(Sender: TObject);
    procedure N3Click(Sender: TObject);
//    procedure N3Click(Sender: TObject);
  private
  function returen_rkey73list():string;
  procedure Assignment;
  public
    Ftag:integer;
    FGrd:TDBGridEh;
    procedure initd;
  end;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar, Pick_WorkShop;

{$R *.dfm}

procedure TFrm_detail.initd;
var i,j:integer;
begin
  SGrid.ColCount:=6;
  SGrid.RowCount:=2;
  for i:=1 to 4 do
   begin
    SGrid.Cells[i,0]:=FGrd.Columns[i-1].Title.Caption;
    SGrid.ColWidths[i]:=FGrd.Columns[i-1].Width;
   end;
  SGrid.Cells[0,0] := '序号';
  SGrid.Cells[5,0]:='rkey73';
  SGrid.ColWidths[5]:=-1;
  if Ftag=0 then
   begin
    self.Caption:='审批流程-新增';
    DM.ADO94_1.Close;
    DM.ADO94_1.Parameters[0].Value:=-1;
    DM.ADO94_1.Open;
    dm.ADO94_1.Append;
    DM.ADO275_1.Close;
    DM.ADO275_1.Parameters[0].Value:=-1;
    DM.ADO275_1.Open;
   end
  else
  begin
    EdtDept.Text:=DM.ADO94.Fieldbyname('dept_code').AsString;
    label6.Caption:=DM.ADO94.Fieldbyname('Dept_name').AsString;
    EdtDept.Tag:=DM.ADO94.Fieldbyname('Dept_ptr').AsInteger;
      
    if Ftag<>3 then
    begin
      DM.ADO94_1.Close;
      DM.ADO94_1.Parameters[0].Value:=DM.ADO94rkey.Value;
      DM.ADO94_1.Open;

      DM.ADO275_1.Close;
      DM.ADO275_1.Parameters[0].Value:=DM.ADO94rkey.Value;
      DM.ADO275_1.Open;
    end;

    if Ftag=1 then
    begin
      self.Caption:='审批流程-修改';
      dm.ADO94_1.Edit;
    end
    else
    if Ftag=2 then
     begin
      self.Caption:='审批流程-查看';
      BtnSave.Enabled:=false;
      SpeedButton1.Enabled:=false;
      EdtDept.Enabled:=false;
     end
    else
    if Ftag=3 then
    begin
     self.Caption:='审批流程-复制';
      DM.ADO94_1.Close;
      DM.ADO94_1.Parameters[0].Value:=-1;
      DM.ADO94_1.Open;
      DM.ADO94_1.Append;
      for i:=0 to DM.ADO94_1.FieldCount-1 do
      if (uppercase(DM.ADO94_1.Fields[i].FullName)<>'RKEY') and (uppercase(DM.ADO94_1.Fields[i].FullName)<>'CODE') then
      DM.ADO94_1.Fields[i].Value:=DM.ADO94.fieldbyname(DM.ADO94_1.Fields[i].FullName).Value;

      DM.ADO275_1.Close;
      DM.ADO275_1.Parameters[0].Value:=-1;
      DM.ADO275_1.Open;
      while not DM.ADO275.Eof do
      begin
        DM.ADO275_1.Append;
        for i:=0 to DM.ADO275_1.FieldCount-1 do
        if uppercase(DM.ADO275_1.Fields[i].FullName)<>'RKEY' then
        DM.ADO275_1.Fields[i].Value:=DM.ADO275.fieldbyname(DM.ADO275_1.Fields[i].FullName).Value;
        DM.ADO275.Next;
      end;
    end;

//    DM.ADO275.Close;
//    DM.ADO275.Open;

    j:=1;
    DM.ADO275.First;
    while not DM.ADO275.Eof do
     begin
      for i:=1 to 4 do
      SGrid.Cells[i,j]:=FGrd.Columns[i-1].Field.AsString;
      SGrid.Cells[5,j]:=DM.ADO275.fieldbyname('user_PTR').AsString;
      SGrid.RowCount:=SGrid.RowCount+1;
      inc(j);
      DM.ADO275.Next;
     end;
   for i := 1 to SGrid.RowCount-2 do
   begin
    SGrid.Cells[0,i] := IntToStr(i);
   end;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
begin
  if DBEdit1.Text='' then
  begin
    showmessage('流程代码不能为空...');
    exit;
  end;
  if DBEdit2.Text='' then
  begin
    showmessage('流程说明不能为空...');
    exit;
  end;
  if DBRadioGroup1.Value='' then
  begin
    showmessage('审批类别不能为空...');
    exit;
  end;
  if EdtDept.Text='' then
  begin
    showmessage('部门不能为空...');
    exit;
  end;
  if SGrid.RowCount=2 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;
  for i :=1 to SGrid.RowCount-2 do
  if strtofloat(SGrid.Cells[4,i])<strtofloat(SGrid.Cells[3,i]) then
  begin
    Messagedlg('上限金额不能小于下限金额...',mtinformation,[mbok],0);
    SGrid.Row :=i;
    Exit;
  end;

  try
   DM.ADOCon.BeginTrans;

   DM.ADO94_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
   DM.ADO94_1.Post;

    with DM.tmp do
    begin
      Close;
      SQL.Text :='delete data0275 where auth_group_ptr='+DM.ADO94_1.FieldByName('rkey').AsString;
      ExecSQL;
    end;
    for i:=1 to SGrid.RowCount-2 do
    begin
      if (DM.ADO275_1.Locate('user_ptr',strtoint(sGrid.Cells[5,i]),[])) and (Ftag = 3)  then
      begin
        DM.ADO275_1.Edit;
      end
      else
      begin
        DM.ADO275_1.Append;
      end;
      DM.ADO275_1.FieldByName('AUTH_GROUP_PTR').AsInteger:=DM.ADO94_1.FieldByName('rkey').AsInteger;
      DM.ADO275_1.FieldByName('LOWER_LIMIT').AsString:=SGrid.Cells[3,i];
      DM.ADO275_1.FieldByName('UPPER_LIMIT').AsString:=SGrid.Cells[4,i];
      DM.ADO275_1.FieldByName('user_ptr').AsString:=SGrid.Cells[5,i];
      DM.ADO275_1.Post;
    end;


//    DM.ADO94_1.UpdateBatch(arAll);
//    for i:=1 to SGrid.RowCount-2 do
//    if DM.ADO275_1.Locate('user_ptr',strtoint(sGrid.Cells[5,i]),[]) then
//    begin
//      DM.ADO275_1.Edit;
//      DM.ADO275_1.FieldByName('AUTH_GROUP_PTR').AsInteger:=DM.ADO94_1.FieldByName('rkey').AsInteger;
//      DM.ADO275_1.FieldByName('LOWER_LIMIT').AsString:=SGrid.Cells[3,i];
//      DM.ADO275_1.FieldByName('UPPER_LIMIT').AsString:=SGrid.Cells[4,i];
//      DM.ADO275_1.FieldByName('user_ptr').AsString:=SGrid.Cells[5,i];
//      DM.ADO275_1.Post;
//    end
//    else
//    begin
//      DM.ADOCon.RollbackTrans;
//      showmessage('错误...');
//      abort;
//    end;
    DM.ADO275_1.UpdateBatch(arAll);

    DM.ADOCon.CommitTrans;
    Frkey94:=DM.ADO94_1.FieldByName('rkey').asinteger;
    modalresult:=mrok;
  except
    on E: Exception do
    begin
     dm.ADOCon.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid.RowCount <= 2 then exit;
  if (DM.ADO275_1.Locate('user_PTR',strtoint(sGrid.Cells[5,sgrid.Row]),[])) and (Ftag=3) then
  begin
    DM.ADO275_1.Delete;
  end;
  for i:=sgrid.Row to sgrid.RowCount-2 do
    sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
  sgrid.RowCount:=sgrid.RowCount-1;

end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  if Ftag=2 then abort;
  N2.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
//  N3.Enabled:=N2.Enabled;
  N3.Enabled:=(N2.Enabled) and ((Ftag=1) or (Ftag=3));
end;

procedure TFrm_detail.SGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    SGrid.MouseToCell(x,y,column,row);
    if row<>0 then SGrid.Row:=row;
  end;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/150';
   InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' when ttype=5 then ''班组'' else ''工序'' end xz from data0034 where ttype in (4,5) or is_cost_dept=1';
   inputvar.KeyField:='Dept_code';
   InputVar.AdoConn := DM.ADOCon ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
     EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
     label6.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
     EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   end ;
  finally
  frmPick_Item_Single.Free ;
  end;

end;

procedure TFrm_detail.EdtDeptExit(Sender: TObject);
begin
  if (EdtDept.Text='') or (Ftag=3) then exit;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (4,5) or is_cost_dept=1) '+
                    'and dept_code='''+EdtDept.Text+'''';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
  begin
    messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
    label6.Caption := '';
    EdtDept.SetFocus;
  end
  else
  begin
    EdtDept.Text:=DM.tmp.FieldValues['dept_code'];
    label6.Caption:=DM.tmp.FieldValues['dept_name'];
    EdtDept.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
  end;
end;

procedure TFrm_detail.Assignment;
begin
  if SGrid.Row <> SGrid.RowCount-1  then
  begin
    if SGrid.Cells[4,SGrid.Row]=''  then
    SGrid.Cells[4,SGrid.Row]:='0';
    if SGrid.Cells[4,SGrid.Row]='.' then
    SGrid.Cells[4,SGrid.Row]:='0';
    if SGrid.Cells[3,SGrid.Row]='' then
    SGrid.Cells[3,SGrid.Row]:='0';
    if SGrid.Cells[3,SGrid.Row]='.' then
    SGrid.Cells[3,SGrid.Row]:='0';
  end;
end;

procedure TFrm_detail.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if Ftag=2 then exit;
  Assignment;
  
 //  SGrid.Cells[3,SGrid.Row]:= formatfloat('0.00',strtofloat(SGrid.Cells[3,SGrid.Row]));
{  if ARow <> SGrid.RowCount-2 then
  begin
  if strtofloat(SGrid.Cells[3,SGrid.Row])<strtofloat(SGrid.Cells[2,SGrid.Row]) then
  begin
   Messagedlg('上限金额不能小于下限金额...',mtinformation,[mbok],0);
   CanSelect := False;
  end;
  end;   }
  if (ARow<>SGrid.RowCount-1) and ((ACol=4) or (ACol=3)) then
  begin
    sGrid.Options := sGrid.Options-[goRowSelect];
    sGrid.Options := sGrid.Options+[goEditing];
  end
  else
  begin
    sGrid.Options := sGrid.Options+[goRowSelect];
    sGrid.Options := sGrid.Options-[goEditing];
  end;

end;

procedure TFrm_detail.SGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ftag<>2) and (sGrid.Col=4) then
  begin
    if not (key in ['0'..'9','.',#8]) then abort
    else
    if key = chr(46) then
    if pos('.',SGrid.Cells[4,SGrid.row])>0  then abort  //第二列小数点'.'不能重复
  end;
  if (sGrid.Col=3) and (Ftag<>2) then
  begin
    if not (key in ['0'..'9','.',#8]) then abort
    else
    if key = chr(46) then
    if pos('.',SGrid.Cells[3,SGrid.row])>0  then abort;
  end
end;

procedure TFrm_detail.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CellString : string;
begin
  CellString := SGrid.Cells[ACol,ARow];
  if  ARow=0 then
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)) div 2,
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString)
  else if (ARow<>0) and (ACol>2)  then    //数字居右
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)),
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString);
end;

function TFrm_detail.returen_rkey73list: string;
var
  rkey73list:string;
  i:integer;
begin
  rkey73list:='(';
  for i:= 1 to SGrid.RowCount-2 do
  if i=SGrid.RowCount-2 then
  rkey73list:=rkey73list+SGrid.Cells[5,i]+')'
  else
  rkey73list:=rkey73list+SGrid.Cells[5,i]+',';
  returen_rkey73list:=rkey73list;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
begin
  try
   frmPick_WorkShop:=TfrmPick_WorkShop.Create(Application);
   if SGrid.RowCount>2 then
   frmPick_WorkShop.ads73.CommandText:=frmPick_WorkShop.ads73.CommandText+
   'and (rkey not in'+self.returen_rkey73list+') ';
   frmPick_WorkShop.Enter(0);
   if frmPick_WorkShop.ShowModal=mrok then
   begin
     frmPick_WorkShop.ads73clientds.First;
     while not frmPick_WorkShop.ads73clientds.Eof do
     begin
       SGrid.Cells[1,SGrid.RowCount-1]:=frmPick_WorkShop.ads73clientdsUSER_LOGIN_NAME.Value;
       SGrid.Cells[2,SGrid.RowCount-1]:=frmPick_WorkShop.ads73clientdsUSER_FULL_NAME.Value;
       SGrid.Cells[5,SGrid.RowCount-1]:=frmPick_WorkShop.ads73clientdsrKey.AsString;
       SGrid.Cells[3,SGrid.RowCount-1]:='0';
       SGrid.Cells[4,SGrid.RowCount-1]:='0';
       SGrid.Cells[0,SGrid.RowCount-1]:=IntToStr(SGrid.RowCount-1);
       if Ftag = 3 then
       begin
         DM.ADO275_1.Append;
         DM.ADO275_1.FieldByName('USER_PTR').AsString:=SGrid.Cells[5,SGrid.RowCount-1];
         DM.ADO275_1.Post;
       end;

       SGrid.RowCount:=SGrid.RowCount+1;
       frmPick_WorkShop.ads73clientds.Next;
     end;
   end;
  finally
  frmPick_WorkShop.Free;
  end;
end;

procedure TFrm_detail.SGridExit(Sender: TObject);
begin
  Assignment;
end;


procedure TFrm_detail.N3Click(Sender: TObject);
var
  row:Integer;
  user_pt:Integer;
begin
  try
   frmPick_WorkShop:=TfrmPick_WorkShop.Create(Application);
   if SGrid.RowCount>2 then
   frmPick_WorkShop.ads73.CommandText:=frmPick_WorkShop.ads73.CommandText+
   'and (rkey not in'+self.returen_rkey73list+') ';
   frmPick_WorkShop.Enter(0);
   row := SGrid.Row;
   user_pt := strtoint(sGrid.Cells[5,SGrid.Row]);
   if frmPick_WorkShop.ShowModal=mrok then
   begin
     SGrid.Cells[1,row]:=frmPick_WorkShop.ads73clientdsUSER_LOGIN_NAME.Value;
     SGrid.Cells[2,row]:=frmPick_WorkShop.ads73clientdsUSER_FULL_NAME.Value;
     SGrid.Cells[5,row]:=frmPick_WorkShop.ads73clientdsrKey.AsString;
     SGrid.Cells[3,row]:='0';
     SGrid.Cells[4,row]:='0';

//         SGrid.Cells[0,SGrid.RowCount-1]:=IntToStr(SGrid.RowCount-1);
     if (DM.ADO275_1.Locate('user_ptr',user_pt,[])) and (Ftag = 3) then
     begin

       DM.ADO275_1.Edit;
       DM.ADO275_1.FieldByName('USER_PTR').AsString:=SGrid.Cells[5,row];
       DM.ADO275_1.Post;
     end;


  //       SGrid.RowCount:=SGrid.RowCount+1;
   end;
  finally
  frmPick_WorkShop.Free;
  end;


end;

end.
