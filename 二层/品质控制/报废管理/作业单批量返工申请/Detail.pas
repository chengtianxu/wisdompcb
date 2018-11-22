unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Grids, ExtCtrls, Mask, DBCtrls,math,DB,
  DBGrids, ADODB;

type
  TFrm_Detail = class(TForm)
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Label9: TLabel;
    Edit14: TEdit;
    Label1: TLabel;
    Edit12: TEdit;
    BitBtn7: TBitBtn;
    Label10: TLabel;
    Edit13: TEdit;
    BitBtn8: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label23: TLabel;
    Memo4: TMemo;
    Memo1: TMemo;
    Label3: TLabel;
    Memo2: TMemo;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StringGrid1: TStringGrid;
    Label5: TLabel;
    Label6: TLabel;
    StringGrid2: TStringGrid;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    N4: TMenuItem;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit12Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    function return_vifrkey(sgrid: tstringgrid;col: integer): string;
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    function find_soerror(number:string):boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    procedure re_calculate_qty;
  public
    xxjs:string;
    { Public declarations }
    ade_flag,rkey203,rkey25,rkey34,step_number,pcs_qty,pnl_qty:Integer;
     procedure update04(table_name:string);
  end;

var
  Frm_Detail: TFrm_Detail;

implementation

uses Demo, part_search, deptcode_search,common,
ConstVar,Pick_Item_Single, WorkOder, DeptCode, Deptcheck, UnDetail;

{$R *.dfm}

procedure TFrm_Detail.update04(table_name:string);
var
 i,v_length:integer;
 v_last,v_seed,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Parameters[0].Value:=table_name;
 dm.ado04.Open;
 v_seed:=dm.ado04SEED_VALUE.Value;
 if dm.ado04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
 end;
end;

procedure TFrm_Detail.BitBtn6Click(Sender: TObject);
begin
 if Self.ade_flag<>3 then
 begin
 if Application.MessageBox('还未保存确认要退出吗?', PChar('提示'),MB_YESNO)=6 then
 Close;
 end
 else
 begin
 Close;
 end;
end;

procedure TFrm_Detail.FormActivate(Sender: TObject);
begin
 StringGrid1.ColWidths[2]:=-1;
 StringGrid1.ColWidths[3]:=-1;
 stringgrid1.Cells[0,0]:='rkey06';
 stringgrid1.Cells[1,0]:='作业单号';
 stringgrid1.Cells[2,0]:='步骤';
 stringgrid1.Cells[3,0]:='工序名称';
 stringgrid1.Cells[4,0]:='在线数量';
 stringgrid1.Cells[5,0]:='PNL数量';
 StringGrid1.colwidths[0]:=-1;

 stringgrid2.Cells[0,0]:='rkey34';
 stringgrid2.Cells[1,0]:='步骤号';
 stringgrid2.Cells[2,0]:='工序代码';
 stringgrid2.Cells[3,0]:='工序名称';
 stringgrid2.Cells[4,0]:='原步骤';
 stringgrid2.Cells[5,0]:='是否过数';
 StringGrid2.colwidths[0]:=-1;

 dm.ads260.Close;
 dm.ads260.Open;

  if Self.ade_flag=1 then   //新增
 begin
  DM.ads260.Close;
  dm.ado04.Close;
  dm.ado04.Parameters[0].Value:='data0203';
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
  Edit14.Text:=dm.ado04SEED_VALUE.Value;
  if dm.ado04SEED_FLAG.Value=4 then
  Edit14.ReadOnly:=True;
  DM.ado04.Close;
 end;
 if Self.ade_flag=2 then
 begin
  Edit14.Text:=dm.ADO203return_code.Value;
  Edit14.ReadOnly:=True;
  Edit12.Text:=dm.ADO203MANU_PART_NUMBER.Value;
  Label5.Caption:=dm.ADO203MANU_PART_DESC.Value;
  rkey25:=dm.ADO203CUST_PART_PTR.Value;
  Edit13.Text:=dm.ADO203DEPT_CODE.Value;
  Label6.Caption:=dm.ADO203DEPT_NAME.AsString;
  rkey34:=dm.ADO203dept_ptr.Value;
  step_number:=dm.ADO203WTYPE_step.Value;
  Edit1.Text:=dm.ADO203v_ttype.Value;
  Memo4.Text:=dm.ADO203describe.Value;
  Memo2.Text:=dm.ADO203scheme.Value;
  Memo1.Text:=dm.ADO203reason.Value;

  dm.aqr006.Close;//打开返工申请的作业单列表
  dm.aqr006.Parameters[0].Value:=dm.ADO203rkey.Value;
  DM.aqr006.Open;
  dm.aqr006.First;
  while not dm.aqr006.Eof do
  begin
    stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aqr006rkey06.AsString;
    stringgrid1.Cells[1,stringgrid1.RowCount-1]:=DM.aqr006work_order_number.AsString;
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:=DM.aqr006step.AsString;
    stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aqr006dept_name.Value;
