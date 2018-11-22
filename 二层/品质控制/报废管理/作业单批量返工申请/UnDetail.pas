unit UnDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB;

type
  TFrm_UnDetail = class(TForm)
    Label23: TLabel;
    Edit8: TEdit;
    Label1: TLabel;
    Memo4: TMemo;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N4: TMenuItem;
    StringGrid1: TStringGrid;
    N1: TMenuItem;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    procedure N2Click(Sender: TObject);
    function return_vifrkey(sgrid: TStringGrid;col: integer): string;
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure append_258(v_ttype:string);
  public
    { Public declarations }
    State:byte;     //1:新增,2:编辑,3:检查
  end;

var
  Frm_UnDetail: TFrm_UnDetail;

implementation

uses ConstVar,Pick_Item_Single,Demo, DeptCode, Unusual, DeptCheck,common,
  UDepname;

{$R *.dfm}

procedure TFrm_UnDetail.N2Click(Sender: TObject);
var
//  rkey34_list:string;
  i:Integer;
begin
  //try
  // frm_deptcode:=tfrm_deptcode.Create(application);
  // rkey34_list:=return_vifrkey(StringGrid1,0);
  // Frm_DeptCode.ADODataSet1.Close;
  // Frm_DeptCode.ADODataSet1.Open;
  // if Trim(rkey34_list)<>'' then
  // begin
  //  frm_deptcode.ADS34.CommandText:=frm_deptcode.ADS34.CommandText+' and data0034.rkey not in'+rkey34_list;
  // end;
  // Frm_DeptCode.ADS34.Open;
  // if frm_deptcode.ShowModal=mrok then
  // begin
  //  for i:=1 to frm_deptcode.DBGrid1.SelectedRows.Count do
  //  begin
  //   frm_deptcode.dbgrid1.DataSource.DataSet.Bookmark :=
  //   frm_deptcode.dbgrid1.SelectedRows.Items[i-1];
  //   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=Frm_DeptCode.ADS34rkey.AsString;
  //   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Frm_DeptCode.ADS34DEPT_CODE.AsString;
  //   stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Frm_DeptCode.ADS34DEPT_NAME.AsString;
  //   StringGrid1.Cells[3,StringGrid1.RowCount-1]:=Frm_DeptCode.ADODataSet1USER_FULL_NAME.AsString;
  //   StringGrid1.Cells[4,StringGrid1.RowCount-1]:=Frm_DeptCode.ADODataSet1RKEY.AsString;
  //   StringGrid1.RowCount:=StringGrid1.RowCount+1;
  //  end;
  // end
  // finally
  // frm_deptcode.Free;
  // end;
  try
  Frm_depname:=TFrm_depname.Create(application);
   if Frm_depname.ShowModal=mrok then
   begin
      for i:=1 to StringGrid1.RowCount-2 do
      begin
        if (StringGrid1.Cells[0,i])=(IntToStr(Frm_depname.Edit1.Tag)) then
        begin
         ShowMessage('已存在经相同部门');
         exit;
        end;
      end;
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=IntToStr(Frm_depname.Edit1.Tag);
     stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Frm_depname.Edit1.Text;
     stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Frm_depname.Label3.Caption;
     StringGrid1.Cells[3,StringGrid1.RowCount-1]:=Frm_depname.Edit2.Text;
     StringGrid1.Cells[4,StringGrid1.RowCount-1]:=IntToStr(Frm_depname.Edit2.Tag);
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
   end;
  finally
   Frm_depname.Free;
  end;
end;



