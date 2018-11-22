unit Editfrm_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, uBaseEditFrm,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt,
  Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Grids, uRKeyBtnEdit, Datasnap.DBClient,
  Data.DB, EhLibVCL, Vcl.Menus, Vcl.DBGrids, Data.Win.ADODB, Datasnap.Provider,uCommFunc,
  uBaseSinglePickListFrm,uLookupDM;

type
  TAfterAppendEvent_Mod280 = procedure of object;
  TfrmEdit_mod280 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DtpReqDate: TDateTimePicker;
    RedtUser: TRKeyRzBtnEdit;
    cds68: TClientDataSet;
    ds68: TDataSource;
    ds69: TDataSource;
    RedtUserPhone: TRKeyRzBtnEdit;
    RedtFactory: TRKeyRzBtnEdit;
    RedtAppCode: TRKeyRzBtnEdit;
    RedtBudtCode: TRKeyRzBtnEdit;
    RedtRqDept: TRKeyRzBtnEdit;
    RedtRqNumber: TRKeyRzBtnEdit;
    RedtYear: TRKeyRzBtnEdit;
    RedtMonth: TRKeyRzBtnEdit;
    pm69: TPopupMenu;
    mniNew69: TMenuItem;
    mniEdit69: TMenuItem;
    mniDele69: TMenuItem;
    N4: TMenuItem;
    mniView69: TMenuItem;
    cds69: TClientDataSet;
    cdsLookUp17: TClientDataSet;
    cdstmp: TClientDataSet;
    ds204: TDataSource;
    cds204: TClientDataSet;
    eh69: TDBGridEh;
    BtnApp: TBitBtn;
    BtnRet: TBitBtn;
    pmAwd69: TPopupMenu;
    mniAddAwd: TMenuItem;
    mniEdtiAwd: TMenuItem;
    mniDelAwd: TMenuItem;
    mniViewAwd: TMenuItem;
    LbRquser: TLabel;
    RedtRquser: TRKeyRzBtnEdit;
    LbPuruser: TLabel;
    RedtPuruser: TRKeyRzBtnEdit;
    BtnBudDet: TButton;
    eh204: TDBGridEh;
    cdsAP68: TClientDataSet;
    cdsAP69: TClientDataSet;
    cdsAP204: TClientDataSet;
    stdDetail: TStringGrid;
    cdsLookUp23: TClientDataSet;
    cdsLookUpZx23: TClientDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure mniNew69Click(Sender: TObject);
    procedure mniEdit69Click(Sender: TObject);
    procedure mniDele69Click(Sender: TObject);
    procedure mniView69Click(Sender: TObject);
    procedure RedtFactoryButtonClick(Sender: TObject);
    procedure RedtAppCodeButtonClick(Sender: TObject);
    procedure RedtBudtCodeButtonClick(Sender: TObject);
    procedure RedtUserButtonClick(Sender: TObject);
    procedure pm69Popup(Sender: TObject);
    procedure BtnAppClick(Sender: TObject);
    procedure BtnRetClick(Sender: TObject);
    procedure mniAddAwdClick(Sender: TObject);
    procedure RedtPuruserButtonClick(Sender: TObject);
    procedure RedtRquserButtonClick(Sender: TObject);
    procedure mniEdtiAwdClick(Sender: TObject);
    procedure mniDelAwdClick(Sender: TObject);
    procedure mniViewAwdClick(Sender: TObject);
    procedure BtnBudDetClick(Sender: TObject);
    procedure RedtBudtCodeExit(Sender: TObject);
    procedure RedtRquserExit(Sender: TObject);
    procedure RedtUserExit(Sender: TObject);
    procedure pmAwd69Popup(Sender: TObject);
    procedure RedtFactoryExit(Sender: TObject);
    procedure return_req(pr_number:string);
    procedure RedtRquserEnter(Sender: TObject);
  private
    { Private declarations }
    req_nuber:string;
    LReq_Reason:string;
    function getReqNo(sWare_type,sPr_id:string):string;
    function check_same_mate():Boolean;
    function Check_Po(APoNumber:string):Boolean;      //add by zsp 2017-03-20

  public
    { Public declarations }
    FsModid:Integer;
    FEditType: Integer;//0新增,1编辑,2检查,3复制
    FsWare_type,Pr_id:string;
    FAfterAppend: TAfterAppendEvent_Mod280;
    procedure Append68(Ftype:string;Smodid:Integer);
    procedure Init(Ftype:string;Smodid:Integer);
    procedure GetData(ARkey,SFlag: string);
  end;

var
  frmEdit_mod280: TfrmEdit_mod280;

implementation

uses
  System.StrUtils, System.DateUtils,EditDetail_Mod280, EditDetailZx_Mod280,
  EditDetail_Mod27, EditDetailZx_Mod27, BugetDel_Mod27, Remark_Mod280,
  CodeFrm_Mod280;

{$R *.dfm}

procedure TfrmEdit_mod280.Append68(Ftype:string;Smodid:Integer);
var
Lsql:string;
begin
  if FEditType=0 then
  begin
  Lsql:='SELECT Data0034.DEPT_CODE,Data0034.dept_name,Data0005.RKEY rkey05,data0034.pr_id '+
        'FROM Data0005 INNER JOIN '+
        'Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY '+
        'where data0005.rkey='+gvar.rkey05;
  gSvrIntf.IntfGetDataBySql(Lsql,cdstmp); //得到当前用户所在部门
  if Smodid=280 then
   Pr_id:=cdstmp.FieldByName('pr_id').AsString;

  cds68.Append;
   if Smodid=280 then
   begin
   cds68.FieldByName('USER_PTR').AsString := gVar.rkey73; // 73
   cds68.FieldByName('REQ_BY').AsString := gVar.rkey05; // 05
   end;
  cds68.FieldByName('REQ_DATE').AsDateTime := dtpReqDate.Date; // 请购日期

  if Smodid=280 then
  cds68.FieldByName('STATUS').AsString := '7' // 状态
  else
  cds68.FieldByName('STATUS').AsString := '3';

  if Smodid=280 then
  cds68.FieldByName('CURRENY_PTR').AsString := '1' //新建记录说明:1请购部门直接新增,2采购授理直接新增
  else
  cds68.FieldByName('CURRENY_PTR').AsString := '2';

  if Smodid=280 then
  cds68.FieldByName('DEPARTMENT_NAME').AsString := cdstmp.FieldByName('dept_code').AsString; // 请购部门代码

  cds68.FieldByName('FLAG').AsString :=Ftype; // (S,M)标准,杂项
  cds68.FieldByName('v_year').AsInteger :=
    StrToInt(FormatDateTime('YYYY', gFunc.GetSvrDateTime)); // 预算使用年度
  cds68.FieldByName('v_month').AsInteger :=
    StrToInt(FormatDateTime('MM', gFunc.GetSvrDateTime)); // 预算使用月份
  cds68.FieldByName('user_name').AsString := RedtUser.Text; // 使用人员姓名
  cds68.FieldByName('user_phone').AsString := RedtUserPhone.Text; // 使用人员电话
  cds68.FieldByName('idkey').Value := gFunc.CreateIDKey;
   if Smodid=280 then //新增请购单程序初始化一些输入数据
   begin
    Lsql:='select * from data0015 where 1=1';//初始化工厂及请购编号
    gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
    if (not cdstmp.IsEmpty) and (cdstmp.RecordCount=1) then
    begin
    cds68.FieldByName('whse_ptr').AsInteger:=cdstmp.FieldByName('rkey').AsInteger;
    FsWare_type:=cdstmp.FieldByName('warehouse_type').AsString;
    cds68.FieldByName('PO_REQ_NUMBER').AsString:=getReqNo(FsWare_type, Pr_id);
    end;

    Lsql:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC'+
        ' from data0094 inner join data0034 on data0094.dept_ptr=data0034.RKEY'+
        ' where data0094.type=0 and data0034.dept_code='+quotedstr(redtrqdept.Text);
    gSvrIntf.IntfGetDataBySql(Lsql,cdstmp); //初始化默认审批代码
    if (not cdstmp.IsEmpty) and (cdstmp.RecordCount=1) then
    begin
    cds68.FieldByName('Auth_type').AsInteger:=cdstmp.FieldByName('rkey').AsInteger;
    end;

    Lsql:='select top 1 data0362.rkey,data0362.code,data0362.DESCRIPTION'+
        ' from data0362 inner join data0363 on data0363.budget_ptr=data0362.rkey'+
        ' where data0362.bud_year='+redtyear.Text+' and data0363.user_ptr='+gvar.rkey73;
    gSvrIntf.IntfGetDataBySql(Lsql,cdstmp); //初始化默认预算代码
    if not cdstmp.IsEmpty then
    begin
    cds68.FieldByName('budget_ptr').AsInteger:=cdstmp.FieldByName('rkey').AsInteger;
    end;

//    Lsql:='select * from data0005 where rkey='+gvar.rkey05;
//    gSvrIntf.IntfGetDataBySql(Lsql,cdstmp); //初始化使用人员默认当前用户
//    if not cdstmp.IsEmpty then
//    begin
//    cds68.FieldByName('user_name').AsString:=cdstmp.FieldByName('EMPLOYEE_NAME').AsString;
//    cds68.FieldByName('user_phone').AsString:=cdstmp.FieldByName('PHONE').AsString;
//    end;
   end;
   cds68.Post;
  end;
  if FEditType=3 then //复制新增
  begin
    cds68.FieldByName('v_year').AsInteger :=
    StrToInt(FormatDateTime('YYYY', gFunc.GetSvrDateTime)); //预算使用年度
    cds68.FieldByName('v_month').AsInteger :=
    StrToInt(FormatDateTime('MM', gFunc.GetSvrDateTime)); //预算使用月份
    if Smodid=280 then //当为开请购单程序复制新增时数据初始化
    begin
      Lsql:='SELECT Data0034.DEPT_CODE,Data0034.dept_name,Data0005.RKEY rkey05,data0034.pr_id '+
          'FROM Data0005 INNER JOIN '+
          'Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY '+
          'where data0005.rkey='+gvar.rkey05;
      gSvrIntf.IntfGetDataBySql(Lsql,cdstmp); //得到当前用户所在部门
      Pr_id:=cdstmp.FieldByName('pr_id').AsString;

      Lsql:='select top 1 * from data0015 where rkey='+cds68.FieldByName('WHSE_PTR').AsString;//初始化工厂及请购编号
      gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
      if not cdstmp.IsEmpty then
      begin
       FsWare_type:=cdstmp.FieldByName('warehouse_type').AsString;
      end;

      cds68.FieldByName('PO_REQ_NUMBER').AsString:=getReqNo(FsWare_type, Pr_id);
      cds68.FieldByName('USER_PTR').AsString := gVar.rkey73; //需求者73
      cds68.FieldByName('REQ_BY').AsString := gVar.rkey05; //需求者05
    end;
    if Smodid=280 then
     cds68.FieldByName('STATUS').AsString := '7' //开请购新增状态为未提交
    else
    cds68.FieldByName('STATUS').AsString := '3'; //请购单授理新增状态为已批准

    cds68.FieldByName('REQ_DATE').AsDateTime := dtpReqDate.Date; // 请购日期
    cds68.FieldByName('idkey').Value := gFunc.CreateIDKey;
    cds68.Post;
  end;
end;