//    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aqr006QTY_BACKLOG.AsString;
//    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aqr006PANELS.AsString;
    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aqr006pcs_qty.AsString;
    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aqr006pnl_qty.AsString;
    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    dm.aqr006.Next;
  end;
  re_calculate_qty;

  dm.aqr239.Close;//打开返工流程信息239表
  dm.aqr239.Parameters[0].Value:=dm.ADO203rkey.Value;
  dm.aqr239.Open;
  dm.aqr239.First;
  while not dm.aqr239.Eof do
  begin
    stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.aqr239dept_ptr.AsString;
    stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.aqr239step_number.AsString;
    stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.aqr239dept_code.AsString;
    stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.aqr239dept_name.AsString;
    stringgrid2.Cells[4,stringgrid2.RowCount-1]:=dm.aqr239old_step_no.AsString;
    if dm.aqr239BARCODE_ENTRY_FLAG.Value='Y' then
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='是'
    else
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='否';
    StringGrid2.RowCount:=StringGrid2.RowCount+1;
    dm.aqr239.Next;
  end;
 end;
 if Self.ade_flag=3 then
  begin
  Edit14.Text:=dm.ADO203return_code.Value;
  Edit14.ReadOnly:=True;
  Edit12.Text:=dm.ADO203MANU_PART_NUMBER.Value;
  Label5.Caption:=dm.ADO203MANU_PART_DESC.Value;
  rkey25:=dm.ADO203CUST_PART_PTR.Value;
  Edit13.Text:=dm.ADO203DEPT_CODE.Value;
  Label6.Caption:=dm.ADO203DEPT_NAME.AsString;
  rkey34:=dm.ADO203dept_ptr.Value;
  step_number:=dm.ADO203WTYPE_step.Value;
  Edit1.Text:=dm.ADO203v_ttype.Value;
  Memo4.Text:=dm.ADO203describe.Value;
  Memo2.Text:=dm.ADO203scheme.Value;
  Memo1.Text:=dm.ADO203reason.Value;

  dm.aqr006.Close;//打开返工申请的作业单列表
  dm.aqr006.Parameters[0].Value:=dm.ADO203rkey.Value;
  DM.aqr006.Open;
  dm.aqr006.First;
  while not dm.aqr006.Eof do
  begin
    stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aqr006rkey06.AsString;
    stringgrid1.Cells[1,stringgrid1.RowCount-1]:=DM.aqr006work_order_number.AsString;
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:=DM.aqr006step.AsString;
    stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aqr006dept_name.Value;
