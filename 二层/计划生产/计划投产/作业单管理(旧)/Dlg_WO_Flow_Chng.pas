unit Dlg_WO_Flow_Chng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,ADoDB, Spin;

type
  TfrmDlg_WO_Flow_Chng = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtWONO: TEdit;
    Label16: TLabel;
    edtProdNo: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtQty: TEdit;
    edtFinQty: TEdit;
    Label2: TLabel;
    edtPlanDate: TEdit;
    edtDiscardQty: TEdit;
    Label12: TLabel;
    Label3: TLabel;
    edtONlinePCS: TEdit;
    Label4: TLabel;
    edtOnlinePNL: TEdit;
    Label5: TLabel;
    edtWorkStep: TEdit;
    Label19: TLabel;
    edtPriority: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    comboxStepNew: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    edtPriorityNew: TSpinEdit;
    procedure edtPriorityNewExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure comboxStepNewClick(Sender: TObject);
  private
    { Private declarations }
    EnterType:integer;
  public
    { Public declarations }
    procedure InitForm(WOrKey,iType,ProdRkey:integer);
  end;
                    
var
  frmDlg_WO_Flow_Chng: TfrmDlg_WO_Flow_Chng;

implementation

uses Dm,myClass,common;

{$R *.dfm}

{ TfrmDlg_WO_Flow_Chng }

procedure TfrmDlg_WO_Flow_Chng.InitForm(WOrKey, iType,ProdRkey: integer);
var
  sqlstr,tmpFlag,TmpStr:string;
  AdoqryTmp:TAdoQuery;
  sWtype:string;