procedure TfrmEdit_mod280.BtnAppClick(Sender: TObject);
var
LPostData: OleVariant;
Lcds68,Lcds276,Lcds276_2,Lcds68_2:TClientDataSet;
Lsql68,Lsql276,Lsql276_2,Lsql68_2:string;
begin
 inherited;
   Lsql68_2:='SELECT data0276.rkey as rkey276,data0276.ranking'+
   ' from data0068 inner join data0276'+
   ' ON Data0068.RKEY = data0276.purchase_ptr'+
   ' INNER JOIN Data0073 ON data0276.user_ptr = Data0073.RKEY'+
   ' where data0068.rkey='+cds68.FieldByName('rkey').AsString+
   ' and data0073.rpl_pr_ptr='+gvar.rkey73;
   Lcds68_2:=TClientDataSet.Create(nil);
   try
   gSvrIntf.IntfGetDataBySql(Lsql68_2,Lcds68_2);
   Lsql276:='select * from data0276 where rkey='+Lcds68_2.FieldByName('rkey276').AsString;
   Lsql276_2:='select * from data0276 where rkey=('+
   ' select top 1 rkey from data0276 where purchase_ptr='+cds68.FieldByName('rkey').AsString+
   ' and ranking>'+Lcds68_2.FieldByName('ranking').AsString+' order by ranking asc)';
   finally
    Lcds68_2.Free;
   end;
   Lsql68:='select * from data0068 where rkey='+cds68.FieldByName('rkey').AsString;
   Lcds68:=TClientDataSet.Create(nil);
   Lcds276:=TClientDataSet.Create(nil);
   Lcds276_2:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql68,Lsql276,Lsql276_2]),[Lcds68,Lcds276,Lcds276_2]);
   if Lcds68.FieldByName('status').value<>cds68.FieldByName('status').value then
   begin
    ShowMessage('请购单状态发生变化,审核失败!');
    Exit;
   end;
   Lcds276.Edit;
   Lcds276.FieldByName('auth_flag').Value:='N';
   Lcds276.FieldByName('auth_date').Value:=gFunc.GetSvrDateTime;
   Lcds276.Post;
   if not Lcds276_2.IsEmpty then //如果当前不是最后一个人审核
   begin
    Lcds68.Edit;
    Lcds68.FieldByName('edited_date').Value:=gFunc.GetSvrDateTime;
    Lcds68.Post;
    Lcds276_2.Edit;
    Lcds276_2.FieldByName('auth_flag').Value:='Y';
    Lcds276_2.FieldByName('auth_date').Value:=null;
    Lcds276_2.Post;
   end
   else  //当前已是最后一个人审核
   begin
    Lcds68.Edit;
    Lcds68.FieldByName('edited_date').Value:=gFunc.GetSvrDateTime;
    Lcds68.FieldByName('status').Value:=3;
    Lcds68.Post;
   end;
   if Lcds68.State in [dsEdit,dsInsert] then Lcds68.Post;
   if Lcds276.State in [dsEdit,dsInsert] then Lcds276.Post;
   if Lcds276_2.State in [dsEdit,dsInsert] then Lcds276_2.Post;
   LPostData := VarArrayCreate([0,2],varVariant);
     if Lcds68.ChangeCount > 0 then
    LPostData[0] := Lcds68.Delta;
  if Lcds276.ChangeCount > 0 then
    LPostData[1] := Lcds276.Delta;
  if Lcds276_2.ChangeCount > 0 then
    LPostData[2] := Lcds276_2.Delta;
  if gSvrIntf.IntfPostModData('公共基础',28,LPostData) then
  begin
    if Lcds68.ChangeCount > 0 then Lcds68.MergeChangeLog;
    if Lcds276.ChangeCount > 0 then Lcds276.MergeChangeLog;
    if Lcds276_2.ChangeCount > 0 then Lcds276_2.MergeChangeLog;
    ShowMessage('审批成功');
  end;
  finally
  Lcds68.Free;
  Lcds276.Free;
  Lcds276_2.Free;
  end;
  Close;
  FAfterAppend;
end;


procedure TfrmEdit_mod280.BtnBudDetClick(Sender: TObject);
var
 i:byte;
 year_total,used_total:real;
 Lcds362:TClientDataSet;
begin
 year_total:=0;
 used_total:=0;
 Lcds362:=TClientDataSet.Create(nil);
 try
 frmBugetDel_Mod27:=tfrmBugetDel_Mod27.Create(application);
 frmBugetDel_Mod27.Edit1.Text:=RedtBudtCode.Text;
 gSvrIntf.IntfGetDataBySql('select * from data0362 where rkey='+cds68.FieldByName('budget_ptr').AsString,Lcds362);
 for i:=1 to 12 do
   begin
    frmBugetDel_Mod27.editor1.Cells[1,i] := formatfloat('0.00',Lcds362.FieldValues['BUDGET_PERIOD_'+inttostr(i)]);
    frmBugetDel_Mod27.editor1.Cells[2,i] := formatfloat('0.00',Lcds362.FieldValues['USED_PERIOD_'+inttostr(i)]);
    frmBugetDel_Mod27.editor1.Cells[3,i] := formatfloat('0.00',Lcds362.FieldValues['BUDGET_PERIOD_'+inttostr(i)]-Lcds362.FieldValues['USED_PERIOD_'+inttostr(i)]);
    year_total:=year_total+Lcds362.FieldValues['BUDGET_PERIOD_'+inttostr(i)];
    used_total:=used_total+Lcds362.FieldValues['USED_PERIOD_'+inttostr(i)];
   end;
  frmBugetDel_Mod27.editor1.cells[1,13] := formatfloat('0.00',year_total);
  frmBugetDel_Mod27.editor1.cells[2,13] := formatfloat('0.00',used_total);
  frmBugetDel_Mod27.editor1.cells[3,13] := formatfloat('0.00',year_total-used_total);
  frmBugetDel_Mod27.ShowModal;
 finally
  Lcds362.Free;
  frmBugetDel_Mod27.Free;
 end;
end;

procedure TfrmEdit_mod280.btnCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEdit_mod280.BtnRetClick(Sender: TObject);
var
Lcds68,Lcdstmp,Lcds68_2:TClientDataSet;
Lsqltmp,Lsql68_2:string;
begin
  inherited;
  Lcds68_2:=TClientDataSet.Create(nil);
  Lcdstmp:=TClientDataSet.Create(nil);
  try
   Lsql68_2:='SELECT data0068.rkey,data0276.ranking,data0276.auth_flag'+
   ' from data0068 inner join'+
   ' data0276 ON Data0068.RKEY = dbo.data0276.purchase_ptr'+
   ' where data0068.rkey='+cds68.FieldByName('rkey').AsString;
   gSvrIntf.IntfGetDataBySql(Lsql68_2,Lcds68_2);
   if Lcds68_2.FieldByName('auth_flag').AsString='N' then //当前操作者已审核要判断下一个审批者是否已审核
   begin
   Lsqltmp:= 'select rkey from data0276 where purchase_ptr='+Lcds68_2.FieldByName('rkey').AsString+
             ' and auth_flag=''N'' and  ranking>'+Lcds68_2.FieldByName('ranking').AsString+' and auth_date is not null';
   gSvrIntf.IntfGetDataBySql(Lsqltmp,Lcdstmp);
   if not Lcdstmp.IsEmpty then
   begin
    showmessage('此单的下一用户已经审核通过,您不能再退回请购单!');
    exit;
   end;
   end;
  finally
   Lcds68_2.Free;
   Lcdstmp.Free;
  end;
  Lcds68:=TClientDataSet.Create(nil);
  with TfrmRemark_Mod280.Create(nil) do
  try
   mmoRemark.Text:=cds68.FieldByName('remark').AsString;
   if showmodal=mrok then
   begin
    gSvrIntf.IntfGetDataBySql('select * from data0068 where rkey='+cds68.FieldByName('rkey').AsString,Lcds68);
    if Lcds68.FieldByName('status').Value<>1  then
    begin
     showmessage('请购单状态发生改变而未能成功退回!');
     exit;
    end;
    if Trim(mmoRemark.Text)<>'' then
    begin
     cds68.Edit;
     cds68.FieldByName('status').Value:=4;
     cds68.FieldByName('remark').AsString:=mmoRemark.Text;
     cds68.Post;
     if gSvrIntf.IntfPostDataByTable('data0068',cds68.Delta) then
     begin
      if cds68.ChangeCount>0 then cds68.MergeChangeLog;
      ShowMessage('退回请购单成功');
      close;
      FAfterAppend;
     end;
    end;
   end;
  finally
   Lcds68.Free;
   free;
  end;
end;

procedure TfrmEdit_mod280.btnSaveClick(Sender: TObject);
var
 if_returnreq:boolean;
 if_insrt:Boolean;
 LPostData: OleVariant;
begin
  inherited;
  if Trim(RedtFactory.Text)='' then
  begin
    showmessage('工厂代码不能为空...');
    abort;
  end;
  if Trim(RedtAppCode.Text)='' then
  begin
    showmessage('审批代码不能为空...');
    abort;
  end;
  if Trim(RedtBudtCode.Text)='' then
  begin
    showmessage('预算代码不能为空...');
    abort;
  end;
  if Trim(RedtUser.Text)='' then
  begin
    showmessage('使用人员不能为空...');
    abort;
  end;
  if (eh69.Visible and (cds69.RecordCount=0)) or (eh204.Visible and (cds204.RecordCount=0))  then
   begin
    showmessage('请购物料不能为空...');
    abort;
   end;
  if eh69.Visible then
  begin
  if not check_same_mate then //检查是否在同一个请购单里有相同编码和交货日期的物料
  Exit;
  end;
  if (stdDetail.RowCount > 2) then
   begin
    messagedlg('将单项退回的请购生成新的请购单!',mtconfirmation,[mbok],0);
    if_returnreq:=true;
   end
  else
  if_returnreq:=false;
  case FEditType of
    0,3:  //新增
    begin

      if Check_Po(trim(cds68.FieldByName('PO_REQ_NUMBER').AsString)) then       // start       add by zsp 2017-03-20
      begin
        cds68.Edit;
        cds68.FieldByName('PO_REQ_NUMBER').Value:= getReqNo(FsWare_type,Pr_id);
        cds68.Post;
      end;                                                                  //end

    end;
    1: //编辑
    begin
      if_insrt:=True;
      cds68.Edit;
      if FsModID=280 then
      cds68.FieldByName('status').Value := 7 // 请购单状态
      else
      begin
       if if_returnreq then
       begin
        if eh69.Visible then
        begin
         cds69.First;
         while not cds69.Eof do
         begin
          if cds69.FieldByName('status').Value=0 then
          begin
           if_insrt:=False;
           ShowMessage('123');
           Break;
          end;
          cds69.Next;
         end;
        end
        else
        begin
         cds204.First;
         while not cds204.Eof do
         begin
          if cds204.FieldByName('status').Value=0 then
          begin
           if_insrt:=False;
           Break;
          end;
          cds204.Next;
         end;
        end;
        if if_insrt then
         cds68.FieldByName('status').Value := 6
        else
         cds68.FieldByName('status').Value := 3
       end
       else
        cds68.FieldByName('status').Value := 3;
      end;
      cds68.FieldByName('REQ_DATE').AsDateTime := DtpReqDate.Date; // 请购日期
      cds68.FieldByName('user_name').AsString := RedtUser.Text; // 使用人员姓名
      cds68.FieldByName('user_phone').AsString := RedtUserPhone.Text; // 使用人员电话
      cds68.Post;
    end;
  end;
  if if_returnreq then self.return_req(trim(cds68.FieldByName('PO_REQ_NUMBER').Value));

  if cds68.State in [dsEdit,dsInsert] then cds68.Post;
  if (eh69.Visible) and (cds69.State in [dsEdit,dsInsert]) then cds69.Post;
  if (eh204.Visible) and (cds204.State in [dsEdit,dsInsert]) then cds204.Post;
  if (if_returnreq) and (cdsAP68.State in [dsEdit,dsInsert]) then cdsAP68.Post;
  if (if_returnreq) and (eh69.Visible) and (cdsAP69.State in [dsEdit,dsInsert]) then cdsAP69.Post;
  if (if_returnreq) and (eh204.Visible) and (cdsAP204.State in [dsEdit,dsInsert]) then cdsAP204.Post;
  LPostData := VarArrayCreate([0,5],varVariant);
  if cds68.ChangeCount > 0 then
    LPostData[0] := cds68.Delta;
  if (eh69.Visible) and (cds69.ChangeCount > 0) then
    LPostData[1] := cds69.Delta;
  if (eh204.Visible) and (cds204.ChangeCount > 0) then
    LPostData[2] := cds204.Delta;
  if (if_returnreq) and (cdsAP68.ChangeCount > 0) then
    LPostData[3] := cdsAP68.Delta;
  if (if_returnreq) and (eh69.Visible) and (cdsAP69.ChangeCount > 0) then
    LPostData[4] := cdsAP69.Delta;
  if (if_returnreq) and (eh204.Visible) and (cdsAP204.ChangeCount > 0) then
    LPostData[5] := cdsAP204.Delta;
  if gSvrIntf.IntfPostModData('公共基础',280,LPostData,0) then
  begin
    cds68.MergeChangeLog;
    if (eh69.Visible) and (cds69.ChangeCount > 0) then cds69.MergeChangeLog;
    if (eh204.Visible) and (cds204.ChangeCount > 0) then cds204.MergeChangeLog;
    if if_returnreq then cdsAP68.MergeChangeLog;
    if (if_returnreq) and (eh69.Visible) then cdsAP69.MergeChangeLog;
    if (if_returnreq) and (eh204.Visible) then cdsAP204.MergeChangeLog;
    if if_returnreq then showmessage('请购单拆分成功!新编号为'+self.req_nuber);
    ShowMessage('保存成功');
    FAfterAppend;
    Close;
  end;

