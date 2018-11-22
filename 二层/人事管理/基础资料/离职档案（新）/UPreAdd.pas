unit UPreAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  Grids, DB, ADODB,constvar;

type
  TFrmAdd = class(TForm)
    sg_add: TStringGrid;
    bbt_cnl: TBitBtn;
    Panel1: TPanel;
    lb_1: TLabel;
    bbt_reslt: TBitBtn;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    bbt_3: TBitBtn;
    btn_QuitSave: TBitBtn;
    btn_AltSave: TBitBtn;
    grp_1: TGroupBox;
    grb_2: TGroupBox;
    Label12: TLabel;
    Label8: TLabel;
    lb_pvalue: TLabel;
    Label4: TLabel;
    lb_13: TLabel;
    Label3: TLabel;
    dbt_dept: TDBEdit;
    dbt_posit: TDBEdit;
    dbt_emp: TDBEdit;
    dbt_pvalue: TDBEdit;
    dbt_rank: TDBEdit;
    DBEdit1: TDBEdit;
    grb_3: TGroupBox;
    lb_cvalue: TLabel;
    btn_SelDep: TSpeedButton;
    Label11: TLabel;
    lb_type: TLabel;
    lb_alterdate: TLabel;
    lb_operdate: TLabel;
    lb_deptname: TLabel;
    lb_position: TLabel;
    btn_SelPosition: TSpeedButton;
    lb_6: TLabel;
    lb_7: TLabel;
    lb_12: TLabel;
    lb_14: TLabel;
    btn_SelRank: TSpeedButton;
    lb_8: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    btn_SelWageType: TSpeedButton;
    lb_9: TLabel;
    cbb_NempType: TComboBox;
    edt_code: TEdit;
    edt_NDep: TEdit;
    cbb_Atype: TComboBox;
    dtp_alterdate: TDateTimePicker;
    dtp_operdate2: TDateTimePicker;
    edt_NPositon: TEdit;
    edt_oprator2: TEdit;
    edt_NRank: TEdit;
    Memo2: TMemo;
    edt_NWageType: TEdit;
    grp_LZ: TGroupBox;
    lb_2: TLabel;
    lb_3: TLabel;
    lb_4: TLabel;
    lb_5: TLabel;
    lb_11: TLabel;
    Label1: TLabel;
    dtp_LZdate: TDateTimePicker;
    cbb_LZtype: TComboBox;
    cbb_LZrs: TComboBox;
    dtp_OperDate: TDateTimePicker;
    edt_oprator: TEdit;
    Memo1: TMemo;
    pm_madd: TPopupMenu;
    mni_Add: TMenuItem;
    N_Del: TMenuItem;
    procedure mni_AddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_cnlClick(Sender: TObject);
    procedure btn_QuitSaveClick(Sender: TObject);
    procedure btn_SelDepClick(Sender: TObject);
    procedure btn_SelPositionClick(Sender: TObject);
    procedure btn_SelRankClick(Sender: TObject);
    procedure btn_SelWageTypeClick(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure bbt_resltClick(Sender: TObject);
    procedure btn_AltSaveClick(Sender: TObject);
    procedure N_DelClick(Sender: TObject);
    procedure sg_addClick(Sender: TObject);
  private
    { Private declarations }
    ismodify:Boolean;
  public
    { Public declarations }
  end;

var
  FrmAdd: TFrmAdd;

implementation

uses USelEmp, UDM,Pick_Item_Single,common;

{$R *.dfm}

procedure TFrmAdd.mni_AddClick(Sender: TObject);
var
  i,j,flag:Integer;
  sstr: string;
begin
  flag:=0;

  if ((dm.pg_index =2) and (sg_add.Cells[1,1]<>'')) then
  begin
    showmessage('复职记录只能单条新增');
    exit;
  end;


try
   try
   FrmSelEmp:=TFrmSelEmp.create(nil);

   if FrmSelEmp.ShowModal=mrok then
   begin
     // sg_add.RowCount:=sg_add.RowCount+FrmSelEmp.dg_emp.SelectedRows.Count;
    for i:=0  to FrmSelEmp.dg_emp.SelectedRows.Count-1 do
    begin
        dm.qry_Empmsg.GotoBookmark(Pointer(FrmSelEmp.dg_emp.SelectedRows.items[i]));
      if sg_add.rowcount>=2 then
      begin
       for j:=1 to  sg_add.rowcount-1 do
       begin
        if sg_add.cells[2,j]=dm.qry_Empmsg.fieldbyname('employeecode').AsString  then
          flag:=1;
       end;
      end;

      if flag=1  then   //判断是否有重复，重复的不加入自动跳过；
      begin

      flag:=0;
       Continue;
      end;

        with dm.qry_Empmsg do
        begin
         if (sg_add.cells[2,sg_add.rowcount-1]<>'')   then  //and  (sg_add.cells[2,sg_add.rowcount-1]<>'工号')
          sg_add.RowCount:=sg_add.RowCount+1;

          sg_add.cols[1].Add(fieldbyname('departmentname').AsString); //, tobject(fieldbyname('rkey').AsInteger));
          sg_add.cols[2].Add(fieldbyname('employeecode').AsString);//, tobject(fieldbyname('rkey').AsInteger));
          sg_add.cols[3].Add(fieldbyname('chinesename').AsString);
          sg_add.cols[4].Add(fieldbyname('sexy').AsString);
          sg_add.cols[5].Add(fieldbyname('ondutytime').AsString);
          sg_add.cols[6].Add(fieldbyname('pposition').asstring);
          sg_add.cols[7].Add(fieldbyname('rankname').AsString);
          sg_add.cols[8].Add(fieldbyname('province').asstring);
          sg_add.cols[9].Add(fieldbyname('employ_type').AsString);
          sg_add.cols[10].Add(fieldbyname('idcard').AsString);
          sg_add.cols[11].Add(IntToStr(fieldbyname('rkey').AsInteger));

         // if dm.pg_index=2 then 
         // dm.qry_empmsg.Locate('rkey',inttostr(integer(sg_add.Objects[2,1])),[]);
          end;

    end;



   end;

   finally
   FrmSelEmp.Free;
   end;


 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);

 end;
