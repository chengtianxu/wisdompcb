unit ApprovalProcessSetFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons;

type
  TFrm_ApprovalProcessSet = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label23: TLabel;
    Edit8: TEdit;
    Label1: TLabel;
    Memo4: TMemo;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N3Click(Sender: TObject);
  private
     function return_vifrkey(sgrid: TStringGrid;col: integer): string;
     procedure append_615(v_ttype:string);
    { Private declarations }
  public
    status : Integer;
    v_ttype : string;
    { Public declarations }
  end;

var
  Frm_ApprovalProcessSet: TFrm_ApprovalProcessSet;

implementation

uses DeptCode, damo;

{$R *.dfm}

function TFrm_ApprovalProcessSet.return_vifrkey(sgrid: TStringGrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
  result:='';
  if sgrid.RowCount > 1 then
  begin
    rkey_list := '(';
    for i := 1 to sgrid.RowCount - 2 do
      rkey_list := rkey_list + sgrid.Cols[col].Strings[i] + ',';
    if length(rkey_list) > 1 then
      result := copy(rkey_list,1,length(rkey_list)-1)+')'
    else
      result := '';
  end;
end;

procedure TFrm_ApprovalProcessSet.N2Click(Sender: TObject);
var
  rkey34_lis : string;
begin
  try
    frm_deptcode:=tfrm_deptcode.Create(application);
    rkey34_lis := return_vifrkey(StringGrid1,0);
    if Trim(rkey34_lis) <> '' then
      frm_deptcode.rkey34_list:=' and data0034.rkey not in'+return_vifrkey(StringGrid1,0);
//    Frm_DeptCode.ADODataSet1.Close;
//    Frm_DeptCode.ADODataSet1.Open;
//    if Trim(rkey34_list)<>'' then
//    begin
//      frm_deptcode.ADS34.CommandText:=frm_deptcode.ADS34.CommandText+' and data0034.rkey not in'+rkey34_list;
//    end;
//    Frm_DeptCode.ADS34.Open;
    if frm_deptcode.ShowModal=mrok then
    begin
      stringgrid1.Cells[0,stringgrid1.RowCount-1] := Frm_DeptCode.rkey34;
      stringgrid1.Cells[1,stringgrid1.RowCount-1] := Frm_DeptCode.Edit12.Text;
      stringgrid1.Cells[2,stringgrid1.RowCount-1] := Frm_DeptCode.Label3.Caption;
      StringGrid1.Cells[3,StringGrid1.RowCount-1] := Frm_DeptCode.Label4.Caption;
      StringGrid1.Cells[4,StringGrid1.RowCount-1] := Frm_DeptCode.rkey05;
      StringGrid1.Cells[5,StringGrid1.RowCount-1] := Frm_DeptCode.Edit1.Text;
      StringGrid1.RowCount := StringGrid1.RowCount+1;

    end
  finally
    frm_deptcode.Free;
  end;

end;

procedure TFrm_ApprovalProcessSet.N3Click(Sender: TObject);
var
  rkey34_li : string;
begin
  try
    frm_deptcode := tfrm_deptcode.Create(application);
    rkey34_li := return_vifrkey(StringGrid1,0);
    if Trim(rkey34_li) <> '' then
      frm_deptcode.rkey34_list:=' and data0034.rkey not in'+return_vifrkey(StringGrid1,0);
//    frm_deptcode.rkey34_list := return_vifrkey(StringGrid1,0);
    Frm_DeptCode.rkey34 :=  stringgrid1.Cells[0,stringgrid1.Row] ;
    Frm_DeptCode.Edit12.Text := stringgrid1.Cells[1,stringgrid1.Row];
    Frm_DeptCode.Label3.Caption := stringgrid1.Cells[2,stringgrid1.Row];
    Frm_DeptCode.Label4.Caption := stringgrid1.Cells[3,stringgrid1.Row];
    Frm_DeptCode.rkey05 := StringGrid1.Cells[4,StringGrid1.Row] ;
    Frm_DeptCode.Edit1.Text := StringGrid1.Cells[5,StringGrid1.Row] ;
    if frm_deptcode.ShowModal=mrok then
    begin
      stringgrid1.Cells[0,stringgrid1.Row] := Frm_DeptCode.rkey34;
      stringgrid1.Cells[1,stringgrid1.Row] := Frm_DeptCode.Edit12.Text;
      stringgrid1.Cells[2,stringgrid1.Row] := Frm_DeptCode.Label3.Caption;
      StringGrid1.Cells[3,StringGrid1.Row] := Frm_DeptCode.Label4.Caption;
      StringGrid1.Cells[4,StringGrid1.Row] := Frm_DeptCode.rkey05;
      StringGrid1.Cells[5,StringGrid1.Row] := Frm_DeptCode.Edit1.Text;
    end;
  finally
    frm_deptcode.Free;
  end;
end;

procedure TFrm_ApprovalProcessSet.N4Click(Sender: TObject);
var
  i:Integer;
begin
  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
    stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;

end;

procedure TFrm_ApprovalProcessSet.append_615(v_ttype: string);
var
  i:Integer;
begin
  for i:=1 to StringGrid1.RowCount-2 do
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text := 'insert into data0615(v_ttype,rkey34,rec_no,csi_ptr) values('+quotedstr(v_ttype)
    +','+StringGrid1.Cells[0,i]+','+inttostr(i)+','+StringGrid1.Cells[4,i]+')' ;
    DM.ADOQuery1.ExecSQL;
  end;
end;

procedure TFrm_ApprovalProcessSet.BitBtn1Click(Sender: TObject);
begin
  if Trim(Edit8.Text)='' then
  begin
    ShowMessage('审批流程代码不能为空,请输入');
    Edit8.SetFocus;
    exit;
  end;
  if StringGrid1.RowCount=2 then
  begin
    ShowMessage('审批部门不能为空,请输入');
    StringGrid1.SetFocus;
    exit;
  end;
  if Self.status=0 then
  begin
    with dm.ADOQuery1 do
    begin
      Close;
      sql.Clear;
      SQL.Add('select * from data0614 where v_ttype='+quotedstr(edit8.Text));
      Open;
    end;
    if not dm.ADOQuery1.IsEmpty then
    begin
      ShowMessage('此审批流程代码已存在,请改换别的代码!');
      Exit;
    end;
  end;
  
  if self.Status=0 then  //新增
  begin
    try
      dm.ADOConnection1.BeginTrans;
      DM.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text := 'insert into data0614(v_ttype,remark) values('+quotedstr(edit8.Text)+','+quotedstr(memo4.Text)+')';
      DM.ADOQuery1.ExecSQL;
      append_615(edit8.Text);
      v_ttype :=  Edit8.Text;
  //   with DM.aq257 do
  //   begin
  //    Close;
  //    Parameters[0].Value:='';
  //    Open;
  //    Append;
  //    DM.aq257.FieldByName('v_ttype').AsString:=Edit8.Text;
  //    dm.aq257.FieldByName('remark').AsString:=Memo4.Text;
  //    Post;//增加主表
  //   end;
  //   append_258(dm.aq257v_ttype.Value);
     dm.ADOConnection1.CommitTrans;
     self.ModalResult:=mrok;
    except
      on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end
  else
  begin
//    dm.aq257.Close;
//    dm.aq257.Parameters[0].Value:=dm.ADO257v_ttype.Value;
//    dm.aq257.Open;
    try
      dm.ADOConnection1.BeginTrans;
      with dm.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        sql.Add('delete from data0615 where v_ttype='+quotedstr(dm.ADS614v_ttype.Value));
        ExecSQL;

        Close;
        SQL.Text := 'update data0614 set v_ttype = '+quotedstr(edit8.Text)+',remark = '+ quotedstr(memo4.Text)
        +' from data0614 where v_ttype='+quotedstr(dm.ADS614v_ttype.Value);
        ExecSQL;

      end;
      append_615(edit8.Text);
      v_ttype :=  Edit8.Text;
//     with dm.aq257 do
//     begin
//       Edit;
//       dm.aq257v_ttype.Value:=Edit8.Text;
//       dm.aq257remark.Value:=Memo4.Text;
//       Post;
//     end;
//     Self.append_258(dm.aq257v_ttype.AsString);
      dm.ADOConnection1.CommitTrans;
      self.ModalResult:=mrok;
    except
      on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_ApprovalProcessSet.PopupMenu1Popup(Sender: TObject);
begin
  if stringgrid1.Row= stringgrid1.RowCount-1 then
    n4.Enabled:=false
  else
    n4.Enabled:=true;
end;

procedure TFrm_ApprovalProcessSet.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0] := 'rkey';
  StringGrid1.colwidths[0] := -1;
  stringgrid1.Cells[1,0] := '审批部门代码';
  stringgrid1.Cells[2,0] := '审批部门名称';
  stringgrid1.Cells[3,0] := '信息接收人';
  StringGrid1.Cells[4,0] := 'csi_ptr';
  StringGrid1.Cells[5,0] := '信息接收人工号' ;
  StringGrid1.colwidths[4] := -1;
  StringGrid1.colwidths[5] := -1;
 if Self.status<>0 then
 begin
   if Self.Status=2 then
   begin
     Edit8.ReadOnly:=True;
     Memo4.ReadOnly:=True;
     StringGrid1.Enabled:=False;
     BitBtn1.Enabled:=False;
   end;
   Edit8.Text:=dm.ADS614v_ttype.AsString;
   Memo4.Text:=dm.ADS614Remark.Value;

   DM.ADS615.First;
   while not DM.ADS615.Eof do
   begin
     StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DM.ADS615.FieldByName('rkey34').asstring;
     StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DM.ADS615.FieldByName('dept_code').asstring;
     StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DM.ADS615.FieldByName('dept_name').asstring;
     StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DM.ADS615.FieldByName('USER_FULL_NAME').asstring;
     StringGrid1.Cells[4,StringGrid1.RowCount-1]:=DM.ADS615.FieldByName('csi_ptr').asstring;
     StringGrid1.Cells[5,StringGrid1.RowCount-1]:=DM.ADS615.FieldByName('USER_LOGIN_NAME').asstring;
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     DM.ADS615.Next;
   end;