end;

function TfrmEdit_mod280.Check_Po(APoNumber: string): Boolean;
var
  LSql:string;
  LCds: TClientDataSet;
begin
  Result:= False;
  LSql:= 'SELECT 1 from data0068 where PO_REQ_NUMBER = ' + QuotedStr(APoNumber);
  LCds:= TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      Result:= True;
      Exit;
    end;
    if not LCds.IsEmpty then  Result:= True;
  finally
    LCds.Free;
  end;
end;

procedure TfrmEdit_mod280.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEdit_mod280 := nil;
end;

procedure TfrmEdit_mod280.GetData(ARkey,SFlag: string);
var
  LSql68,LSql69,LSql204,LSqlLK17,LSqlLK23,LSqlLKZx23: string;
begin
  //LookUp17引用材料明细表
  LSqlLK17 := 'select d17.rkey,d17.INV_PART_NUMBER ,d17.inv_name,d17.INV_DESCRIPTION from Data0069 d69 ' +
              ' inner join data0017 d17 on d69.INVT_PTR = d17.RKEY ' +
              ' where d69.PURCH_REQ_PTR = ' + ARkey;

  //LookUp23引用供应商代码表
  LSqlLK23 := 'select d23.rkey,d23.abbr_name from data0069 d69 ' +
              ' inner join data0023 d23 on d69.SUPP_PTR = d23.RKEY ' +
              ' where d69.PURCH_REQ_PTR = ' + ARkey;

  LSqlLKZx23 := 'select d23.rkey,d23.abbr_name from data0204 d204 ' +
              ' inner join data0023 d23 on d204.SUPPLIER_PTR = d23.RKEY ' +
              ' where d204.PURCHASE_REQ_PTR = ' + ARkey;

  //data0068请购主表
  LSql68 := 'select * from data0068 where rkey = ' + ARkey;

  //data0069请购生产物料明细
  LSql69 := 'select * from data0069 where PURCH_REQ_PTR = ' + ARkey;

  //data0204请购杂项物料明细
  LSql204 :='select * from data0204 where PURCHASE_REQ_PTR=' + ARkey;
  if SFlag='S' then
  begin
  frmEdit_mod280.Caption:='生产物料请购单';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSqlLK17,LsqlLK23,LSql68,LSql69]),[cdsLookUp17,cdsLookUp23,cds68,cds69]) then Exit;
  if (not cds68.IsEmpty) and (cds68.FieldByName('IDKEY').AsString = '') then
  begin
    cds68.Edit;
    cds68.FieldByName('IDKEY').AsString := gFunc.CreateIDKey;
    cds68.Post;
  end;
  cds69.DisableControls;
  try
    cds69.First;
    while not cds69.Eof do
    begin
      cds69.Edit;
      cds69.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKEY').AsString;
      cds69.Post;
      cds69.Next;
    end;
    cds69.First;
  finally
    cds69.EnableControls;
  end;
  end;
  if SFlag='M' then
  begin
  frmEdit_mod280.Caption:='杂项物料请购单';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSqlLKZx23,LSql68,LSql204]),[cdsLookUpZx23,cds68,cds204]) then Exit;

  if (not cds68.IsEmpty) and (cds68.FieldByName('IDKEY').AsString = '') then
  begin
    cds68.Edit;
    cds68.FieldByName('IDKEY').AsString := gFunc.CreateIDKey;
    cds68.Post;
  end;

  cds204.DisableControls;
  try
    cds204.First;
    while not cds204.Eof do
    begin
      cds204.Edit;
      cds204.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKEY').AsString;
      cds204.Post;
      cds204.Next;
    end;
    cds204.First;
  finally
    cds204.EnableControls;
  end;
  end;
end;

procedure TfrmEdit_mod280.Init(Ftype:string;Smodid:Integer);
var
  LLKField: TField;
  I: Integer;
begin
  if Smodid<>27 then
  begin
   pnl2.Height:=136;
  end
  else
  begin
   LbRquser.Visible:=True;
   LbPuruser.Visible:=True;
   BtnBudDet.Visible:=True;
   RedtRquser.Visible:=True;
   RedtPuruser.Visible:=True;
   eh69.Columns[5].Visible:=True;
   eh69.Columns[6].Visible:=True;
   eh69.PopupMenu:=pmAwd69;
   eh204.Columns[5].Visible:=True;
   eh204.Columns[6].Visible:=True;
   eh204.Columns[8].Visible:=True;
   eh204.PopupMenu:=pmAwd69;
   if (FEditType=1) or (FEditType=2) then
   BtnBudDet.Enabled:=True;
  end;
  if Ftype='S' then
  begin
   eh69.Visible:=True;
   eh204.Visible:=False;
   gSvrIntf.IntfGetDataBySql('SELECT * FROM data0069 WHERE 1=0',cds69);
  //在数据集关闭的情况下新增加一个字段
  try
    cds69.Close;
    cds69.FieldDefs.BeginUpdate;
    for i := 0 to cds69.FieldDefList.Count - 1 do
    begin
      cds69.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    //Add New Field
   //增加新的字段
    LLKField := TStringField.Create(cds69);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds69;

    LLKField := TStringField.Create(cds69);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cds69;

    LLKField := TStringField.Create(cds69);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cds69;

    LLKField := TStringField.Create(cds69);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'abbr_name';
    LLKField.KeyFields := 'SUPP_PTR';
    LLKField.LookupDataSet := cdsLookUp23;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'abbr_name';
    LLKField.DataSet := cds69;

    LLKField := TStringField.Create(cds69);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'UNIT_PTR';
    LLKField.LookupDataSet := gLookDM.cdsLK02;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds69;
  finally
    cds69.FieldDefs.EndUpdate;
  end;
  end
  else
  begin
   eh69.Visible:=false;
   eh204.Visible:=True;
   gSvrIntf.IntfGetDataBySql('SELECT * FROM data0204 WHERE 1=0',cds204);
  try
    cds204.Close;
    cds204.FieldDefs.BeginUpdate;
    for i := 0 to cds204.FieldDefList.Count - 1 do
    begin
      cds204.FieldDefList.FieldDefs[i].CreateField(Self);
    end;

    LLKField := TStringField.Create(cds204);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'abbr_name';
    LLKField.KeyFields := 'SUPPLIER_PTR';
    LLKField.LookupDataSet := cdsLookUpZx23;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'abbr_name';
    LLKField.DataSet := cds204;

    LLKField := TStringField.Create(cds204);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'G_L_PTR';
    LLKField.LookupDataSet := gLookDM.cdsLK02;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds204;

    LLKField := TStringField.Create(cds204);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'curr_name';
    LLKField.KeyFields := 'PO_LINK_PTR';
    LLKField.LookupDataSet := gLookDM.cdsLK01;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'curr_name';
    LLKField.DataSet := cds204;
  finally
  cds204.FieldDefs.EndUpdate;
  end;
  end;
end;

procedure TfrmEdit_mod280.mniNew69Click(Sender: TObject);
var
  LField: TField;
  LFrm: TfrmDetailEdit_Mod280;
  LFrmZx: TfrmZxDetailEdit_Mod280;
begin
  inherited;
  if Trim(RedtFactory.text)='' then
  begin
    showmessage('请先选择工厂...');
    exit;
  end;
  if eh69.Visible then
  begin
   LFrm := TfrmDetailEdit_Mod280.Create(Self);
   LFrm.RedtNeedFac.Text :=RedtFactory.DisplayNoteLabel.Caption;
   try
    LFrm.GetData('0');
    LFrm.Init(Tmenuitem(Sender).Tag,LReq_Reason);           //Alter by zsp 2017-03-20
    if LFrm.ShowModal = mrOk then
    begin
      cdsLookUp17.FieldByName('rkey').ReadOnly := False;
      cdsLookUp17.Append;
      cdsLookUp17.FieldByName('rkey').AsInteger := LFrm.cds69.FieldByName('INVT_PTR').AsInteger;
      cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := LFrm.RedtMaterCode.Text;
      cdsLookUp17.FieldByName('inv_name').AsString := LFrm.RedtMaterName.Text;
      cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := LFrm.RedtMaterGuige.Text;
      cdsLookUp17.Post;

      cds69.Append;
      for LField in cds69.Fields do //增加字段到cds69*
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrm.cds69.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrm.cds69.FindField(LField.FieldName).Value;
        end;
      end;
      cds69.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
      cds69.Post;
      LReq_Reason:= cds69.FieldByName('reason').AsString;    //add by zsp 2017-03-20
      eh69.DataSource := nil;
      eh69.DataSource := ds69;
    end;
   finally
    LFrm.Free;
   end;
  end
  else
  begin
   LFrmZx:=TfrmZxDetailEdit_Mod280.Create(Self);
   try
    LFrmZx.getdataZx('0');
    LFrmZx.InitZX(Tmenuitem(Sender).Tag,LReq_Reason);
    if LFrmZx.ShowModal=mrOk then
    begin
     cds204.Append;
      for LField in cds204.Fields do
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrmZx.cds204.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrmZx.cds204.FindField(LField.FieldName).Value;
        end;
      end;
     cds204.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
     cds204.FieldByName('UNIT_PRICE').Value :=0;
     cds204.FieldByName('TAX_FLAG').Value :='N';
     cds204.FieldByName('tax').Value :=0;
     cds204.FieldByName('tax_PRICE').Value :=0;
     cds204.FieldByName('status').Value :=0;
     cds204.Post;
     LReq_Reason:= cds204.FieldByName('reason').AsString;    //add by zsp 2017-03-20
     eh204.DataSource := nil;
     eh204.DataSource := ds204;
    end;
   finally
    LFrmZx.Free;
   end;
  end;
end;

procedure TfrmEdit_mod280.mniView69Click(Sender: TObject);
var
  LFrm: TfrmDetailEdit_Mod280;
  LFrmZx: TfrmZxDetailEdit_Mod280;
  Lsql:string;