//    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aqr006QTY_BACKLOG.AsString;
//    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aqr006PANELS.AsString;
    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aqr006pcs_qty.AsString;
    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aqr006pnl_qty.AsString;

    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    dm.aqr006.Next;
  end;
  re_calculate_qty;

  dm.aqr239.Close;//打开返工流程信息239表
  dm.aqr239.Parameters[0].Value:=dm.ADO203rkey.Value;
  dm.aqr239.Open;
  dm.aqr239.First;
  while not dm.aqr239.Eof do
  begin
    stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.aqr239dept_ptr.AsString;
    stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.aqr239step_number.AsString;
    stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.aqr239dept_code.AsString;
    stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.aqr239dept_name.AsString;
    stringgrid2.Cells[4,stringgrid2.RowCount-1]:=dm.aqr239old_step_no.AsString;
    if dm.aqr239BARCODE_ENTRY_FLAG.Value='Y' then
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='是'
    else
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='否';
    StringGrid2.RowCount:=StringGrid2.RowCount+1;
    dm.aqr239.Next;
  end;
 end;
 if Self.ade_flag=4 then
 begin
  Edit14.Text:=dm.ADO203return_code.Value;
  Edit14.ReadOnly:=True;
  Edit12.Text:=dm.ADO203MANU_PART_NUMBER.Value;
  Label5.Caption:=dm.ADO203MANU_PART_DESC.Value;
  rkey25:=dm.ADO203CUST_PART_PTR.Value;
  Edit13.Text:=dm.ADO203DEPT_CODE.Value;
  Label6.Caption:=dm.ADO203DEPT_NAME.AsString;
  rkey34:=dm.ADO203dept_ptr.Value;
  step_number:=dm.ADO203WTYPE_step.Value;
  Edit1.Text:=dm.ADO203v_ttype.Value;
  Memo4.Text:=dm.ADO203describe.Value;
  Memo2.Text:=dm.ADO203scheme.Value;
  Memo1.Text:=dm.ADO203reason.Value;

  dm.aqr006.Close;//打开返工申请的作业单列表
  dm.aqr006.Parameters[0].Value:=dm.ADO203rkey.Value;
  DM.aqr006.Open;
  dm.aqr006.First;
  while not dm.aqr006.Eof do
  begin
    stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aqr006rkey06.AsString;
    stringgrid1.Cells[1,stringgrid1.RowCount-1]:=DM.aqr006work_order_number.AsString;
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:=DM.aqr006step.AsString;
    stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aqr006dept_name.Value;
//    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aqr006QTY_BACKLOG.AsString;
//    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aqr006PANELS.AsString;
    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aqr006pcs_qty.AsString;
    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aqr006pnl_qty.AsString;

    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    dm.aqr006.Next;
  end;
  re_calculate_qty;

  dm.aqr239.Close;//打开返工流程信息239表
  dm.aqr239.Parameters[0].Value:=dm.ADO203rkey.Value;
  dm.aqr239.Open;
  dm.aqr239.First;
  while not dm.aqr239.Eof do
  begin
    stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.aqr239dept_ptr.AsString;
    stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.aqr239step_number.AsString;
    stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.aqr239dept_code.AsString;
    stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.aqr239dept_name.AsString;
    stringgrid2.Cells[4,stringgrid2.RowCount-1]:=dm.aqr239old_step_no.AsString;
    if dm.aqr239BARCODE_ENTRY_FLAG.Value='Y' then
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='是'
    else
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='否';
    StringGrid2.RowCount:=StringGrid2.RowCount+1;
    dm.aqr239.Next;
  end;
 end;
end;

procedure TFrm_Detail.BitBtn7Click(Sender: TObject);
begin
try
 frmcustpart:=Tfrmcustpart.Create(application);
    FrmCustPart.ADOQuery1.Open;
    frmcustpart.Edit1.Text := trim(edit12.Text);
    if frmcustpart.ADOQuery1.IsEmpty then
    begin
      application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+
      mb_iconstop+mb_systemmodal);
      edit12.SetFocus;
      exit;
    end;
    if frmcustpart.ShowModal=mrok then
    begin
      Edit12.Text := trim(frmcustpart.ADOQuery1.FieldValues['manu_part_number']);
      rkey25:=FrmCustPart.ADOQuery1rkey.Value;
      edit12.Font.Color := clwindowtext;
      label5.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];
    end;
      edit12.SetFocus;
  finally
    frmcustpart.free;
