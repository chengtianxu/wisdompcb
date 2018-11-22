unit wip_code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    StG1: TStringGrid;
    ProgressBar1: TProgressBar;
    StG2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure new_count();
    function if_instock():boolean;
    procedure StG1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
  private
    { Private declarations }
    rkey15,rkey07:integer;
  public
    { Public declarations }
    function find_489_06: Boolean; //查找有内层分配记录，但作业单为待发放状态
  end;

var
  Form2: TForm2;

implementation

uses demo, warehouse_search, main, searchgroup;

{$R *.dfm}

function TForm2.find_489_06: Boolean;
var
  sWORK_ORDER_NUMBER: string;
  Number: Integer;
begin
  //Number:=0;
  sWORK_ORDER_NUMBER:='';
  with dm.qrytmp do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT DISTINCT Data0006.WORK_ORDER_NUMBER FROM Data0006');
    sql.Add('INNER JOIN Data0489 ON Data0006.RKEY=Data0489.WO_PTR');
    sql.Add('WHERE Data0006.PROD_STATUS=2 ');   //PROD_STATUS=2待发放
    open;
    Number:= RecordCount;
    First;
    while not Eof do
    begin
      if sWORK_ORDER_NUMBER='' then
        sWORK_ORDER_NUMBER:= FieldByName('WORK_ORDER_NUMBER').AsString
      else
        sWORK_ORDER_NUMBER:=sWORK_ORDER_NUMBER+#13+FieldByName('WORK_ORDER_NUMBER').AsString;
      Next;
    end;
    if isempty then
     result:=false
    else
    begin
     result:=true;
  messagedlg(Format('对不起内层分配有记录但作业单未能发放到产线不能截数！'+#13+#13+'%d个作业单号:'+#13+'%s',[Number,sWORK_ORDER_NUMBER])
                ,mterror,[mbcancel],0)
    end;
  end;
end;

procedure TForm2.new_count();
var
 i,serial_no:integer;
begin

 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('delete from data0401');
   sql.Add('where header_ptr='+dm.ADP400rkey.AsString);
   ExecSQL;
  end;

 dm.ADO401.Close;
 dm.ADO401.Parameters[0].Value := null;
 dm.ADO401.Open;

 if rkey07>0 then
  with dm.ADO56 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('and data0008.pr_grp_pointer='+inttostr(rkey07));
   end
  else
   with dm.ADO56 do
    begin
     close;
     sql.Delete(sql.Count-1);
     sql.add('');
    end;

 serial_no:=1;
 for i:=1 to stg2.RowCount-2 do
  begin

   dm.ADO56.Close;
   dm.ADO56.Parameters[0].Value:=strtoint(stg2.Cells[2,i]);
   dm.ADO56.Parameters[1].Value:=self.rkey15;
   dm.ADO56.Open;

   progressbar1.Position:=0;
   while not dm.ADO56.Eof do
    begin
     dm.ADO401.Append;
     dm.ADO401header_ptr.Value:=dm.ADP400rkey.Value;
     dm.ADO401wo_ptr.Value:=dm.ado56wo_ptr.value;
     dm.ADO401dept_ptr.Value:=dm.ADO56DEPT_PTR.Value;
     dm.ADO401wip_system_qty.Value:=dm.ADO56QTY_BACKLOG.Value;
     dm.ADO401panels.Value:= dm.ADO56PANELS.Value;   //新增字段
     dm.ADO401physical_panels.Value :=dm.ADO56PANELS.Value;   //新增字段
     dm.ADO401wiprkey_ptr.Value := dm.ADO56rkey.Value;//新增字段
     dm.ADO401wip_ptr.Value:=dm.ado56step.value;
     dm.ADO401seaial_no.Value:=serial_no;
     dm.ADO401WTYPE.Value:=dm.ADO56WTYPE.Value;//正常，返工
     dm.ADO401INTIME.Value:=dm.ADO56INTIME.Value; //工序接收时间
     if dm.ADO56LOC_PTR.Value>0 then
      dm.ADO401wharehouse_ptr.Value:=dm.ADO56LOC_PTR.Value
     else
      dm.ADO401wharehouse_ptr.Value:=dm.ADP400whouse_ptr.Value;
     inc(serial_no);
     dm.ADO401.Post;
     if dm.ado56.RecNo=dm.ado56.RecordCount then
      progressbar1.Position:=50
     else
      if progressbar1.Position<50 then
       progressbar1.Position:=progressbar1.Position+2;
     dm.ADO56.Next;
    end;
  end;
 dm.ADO56.Close;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:integer;
begin
stg1.Cells[0,0]:='工序代码';
stg1.Cells[1,0]:='工序名称';
stg2.Cells[0,0]:='工序代码';
stg2.Cells[1,0]:='工序名称';
stg2.ColWidths[0]:=stg1.ColWidths[0];
dm.ado34.Open;
dm.ado34.First;
stg1.RowCount:=dm.ado34.RecordCount+2;
for i:=1 to dm.ado34.RecordCount do
 begin
  stg1.Cells[0,i]:=dm.ado34dept_code.Value;
  stg1.Cells[1,i]:=dm.ado34dept_name.Value;
  stg1.Cells[2,i]:=dm.ado34rkey.AsString;
  stg1.Cells[3,i]:=inttostr(i);
  dm.ado34.Next;
 end;
 
if edit1.Enabled=true then  //如果新增
 begin
  rkey15:=0; //给仓库指针赋初始值
  rkey07:=0;
 end
else
 begin
  rkey15:=dm.ADP400whouse_ptr.Value;
  rkey07:=dm.ADP400group_ptr.Value;
  if rkey07>0 then
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select PR_GRP_CODE,PRODUCT_GROUP_NAME from data0007');
     sql.Add('where rkey='+inttostr(rkey07));
     open;
     edit4.Text:=fieldvalues['pr_grp_code'];
     edit4.Font.Color := clwindowtext;
     label8.Caption := fieldvalues['product_group_name'];
    end;
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
 i:integer;
begin
if stg1.RowCount<>2 then
 begin
  dm.ado34.First;
  stg2.RowCount:=dm.ado34.RecordCount+2;
  for i:=1 to dm.ado34.RecordCount do
   begin
    stg2.Cells[0,i] := dm.ado34dept_code.Value;
    stg2.Cells[1,i] := dm.ado34dept_name.Value;
    stg2.Cells[2,i] := dm.ado34rkey.AsString;
    stg2.Cells[3,i] := inttostr(i);
    dm.ado34.Next;
   end;
  stg2.ColWidths[1]:=190;
  for i:=1 to stg1.RowCount-2 do stg1.Rows[i].Clear;
   stg1.RowCount:=2;
   stg1.ColWidths[1]:=207;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i,j,ii,jj:integer;
begin                             //第一步实现stg2的插入
for i:=stg1.Selection.Top to stg1.Selection.Bottom do
 if i<>stg1.RowCount-1 then //如果当前行不是最后一行
  begin
   if stg2.RowCount=2 then  //如果STG2当前是空行
    stg2.Rows[1].Text := stg1.Rows[i].Text
   else
    for ii:=1 to stg2.RowCount-2 do //排序寻找插入的位置
     if strtoint(stg2.Cells[3,ii])>strtoint(stg1.Cells[3,i]) then
      begin
       for jj:=stg2.RowCount-1 downto ii do
        if jj<>ii then
         stg2.Rows[jj].Text := stg2.Rows[jj-1].Text
        else
         stg2.Rows[jj].Text := stg1.Rows[i].Text;
       break;   //插入后跳出内循环
      end
     else                                                         //增加
      if ii=stg2.RowCount-2 then//小于当前行并且是最后一行
       stg2.Rows[ii+1].Text := stg1.Rows[i].Text;
   stg2.RowCount := stg2.RowCount+1;
  end;
                                  //第二步实现stg1的删除
 for i:=stg1.Selection.Top to stg1.Selection.Bottom do
  begin
   for j:=stg1.Selection.Top to stg1.RowCount-2 do
    stg1.Rows[j].Text:=stg1.Rows[j+1].Text;
   if stg1.Selection.Top<=stg1.RowCount-2 then
    stg1.RowCount:=stg1.RowCount-1;
  end;

if stg2.RowCount>=15 then stg2.ColWidths[1]:=190;
if stg1.RowCount<=14 then stg1.ColWidths[1]:=270;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
 i:integer;
begin
if stg2.RowCount<>2 then
 begin
  dm.ado34.First;
  stg1.RowCount:=dm.ado34.RecordCount+2;
  for i:=1 to dm.ado34.RecordCount do
   begin
    stg1.Cells[0,i] := dm.ado34dept_code.Value;
    stg1.Cells[1,i] := dm.ado34dept_name.Value;
    stg1.Cells[2,i] := dm.ado34rkey.AsString;
    stg1.Cells[3,i] := inttostr(i);
    dm.ado34.Next;
   end;
  stg1.ColWidths[1]:=190;
  for i:=1 to stg2.RowCount-2 do stg2.Rows[i].Clear;
   stg2.RowCount:=2;
   stg2.ColWidths[1]:=207;
 end;

end;

procedure TForm2.Button3Click(Sender: TObject);
var
 i,ii,j,jj:integer;
begin                               //第一步实现stg1的插入
for i:=stg2.Selection.Top to stg2.Selection.Bottom do
 if i<>stg2.RowCount-1 then //如果当前行不是最后一行
  begin
   if stg1.RowCount=2 then  //如果STG1当前是空行
    stg1.Rows[1].Text := stg2.Rows[i].Text
   else
    for ii:=1 to stg1.RowCount-2 do //排序寻找插入的位置
     if strtoint(stg1.Cells[3,ii])>strtoint(stg2.Cells[3,i]) then
      begin
       for jj:=stg1.RowCount-1 downto ii do
        if jj<>ii then
         stg1.Rows[jj].Text := stg1.Rows[jj-1].Text
        else
         stg1.Rows[jj].Text := stg2.Rows[i].Text;
       break;   //插入后跳出内循环
      end
     else                                                         //增加
      if ii=stg1.RowCount-2 then//小于当前行并且是最后一行
       stg1.Rows[ii+1].Text := stg2.Rows[i].Text;
   stg1.RowCount := stg1.RowCount+1;
  end;
//******************************************************************************
                                                    //第二步实现stringgrid2的删除
 for i:=stg2.Selection.Top to stg2.Selection.Bottom do
  begin
   for j:=stg2.Selection.Top to stg2.RowCount-2 do
    stg2.Rows[j].Text:=stg2.Rows[j+1].Text;
   if stg2.Selection.Top<=stg2.RowCount-2 then
    stg2.RowCount:=stg2.RowCount-1;
  end;
if stg2.RowCount<=14 then stg2.ColWidths[1]:=270;
if stg1.RowCount>=15 then stg1.ColWidths[1]:=190;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
TRY
 form_wh:=tform_wh.Create(application);
 form_wh.Edit1.Text := trim(edit2.Text);
 if form_wh.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
   edit2.SetFocus;
  end
 else
 if form_wh.ShowModal=mrok then
  begin
   edit2.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   edit2.Font.Color := clwindowtext;
   label4.Caption := form_wh.ADOQuery1.FieldValues['warehouse_name'];
   rkey15 :=form_wh.ADOQuery1.fieldbyname('rkey').AsInteger;
   edit3.SetFocus;
  end
 else
  edit2.SetFocus;
FINALLY
 form_wh.free;
END;

end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') AND
   (trim(edit2.Text)<>'') then
 try
  form_wh:=Tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit2.Text);
  if comparetext(trim(edit2.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
   begin
    edit2.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
    edit2.Font.Color := clwindowtext;
    label4.Caption :=form_wh.ADOQuery1.fieldbyname('warehouse_name').AsString;
    rkey15 := form_wh.ADOQuery1.fieldbyname('rkey').AsInteger;
   end
  else
   begin
    messagedlg('请输入正确的仓库代码!',mterror,[mbcancel],0);
    edit2.SetFocus;
   end;
 finally
  form_wh.free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') AND
   (trim(edit2.Text)='') then
 begin
  label4.Caption := '';
  rkey15 := 0;
 end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ado34.Close;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if edit1.Enabled=true then   //新增(编辑时不允许编辑盘点代码)
 begin
  if trim(edit1.Text)='' then
   begin
    messagedlg('请输入正确的盘点代码!',mtinformation,[mbok],0);
    edit1.SetFocus;
    exit;
   end
  else
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select rkey from data0400');
     sql.Add('where wip_CODE='''+trim(edit1.Text)+'''');
     open;
     if not isempty then
      begin
       messagedlg('不允许盘点代码重复,请重新输入!',mtinformation,[mbok],0);
       edit1.SetFocus;
       exit;
      end;
    end;
 end;

if rkey15=0 then
 begin
  messagedlg('请输入需要盘点的工厂!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;

if stg2.RowCount=2 then
 begin
  messagedlg('请确定需要盘点的工序!',mtinformation,[mbok],0);
  stg2.SetFocus;
  exit;
 end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  sMANU_PART_NUMBER, sWORK_ORDER_NUMBER: string;
begin
  //************如果有内层分类了，但是还没有发放的，禁止保存
  //**ChengTX 2017-3-1
  if find_489_06 then Exit;

  //**********************

  sMANU_PART_NUMBER:= '';
  sWORK_ORDER_NUMBER:= '';

  with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select 1 from data0549 where status = 0');
   open;
  end;
  if not DM.ADOQuery2.IsEmpty then
  begin
    ShowMessage('存在报废反审核，待确认的记录，请先反审核后在操作。');
    Exit;
  end;

  with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT DISTINCT t6.WORK_ORDER_NUMBER,t25.MANU_PART_NUMBER FROM Data0006 t6');
   sql.Add('INNER JOIN Data0025 t25 ON t6.BOM_PTR=t25.RKEY');
   sql.Add('INNER JOIN Data0025 t25_1 ON t25.RKEY=t25_1.PARENT_PTR');
   sql.Add('WHERE t6.PROD_STATUS=2 AND t6.WIPMAT_STATUS=1');
   sql.Add('AND EXISTS(SELECT 1 FROM Data0489 t489 WHERE t6.RKEY=t489.WO_PTR)');
   open;
  end;
  dm.ADOQuery2.First;
  while not dm.ADOQuery2.Eof do
  begin
    if sMANU_PART_NUMBER='' then
      sMANU_PART_NUMBER:= dm.ADOQuery2.FieldByName('MANU_PART_NUMBER').AsString
    else
      sMANU_PART_NUMBER:=sMANU_PART_NUMBER+','+dm.ADOQuery2.FieldByName('MANU_PART_NUMBER').AsString;
    if sWORK_ORDER_NUMBER='' then
      sWORK_ORDER_NUMBER:= dm.ADOQuery2.FieldByName('WORK_ORDER_NUMBER').AsString
    else
      sWORK_ORDER_NUMBER:=sWORK_ORDER_NUMBER+','+dm.ADOQuery2.FieldByName('WORK_ORDER_NUMBER').AsString;
    dm.ADOQuery2.Next;
  end;
  if dm.ADOQuery2.RecordCount>0 then
  begin
    Showmessage(Format('存在 %d 笔内层已分配且待发放的外层作业单！'+#13+#13+'本厂编号: %s '+#13+'作业单号: %s ',
                      [dm.ADOQuery2.RecordCount,sMANU_PART_NUMBER,sWORK_ORDER_NUMBER]));
    Abort;
  end;
  with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('Select number From Data0414 Where STATUS <> 3');
   Open;
  end;
  if dm.ADOQuery2.RecordCount>0 then
  begin
    Showmessage(Format('退货成品检视有 %d 笔未完成！'+#13+#13+'MRB编号: %s ',
                      [dm.ADOQuery2.RecordCount,
                       dm.ADOQuery2.FieldByName('number').AsString]));
    Abort;
  end;
if self.if_instock=true then
 begin
  stg2.SetFocus;
  exit;
 end;

if edit1.Enabled=false then
if messagedlg('原相关盘点清单将会被删除重新生成盘点清单,确认吗?',mtconfirmation,[mbyes,mbno],0)=mrNo then
 exit;

dm.ADOConnection1.BeginTrans;
if edit1.Enabled=true then  //如果是新增盘点
 with dm.ADP400 do
  begin
   append;
   dm.ADP400wip_code.Value := trim(edit1.Text);
   dm.ADP400user_ptr.Value := form1.v_employee;
   dm.ADP400ent_date.Value := form1.v_date;
   dm.ADP400whouse_ptr.Value := self.rkey15;
   dm.ADP400status.Value:=0;
   dm.ADP400serial_no.Value:=trim(edit3.Text);
   if rkey07>0 then
    dm.ADP400group_ptr.Value:=rkey07;
   post;
  end
else               //如果是编辑盘点
 with dm.ADP400 do
  begin
   edit;
   dm.ADP400whouse_ptr.Value:=self.rkey15;
   dm.ADP400status.Value:=0;
   dm.ADP400serial_no.Value:=trim(edit3.Text);
   if rkey07>0 then
    dm.ADP400group_ptr.Value:=rkey07;
   post;
  end;

 self.new_count();

if dm.ADO401.IsEmpty then
 begin
  messagedlg('没有找到需要盘点的在线工单,请重新选择工序!',mtinformation,[mbok],0);
  dm.ADOConnection1.RollbackTrans;
 end
else
 try
  dm.ADOConnection1.CommitTrans;   //提交事物退出界面
  dm.ADO401.Close;
  ModalResult:=mrok;
 except
  dm.ADOConnection1.RollbackTrans;
 end;

end;


procedure TForm2.StG1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (acol=2) or (acol=3) then canselect:=false;
end;


function tform2.if_instock():boolean;
var
 i:integer;
begin
 if_instock:=false;
 for i:=1 to stg2.RowCount-2 do
  begin
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select data0056.rkey from data0056');
     sql.Add('inner join data0006 on Data0056.WO_PTR = Data0006.RKEY');
     sql.Add('inner join data0492 on data0006.cut_no=data0492.cut_no');
     sql.Add('where data0056.TO_BE_STOCKED<>0');
     sql.Add('and Data0056.DEPT_PTR ='+stg2.Cells[2,i]);
     sql.Add('and data0492.whouse_ptr ='+inttostr(self.rkey15));
     open;
    end;
    if not dm.ADOQuery2.IsEmpty then
    begin
     showmessage('工序：'+stg2.Cells[1,i]+' 有在线的等待入仓审核的作业单暂时不能盘点!');
     if_instock:=true;
     break;
    end;
  end;

end;

procedure TForm2.Edit4Click(Sender: TObject);
begin
if edit4.Font.Color=clwindowtext then
 begin
  edit4.SelectAll;;
  edit4.Font.Color:=clblue;
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
form_group:=tform_group.Create(application);
if form_group.ShowModal=mrok then
 begin
  self.rkey07:=form_group.ADOQuery1rkey.value;
  edit4.Text:=form_group.ADOQuery1pr_grp_code.Value;
  edit4.Font.Color:=clwindowtext;
  label8.Caption:=form_group.ADOQuery1product_group_name.Value;
 end;
form_group.Free;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4') AND
   (trim(edit4.Text)<>'') then
 try
  form_group:=Tform_group.Create(application);
  form_group.Edit1.Text := trim(edit4.Text);
  if comparetext(trim(edit4.text),trim(form_group.ADOQuery1pr_grp_code.Value))=0 then
   begin
    edit4.Font.Color := clwindowtext;
    label8.Caption := form_group.ADOQuery1product_group_name.Value;
    rkey07:=form_group.ADOQuery1rkey.Value;
   end
  else
   begin
    messagedlg('请输入正确的产品组代码!',mterror,[mbcancel],0);
    edit4.SetFocus;
   end;
 finally
  form_group.free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4') AND
   (trim(edit4.Text)='') then
 begin
  label8.Caption := '';
  rkey07 := 0;
 end;
end;

end.