end;

end;

procedure TFrmAdd.FormShow(Sender: TObject);
var
  ssql,ssql2, err: string;
begin
  try

    //grid初始化
  with sg_add do
  begin
    //sg_add.RowCount:=1;
    cols[0].Text:='';
    cols[1].Text:='部门';
    cols[2].Text:='工号';
    cols[3].Text:='姓名';
    cols[4].Text:='性别';
    cols[5].Text:='入职时间';
    cols[6].Text:='职务';
    cols[7].Text:='职级';
    cols[8].Text:='藉贯';
    cols[9].Text:='合同类型';
    cols[10].Text:='身份证号码';
    cols[11].Text:='rkey';
   // cols[11].visible:=false;

  end;

    if dm.pg_index=0 then
    begin
    btn_QuitSave.Visible:=true;
    btn_AltSave.Visible:=false;
    end
    else  if dm.pg_index=2 then
    begin
    btn_QuitSave.Visible:=false;
    btn_AltSave.Visible:=true;
    end ;
   //初始化控件：

 
    ssql2:='select rkey, item from datadetail';
   // dm.OpenQry(dm.qrytemp,ssql);
    
    if dm.pg_index=0 then
    begin

   //辞职类型：

     ssql:=ssql2+' where  dictid=9 and user_defined1= 1';
    dm.OpenQry(dm.qrytemp,ssql);

     dm.qrytemp.First;
     cbb_LZtype.Items.Clear;

     while not dm.qrytemp.Eof do
     begin
     cbb_LZtype.Items.AddObject(dm.qrytemp.FieldByName('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').asinteger));
     dm.qrytemp.Next;
     end;

     //辞职原因：
     ssql:=ssql2+' where  dictid=10';
    dm.OpenQry(dm.qrytemp,ssql);

     dm.qrytemp.First;
     cbb_LZrs.Items.Clear;

     while not dm.qrytemp.Eof do
     begin
     cbb_LZrs.Items.AddObject(dm.qrytemp.FieldByName('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').asinteger));
     dm.qrytemp.Next;
     end;
    end
    else  if dm.pg_index=2 then
    begin

   //合同类型：

      ssql:=ssql2+' where dictid=5';
    dm.OpenQry(dm.qrytemp,ssql);

     dm.qrytemp.First;
     cbb_NempType.Items.Clear;

     while not dm.qrytemp.Eof do
     begin
     cbb_NempType.Items.AddObject(dm.qrytemp.FieldByName('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').asinteger));
     dm.qrytemp.Next;
     end;
     cbb_NempType.itemindex:=1;

     //变更类型：
     ssql:=ssql2+' where  rkey = 476';
    dm.OpenQry(dm.qrytemp,ssql);
    cbb_NempType.itemindex:=0;

     dm.qrytemp.First;
     cbb_Atype.Items.Clear;

     while not dm.qrytemp.Eof do
     begin
     cbb_Atype.Items.AddObject(dm.qrytemp.FieldByName('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').asinteger));
     dm.qrytemp.Next;
     end;
    end ;


   dtp_LZdate.date:=now;
   dtp_alterdate.date:=now;
   dtp_OperDate.Date:=now;
   dtp_OperDate2.Date:=now;

  //操作人等 ： 

    ssql:= format('select data0005.rkey, employee_name from data0005 inner join data0073 on data0073.employee_ptr=data0005.rkey '
      + 'where data0073.rkey=''%s'' ', [rkey73]);
     dm.OpenQry(dm.qrytemp,ssql);
     
    edt_oprator.Text := dm.qrytemp.fieldbyName('employee_name').AsString;
    edt_oprator2.Text := dm.qrytemp.fieldbyName('employee_name').AsString;
    edt_oprator.Tag := dm.qrytemp.fieldbyName('rkey').AsInteger;
    edt_oprator2.Tag := dm.qrytemp.fieldbyName('rkey').AsInteger;
  

  //
  if dm.pg_index =0  then
  begin
    self.grp_LZ.Visible:=true;
    Self.grp_1.Visible:=false;
    self.Caption:='新增离职';
  end
  else     if dm.pg_index =2  then
  begin
    self.grp_LZ.Visible:=false;
    Self.grp_1.Visible:=true;
    self.Caption:='新增复职';
  end ;