begin
  inherited;
  if eh69.Visible then
  begin
   LFrm := TfrmDetailEdit_Mod280.Create(Self);
   try
    LFrm.GetData(cds69.FieldByName('rkey').AsString);
    LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
    LFrm.GetQty;
    Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
    LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
    LFrm.RedtMaterCode.Enabled:=False;
    LFrm.btnSave.Enabled := False;
    LFrm.BtSave.Enabled :=False;
    LFrm.btnSave.Enabled:=False;
    LFrm.cds69.ReadOnly := True;
    if LFrm.ShowModal = mrOk then
    begin
    //
    end;
   finally
    LFrm.Free;
   end;
  end
  else
  begin
  LFrmZx := TfrmZxDetailEdit_Mod280.Create(Self);
   try
    LFrmZx.getdataZx(cds204.FieldByName('rkey').AsString);
    LFrmZx.BtSave.Enabled := False;
    LFrmZx.dbcbbDESCRIPTION_2.Enabled:=False;
    LFrmZx.cds204.ReadOnly := True;
    if LFrmZx.ShowModal = mrOk then
    begin
    //
    end;
   finally
    LFrmZx.Free;
   end;
  end;
end;

procedure TfrmEdit_mod280.mniViewAwdClick(Sender: TObject);
var
  LFrm: TfrmEditDetail_Mod27;
  LFrmZx: TfrmEditDetailZx_Mod27;
  Lsql:string;
begin
  inherited;
  if eh69.Visible then
  begin
  LFrm := TfrmEditDetail_Mod27.Create(Self);
   try
    LFrm.GetData(cds69.FieldByName('rkey').AsString);
    LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
    Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
    LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
    LFrm.RedtMaterCode.Enabled:=False;
    LFrm.RedtSupp.Enabled:=False;
    LFrm.btnSave.Enabled := False;
    LFrm.cds69.ReadOnly := True;
    if LFrm.ShowModal = mrOk then
    begin

    end;
   finally
    LFrm.Free;
   end;
  end
  else
  begin
  LFrmZx := TfrmEditDetailZx_Mod27.Create(Self);
   try
    LFrmZx.getdataZx(cds204.FieldByName('rkey').AsString);
    LFrmZx.cds204.ReadOnly := True;
    LFrmZx.RedtSupp.Enabled:=False;
    LFrmZx.dbcbbDESCRIPTION_2.Enabled:=False;
    LFrmZx.btnSave.Enabled:=False;
    if LFrmZx.ShowModal = mrOk then
    begin

    end;
   finally
    LFrmZx.Free;
   end;
  end;
end;

procedure TfrmEdit_mod280.pm69Popup(Sender: TObject);
begin
  inherited;
  mniNew69.Visible:=FEditType in [0,1,3];
  mniEdit69.Visible:=FEditType in [0,1,3];
  mniDele69.Visible:=FEditType in [0,1,3];
  mniView69.Visible:=FEditType=2;
  mniNew69.Enabled:=FEditType in [0,1,3];
  if eh69.Visible then
  begin
  mniEdit69.Enabled:=mniNew69.Enabled and (cds69.RecordCount>0);
  mniDele69.Enabled:=mniEdit69.Enabled;
  mniView69.Enabled:=cds69.RecordCount>0;
  end
  else
  begin
   mniEdit69.Enabled:=mniNew69.Enabled and (cds204.RecordCount>0);
   mniDele69.Enabled:=mniEdit69.Enabled;
   mniView69.Enabled:=cds204.RecordCount>0;
  end;
end;

procedure TfrmEdit_mod280.pmAwd69Popup(Sender: TObject);
begin
  inherited;
  mniAddAwd.Visible:=FEditType in [0,1,3];
  mniEdtiAwd.Visible:=FEditType in [0,1,3];
  mniDelAwd.Visible:=FEditType in [0,1,3];
  mniViewAwd.Visible:=FEditType=2;
  mniAddAwd.Enabled:=FEditType in [0,1,3];
  if eh69.Visible then
  begin
  mniEdtiAwd.Enabled:=mniAddAwd.Enabled and (cds69.RecordCount>0);
  mniDelAwd.Enabled:=mniEdtiAwd.Enabled;
  mniViewAwd.Enabled:=cds69.RecordCount>0;
  end
  else
  begin
   mniEdtiAwd.Enabled:=mniAddAwd.Enabled and (cds204.RecordCount>0);
   mniDelAwd.Enabled:=mniEdtiAwd.Enabled;;
   mniViewAwd.Enabled:=cds204.RecordCount>0;
  end;
end;

procedure TfrmEdit_mod280.RedtAppCodeButtonClick(Sender: TObject);
var
  LFrm:TfrmCode_Mod280;
begin
//  LFrm:=TfrmSinglePickList.Create(Self);
//  try
//    LFrm.InitWithPickID(280,1,' where Data0094.type=0 and Data0034.DEPT_CODE='+quotedstr(RedtRqDept.Text));
//    if LFrm.cdsPick.IsEmpty then
//    begin
//     ShowMessage('此员工所在部门没有增加请购审批代码,请联系采购部!');
//     Exit;
//    end;
//    if LFrm.ShowModal= mrOk then
//    begin
//      cds68.Edit;
//      cds68.FieldByName('Auth_type').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
//      cds68.Post;
//    end;
//  finally
//    LFrm.Free;
//  end;

  LFrm:= TfrmCode_Mod280.Create(Self);
  try
    LFrm.FDept_Code:= Trim(RedtRqDept.Text);
    LFrm.GetData;
    if LFrm.cdsMain.IsEmpty then
    begin
     ShowMessage('此员工所在部门没有增加请购审批代码,请联系采购部!');
     Exit;
    end;
    if LFrm.ShowModal= mrOk then
    begin
      cds68.Edit;
      cds68.FieldByName('Auth_type').Value:= LFrm.cdsMain.FieldByName('RKEY').Value;
      cds68.Post;
    end;
  finally
    LFrm.Free;
  end;
end;


procedure TfrmEdit_mod280.RedtBudtCodeButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(280,5,' where data0362.bud_year= '+RedtYear.Text+' and data0363.user_ptr= '+gvar.rkey73);
    if LFrm.cdsPick.IsEmpty then
    begin
     ShowMessage('此员工在本年度没有相关采购预算代码,请联系采购部!');
     Exit;
    end;
    if LFrm.ShowModal= mrOk then
    begin
      cds68.Edit;
      cds68.FieldByName('budget_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      cds68.Post;
//      RedtKybud.Text := formatfloat('0.000',
//      LFrm.cdsPick.FieldByName('budget_period_'+RedtMonth.Text).Value-
//      LFrm.cdsPick.FieldByName('used_period_'+RedtMonth.Text).Value);
      BtnBudDet.Enabled:=True;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtBudtCodeExit(Sender: TObject);
var
  Lcds362:TClientDataSet;
  Lsql362:string;
begin
  Lcds362:=TClientDataSet.Create(nil);
  try
    Lsql362:='select data0362.* from data0362'+
    ' inner join data0363 on data0363.budget_ptr=data0362.rkey'+
    ' where data0362.bud_year= '+RedtYear.Text+
    ' and data0363.user_ptr= '+gvar.rkey73+
    ' and data0362.code='+quotedstr(RedtBudtCode.Text);
    gSvrIntf.IntfGetDataBySql(Lsql362,Lcds362);
    if Lcds362.IsEmpty then
    begin
     ShowMessage('此员工在本年度没有相关采购预算代码,请联系采购部!');
     Exit;
    end;
    cds68.Edit;
    cds68.FieldByName('budget_PTR').Value:= Lcds362.FieldByName('RKEY').Value;
    cds68.Post;
    BtnBudDet.Enabled:=True;
  finally
    Lcds362.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtFactoryButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtFactory.Text)<>'' then
    LFrm.InitWithPickID(280,StrToInt(RedtFactory.DisplayPickID),' where WAREHOUSE_CODE LIKE ''%'+Trim(RedtFactory.Text)+'%''')
    else
    LFrm.InitWithPickID(280,StrToInt(RedtFactory.DisplayPickID),' WHERE 1=1 ');
    if LFrm.ShowModal= mrOk then
    begin
      FsWare_type:=LFrm.cdsPick.FieldByName('warehouse_type').AsString;
      cds68.Edit;
      cds68.FieldByName('WHSE_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      if FsModid=280 then
      cds68.FieldByName('PO_REQ_NUMBER').AsString:=getReqNo(FsWare_type, Pr_id);//自动生成请购编号
      cds68.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtFactoryExit(Sender: TObject);
var
  Lcds15:TClientDataSet;
begin
  Lcds15:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySql('select * from data0015 where WAREHOUSE_CODE='+quotedstr(RedtFactory.Text),Lcds15);
    if not Lcds15.IsEmpty then
    begin
      FsWare_type:=Lcds15.FieldByName('warehouse_type').AsString;
      cds68.Edit;
      cds68.FieldByName('WHSE_PTR').Value:= Lcds15.FieldByName('RKEY').Value;
      if FsModid=280 then
      cds68.FieldByName('PO_REQ_NUMBER').AsString:=getReqNo(FsWare_type, Pr_id);//自动生成请购编号
      cds68.Post;
    end;
  finally
    Lcds15.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtPuruserButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtPuruser.Text)<>'' then
    LFrm.InitWithPickID(280,StrToInt(RedtUser.DisplayPickID),' and BUYER_FLAG=''Y'' and EMPL_CODE LIKE ''%'+Trim(RedtPuruser.Text)+'%''')
    else
    LFrm.InitWithPickID(280,StrToInt(RedtUser.DisplayPickID),' and BUYER_FLAG=''Y''');
    if LFrm.ShowModal= mrOk then
    begin
      cds68.Edit;
      cds68.FieldByName('BUYER_PTR').AsString:= LFrm.cdsPick.FieldByName('rkey').Value;
      cds68.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtRquserButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  //inherited
//  if Trim(RedtFactory.Text)='' then
//  begin
//   messagedlg('请首先输入工厂信息!',mtinformation,[mbok],0);
//   RedtFactory.SetFocus;
//   exit;
//  end;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtRquser.Text)<>'' then
    LFrm.InitWithPickID(27,StrToInt(RedtRquser.DisplayPickID),' and EMPL_CODE LIKE ''%'+Trim(RedtRquser.Text)+'%''')
    else
    LFrm.InitWithPickID(27,StrToInt(RedtRquser.DisplayPickID),'');
    if LFrm.ShowModal= mrOk then
    begin
      Pr_id:=LFrm.cdsPick.FieldByName('Pr_id').AsString;
      cds68.Edit;
      cds68.FieldByName('user_ptr').value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cds68.FieldByName('REQ_BY').value:=LFrm.cdsPick.FieldByName('employee_ptr').Value;
      cds68.FieldByName('DEPARTMENT_NAME').value :=LFrm.cdsPick.FieldByName('DEPT_CODE').Value;
      cds68.FieldByName('PO_REQ_NUMBER').AsString:=getReqNo(FsWare_type, Pr_id);
      cds68.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtRquserEnter(Sender: TObject);
begin
  inherited;
  if Trim(RedtFactory.Text)='' then
  begin
   messagedlg('请首先输入工厂信息!',mtinformation,[mbok],0);
   RedtFactory.SetFocus;
   exit;
  end;
end;