//   with dm.ADOQuery1 do
//   begin
//     Close;
//     sql.Clear;
//     SQL.Add('select data0258.v_ttype,data0073.USER_FULL_NAME,data0258.rkey34,data0258.name_no,data0034.dept_code,data0034.dept_name from data0258');
//     sql.Add(' inner join data0034 on data0258.rkey34=data0034.rkey');
//     sql.Add(' inner join data0073 on data0258.name_no=data0073.rkey');
//     sql.Add(' where data0258.v_ttype='+quotedstr(dm.ADO257v_ttype.Value));
//     sql.Add(' order by data0258.seq_no');
//     Open;
//     while not Eof do
//     begin
//      StringGrid1.Cells[0,StringGrid1.RowCount-1]:=FieldByName('rkey34').asstring;
//      StringGrid1.Cells[1,StringGrid1.RowCount-1]:=FieldByName('dept_code').asstring;
//      StringGrid1.Cells[2,StringGrid1.RowCount-1]:=FieldByName('dept_name').asstring;
//      StringGrid1.Cells[3,StringGrid1.RowCount-1]:=FieldByName('USER_FULL_NAME').asstring;
//      StringGrid1.Cells[4,StringGrid1.RowCount-1]:=FieldByName('name_no').asstring;
//      StringGrid1.RowCount:=StringGrid1.RowCount+1;
//      Next;
//     end;
//   end;
 end;
end;



procedure TFrm_ApprovalProcessSet.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    stringgrid1.MouseToCell(x,y,column,row);
    if row<>0 then stringgrid1.Row:=row;
  end;

end;



end.