function TFrm_UnDetail.return_vifrkey(sgrid: TStringGrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
 if sgrid.RowCount >1 then
 begin
   rkey_list:='(';
   for i:=1 to sgrid.RowCount-2 do
     rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
   if length(rkey_list) > 1 then
    result:= copy(rkey_list,1,length(rkey_list)-1)+')'

   else
    result:='';
 end;

end;

procedure TFrm_UnDetail.N4Click(Sender: TObject);
var
  i:Integer;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
 stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TFrm_UnDetail.BitBtn1Enter(Sender: TObject);
begin
 if Trim(Edit8.Text)='' then
 begin
   showmsg('异常等级不能为空,请输入',1);
   Edit8.SetFocus;
   exit;
 end;
 if StringGrid1.RowCount=2 then
 begin
   showmsg('审批部门不能为空,请输入',1);
   StringGrid1.SetFocus;
   exit;
 end;
// if Self.State=0 then
// begin
// with dm.ADOQuery1 do
// begin
//   Close;
//   sql.Clear;
//   SQL.Add('select * from data0257 where v_ttype='+quotedstr(edit8.Text));
//   Open;
// end;
// if not dm.ADOQuery1.IsEmpty then
// begin
//   ShowMsg('此异常等级代码已存在,请改换别的代码!',1);
//   Exit;
// end;
// end;
end;

procedure TFrm_UnDetail.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row= stringgrid1.RowCount-1 then
 begin
 n4.Enabled:=false;
 n1.Enabled:=false;
 end
 else
 begin
 n4.Enabled:=true;
 n1.Enabled:=true;
 end;
end;


procedure tfrm_undetail.append_258(v_ttype:string);
var
  i:Integer;
begin
 with dm.ADOQuery1 do
 begin
   Close;
   sql.Clear;
   SQL.Add('select * from data0258');
   Open;
 end;
 for i:=1 to StringGrid1.RowCount-2 do
 begin
   dm.ADOQuery1.Append;
   dm.ADOQuery1.FieldByName('v_ttype').Value:=v_ttype;
   dm.ADOQuery1.FieldByName('rkey34').Value:=StrToInt(StringGrid1.Cells[0,i]);
   dm.ADOQuery1.FieldByName('seq_no').Value:=i;
   if StringGrid1.Cells[4,i]='' then
   else
     dm.ADOQuery1.FieldByName('name_no').Value:=StrToInt(StringGrid1.Cells[4,i]);
   dm.ADOQuery1.Post;
 end;
end;

procedure TFrm_UnDetail.BitBtn1Click(Sender: TObject);
begin
 if self.State=0 then  //新增
 begin
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from data0257 where v_ttype='+quotedstr(edit8.Text));
     Open;
   end;
  if not dm.ADOQuery1.IsEmpty then
  begin
   ShowMsg('此异常等级代码已存在,请改换别的代码!',1);
   Exit;
  end;
  try
  dm.ADOConnection1.BeginTrans;
   with DM.aq257 do
   begin
    Close;
    Parameters[0].Value:='';
    Open;
    Append;
    DM.aq257.FieldByName('v_ttype').AsString:=Edit8.Text;
    dm.aq257.FieldByName('remark').AsString:=Memo4.Text;
    dm.aq257.FieldByName('rkey73').Value:=Edit2.Tag;
    Post;//增加主表
   end;
   append_258(dm.aq257v_ttype.Value);
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
  dm.aq257.Close;
  dm.aq257.Parameters[0].Value:=dm.ADO257v_ttype.Value;
  dm.aq257.Open;
  try
   dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     sql.Add('delete from data0258 where v_ttype='+quotedstr(dm.ADO257v_ttype.Value));
     ExecSQL;
   end;

   with dm.aq257 do
   begin
     Edit;
     dm.aq257v_ttype.Value:=Edit8.Text;
     dm.aq257remark.Value:=Memo4.Text;
     DM.aq257.FieldByName('rkey73').Value:=Edit2.Tag;
     Post;
   end;
   Self.append_258(dm.aq257v_ttype.AsString);////////////////
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

procedure TFrm_UnDetail.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='rkey';
 StringGrid1.colwidths[0]:=-1;
 StringGrid1.ColWidths[4]:=-1;
 stringgrid1.Cells[1,0]:='审批部门代码';
 stringgrid1.Cells[2,0]:='审批部门名称';
 stringgrid1.Cells[3,0]:='信息接收人';
 StringGrid1.Cells[4,0]:='name_no';
 if Self.State<>0 then
 begin
   if Self.State=2 then
   begin
     Edit8.ReadOnly:=True;
     Memo4.ReadOnly:=True;
     StringGrid1.Enabled:=False;
     BitBtn1.Enabled:=False;
   end;
   Edit8.Text:=dm.ADO257v_ttype.Value;
   Memo4.Text:=dm.ADO257remark.Value;
   Edit2.Text:=DM.ADO257USER_FULL_NAME.Value;
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     SQL.Add('select data0258.v_ttype,data0073.USER_FULL_NAME,data0258.rkey34,data0258.name_no,data0034.dept_code,data0034.dept_name from data0258');
     sql.Add(' inner join data0034 on data0258.rkey34=data0034.rkey');
     sql.Add(' left join data0073 on data0258.name_no=data0073.rkey');
     sql.Add(' where data0258.v_ttype='+quotedstr(dm.ADO257v_ttype.Value));
     sql.Add(' order by data0258.seq_no');
     Open;
     DM.ADOQuery1.First;
     while not Eof do
     begin

      StringGrid1.Cells[0,StringGrid1.RowCount-1]:=FieldByName('rkey34').asstring;
      StringGrid1.Cells[1,StringGrid1.RowCount-1]:=FieldByName('dept_code').asstring;
      StringGrid1.Cells[2,StringGrid1.RowCount-1]:=FieldByName('dept_name').asstring;
      StringGrid1.Cells[3,StringGrid1.RowCount-1]:=FieldByName('USER_FULL_NAME').asstring;
      StringGrid1.Cells[4,StringGrid1.RowCount-1]:=FieldByName('name_no').asstring;
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
      Next;
     end;
   end;
 end;
end;

procedure TFrm_UnDetail.N1Click(Sender: TObject);
begin
 Frm_depname.sdate:=1;
 try
  Frm_depname:=TFrm_depname.Create(application);
  Frm_depname.Edit1.Tag:=StrToInt(stringgrid1.Cells[0,stringgrid1.Row]);
  Frm_depname.Edit1.Text:= stringgrid1.Cells[1,stringgrid1.Row];
  Frm_depname.Label3.Caption:=stringgrid1.Cells[2,stringgrid1.Row];
  Frm_depname.Edit2.Text:= StringGrid1.Cells[3,StringGrid1.Row];

   if Frm_depname.ShowModal=mrok then
   begin
     stringgrid1.Cells[0,stringgrid1.Row]:=IntToStr(Frm_depname.Edit1.Tag);
     stringgrid1.Cells[1,stringgrid1.Row]:=Frm_depname.Edit1.Text;
     stringgrid1.Cells[2,stringgrid1.Row]:=Frm_depname.Label3.Caption;
     StringGrid1.Cells[3,StringGrid1.Row]:=Frm_depname.Edit2.Text;
     StringGrid1.Cells[4,StringGrid1.Row]:=IntToStr(Frm_depname.Edit2.Tag);
   end;
  finally
   Frm_depname.Free;
 end;
end;

procedure TFrm_UnDetail.BitBtn2Click(Sender: TObject);
var inputvar: PDlgInput;
i:Integer;
begin

 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   InputVar.Fields := 'USER_LOGIN_NAME/用户代码/100,USER_FULL_NAME/用户名称/150,DEPT_NAME/部门名称/150';
   InputVar.Sqlstr := ' SELECT dbo.Data0034.DEPT_NAME, dbo.Data0073.USER_FULL_NAME, dbo.Data0073.rkey,dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.ACTIVE_FLAG '+
                     ' FROM dbo.Data0073 INNER JOIN dbo.Data0005 ON dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY AND dbo.Data0073.EMPLOYEE_PTR '+
                     ' = dbo.Data0005.RKEY INNER JOIN dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY  WHERE dbo.Data0073.ACTIVE_FLAG = 0' ;

   inputvar.KeyField:='rkey';
   InputVar.AdoConn := DM.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
   // Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['USER_LOGIN_NAME'];
    Edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['USER_FULL_NAME'];
    Edit2.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    Label5.Caption:=frmPick_Item_Single.adsPick.FieldValues['DEPT_NAME'];
   end ;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_UnDetail.BitBtn4Click(Sender: TObject);
begin
  
  Edit2.Clear;
  Label5.Caption:='';
end;

end.