procedure TfrmEdit_mod280.RedtRquserExit(Sender: TObject);
var
Lsql73:string;
Lcds73:TClientDataSet;
begin
  Lcds73:=TClientDataSet.Create(nil);
  try
    Lsql73:='SELECT data0073.rkey,data0073.USER_LOGIN_NAME as user_id,'+
    ' data0073.user_full_name,Data0034.DEPT_CODE,dept_name,'+
    ' data0073.employee_ptr,data0034.pr_id FROM dbo.Data0005'+
    ' INNER JOIN dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY'+
    ' INNER JOIN dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR'+
    ' where data0073.active_flag=0'+
    ' and USER_LOGIN_NAME='+quotedstr(RedtRquser.Text)+
    ' order by user_id';
    gSvrIntf.IntfGetDataBySql(Lsql73,Lcds73);
    if not Lcds73.IsEmpty then
    begin
      Pr_id:=Lcds73.FieldByName('Pr_id').AsString;
      cds68.Edit;
      cds68.FieldByName('user_ptr').value:= Lcds73.FieldByName('rkey').Value;
      cds68.FieldByName('REQ_BY').value:=Lcds73.FieldByName('employee_ptr').Value;
      cds68.FieldByName('DEPARTMENT_NAME').value :=Lcds73.FieldByName('DEPT_CODE').Value;
      cds68.FieldByName('PO_REQ_NUMBER').AsString:=getReqNo(FsWare_type, Pr_id);
      cds68.Post;
    end;
  finally
    Lcds73.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtUserButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtUser.Text)<>'' then
    LFrm.InitWithPickID(280,StrToInt(RedtUser.DisplayPickID),' and employee_name LIKE ''%'+Trim(RedtUser.Text)+'%''')
    else
    LFrm.InitWithPickID(280,StrToInt(RedtUser.DisplayPickID),' and 1=1 ');
    if LFrm.ShowModal= mrOk then
    begin
      cds68.Edit;
      cds68.FieldByName('user_name').AsString:= LFrm.cdsPick.FieldByName('EMPLOYEE_NAME').Value;
      if LFrm.cdsPick.FieldByName('PHONE').Value<>null then
      cds68.FieldByName('user_phone').AsString:=LFrm.cdsPick.FieldByName('PHONE').Value;
      cds68.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_mod280.RedtUserExit(Sender: TObject);
var
  Lcds05:TClientDataSet;
begin
  Lcds05:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySql('select * from data0005 where ACTIVE_FLAG=''Y'' and EMPLOYEE_NAME='+quotedstr(RedtUser.Text),Lcds05);
    if not Lcds05.IsEmpty then
    begin
      cds68.Edit;
      cds68.FieldByName('user_name').AsString:= Lcds05.FieldByName('EMPLOYEE_NAME').Value;
      if Lcds05.FieldByName('PHONE').Value<>null then
      cds68.FieldByName('user_phone').AsString:=Lcds05.FieldByName('PHONE').Value;
      cds68.Post;
    end;
  finally
    Lcds05.Free;
  end;
end;

procedure TfrmEdit_mod280.mniAddAwdClick(Sender: TObject);
var
  LField: TField;
  LFrm: TfrmEditDetail_Mod27;
  LFrmZx: TfrmEditDetailZx_Mod27;
begin
  inherited;
  if trim(RedtFactory.Text)='' then
 begin
  messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
  Exit;
  RedtFactory.SetFocus;
 end;
  if eh69.Visible then
  begin
   LFrm := TfrmEditDetail_Mod27.Create(Self);
   LFrm.FeditType:=Tmenuitem(Sender).Tag;
   LFrm.RedtNeedFac.Text :=RedtFactory.DisplayNoteLabel.Caption;
   try
    LFrm.GetData('0');
    LFrm.Init(Tmenuitem(Sender).Tag);
    if LFrm.ShowModal = mrOk then
    begin
      cdsLookUp17.FieldByName('rkey').ReadOnly := False;
      cdsLookUp17.Append;
      cdsLookUp17.FieldByName('rkey').AsInteger := LFrm.cds69.FieldByName('INVT_PTR').AsInteger;
      cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := LFrm.RedtMaterCode.Text;
      cdsLookUp17.FieldByName('inv_name').AsString := LFrm.cds69.FieldByName('inv_name').AsString;
      cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := LFrm.cds69.FieldByName('INV_DESCRIPTION').AsString;
      cdsLookUp17.Post;

      cdsLookUp23.FieldByName('rkey').ReadOnly := False;
      cdsLookUp23.Append;
      cdsLookUp23.FieldByName('rkey').AsInteger := LFrm.cds69.FieldByName('SUPP_PTR').AsInteger;
      cdsLookUp23.FieldByName('abbr_name').AsString := LFrm.cds69.FieldByName('abbr_name').AsString;
      cdsLookUp23.Post;

      cds69.Append;
      for LField in cds69.Fields do //增加字段到cds69*
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrm.cds69.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrm.cds69.FindField(LField.FieldName).Value;
        end;
      end;
      cds69.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
      cds69.Post;
      eh69.DataSource := nil;
      eh69.DataSource := ds69;
    end;
   finally
    LFrm.Free;
   end;
  end
  else
  begin
   LFrmZx:=TfrmEditDetailZx_Mod27.Create(Self);
   LFrmZx.FeditType:=Tmenuitem(Sender).Tag;
   try
    LFrmZx.getdataZx('0');
    LFrmZx.InitZX(Tmenuitem(Sender).Tag);
    if LFrmZx.ShowModal=mrOk then
    begin
      cdsLookUpZx23.FieldByName('rkey').ReadOnly := False;
      cdsLookUpZx23.Append;
      cdsLookUpZx23.FieldByName('rkey').AsInteger := LFrmZx.cds204.FieldByName('SUPPLIER_PTR').AsInteger;
      cdsLookUpZx23.FieldByName('abbr_name').AsString := LFrmZx.cds204.FieldByName('abbr_name').AsString;
      cdsLookUpZx23.Post;

     cds204.Append;
      for LField in cds204.Fields do
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrmZx.cds204.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrmZx.cds204.FindField(LField.FieldName).Value;
        end;
      end;
     cds204.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
     cds204.Post;

     eh204.DataSource := nil;
     eh204.DataSource := ds204;
    end;
   finally
    LFrmZx.Free;
   end;
  end;
end;

procedure TfrmEdit_mod280.mniDelAwdClick(Sender: TObject);
begin
  inherited;
  if FEditType<>1 then
  begin
  if eh69.Visible then
  cds69.Delete
  else
  cds204.Delete;
  end
  else
  begin
   if eh69.Visible then
   begin
    if cds69.FieldByName('status').Value=True then
    begin
    MessageDlg('对不起已导入采购的请购不能再操作!',mtError,[mbCancel],0);
    end
    else
    begin
     if cds69.FieldByName('rkey').AsVariant <> null then
     begin
     stdDetail.Cells[0,stdDetail.RowCount-1] :=cds69.FieldByName('INVT_PTR').AsString;
     if cds69.FieldByName('supp_PTR').AsVariant<>null then
     stdDetail.Cells[1,stdDetail.RowCount-1] :=cds69.FieldByName('supp_PTR').AsString;
     if cds69.FieldByName('PO_LINK_PTR').AsVariant<>null then
     stdDetail.Cells[2,stdDetail.RowCount-1] :=cds69.FieldByName('PO_LINK_PTR').AsString;
     stdDetail.Cells[3,stdDetail.RowCount-1] :=cds69.FieldByName('REQ_DATE').AsString;
     stdDetail.Cells[4,stdDetail.RowCount-1] :=cds69.FieldByName('QUANTITY').AsString;
     if cds69.FieldByName('unit_price').AsVariant<>null then
     stdDetail.Cells[5,stdDetail.RowCount-1] :=cds69.FieldByName('UNIT_PRICE').AsString;
     stdDetail.Cells[6,stdDetail.RowCount-1] :=cds69.FieldByName('UNIT_PTR').AsString;
     stdDetail.Cells[7,stdDetail.RowCount-1] :=cds69.FieldByName('CONVERSION_FACTOR').AsString;
     if cds69.FieldByName('o_i_flag').AsVariant<>null then
     stdDetail.Cells[8,stdDetail.RowCount-1] :=cds69.FieldByName('o_i_flag').AsString;
     if cds69.FieldByName('reply_date').AsVariant<>null then
     stdDetail.Cells[9,stdDetail.RowCount-1] :=cds69.FieldByName('reply_date').AsString;
     stdDetail.Cells[10,stdDetail.RowCount-1] :=cds69.FieldByName('reason').AsString;
     if cds69.FieldByName('extra_req').AsVariant<>null then
     stdDetail.Cells[11,stdDetail.RowCount-1] :=cds69.FieldByName('extra_req').AsString;
     stdDetail.Cells[12,stdDetail.RowCount-1] :=cds69.FieldByName('avl_flag').AsString;
     stdDetail.Cells[13,stdDetail.RowCount-1] :=cds69.FieldByName('tax').AsString;
     stdDetail.Cells[14,stdDetail.RowCount-1] :=cds69.FieldByName('tax_price').AsString;
     if cds69.FieldByName('rohs').AsVariant<>null then
     stdDetail.Cells[15,stdDetail.RowCount-1] :=cds69.FieldByName('rohs').Value;
     stdDetail.Cells[16,stdDetail.RowCount-1] :=cds69.FieldByName('req_unit_ptr').AsString;
     if cds69.FieldByName('if_caf').AsVariant<>null then
     stdDetail.Cells[17,stdDetail.RowCount-1] :=cds69.FieldByName('IF_CAF').AsString;
     stdDetail.Cells[18,stdDetail.RowCount-1] :=cds69.FieldByName('status').AsString;
     stdDetail.Cells[19,stdDetail.RowCount-1] :=cds69.FieldByName('IF_urgency').AsString;
     stdDetail.Cells[20,stdDetail.RowCount-1] :=cds69.FieldByName('req_quantity').AsString;
     stdDetail.RowCount:=stdDetail.RowCount+1;
     end;
     cds69.Delete;
    end;
   end
   else
   begin
    if cds204.FieldByName('rkey').AsVariant <> null then
    begin
     stdDetail.Cells[0,stdDetail.RowCount-1] :=cds204.FieldByName('DESCRIPTION_1').AsString;
     stdDetail.Cells[1,stdDetail.RowCount-1] :=cds204.FieldByName('GUI_GE').AsString;
     stdDetail.Cells[2,stdDetail.RowCount-1] :=cds204.FieldByName('DESCRIPTION_2').AsString;
     if cds204.FieldByName('supplier_ptr').AsVariant<>null then
     stdDetail.Cells[3,stdDetail.RowCount-1] :=cds204.FieldByName('SUPPLIER_PTR').AsString;
     if cds204.FieldByName('po_link_ptr').AsVariant<>null then
     stdDetail.Cells[4,stdDetail.RowCount-1] :=cds204.FieldByName('PO_LINK_PTR').AsString;
     stdDetail.Cells[5,stdDetail.RowCount-1] :=cds204.FieldByName('G_L_PTR').AsString;
     stdDetail.Cells[6,stdDetail.RowCount-1] :=cds204.FieldByName('QUANTITY_REQUIRED').AsString;
     stdDetail.Cells[7,stdDetail.RowCount-1] :=cds204.FieldByName('UNIT_PRICE').AsString;
     stdDetail.Cells[8,stdDetail.RowCount-1] :=cds204.FieldByName('TAX_FLAG').AsString;
     stdDetail.Cells[9,stdDetail.RowCount-1] :=cds204.FieldByName('REQ_DATE').AsString;
     if cds204.FieldByName('o_i_flag').AsVariant<>null then
     stdDetail.Cells[10,stdDetail.RowCount-1] :=cds204.FieldByName('o_i_flag').AsString;
     if cds204.FieldByName('reply_date').AsVariant<>null then
     stdDetail.Cells[11,stdDetail.RowCount-1] :=cds204.FieldByName('reply_date').AsString;
     stdDetail.Cells[12,stdDetail.RowCount-1] :=cds204.FieldByName('reason').AsString;
     stdDetail.Cells[13,stdDetail.RowCount-1] :=cds204.FieldByName('tax').AsString;
     stdDetail.Cells[14,stdDetail.RowCount-1] :=cds204.FieldByName('tax_price').AsString;
     if cds204.FieldByName('rohs').AsVariant<>null then
     stdDetail.Cells[15,stdDetail.RowCount-1] :=cds204.FieldByName('rohs').AsString;
     stdDetail.Cells[16,stdDetail.RowCount-1] :=cds204.FieldByName('status').AsString;
     stdDetail.Cells[17,stdDetail.RowCount-1] :=cds204.FieldByName('IF_urgency').AsString;
     stdDetail.Cells[18,stdDetail.RowCount-1] :=cds204.FieldByName('req_quantity').AsString;
     stdDetail.RowCount:=stdDetail.RowCount+1;
    end;
    cds204.Delete;
   end;
  end;