//
  dm.qry_altSave.Parameters[0].Value := 0;
  dm.qry_altSave.Open;

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 dm.con1.RollbackTrans;
 exit;
 end;
 end;

end;

procedure TFrmAdd.bbt_cnlClick(Sender: TObject);
begin
close;
end;

procedure TFrmAdd.btn_QuitSaveClick(Sender: TObject);
var
  ssql,err,ecode,ecode2: string;
  i,j,flag,rkey: integer;
begin
 //if   dg_add.

 IF cbb_LZtype.text='' then
 begin
 showmessage('离职类型不能为空');
  cbb_LZtype.setfocus;
  exit;
 end;
 
  IF trim(cbb_LZrs.text)='' then
 begin
 showmessage('离职原因不能为空');
  cbb_LZrs.setfocus;
 exit;
 end;
     flag:=0;

 //if not qry_altSave.Active then qry_altSave.Open;
 try
    if not dm.con1.InTransaction then dm.con1.BeginTrans;
       j:=1;
  for i:=1 to sg_add.rowcount-1 do
  begin

//   dm.qry_Empmsg.Locate('rkey',strtoint(sg_add.cells[11,i]),[]);
//    ecode:=sg_add.cells[11,i];
//    ecode2 := IntToStr(dm.qry_Empmsg.fieldbyname('rkey').asinteger);

  //判断该员工有没有离职记录：
  ssql:=' select a.rkey  from  employee_alteration a  inner join  employeemsg b on a.employeeid=b.rkey   '+
   ' left join datadetail c on  a.type=c.rkey '+
  '  where a.active=0 and c.dictid=9 and b.employeecode= '''+sg_add.cells[2,i]+'''  ';

   dm.OpenQry(dm.qrytemp,ssql);

     if not dm.qrytemp.IsEmpty then
     begin
      ShowMessage('工号为：'''+sg_add.cells[2,i]+'''的员工已有未生效的离职记录！');
      Continue;
     end;

     ssql:='select  rkey,employeecode,departmentid,position,employ_type,rank,ondutytime  from employeemsg where  employeecode='''+sg_add.cells[2,i]+''' ';
     dm.openqry(dm.qrytemp,ssql);
       // dm.qry_empmsg.Locate('rkey',rkey,[]);    //找到对应员工的基本资料

   //savebegin:
   with dm.qry_altSave do
   begin
      flag:=1;
        append;
        FieldByName('employeeid').AsString := dm.qrytemp.FieldByName('rkey').asstring;
        fieldbyname('alterdate').Value := DateToStr(dtp_LZdate.Date);
        fieldbyname('oper_date').AsDateTime := dtp_OperDate.DateTime;
        fieldbyname('type').AsInteger := integer(cbb_LZtype.Items.Objects[cbb_LZtype.ItemIndex]);
        fieldbyname('reason').AsInteger := integer(cbb_LZrs.Items.Objects[cbb_LZrs.ItemIndex]);
        fieldbyname('active').AsInteger := 0;
        fieldbyname('oper_person').AsInteger:=edt_oprator.Tag;
        FieldByName('remark').AsString := Trim(Memo1.Text);
        fieldbyname('orginal_employeecode').Asstring := dm.qrytemp.fieldbyname('employeecode').Asstring;
        fieldbyname('orginal_departmentid').AsInteger := dm.qrytemp.fieldbyname('departmentid').AsInteger;
        fieldbyname('orginal_position').AsInteger := dm.qrytemp.fieldbyname('position').AsInteger;
        fieldbyname('orginal_employ_type').AsInteger := dm.qrytemp.fieldbyname('employ_type').AsInteger;
        fieldbyname('orginal_rank').AsInteger := dm.qrytemp.fieldbyname('rank').AsInteger;
        fieldbyname('orginal_ondutytime').AsString := FormatdateTime('YYYY-MM-DD',dm.qrytemp.fieldbyname('ondutytime').asdatetime);
        fieldbyname('orginal_outdutytime').AsString :=FormatdateTime('YYYY-MM-DD',dtp_LZdate.Date);
        post;
   end;

    j:=j+1;

  end;
  if flag =1  then
  begin
  dm.qry_altSave.updatebatch(arall);
  dm.con1.CommitTrans;
  dm.qry_altSave.close;
  close;
  end;
 except on e:Exception do
 begin
  ShowMessage('错误：'+e.message);
  dm.con1.RollbackTrans;
  dm.qry_altSave.close;
 exit;
 end;

 end;


end;

procedure TFrmAdd.btn_SelDepClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_NDep.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      edt_NDep.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
      //lb_deptname.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrmAdd.btn_SelPositionClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'item/职位名称/350,';
    InputVar.Sqlstr :='select * from datadetail where dictid=1 order by 2';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_NPositon.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      edt_NPositon.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.btn_SelRankClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'item/职级名称/350,';
    InputVar.Sqlstr :='select * from datadetail where dictid=2 order by 2';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_NRank.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      edt_NRank.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.btn_SelWageTypeClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'accountname/帐套名称/350,';
    InputVar.Sqlstr :='select accountname,rkey from salaryaccount';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_NWageType.Text := frmPick_Item_Single.adsPick.FieldValues['accountname'];
      edt_NWageType.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrmAdd.bbt_1Click(Sender: TObject);
begin
mni_AddClick(sender);
end;

procedure TFrmAdd.bbt_2Click(Sender: TObject);
var
  i:integer;
begin
  for i :=1  to sg_add.rowcount-2  do
  begin
   sg_add.Rows[i].Clear;
  end;
  sg_add.RowCount:=2;

end;

procedure TFrmAdd.bbt_resltClick(Sender: TObject);
begin
bbt_2Click(sender);
end;

procedure TFrmAdd.btn_AltSaveClick(Sender: TObject);
var
  ssql,err,msg,msg1: string;
  count,i,rkey:integer;
begin
//

 if Trim(edt_NWageType.Text)='' then
 begin
  ShowMessage('复职后新的薪资账套不能为空！');
  exit;
 end;

  if Trim(cbb_NempType.Text)='' then
 begin
  ShowMessage('合同类型不能为空！');
  exit;
 end;

  if Trim(cbb_Atype.Text)='' then
 begin
  ShowMessage('变更类型不能为空！');
  exit;
 end;

 if sg_add.Cells[2,1]=''  then
 begin
 ShowMessage('请选择要复职的员工先！');
 Exit;
 end;
 try
    if not dm.con1.InTransaction then dm.con1.BeginTrans;
    
  if trim(edt_code.Text)<>''then
  begin
 ssql:='select  rkey from employeemsg   where  employeecode='''+trim(edt_code.Text)+''' and   chineseName<>'''+sg_add.Cells[3,1]+'''  ';
 dm.OpenQry(dm.qrytemp,ssql);
  if not dm.qrytemp.IsEmpty then
 begin
 ShowMessage('该新工号已有员工使用， 请换个新工号！');
 exit;
 end;
 end;
 


 //save begin
      ssql:='select  rkey from employeemsg where  employeecode='''+sg_add.Cells[2,1]+''' ';
    rkey:= dm.GetOne('rkey',ssql,dm.qrytemp);
    dm.qry_empmsg.Locate('rkey',rkey,[]);
    
   with dm.qry_altSave do  //复工变动表
    begin
      
      append;
      FieldByName('employeeid').AsString := dm.qry_empmsg.FieldByName('rkey').asstring;
      fieldbyname('alterdate').Value := formatdatetime('yyyy-mm-dd',dtp_alterdate.Date);
      fieldbyname('oper_date').AsDateTime := strtodatetime(formatdatetime('yyyy-mm-dd',dtp_operdate.DateTime));

      fieldbyname('type').AsInteger := integer(cbb_atype.Items.Objects[cbb_Atype.ItemIndex]);
      fieldbyname('orginal_ondutytime').AsString :=  FormatDateTime('yyyy-MM-dd',dm.qry_empmsg.fieldbyname('ondutytime').AsDatetime);
      fieldbyname('orginal_outdutytime').AsString :=  FormatDateTime('yyyy-MM-dd',dm.qry_empmsg.fieldbyname('outdutytime').AsDatetime);
      fieldbyname('reason').AsInteger :=  dm.qry_empmsg.fieldbyname('old_reason').AsInteger;
      fieldbyname('orginal_employeecode').asstring := dbt_pvalue.Text;
      fieldbyname('orginal_departmentid').AsInteger := dm.qry_empmsg.fieldbyname('departmentid').AsInteger;
      fieldbyname('orginal_position').AsInteger := dm.qry_empmsg.fieldbyname('position').AsInteger;
      fieldbyname('orginal_employ_type').AsInteger := dm.qry_empmsg.fieldbyname('employ_type_rkey').AsInteger;
      fieldbyname('new_employ_type').AsInteger := integer(cbb_NempType.Items.Objects[cbb_NempType.ItemIndex]);
      fieldbyname('orginal_accountid').AsInteger := dm.qry_empmsg.fieldbyname('wagetype').AsInteger;
      if trim(edt_NWageType.Text) <>'' then fieldbyname('new_accountid').AsInteger :=edt_NWageType.tag;
      if trim(edt_code.Text) <> '' then  fieldbyname('new_employeecode').asstring := edt_code.Text
        else   fieldbyname('new_employeecode').asstring := dbt_pvalue.Text; ;
      if (Trim(edt_NDep.Text) <> Trim(dbt_dept.Text)) and (Trim(edt_NDep.Text)<>'') then
        begin
          fieldbyname('new_departmentid').AsInteger := edt_NDep.tag;
           ismodify := true;
         end
      else  fieldbyname('new_departmentid').AsInteger :=dm.qry_empmsg.fieldbyname('departmentid').AsInteger;

      if (trim(edt_NPositon.Text)<>trim(dbt_posit.Text)) and (Trim(edt_NPositon.Text)<>'') then
          fieldbyname('new_position').AsInteger := edt_NPositon.tag
      else fieldbyname('new_position').AsInteger := dm.qry_empmsg.fieldbyname('position').AsInteger;

      if (trim(cbb_NempType.Text)<>trim(dbt_emp.Text)) and (Trim(cbb_NempType.Text)<>'') then
        begin
          fieldbyname('new_employ_type').AsInteger := integer(cbb_NempType.Items.Objects[cbb_NempType.ItemIndex]);;
          with DM.qryTemp do
          begin
            SQL.Clear;
            SQL.Text := 'select rkey from datadetail where item='+quotedstr(dm.qry_empmsg.fieldbyname('employ_type').AsString);
            Open;
          end;
          fieldbyname('orginal_employ_type').AsInteger := DM.qryTemp.fieldbyname('rkey').AsInteger;
          ismodify := true;
        end;
      if (trim(edt_nrank.Text)<>trim(dbt_rank.Text)) and (Trim(edt_nrank.Text)<>'') then
        begin
          fieldbyname('new_rank').AsInteger := edt_nrank.tag;
          fieldbyname('orginal_rank').AsInteger := dm.qry_empmsg.fieldbyname('rank').AsInteger;
          ismodify := true;
        end;
      if Trim(Memo2.Text) <> '' then
      begin
        FieldByName('remark').AsString := Memo2.Text;
        ismodify := true;
      end;
      fieldbyname('active').AsInteger:=0;
      fieldbyname('oper_person').AsInteger:=edt_oprator2.Tag;
      if ismodify then
        begin
          post;
          count:=count+1;
        end
      else
        begin
          msg1 := msg1+','+inttostr(i);
          msg := Copy(msg1,2,Length(msg1)-1);
         // cancel;
        end;
      //DM.FZTime := dtp_alterdate.Date;
     // post;
    end;

     dm.qry_altSave.UpdateBatch(arall);
    dm.con1.CommitTrans;

 // if msg <> '' then
  // ShowMessage('第 '+ msg +' 行记录无变更操作，不需要更新！');

  ShowMessage('保存成功，此次操作共计变动 '+inttostr(count)+' 条记录');
 // flag:=true;
  ModalResult:=mrOk;


 //save end;

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 dm.con1.RollbackTrans;
 exit;
 end;

 end;

end;

procedure TFrmAdd.N_DelClick(Sender: TObject);
var
   i : integer;
begin
   if sg_add.RowCount <= 1 then exit;
  for i:=sg_add.Row to sg_add.RowCount-2 do
   sg_add.Rows[i].Text:=sg_add.Rows[i+1].Text;
  sg_add.RowCount:=sg_add.RowCount-1;

    if sg_add.RowCount=1  then
    begin
    sg_add.RowCount:=sg_add.RowCount+1;
     sg_add.Rows[sg_add.RowCount-1].Clear;
     
     end;
end;
procedure TFrmAdd.sg_addClick(Sender: TObject);
begin
 if  sg_add.Cells[1,1]='' then exit;


end;

end.