begin
  EnterType:= iType;
  sqlstr:='';
  Memo1.Clear;
  //1.加载历史变更记录
{  if iType = 1 then//暂缓,恢复
    tmpFlag:=' (1,2) '
  else}
    tmpFlag:=' (1,2,3,4,5,6,7) ';
  sqlstr:= ' select data0117.*,data0005.employee_name from data0005,data0117 '+
           ' where data0117.source_type=2 and data0117.source_ptr='+IntToStr(WORkey)+' and Action in '+tmpFlag+
           ' and data0117.empl_ptr=data0005.rkey';
   try
     AdoqryTmp:=TAdoQuery.Create(nil);
     AdoqryTmp.Connection := dmcon.ADOConnection1;
     AdoqryTmp.SQL.Clear;
     AdoqryTmp.SQL.Add(sqlstr);
     AdoqryTmp.Open;
     AdoqryTmp.First;
     with AdoqryTmp do
     while not AdoqryTmp.Eof do begin
        case Fieldbyname('action').asinteger of
        0:   Memo1.Lines.Add('=== 从报废中创建于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        1:   Memo1.Lines.Add('=== 暂停生产于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        2:   Memo1.Lines.Add('=== 恢复生产于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        3:   Memo1.Lines.Add('=== 取消作业单于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        4:   Memo1.Lines.Add('=== 恢复作业单于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        5:   Memo1.Lines.Add('=== 作业单变返工'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        6:   Memo1.Lines.Add('=== 数量分拆于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        7:   Memo1.Lines.Add('=== 更改作业单于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
        end;
        if trim(fieldbyname('remark').asstring)<>'' then
          Memo1.Lines.Add(fieldbyname('remark').asstring);
        next;
     end;
     //2.加载作业单基本信息
     edtWONO.Text := dmcon.adsWOCtrlList.fieldByName('work_order_number').AsString; //作业单号
     edtProdNo.Text := dmcon.adsWOCtrlList.fieldByName('manu_part_number').AsString; //本厂编号
     edtQty.Text := dmcon.adsWOCtrlList.fieldByName('quan_sch').AsString;     //计划数量
     edtFinQty.Text := dmcon.adsWOCtrlList.fieldByName('quan_prod').AsString; //
     edtPlanDate.Text := dmcon.adsWOCtrlList.fieldByName('sch_compl_date').AsString;
     edtDiscardQty.Text := dmcon.adsWOCtrlList.fieldByName('quan_rej').AsString;
     edtPriority.Text := dmcon.adsWOCtrlList.fieldByName('priority_code').AsString;
     edtPriorityNew.Text := edtPriority.Text;
     //3.加载作业单在线信息
     sqlstr:= ' select d34.Dept_Code,D56.Step,d56.Qty_BackLog,d56.Panels from data0056 d56 inner join data0034 d34 on d56.dept_ptr=d34.rkey '+
              ' where D56.WO_Ptr='+IntToStr(WOrKey);
     MyDataClass.OpenQuery(adoQryTmp,sqlstr);
     if not adoQryTmp.IsEmpty then
     begin
       edtONlinePCS.Text := adoQryTmp.fieldByName('Qty_BackLog').AsString;
       edtOnlinePNL.Text := adoQryTmp.fieldByName('Panels').AsString;
       edtWorkStep.Text := copy(inttostr(1000+adoQryTmp.fieldbyname('step').Asinteger),2,3)+'. '+trim(adoQryTmp.fieldByName('Dept_Code').AsString);
     end;
     //4.加载变更工序列表
     if adoQryTmp.fieldByName('Step').IsNull then
     begin
       ShowMsg('发生非预期错误,工序为空,不能继续执行操作.请检查!',1);
       abort;
     end;
     if iType= 1 then  //返工(工序向前调整)
       sqlstr:= ' SELECT data0038.step_number,data0034.dept_code,data0034.rkey from data0038,data0034 where '+
                ' data0038.source_ptr='+IntToStr(ProdRkey)+' and data0038.dept_ptr=data0034.rkey and data0038.Step_Number<='+adoQryTmp.fieldByName('Step').AsString+
                ' and data0034.barcode_entry_flag='+QuotedStr('Y')+' order by data0038.step_number '
     else  begin//作业单变更(工序向后调整)
       sWtype:='';
       if dmcon.adsWOCtrlList.fieldByName('wtype').AsInteger>0 then sWtype:=' and data0038.Step_Number<'+dmcon.adsWOCtrlList.fieldByName('wtype').AsString;  //返工变更步骤 YYY 2010/06/01
       sqlstr:= ' SELECT data0038.step_number,data0034.dept_code,data0034.rkey from data0038,data0034 where '+
                ' data0038.source_ptr='+IntToStr(ProdRkey)+' and data0038.dept_ptr=data0034.rkey and data0038.Step_Number>='+adoQryTmp.fieldByName('Step').AsString+sWtype+
                ' and data0034.barcode_entry_flag='+QuotedStr('Y')+' order by data0038.step_number ';
     end;
     MyDataClass.OpenQuery(adoQryTmp,sqlstr);
     comboxStepNew.Items.Clear;
     adoQryTmp.First;
     while not adoQryTmp.Eof do begin
       TmpStr:= copy(inttostr(1000+adoQryTmp.fieldbyname('step_number').Asinteger),2,3)+'. '+trim(adoQryTmp.fieldByName('Dept_Code').AsString);
       comboxStepNew.Items.Add(tmpstr);
       adoQryTmp.Next;
     end;
     comboxStepNew.ItemIndex:= comboxStepNew.Items.IndexOf(edtWorkStep.Text);
   finally
     AdoqryTmp.Close;
     AdoqryTmp.Free;
   end;
end;

procedure TfrmDlg_WO_Flow_Chng.edtPriorityNewExit(Sender: TObject);
begin
  if [fsModal]<>self.FormState then exit;
  if edtPriorityNew.Value >9 then
  begin
    ShowMsg('优先级设定范围为0..9,请注意',1);
    edtPriorityNew.SetFocus;
  end;
end;

procedure TfrmDlg_WO_Flow_Chng.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  StepNew,StepCur:integer;
begin
  if modalresult <> mrok then exit;
  Canclose:=true;
  if trim(comboxStepNew.Text)='' then
  begin
    ShowMsg('必须选择调整工序!',1);
    canclose:=false;
    exit;
  end;
  StepNew:= StrtoInt(copy(comboxStepNew.Text,1,3));
  StepCur:= StrtoInt(copy(edtWorkStep.Text,1,3));
  if EnterType = 1 then //返工,调整工序必须小于当前工序
  begin
    if StepNew>=StepCur then
    begin
      ShowMsg('返工工序必须小于当前在线工序',1);
      Canclose:=false;
    end;
  end
  else          //作业单变更,调整工序要大于当前工序
    if StepNew<=StepCur then
    begin
      ShowMsg('作业单变更工序必须大于当前在线工序',1);
      Canclose:=false;
    end;
end;

procedure TfrmDlg_WO_Flow_Chng.Button1Click(Sender: TObject);
var
  msg:string;
begin
  with Dmcon.tmpQry  do //判断当前步骤是否有内层压合
  begin
    Close;
    SQL.Clear;
    SQL.Text:=' select * from data0025 '
             +' where PARENT_PTR in ( '
                       +' select BOM_PTR from  data0006 '
//                     +'select BOM_PTR from data0056 '
//                     +'join data0006 on data0056.WO_ptr=data0006.rkey '
                     +'where WORK_ORDER_NUMBER='+quotedStr(Dmcon.adsWOCtrlList.FieldByName('WORK_ORDER_NUMBER').AsString)
                     +')'
             +' and BOM_STEP>'+Dmcon.adsWOCtrlList.FieldByName('STEP').AsString+' and BOM_STEP<'+copy(comboxStepNew.Text,1,3);
   // ShowMessage(SQL.Text);
    Open;
    if  IsEmpty=False then
    begin
      msg:='';
      while not Eof do
      begin
        if msg<>'' then
          msg:=msg+#10#13;
        msg:=msg+'在第'+FieldByName('BOM_STEP').AsString+'步骤，有子部件“'+FieldByName('MANU_PART_NUMBER').AsString+'”需要分配！';
        Next;
      end;
      msg:=msg+#10#13+'所以无法更改。';
      MessageBox(Self.Handle,PChar(msg),'错误',MB_ok+MB_iconStop);
      Exit;
    end;
    
    Close;
    SQL.Clear;
    SQL.Text:='select WIPMAT_STATUS,* from data0006 where WORK_ORDER_NUMBER='
        +QuotedStr(Dmcon.adsWOCtrlList.FieldByName('WORK_ORDER_NUMBER').AsString)
        +' and  WIPMAT_STATUS=0 ';
    Open;
    if  IsEmpty=False then
    begin
      MessageBox(Self.Handle,PChar('在当前步骤，有子部件需要分配！'),'错误',MB_ok+MB_iconStop);
      Exit;
    end;
    Close;
  end;

  ModalResult:=mrOk;
end;

procedure TfrmDlg_WO_Flow_Chng.comboxStepNewClick(Sender: TObject);
begin
 if EnterType=1 then
 begin
  Memo2.Text:='由工序:'+edtWorkStep.Text+'  '+'到工序:'+comboxStepNew.Text+'  '+'原因:';
 end;
end;

end.