end;

procedure TfrmEdit_mod280.mniDele69Click(Sender: TObject);
begin
  inherited;
  if eh69.Visible then
  cds69.Delete
  else
  cds204.Delete;
end;

procedure TfrmEdit_mod280.mniEdit69Click(Sender: TObject);
var
  Lsql:string;
  LField: TField;
  LFrm: TfrmDetailEdit_Mod280;
  LFrmZx:TfrmZxDetailEdit_Mod280;
begin
  inherited;
  if Trim(RedtFactory.text)='' then
  begin
    showmessage('请先选择工厂...');
    exit;
  end;
  if eh69.Visible then
  begin
   LFrm := TfrmDetailEdit_Mod280.Create(Self);
   LFrm.RedtMaterCode.Enabled:=False;
   try
    if FEditType=1 then //编辑状态下修改
    begin
     if cds69.FieldByName('rkey').AsVariant<>null then
     begin
     LFrm.GetData(cds69.FieldByName('rkey').AsString);
     LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
     LFrm.GetQty;
     LFrm.cds69.Edit;
     LFrm.cds69.FieldByName('IF_urgency').Value:=cds69.FieldByName('IF_urgency').Value;
     LFrm.cds69.FieldByName('QUANTITY').Value:=cds69.FieldByName('QUANTITY').Value;
     LFrm.cds69.FieldByName('REQ_DATE').Value:=cds69.FieldByName('REQ_DATE').Value;
     LFrm.cds69.FieldByName('reason').Value:=cds69.FieldByName('reason').Value;
     LFrm.cds69.FieldByName('extra_req').Value:=cds69.FieldByName('extra_req').Value;
     LFrm.cds69.Post;
     Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
     LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
     end
     else
     begin
     LFrm.GetData('0');
     LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
     LFrm.cds69.Append;
     LFrm.cds69.FieldByName('INVT_PTR').Value:=cds69.FieldByName('INVT_PTR').Value;
     LFrm.cds69.FieldByName('QUANTITY').Value:=cds69.FieldByName('QUANTITY').Value;
     LFrm.cds69.FieldByName('UNIT_PTR').Value:=cds69.FieldByName('UNIT_PTR').Value;
     LFrm.cds69.FieldByName('req_unit_ptr').Value:=cds69.FieldByName('req_unit_ptr').Value;
     LFrm.cds69.FieldByName('IF_urgency').Value:=cds69.FieldByName('IF_urgency').Value;
     LFrm.cds69.FieldByName('req_quantity').Value:=cds69.FieldByName('req_quantity').Value;
     LFrm.cds69.FieldByName('CONVERSION_FACTOR').Value:=cds69.FieldByName('CONVERSION_FACTOR').Value;
     LFrm.cds69.FieldByName('REQ_DATE').Value:=cds69.FieldByName('REQ_DATE').Value;
     LFrm.cds69.FieldByName('reason').Value:=cds69.FieldByName('reason').Value;
     LFrm.cds69.FieldByName('extra_req').Value:=cds69.FieldByName('extra_req').Value;
     LFrm.cds69.FieldByName('avl_flag').Value:=cds69.FieldByName('avl_flag').Value;
     LFrm.cds69.FieldByName('tax').Value:=0;
     LFrm.cds69.FieldByName('tax_price').Value:=0;
     LFrm.cds69.FieldByName('status').Value:=0;
     Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
     LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
     LFrm.cds69.Post;
     LFrm.GetQty;
     end;
    end
    else
    begin
     LFrm.GetData('0');
     LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
     LFrm.cds69.Append;
     LFrm.cds69.FieldByName('INVT_PTR').Value:=cds69.FieldByName('INVT_PTR').Value;
     LFrm.cds69.FieldByName('QUANTITY').Value:=cds69.FieldByName('QUANTITY').Value;
     LFrm.cds69.FieldByName('UNIT_PTR').Value:=cds69.FieldByName('UNIT_PTR').Value;
     LFrm.cds69.FieldByName('req_unit_ptr').Value:=cds69.FieldByName('req_unit_ptr').Value;
     LFrm.cds69.FieldByName('IF_urgency').Value:=cds69.FieldByName('IF_urgency').Value;
     LFrm.cds69.FieldByName('req_quantity').Value:=cds69.FieldByName('req_quantity').Value;
     LFrm.cds69.FieldByName('CONVERSION_FACTOR').Value:=cds69.FieldByName('CONVERSION_FACTOR').Value;
     LFrm.cds69.FieldByName('REQ_DATE').Value:=cds69.FieldByName('REQ_DATE').Value;
     LFrm.cds69.FieldByName('reason').Value:=cds69.FieldByName('reason').Value;
     LFrm.cds69.FieldByName('extra_req').Value:=cds69.FieldByName('extra_req').Value;
     LFrm.cds69.FieldByName('avl_flag').Value:=cds69.FieldByName('avl_flag').Value;
     LFrm.cds69.FieldByName('tax').Value:=0;
     LFrm.cds69.FieldByName('tax_price').Value:=0;
     LFrm.cds69.FieldByName('status').Value:=0;
     Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
     LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
     LFrm.cds69.Post;
     LFrm.GetQty;
    end;
    if LFrm.ShowModal = mrOk then
    begin
      cdsLookUp17.FieldByName('rkey').ReadOnly := False;
      cdsLookUp17.Append;
      cdsLookUp17.FieldByName('rkey').AsInteger := LFrm.cds69.FieldByName('INVT_PTR').AsInteger;
      cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := LFrm.RedtMaterCode.Text;
      cdsLookUp17.FieldByName('inv_name').AsString := LFrm.RedtMaterName.Text;
      cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := LFrm.RedtMaterGuige.Text;
      cdsLookUp17.Post;
      cds69.Edit;
      for LField in cds69.Fields do
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrm.cds69.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrm.cds69.FindField(LField.FieldName).Value;
        end;
      end;
      cds69.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
      cds69.Post;
    end;
   finally
    LFrm.Free;
   end;
  end
  else
  begin
   LFrmZx := TfrmZxDetailEdit_Mod280.Create(Self);
   try
    if FEditType=1 then //编辑状态下修改
    begin
     if cds204.FieldByName('rkey').AsVariant<>null then
     begin
      LFrmZx.getdataZx(cds204.FieldByName('rkey').AsString);
      LFrmZx.cds204.Edit;
      LFrmZx.cds204.FieldByName('REQ_DATE').Value:=cds204.FieldByName('REQ_DATE').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_1').Value:=cds204.FieldByName('DESCRIPTION_1').Value;
      LFrmZx.cds204.FieldByName('G_L_PTR').Value:=cds204.FieldByName('G_L_PTR').Value;
      LFrmZx.cds204.FieldByName('GUI_GE').Value:=cds204.FieldByName('GUI_GE').Value;
      LFrmZx.cds204.FieldByName('QUANTITY_REQUIRED').Value:=cds204.FieldByName('QUANTITY_REQUIRED').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_2').Value:=cds204.FieldByName('DESCRIPTION_2').Value;
      LFrmZx.cds204.FieldByName('reason').Value:=cds204.FieldByName('reason').Value;
      LFrmZx.cds204.FieldByName('IF_urgency').Value:=cds204.FieldByName('IF_urgency').Value;
      LFrmZx.cds204.Post;
     end
     else
     begin
      LFrmZx.getdataZx('0');
      LFrmZx.cds204.Append;
      LFrmZx.cds204.FieldByName('REQ_DATE').Value:=cds204.FieldByName('REQ_DATE').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_1').Value:=cds204.FieldByName('DESCRIPTION_1').Value;
      LFrmZx.cds204.FieldByName('G_L_PTR').Value:=cds204.FieldByName('G_L_PTR').Value;
      LFrmZx.cds204.FieldByName('GUI_GE').Value:=cds204.FieldByName('GUI_GE').Value;
      LFrmZx.cds204.FieldByName('QUANTITY_REQUIRED').Value:=cds204.FieldByName('QUANTITY_REQUIRED').Value;
      LFrmZx.cds204.FieldByName('req_quantity').Value:=cds204.FieldByName('req_quantity').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_2').Value:=cds204.FieldByName('DESCRIPTION_2').Value;
      LFrmZx.cds204.FieldByName('reason').Value:=cds204.FieldByName('reason').Value;
      LFrmZx.cds204.FieldByName('IF_urgency').Value:=cds204.FieldByName('IF_urgency').Value;
      LFrmZx.cds204.FieldByName('UNIT_PRICE').Value :=0;
      LFrmZx.cds204.FieldByName('TAX_FLAG').Value :='N';
      LFrmZx.cds204.FieldByName('tax').Value :=0;
      LFrmZx.cds204.FieldByName('tax_PRICE').Value :=0;
      LFrmZx.cds204.FieldByName('status').Value :=0;
      LFrmZx.cds204.Post;
     end;
    end
    else
    begin
     LFrmZx.getdataZx('0');
     LFrmZx.cds204.Append;
     LFrmZx.cds204.FieldByName('REQ_DATE').Value:=cds204.FieldByName('REQ_DATE').Value;
     LFrmZx.cds204.FieldByName('DESCRIPTION_1').Value:=cds204.FieldByName('DESCRIPTION_1').Value;
     LFrmZx.cds204.FieldByName('G_L_PTR').Value:=cds204.FieldByName('G_L_PTR').Value;
     LFrmZx.cds204.FieldByName('GUI_GE').Value:=cds204.FieldByName('GUI_GE').Value;
     LFrmZx.cds204.FieldByName('QUANTITY_REQUIRED').Value:=cds204.FieldByName('QUANTITY_REQUIRED').Value;
     LFrmZx.cds204.FieldByName('req_quantity').Value:=cds204.FieldByName('req_quantity').Value;
     LFrmZx.cds204.FieldByName('DESCRIPTION_2').Value:=cds204.FieldByName('DESCRIPTION_2').Value;
     LFrmZx.cds204.FieldByName('reason').Value:=cds204.FieldByName('reason').Value;
     LFrmZx.cds204.FieldByName('IF_urgency').Value:=cds204.FieldByName('IF_urgency').Value;
     LFrmZx.cds204.FieldByName('UNIT_PRICE').Value :=0;
     LFrmZx.cds204.FieldByName('TAX_FLAG').Value :='N';
     LFrmZx.cds204.FieldByName('tax').Value :=0;
     LFrmZx.cds204.FieldByName('tax_PRICE').Value :=0;
     LFrmZx.cds204.FieldByName('status').Value :=0;
     LFrmZx.cds204.Post;
    end;
    if LFrmZx.ShowModal = mrOk then
    begin
      cds204.Edit;
      for LField in cds204.Fields do
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrmZx.cds204.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrmZx.cds204.FindField(LField.FieldName).Value;
        end;
      end;
      cds204.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
      cds204.Post;
    end;
   finally
    LFrmzx.Free;
   end;
  end;
end;