end;
end;

procedure TFrm_Detail.BitBtn8Click(Sender: TObject);
begin
if Trim(Edit12.Text)='' then
  begin
   ShowMsg('先确定本厂编号!',1);
   Edit12.SetFocus;
   Exit;
  end;
with Tform_deptcode.Create(Application) do
try
  maskedit1.Text:=self.Edit13.Text;
  ADOQuery1.Close;
  ADOQuery1.Parameters[0].Value:=rkey25;
  ADOQuery1.Open;
  if adoquery1.IsEmpty then
   ShowMsg('没有找到相应的工序代码',1)
  else
  if Showmodal=mrok then
  begin
   self.edit13.Text:=ADOQuery1DEPT_CODE.Value;
   self.label6.Caption:=ADOQuery1DEPT_NAME.Value;
   rkey34:=ADOQuery1rkey.Value;
   step_number:=ADOQuery1step_number.Value;
  end;
finally
 form_deptcode.Free;
end;
end;

procedure TFrm_Detail.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
  s := 'select v_ttype,remark from Data0257';
  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
      InputVar.Fields := 'v_ttype/异常等级代码/120,remark/异常等级说明/300';
      InputVar.Sqlstr := s ;
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single2.InitForm_New(InputVar)  ;
      if frmPick_Item_Single2.ShowModal = mrok then
          begin
              if frmPick_Item_Single2.adsPick.IsEmpty then exit;
              Edit1.Text := frmPick_Item_Single2.adsPick.fieldbyname('v_ttype').asstring;
          end
      else
          Edit1.SetFocus ;
  finally
      frmPick_Item_Single2.adsPick.Close;
      frmPick_Item_Single2.Free ;
  end;
end;

procedure TFrm_Detail.Edit12Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn7') and (trim(Edit12.Text)<>'') then
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  frmcustpart.adoquery1.Open;
  frmcustpart.Edit1.Text := trim(edit12.Text);
  if Comparetext(trim(edit12.Text),trim(frmcustpart.ADOQuery1.Fieldbyname('manu_part_number').AsString))=0 then
   begin
    edit12.Font.Color := clwindowtext;
    label5.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];
    rkey25 := frmcustpart.ADOQuery1.Fieldbyname('rkey').Value;
   end
  else
   begin
    messagedlg('请输入正确的客户部品!',mtinformation,[mbcancel],0);
    edit12.SetFocus;
   end;
 finally
  frmcustpart.free;
 end
else
 begin
  label5.Caption := '';
  rkey25 := 0;
 end;
end;

procedure TFrm_Detail.Edit12Click(Sender: TObject);
begin
if edit12.Font.Color=clwindowtext then
 begin
  edit12.SelectAll;
  edit12.Font.Color:=clblue;
 end;
end;

procedure TFrm_Detail.N1Click(Sender: TObject);
var
 i:integer;
 rkey06_list:string;
begin
  if Trim(Edit12.Text)='' then
  begin
   MessageDlg('请先选择产品!',mtInformation,[mbok],1);
   Exit;
  end;
  if Trim(Edit13.Text)='' then
  begin
   MessageDlg('请确定当前返工工序和步骤!',mtInformation,[mbok],1);
   Exit;
  end;
 try
  Frm_WorkOder:= TFrm_WorkOder.Create(application);
  rkey06_list:= return_vifrkey(stringgrid1,0);
  with  dm.ADO06 do
   begin
    close;
    Parameters[0].Value:=rkey25;
    Parameters[1].Value:=rkey34;
    if rkey06_list<>'' then
     CommandText:=CommandText+' and D06.rkey not in'+rkey06_list;
    Prepared;
    open;
   end;
  if Frm_WorkOder.ShowModal=mrok then
  begin
   for i:=1 to Frm_WorkOder.DBGrid1.SelectedRows.Count do
    begin
     Frm_WorkOder.dbgrid1.DataSource.DataSet.Bookmark :=
                         Frm_WorkOder.dbgrid1.SelectedRows.Items[i-1];
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.ADO06RKEY.AsString;
     stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.ADO06WORK_ORDER_NUMBER.AsString;
     stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.ADO06STEP.AsString;
     stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.ADO06DEPT_NAME.AsString;
     stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.ADO06QTY_BACKLOG.AsString;
     stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.ADO06PANELS.AsString;
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
    end;
    re_calculate_qty;
  end;
 finally
  Frm_WorkOder.Free;
 end;