procedure TfrmEdit_mod280.mniEdtiAwdClick(Sender: TObject);
var
  Lsql:string;
  LField: TField;
  LFrm: TfrmEditDetail_Mod27;
  LFrmZx:TfrmEditDetailZx_Mod27;
begin
  inherited;
  if eh69.Visible then
  begin
   LFrm := TfrmEditDetail_Mod27.Create(Self);
   try
    if FEditType=1 then //编辑状态下修改
    begin
     if cds69.FieldByName('rkey').AsVariant<>null then
     begin
     LFrm.GetData(cds69.FieldByName('rkey').AsString);
     LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
     LFrm.cds69.Edit;
     LFrm.cds69.FieldByName('INVT_PTR').Value:=cds69.FieldByName('INVT_PTR').Value;
     LFrm.cds69.FieldByName('QUANTITY').Value:=cds69.FieldByName('QUANTITY').Value;
     LFrm.cds69.FieldByName('UNIT_PTR').Value:=cds69.FieldByName('UNIT_PTR').Value;
     LFrm.cds69.FieldByName('SUPP_PTR').Value:=cds69.FieldByName('SUPP_PTR').Value;
     LFrm.cds69.FieldByName('PO_LINK_PTR').Value:=cds69.FieldByName('PO_LINK_PTR').Value;
     LFrm.cds69.FieldByName('reply_date').Value:=cds69.FieldByName('reply_date').Value;
     LFrm.cds69.FieldByName('req_unit_ptr').Value:=cds69.FieldByName('req_unit_ptr').Value;
     LFrm.cds69.FieldByName('IF_urgency').Value:=cds69.FieldByName('IF_urgency').Value;
     LFrm.cds69.FieldByName('req_quantity').Value:=cds69.FieldByName('req_quantity').Value;
     LFrm.cds69.FieldByName('CONVERSION_FACTOR').Value:=cds69.FieldByName('CONVERSION_FACTOR').Value;
     LFrm.cds69.FieldByName('REQ_DATE').Value:=cds69.FieldByName('REQ_DATE').Value;
     LFrm.cds69.FieldByName('reason').Value:=cds69.FieldByName('reason').Value;
     LFrm.cds69.FieldByName('extra_req').Value:=cds69.FieldByName('extra_req').Value;
     LFrm.cds69.FieldByName('avl_flag').Value:=cds69.FieldByName('avl_flag').Value;
     LFrm.cds69.FieldByName('o_i_flag').Value:=cds69.FieldByName('o_i_flag').Value;
     LFrm.cds69.FieldByName('tax').Value:=cds69.FieldByName('tax').Value;
     LFrm.cds69.FieldByName('tax_price').Value:=cds69.FieldByName('tax_price').Value;
     LFrm.cds69.FieldByName('unit_price').Value:=cds69.FieldByName('unit_price').Value;
     LFrm.cds69.FieldByName('status').Value:=cds69.FieldByName('status').Value;
     LFrm.cds69.Post;
     Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
     LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
     end
     else
     begin
     LFrm.GetData('0');
     LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
     LFrm.cds69.Append;
     LFrm.cds69.FieldByName('INVT_PTR').Value:=cds69.FieldByName('INVT_PTR').Value;
     LFrm.cds69.FieldByName('QUANTITY').Value:=cds69.FieldByName('QUANTITY').Value;
     LFrm.cds69.FieldByName('UNIT_PTR').Value:=cds69.FieldByName('UNIT_PTR').Value;
     LFrm.cds69.FieldByName('SUPP_PTR').Value:=cds69.FieldByName('SUPP_PTR').Value;
     LFrm.cds69.FieldByName('PO_LINK_PTR').Value:=cds69.FieldByName('PO_LINK_PTR').Value;
     LFrm.cds69.FieldByName('reply_date').Value:=cds69.FieldByName('reply_date').Value;
     LFrm.cds69.FieldByName('req_unit_ptr').Value:=cds69.FieldByName('req_unit_ptr').Value;
     LFrm.cds69.FieldByName('IF_urgency').Value:=cds69.FieldByName('IF_urgency').Value;
     LFrm.cds69.FieldByName('req_quantity').Value:=cds69.FieldByName('req_quantity').Value;
     LFrm.cds69.FieldByName('CONVERSION_FACTOR').Value:=cds69.FieldByName('CONVERSION_FACTOR').Value;
     LFrm.cds69.FieldByName('REQ_DATE').Value:=cds69.FieldByName('REQ_DATE').Value;
     LFrm.cds69.FieldByName('reason').Value:=cds69.FieldByName('reason').Value;
     LFrm.cds69.FieldByName('extra_req').Value:=cds69.FieldByName('extra_req').Value;
     LFrm.cds69.FieldByName('avl_flag').Value:=cds69.FieldByName('avl_flag').Value;
     LFrm.cds69.FieldByName('o_i_flag').Value:=cds69.FieldByName('o_i_flag').Value;
     LFrm.cds69.FieldByName('tax').Value:=cds69.FieldByName('tax').Value;
     LFrm.cds69.FieldByName('tax_price').Value:=cds69.FieldByName('tax_price').Value;
     LFrm.cds69.FieldByName('unit_price').Value:=cds69.FieldByName('unit_price').Value;
     LFrm.cds69.FieldByName('status').Value:=cds69.FieldByName('status').Value;
     Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
     LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
     LFrm.cds69.Post;
     end;
     LFrm.LoadData;     ////20170215   add by zsp
    end
    else
    begin
     LFrm.GetData('0');
     LFrm.RedtNeedFac.Text:=RedtFactory.DisplayNoteLabel.Caption;
     LFrm.cds69.Append;
     LFrm.cds69.FieldByName('INVT_PTR').Value:=cds69.FieldByName('INVT_PTR').Value;
     LFrm.cds69.FieldByName('QUANTITY').Value:=cds69.FieldByName('QUANTITY').Value;
     LFrm.cds69.FieldByName('UNIT_PTR').Value:=cds69.FieldByName('UNIT_PTR').Value;
     LFrm.cds69.FieldByName('SUPP_PTR').Value:=cds69.FieldByName('SUPP_PTR').Value;
     LFrm.cds69.FieldByName('PO_LINK_PTR').Value:=cds69.FieldByName('PO_LINK_PTR').Value;
     LFrm.cds69.FieldByName('reply_date').Value:=cds69.FieldByName('reply_date').Value;
     LFrm.cds69.FieldByName('req_unit_ptr').Value:=cds69.FieldByName('req_unit_ptr').Value;
     LFrm.cds69.FieldByName('IF_urgency').Value:=cds69.FieldByName('IF_urgency').Value;
     LFrm.cds69.FieldByName('req_quantity').Value:=cds69.FieldByName('req_quantity').Value;
     LFrm.cds69.FieldByName('CONVERSION_FACTOR').Value:=cds69.FieldByName('CONVERSION_FACTOR').Value;
     LFrm.cds69.FieldByName('REQ_DATE').Value:=cds69.FieldByName('REQ_DATE').Value;
     LFrm.cds69.FieldByName('reason').Value:=cds69.FieldByName('reason').Value;
     LFrm.cds69.FieldByName('extra_req').Value:=cds69.FieldByName('extra_req').Value;
     LFrm.cds69.FieldByName('avl_flag').Value:=cds69.FieldByName('avl_flag').Value;
     LFrm.cds69.FieldByName('o_i_flag').Value:=cds69.FieldByName('o_i_flag').Value;
     LFrm.cds69.FieldByName('tax').Value:=cds69.FieldByName('tax').Value;
     LFrm.cds69.FieldByName('tax_price').Value:=cds69.FieldByName('tax_price').Value;
     LFrm.cds69.FieldByName('unit_price').Value:=cds69.FieldByName('unit_price').Value;
     LFrm.cds69.FieldByName('status').Value:=cds69.FieldByName('status').Value;
     Lsql:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cds69.FieldByName('INVT_PTR').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdstmp);
     LFrm.RedtIfMajor.Text:=cdstmp.FieldByName('CRITICAL_MATL').AsString;
     LFrm.cds69.Post;
    end;
    if LFrm.ShowModal = mrOk then
    begin
      cdsLookUp17.FieldByName('rkey').ReadOnly := False;
      cdsLookUp17.Append;
      cdsLookUp17.FieldByName('rkey').AsInteger := LFrm.cds69.FieldByName('INVT_PTR').AsInteger;
      cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := LFrm.RedtMaterCode.Text;
      cdsLookUp17.FieldByName('inv_name').AsString := LFrm.cds69.FieldByName('inv_name').AsString;
      cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := LFrm.cds69.FieldByName('INV_DESCRIPTION').AsString;
      cdsLookUp17.Post;

      cdsLookUp23.FieldByName('rkey').ReadOnly := False;
      cdsLookUp23.Append;
      cdsLookUp23.FieldByName('rkey').AsInteger := LFrm.cds69.FieldByName('SUPP_PTR').AsInteger;
      cdsLookUp23.FieldByName('abbr_name').AsString := LFrm.cds69.FieldByName('abbr_name').AsString;
      cdsLookUp23.Post;

      cds69.Edit;
      for LField in cds69.Fields do
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrm.cds69.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrm.cds69.FindField(LField.FieldName).Value;
        end;
      end;
      cds69.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
      cds69.Post;
    end;
   finally
    LFrm.Free;
   end;
  end
  else
  begin
   LFrmZx := TfrmEditDetailZx_Mod27.Create(Self);
   try
    if FEditType=1 then //编辑状态下修改
    begin
     if cds204.FieldByName('rkey').AsVariant<>null then
     begin
      LFrmZx.getdataZx(cds204.FieldByName('rkey').AsString);
      LFrmZx.cds204.Edit;
      LFrmZx.cds204.FieldByName('REQ_DATE').Value:=cds204.FieldByName('REQ_DATE').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_1').Value:=cds204.FieldByName('DESCRIPTION_1').Value;
      LFrmZx.cds204.FieldByName('G_L_PTR').Value:=cds204.FieldByName('G_L_PTR').Value;
      LFrmZx.cds204.FieldByName('GUI_GE').Value:=cds204.FieldByName('GUI_GE').Value;
      LFrmZx.cds204.FieldByName('QUANTITY_REQUIRED').Value:=cds204.FieldByName('QUANTITY_REQUIRED').Value;
      LFrmZx.cds204.FieldByName('req_quantity').Value:=cds204.FieldByName('req_quantity').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_2').Value:=cds204.FieldByName('DESCRIPTION_2').Value;
      LFrmZx.cds204.FieldByName('reason').Value:=cds204.FieldByName('reason').Value;
      LFrmZx.cds204.FieldByName('IF_urgency').Value:=cds204.FieldByName('IF_urgency').Value;
      LFrmZx.cds204.FieldByName('UNIT_PRICE').Value :=cds204.FieldByName('unit_price').Value;
      LFrmZx.cds204.FieldByName('TAX_FLAG').Value :=cds204.FieldByName('tax_flag').Value;
      LFrmZx.cds204.FieldByName('tax').Value :=cds204.FieldByName('tax').Value;
      LFrmZx.cds204.FieldByName('tax_PRICE').Value :=cds204.FieldByName('tax_price').Value;
      LFrmZx.cds204.FieldByName('status').Value :=cds204.FieldByName('status').Value;
      LFrmZx.cds204.FieldByName('supplier_ptr').Value :=cds204.FieldByName('supplier_ptr').Value;
      LFrmZx.cds204.FieldByName('PO_LINK_PTR').Value :=cds204.FieldByName('PO_LINK_PTR').Value;
      LFrmZx.cds204.FieldByName('o_i_flag').Value :=cds204.FieldByName('o_i_flag').Value;
      LFrmZx.cds204.Post;
     end
     else
     begin
      LFrmZx.getdataZx('0');
      LFrmZx.cds204.Append;
      LFrmZx.cds204.FieldByName('REQ_DATE').Value:=cds204.FieldByName('REQ_DATE').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_1').Value:=cds204.FieldByName('DESCRIPTION_1').Value;
      LFrmZx.cds204.FieldByName('G_L_PTR').Value:=cds204.FieldByName('G_L_PTR').Value;
      LFrmZx.cds204.FieldByName('GUI_GE').Value:=cds204.FieldByName('GUI_GE').Value;
      LFrmZx.cds204.FieldByName('QUANTITY_REQUIRED').Value:=cds204.FieldByName('QUANTITY_REQUIRED').Value;
      LFrmZx.cds204.FieldByName('req_quantity').Value:=cds204.FieldByName('req_quantity').Value;
      LFrmZx.cds204.FieldByName('DESCRIPTION_2').Value:=cds204.FieldByName('DESCRIPTION_2').Value;
      LFrmZx.cds204.FieldByName('reason').Value:=cds204.FieldByName('reason').Value;
      LFrmZx.cds204.FieldByName('IF_urgency').Value:=cds204.FieldByName('IF_urgency').Value;
      LFrmZx.cds204.FieldByName('UNIT_PRICE').Value :=cds204.FieldByName('unit_price').Value;
      LFrmZx.cds204.FieldByName('TAX_FLAG').Value :=cds204.FieldByName('tax_flag').Value;
      LFrmZx.cds204.FieldByName('tax').Value :=cds204.FieldByName('tax').Value;
      LFrmZx.cds204.FieldByName('tax_PRICE').Value :=cds204.FieldByName('tax_price').Value;
      LFrmZx.cds204.FieldByName('status').Value :=cds204.FieldByName('status').Value;
      LFrmZx.cds204.FieldByName('supplier_ptr').Value :=cds204.FieldByName('supplier_ptr').Value;
      LFrmZx.cds204.FieldByName('PO_LINK_PTR').Value :=cds204.FieldByName('PO_LINK_PTR').Value;
      LFrmZx.cds204.FieldByName('o_i_flag').Value :=cds204.FieldByName('o_i_flag').Value;
      LFrmZx.cds204.Post;
     end;
    end
    else
    begin
     LFrmZx.getdataZx('0');
     LFrmZx.cds204.Append;
     LFrmZx.cds204.FieldByName('REQ_DATE').Value:=cds204.FieldByName('REQ_DATE').Value;
     LFrmZx.cds204.FieldByName('DESCRIPTION_1').Value:=cds204.FieldByName('DESCRIPTION_1').Value;
     LFrmZx.cds204.FieldByName('G_L_PTR').Value:=cds204.FieldByName('G_L_PTR').Value;
     LFrmZx.cds204.FieldByName('GUI_GE').Value:=cds204.FieldByName('GUI_GE').Value;
     LFrmZx.cds204.FieldByName('QUANTITY_REQUIRED').Value:=cds204.FieldByName('QUANTITY_REQUIRED').Value;
     LFrmZx.cds204.FieldByName('req_quantity').Value:=cds204.FieldByName('req_quantity').Value;
     LFrmZx.cds204.FieldByName('DESCRIPTION_2').Value:=cds204.FieldByName('DESCRIPTION_2').Value;
     LFrmZx.cds204.FieldByName('reason').Value:=cds204.FieldByName('reason').Value;
     LFrmZx.cds204.FieldByName('IF_urgency').Value:=cds204.FieldByName('IF_urgency').Value;
     LFrmZx.cds204.FieldByName('UNIT_PRICE').Value :=cds204.FieldByName('unit_price').Value;
     LFrmZx.cds204.FieldByName('TAX_FLAG').Value :=cds204.FieldByName('tax_flag').Value;
     LFrmZx.cds204.FieldByName('tax').Value :=cds204.FieldByName('tax').Value;
     LFrmZx.cds204.FieldByName('tax_PRICE').Value :=cds204.FieldByName('tax_price').Value;
     LFrmZx.cds204.FieldByName('status').Value :=cds204.FieldByName('status').Value;
     LFrmZx.cds204.FieldByName('supplier_ptr').Value :=cds204.FieldByName('supplier_ptr').Value;
     LFrmZx.cds204.FieldByName('PO_LINK_PTR').Value :=cds204.FieldByName('PO_LINK_PTR').Value;
     LFrmZx.cds204.FieldByName('o_i_flag').Value :=cds204.FieldByName('o_i_flag').Value;
     LFrmZx.cds204.Post;
    end;
    if LFrmZx.ShowModal = mrOk then
    begin
      cdsLookUpZx23.FieldByName('rkey').ReadOnly := False;
      cdsLookUpZx23.Append;
      cdsLookUpZx23.FieldByName('rkey').AsInteger := LFrmZx.cds204.FieldByName('SUPPLIER_PTR').AsInteger;
      cdsLookUpZx23.FieldByName('abbr_name').AsString := LFrmZx.cds204.FieldByName('abbr_name').AsString;
      cdsLookUpZx23.Post;

      cds204.Edit;
      for LField in cds204.Fields do
      begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrmZx.cds204.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrmZx.cds204.FindField(LField.FieldName).Value;
        end;
      end;
      cds204.FieldByName('D68_IDKey').AsString := cds68.FieldByName('IDKey').AsString;
      cds204.Post;
    end;
   finally
    LFrmzx.Free;
   end;
  end;
end;

function TfrmEdit_mod280.getReqNo(sWare_type, sPr_id: string): string;
var tsql,s:string;
    I:integer;
begin
  s:=sWare_type+sPr_id+'-'+copy(redtYear.Text,3,2)+copy('0'+Redtmonth.Text,1,2);
  tsql:='select top 1 po_req_number from data0068 where po_req_number like '''+s+'%'' order by po_req_number desc';
  gSvrIntf.IntfGetDataBySql(tsql,cdstmp);
  if cdstmp.IsEmpty then
    s:=s+'0001'
  else
  begin
    I := strtoint(copy(cdstmp.fieldvalues['po_req_number'],length(trim(s))+1,4));
    I :=10000+I+1;
    s:=s+copy(inttostr(I),2,4);
  end;
  result:=s;
end;

function TfrmEdit_mod280.check_same_mate():Boolean;
var
i,j,n:Integer;
sg1:TStringGrid;
begin
  Result:=True;
  sg1:=TStringGrid.Create(nil);
  try
   eh69.DataSource.DataSet.First;
   n:=eh69.DataSource.DataSet.RecordCount;
   sg1.RowCount:=n+1;
   sg1.ColCount:=eh69.DataSource.DataSet.FieldCount+1;
   for j:=0 to n do
   begin
    for i:=0 to eh69.FieldCount-1 do //先将dbgrideh数据写到stringgrid
    sg1.Cells[i+1,j+1]:=eh69.Fields[i].AsString;
    eh69.DataSource.DataSet.Next;
   end;
   for i := 1 to sg1.RowCount-2 do //遍历查询看是否有相同物料并且交期相同
   begin
    for j := i+1 to sg1.RowCount-1 do
    begin
     if (sg1.Cells[13,j]=sg1.Cells[13,i])
     and (formatdatetime('yyyy-mm-dd',StrToDateTime(sg1.Cells[8,j]))=formatdatetime('yyyy-mm-dd',StrToDateTime(sg1.Cells[8,i]))) then
     begin
      Result:=False;
      ShowMessage('存在相同物料:'+sg1.Cells[1,i]+',并且交期相同,请把交期改为不同或删除其中一条重复记录!');
      Abort;
     end;
    end;
   end;
   Exit;
  finally
   sg1.Free;
  end;
end;

procedure TfrmEdit_mod280.return_req(pr_number:string);
var
 i,id,j:word;
 Lsqltmp,Lsql69204:string;
 Lcdstmp:TClientDataSet;
begin
 if (cds68.FieldByName('CURRENY_PTR').Value=1) or (cds68.FieldByName('CURRENY_PTR').Value=2) then
 //从新单拆分,但不代表第一次拆分
 begin
 Lsqltmp:='select po_req_number,CURRENY_PTR from data0068'+
          ' where po_req_number like '''+pr_number+'%'''+
          ' order by po_req_number desc';

 end
 else//从被拆下的单再次拆分也可能是第一次拆分
 begin
  Lsqltmp:='select po_req_number,CURRENY_PTR from data0068'+
           ' where po_req_number like '''+copy(pr_number,1,length(pr_number)-1)+'%'''+
           ' order by po_req_number desc';
 end;
  Lcdstmp:=TClientDataSet.Create(nil);
  try
  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf(['select * from data0068 where rkey is null',Lsqltmp]),[cdsAP68,Lcdstmp]);
  cdsAP68.Append;
  for i:=2 to 27 do
   cdsAP68.fieldvalues[cdsAP68.Fields[i].FieldName]:=
   cds68.fieldvalues[cdsAP68.Fields[i].FieldName];

  if trim(Lcdstmp.FieldValues['po_req_number']) = pr_number then//第一次拆分
   if (Lcdstmp.FieldValues['CURRENY_PTR']=1) or (Lcdstmp.FieldValues['CURRENY_PTR']=2) then
    cdsAP68.FieldByName('PO_REQ_NUMBER').Value:= pr_number+'R1'
   else
    begin
     id := strtoint(copy(pr_number,length(pr_number),1))+1;
     cdsAP68.FieldByName('PO_REQ_NUMBER').Value := copy(pr_number,1,length(pr_number)-1)+inttostr(id);
    end
  else             //再次拆分
   begin
    id := strtoint(copy(Lcdstmp.fieldvalues['po_req_number'],
                   length(trim(Lcdstmp.fieldvalues['po_req_number'])),1))+1;
    cdsAP68.FieldByName('PO_REQ_NUMBER').Value := copy(Lcdstmp.fieldvalues['po_req_number'],1,
                                   length(trim(Lcdstmp.fieldvalues['po_req_number']))-1)+inttostr(id);
   end;
   cdsAP68.FieldByName('idkey').Value := gFunc.CreateIDKey;
   cdsAP68.Post;
   if eh69.Visible = true then
   begin
    Lsql69204:='select * from data0069 where purch_req_ptr=0';
    gSvrIntf.IntfGetDataBySql(Lsql69204,cdsAP69);
   end
   else
   begin
    Lsql69204:='select * from data0204 where purchase_req_ptr=0';
    gSvrIntf.IntfGetDataBySql(Lsql69204,cdsAP204);
   end;
   if eh69.Visible = true then
    for i:=1 to stdDetail.RowCount-2 do
     begin
      cdsAP69.Append;
      cdsAP69.FieldByName('D68_IDKey').AsString := cdsAP68.FieldByName('IDKey').AsString;
      for j:=1 to 21 do
      cdsAP69.FieldByName(cdsAP69.Fields[j+1].fieldname).asstring:=stdDetail.Cells[j-1,i];
      cdsAP69.Post;
     end
   else
    for i:=1 to stdDetail.RowCount-2 do
     begin
      cdsAP204.Append;
      cdsAP204.FieldByName('D68_IDKey').AsString := cdsAP68.FieldByName('IDKey').AsString;
      for j:=1 to 19 do
      cdsAP204.FieldByName(cdsAP204.Fields[j+1].fieldname).asstring:=stdDetail.Cells[j-1,i];
      cdsAP204.Post;
     end;
   cdsAP68.Edit;
   cdsAP68.FieldByName('status').Value :=3; //状态为已批准
   cdsAP68.FieldByName('CURRENY_PTR').Value :=3; // 表示采购部拆分新增
   cdsAP68.Post;
   self.req_nuber:=cdsAP68.FieldByName('PO_REQ_NUMBER').Value;
  finally
   Lcdstmp.Free;
  end;
end;

end.