end;

function TFrm_Detail.return_vifrkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
if sgrid.RowCount > 2 then
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

procedure TFrm_Detail.N2Click(Sender: TObject);
var
 i:byte;
begin
   for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  end;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 re_calculate_qty;
end;

procedure TFrm_Detail.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n2.Enabled:=false;
  end
else
  begin
   n2.Enabled:=true;
  end;
end;

procedure TFrm_Detail.re_calculate_qty;
var
 i:integer;
begin
 pcs_qty:=0;
 pnl_qty:=0;
 for i:=1 to stringgrid1.RowCount-2 do
  begin
   pcs_qty:=pcs_qty+strtoint(stringgrid1.Cells[4,i]);
   pnl_qty:=pnl_qty+strtoint(stringgrid1.Cells[5,i]);
  end;
  StringGrid1.Cells[1,StringGrid1.RowCount-1 ] :='合计:';
  stringgrid1.Cells[4,StringGrid1.RowCount-1 ] :=IntToStr(pcs_qty);
  stringgrid1.Cells[5,StringGrid1.RowCount-1 ] :=IntToStr(pnl_qty);
end;

procedure TFrm_Detail.N3Click(Sender: TObject);
var
  i: Integer;
begin
 if Trim(Edit12.Text)='' then
 begin
  MessageDlg('请先选择产品!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit13.Text)='' then
 begin
  MessageDlg('请确定当前返工工序和步骤!',mtInformation,[mbok],1);
  Exit;
 end;
 try
  Frm_DeptCheck:= TFrm_DeptCheck.Create(application);
  // ShowMessage(edit13.text);
   Frm_DeptCheck.y:=edit13.text;
  Frm_DeptCheck.rkey25:=IntToStr(rkey25);
  Frm_DeptCheck.step_number:=IntToStr(step_number);
  if Frm_DeptCheck.ShowModal=mrok then
  begin
    if StringGrid2.RowCount>2 then
    begin
     for i:=1  to  stringgrid2.rowcount  do
      stringgrid2.rows[I].clear;
    end;
    StringGrid2.RowCount:=2;
   for I:=0 to Frm_DeptCheck.lvRStep.Items.Count-1 do
    begin
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=IntToStr(Integer(Frm_DeptCheck.lvRStep.Items[I].Data));
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=Frm_DeptCheck.lvRStep.Items[I].Caption;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=Frm_DeptCheck.lvRStep.Items[I].SubItems[0];
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=Frm_DeptCheck.lvRStep.Items[I].SubItems[1];
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=Frm_DeptCheck.lvRStep.Items[I].SubItems[2];
     stringgrid2.Cells[5,stringgrid2.RowCount-1]:=Frm_DeptCheck.lvRStep.Items[I].SubItems[3];
     StringGrid2.RowCount:=StringGrid2.RowCount+1;
    end;
    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      SQL.Add('select dept_code,dept_name from data0034 where rkey='+inttostr(rkey34));
      Open;
    end;
    stringgrid2.Cells[0,stringgrid2.RowCount-1]:=IntToStr(rkey34); //增加最后一步工序到返工流程表
    stringgrid2.Cells[1,stringgrid2.RowCount-1]:=IntToStr(Frm_DeptCheck.lvRStep.Items.Count+1);
    stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('dept_code').AsString;
    stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('dept_name').AsString;
    stringgrid2.Cells[4,stringgrid2.RowCount-1]:=IntToStr(step_number);
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:='是';
    StringGrid2.RowCount:=StringGrid2.RowCount+1;
  end
  else
 finally
  Frm_DeptCheck.Free;
 end;
end;

procedure TFrm_Detail.BitBtn5Click(Sender: TObject);
var
i:word;
begin
 if (ade_flag=1) or (ade_flag=2) then
 begin
 if Trim(Edit14.Text)='' then
 begin
  MessageDlg('返工代码不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit12.Text)='' then
 begin
  MessageDlg('产品不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit13.Text)='' then
 begin
  MessageDlg('返工前的工序不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit1.Text)='' then
 begin
  MessageDlg('异常等级不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Memo4.Text)='' then
 begin
   MessageDlg('异常描述不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if StringGrid1.RowCount=2 then
 begin
  MessageDlg('返工作业单不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 end;
 if ade_flag=4 then
 begin
 if Trim(Edit14.Text)='' then
 begin
  MessageDlg('返工代码不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit12.Text)='' then
 begin
  MessageDlg('产品不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit13.Text)='' then
 begin
  MessageDlg('返工前的工序不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Edit1.Text)='' then
 begin
  MessageDlg('异常等级不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Memo4.Text)='' then
 begin
   MessageDlg('异常描述不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if StringGrid1.RowCount=2 then
 begin
  MessageDlg('返工作业单不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Memo1.Text)='' then
 begin
   MessageDlg('异常原因不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if Trim(Memo2.Text)='' then
 begin
   MessageDlg('返工方案不能为空!',mtInformation,[mbok],1);
  Exit;
 end;
 if StringGrid2.RowCount=2 then
 begin
//  MessageDlg('返工流程不能为空!',mtInformation,[mbok],1);
//  Exit;
   if messagedlg('返工流程为空,是否内部返工?',mtConfirmation,[mbyes,mbno],0)=mryes then
   else Exit;
 end;
 end;
 if not (edit14.Text[length(trim(edit14.Text))] in ['0'..'9']) then
 begin
  messagedlg('返工代码最后一位必需是一个数字!',mtinformation,[mbok],0);
  exit;
 end;
 if Self.ade_flag=1 then //新增的话要判断编号是否重复
   begin
    if self.find_soerror(trim(edit14.Text)) then
    if messagedlg('返工代码重复,可能有多台计算机同时新增,是否自动更新?',
      mtConfirmation,[mbYes,mbNo],0)=mrYes  then
      begin
       dm.ado04.Close;
       dm.ado04.Parameters[0].Value:='data0203';
       dm.ado04.Open;
       edit14.Text:=dm.ado04SEED_VALUE.Value;
      end
    else
    begin
     Edit14.SetFocus;
     exit;
    end;
   end;
  dm.ADOConnection1.BeginTrans;
if dm.aq203.State=dsinsert then  //如果新增返工申请
 begin
  try
   DM.aq203return_code.Value:=Edit14.Text;
   DM.aq203user_ptr.AsString:=user_ptr;
   dm.aq203status.Value:=0;
   dm.aq203ENT_DATE.Value:=getsystem_date(dm.ADOQuery1,0); //创建日期赋值(长格式)
   dm.aq203CUST_PART_PTR.Value:=Self.rkey25;
   dm.aq203dept_ptr.Value:=Self.rkey34;
   dm.aq203WTYPE_step.Value:=step_number;
   dm.aq203v_ttype.Value:=Edit1.Text;
   dm.aq203describe.Value:=Memo4.Text;
   dm.aq203reason.Value:=Memo1.Text;
   DM.aq203scheme.Value:=Memo2.Text;
   DM.aq203panel_qty.Value:=pnl_qty;
   dm.aq203pcs_qty.Value:=pcs_qty;
   dm.aq203.Post;

   update04('data0203');//更新控制码

   for i:=1 to  stringgrid1.RowCount-2 do //增加返工作业单列表
   begin
    dm.ADO252.Close;
    dm.ADO252.Open;
    dm.ADO252.Append;
    dm.ado252rkey203.Value:=dm.aq203rkey.Value;
    dm.ADO252rkey06.Value:=strtoint(stringgrid1.Cells[0,i]);
    dm.ADO252pcs_qty.Value:=strtoint(stringgrid1.Cells[4,i]);
    dm.ADO252pnl_qty.Value:=strtoint(stringgrid1.Cells[5,i]);

    DM.ADO252.Post;
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update data0006 set wtype=2 where rkey='+stringgrid1.Cells[0,i]);
      ExecSQL;
    end;
   end;
   dm.ADOConnection1.CommitTrans;
   rkey203:=dm.aq203rkey.Value;
   dm.ADO203.Close;
   dm.ADO203.Open;
   dm.ADO203.Locate('rkey',rkey203,[]);
   ModalResult:=mrOk;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
     exit;
    end;
  end;
 end
else   //如果是编辑状态
 begin
  try
   dm.aq203status.Value:=0;
   dm.aq203CUST_PART_PTR.Value:=Self.rkey25;
   dm.aq203dept_ptr.Value:=Self.rkey34;
   dm.aq203WTYPE_step.Value:=step_number;
   dm.aq203v_ttype.Value:=Edit1.Text;
   dm.aq203describe.Value:=Memo4.Text;
   dm.aq203reason.Value:=Memo1.Text;
   DM.aq203scheme.Value:=Memo2.Text;
   DM.aq203panel_qty.Value:=pnl_qty;
   dm.aq203pcs_qty.Value:=pcs_qty;
   dm.aq203.Post;
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     sql.Add('update data0006 set wtype=0 where rkey in (select rkey06 from data0252 where rkey203='+dm.ADO203rkey.AsString+')');
     ExecSQL;
   end;
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     sql.Add('delete from data0252 where rkey203='+dm.ADO203rkey.AsString);
     ExecSQL;
   end;
   for i:=1 to stringgrid1.RowCount-2 do //增加返工作业单列表
   begin
    dm.ADO252.Close;
    dm.ADO252.Open;
    dm.ADO252.Append;
    dm.ado252rkey203.Value:=dm.ADO203rkey.Value;
    dm.ADO252rkey06.Value:=strtoint(stringgrid1.Cells[0,i]);
    DM.ADO252pcs_qty.Value:=strtoint(stringgrid1.Cells[4,i]);
    DM.ADO252pnl_qty.Value:=strtoint(stringgrid1.Cells[5,i]);
    DM.ADO252.Post;
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update data0006 set wtype=2 where rkey='+stringgrid1.Cells[0,i]);
      ExecSQL;
    end;
   end;

   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     sql.Add('delete from data0239 where rkey203='+dm.ADO203rkey.AsString);
     ExecSQL;
   end;

   if StringGrid2.RowCount>2 then
   begin
   for i:=1 to stringgrid2.RowCount-2 do //增加返工流程表239
   begin
    dm.ADO239.Close;
    dm.ADO239.Open;
    dm.ADO239.Append;
    with dm.ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('select def_rout_inst,tooling_rev,tool_remark from data0038 ');
      SQL.Add('where source_ptr='+inttostr(rkey25));
      SQL.Add('and dept_ptr='+stringgrid2.Cells[0,i]);
      SQL.Add('and step_number='+stringgrid2.Cells[4,i]);
      Open;
    end;
    dm.ADO239rkey203.Value:=dm.ADO203rkey.Value;
    dm.ADO239DEPT_PTR.Value:=strtoint(stringgrid2.Cells[0,i]);
    DM.ADO239STEP_NUMBER.Value:=strtoint(stringgrid2.Cells[1,i]);
    dm.ADO239Old_Step_NO.Value:=strtoint(stringgrid2.Cells[4,i]);
    dm.ADO239DEF_ROUT_INST.Value:=dm.ADOQuery1.fieldbyname('def_rout_inst').AsString;
    dm.ADO239tooling_rev.Value:=dm.ADOQuery1.fieldbyname('tooling_rev').AsString;
    dm.ADO239TOOL_REMARK.Value:=dm.ADOQuery1.fieldbyname('TOOL_REMARK').AsString;
    DM.ADO239.Post;
   end;
   end;
   rkey203:=dm.ADO203rkey.Value;
   dm.ADOConnection1.CommitTrans;
   DM.ADO203.Close;
   DM.ADO203.Open;
   DM.ADO203.Locate('rkey',rkey203,[]);
   ModalResult:=mrOk;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;


 with DM.ADOQuery5 do
 begin
   Close;
   SQL.Clear;
   SQL.Add('select * from data0257 where v_ttype='+ QuotedStr(trim(Edit1.Text)));
   Open;
 end;
 if (DM.ADOQuery5.FieldValues['rkey73']>0) or (DM.ADOQuery5.FieldValues['rkey73']<>Null) then
 begin
  with DM.ADOQuery2 do
  begin
    Close;
    sql.clear;
    SQL.Add('declare @classid as int');
    SQL.Add('INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES(''返工申请需要您工艺修改并提交,本厂编号为：'+ Edit12.Text+'  数量为：'+IntToStr(pcs_qty)+'pes '+IntToStr(pnl_qty)+'pnl'',GETDATE(),'+rkey73+')'+'select @classid=@@identity');
    SQL.Add('INSERT INTO data0314(emp_ptr,d14_ptr)VALUES('+dm.ADOQuery5.fieldbyname('rkey73').AsString+','+ '@classid'+')');
    ExecSQL;
  end;
  with dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
    Open;
  end;
  if Trim(dm.tmp.FieldByName('SUPLFEDSHIP').AsString) <> '' then
  begin
    DM.tmp2.SQL.Clear;
    DM.tmp2.Close;
    DM.tmp2.SQL.Text:='SELECT dbo.Data0005.PHONE, dbo.Data0073.RKEY, dbo.Data0005.EMPLOYEE_NAME '+
    'FROM dbo.Data0005 INNER JOIN '+
    'dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR where dbo.Data0073.RKEY= '+ dm.ADOQuery5.fieldbyname('rkey73').AsString;
    DM.tmp2.Open;
    DM.tmp3.SQL.Clear;
    DM.tmp3.Close;
    DM.tmp3.SQL.Text:='SELECT EMPLOYEE_NAME FROM Data0005 WHERE RKEY='+ user_ptr;
    DM.tmp3.Open;

    with dm.tmp1 do
    begin
      Close;
      SQL.Text:='insert ['+dm.tmp.FieldValues['SUPLFEDSHIP']+'].'+dm.tmp.FieldValues['SUPLFEDMAT']+'.dbo.'+dm.tmp.FieldValues['SUPLFEDMISC']+
                '(phonenumber,messagecontent,sendername,companyid) '+
                'values (:phonenumber,:messagecontent,:sendername,9)';
      if DM.tmp2.FieldByName('PHONE').Value<>Null then
      begin
        Parameters[0].Value:=DM.tmp2.FieldValues['PHONE'] ;
        Parameters[1].Value:='返工申请需要您工艺修改并提交,本厂编号为：'+ Edit12.Text+'  数量为：'+IntToStr(pcs_qty)+'pes '+IntToStr(pnl_qty)+'pnl';
        xxjs:=Parameters[1].Value;
        Parameters[2].Value:=DM.tmp3.FieldValues['EMPLOYEE_NAME'] ;
        ExecSQL;
       // ShowMessage('手机短信已发出');
      end;
    end;
  end;
 end;

end;

function TFrm_Detail.find_soerror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0203');
   sql.Add('where return_code='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TFrm_Detail.FormCreate(Sender: TObject);
begin
  dm.ads260.Close;

end;

procedure TFrm_Detail.FormShow(Sender: TObject);
begin
 DM.ads260.Close;
end;

procedure TFrm_Detail.N4Click(Sender: TObject);
var
 i:Integer;
begin
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
 stringgrid2.RowCount:=stringgrid2.RowCount-1; // 总行数等于总行数减一
 StringGrid2.Rows[1].Text:='';
end;



end.
