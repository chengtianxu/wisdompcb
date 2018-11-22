unit Madd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, ComCtrls,DateUtils,
  Menus, ExtCtrls, ToolWin,DB;

type
  Tfm_madd = class(TForm)
    bbt_cnl: TBitBtn;
    dtp_operdate: TDateTimePicker;
    lb_operdate: TLabel;
    dtp_alterdate: TDateTimePicker;
    lb_alterdate: TLabel;
    lb_type: TLabel;
    dbt_pvalue: TDBEdit;
    lb_cvalue: TLabel;
    lb_pvalue: TLabel;
    cbb_type: TComboBox;
    Panel1: TPanel;
    dbt_dept: TDBEdit;
    Label4: TLabel;
    dbt_posit: TDBEdit;
    Label8: TLabel;
    Label11: TLabel;
    dbt_emp: TDBEdit;
    Label12: TLabel;
    edt_code: TEdit;
    sg_mtadd: TStringGrid;
    bbt_reslt: TBitBtn;
    cbb_emp: TComboBox;
    btn_mtlv1: TBitBtn;
    btn_alt1: TBitBtn;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    edt_1: TEdit;
    btn1: TSpeedButton;
    pm_madd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    lb_1: TLabel;
    grb_1: TGroupBox;
    grb_2: TGroupBox;
    grb_3: TGroupBox;
    bbt_3: TBitBtn;
    lb_deptname: TLabel;
    grb_LZ: TGroupBox;
    lb_2: TLabel;
    lb_3: TLabel;
    lb_4: TLabel;
    lb_5: TLabel;
    dtpLZdate: TDateTimePicker;
    cbb_LZtype: TComboBox;
    cbb_LZrs: TComboBox;
    dtpOperDate: TDateTimePicker;
    edt_2: TEdit;
    lb_position: TLabel;
    btn2: TSpeedButton;
    lb_6: TLabel;
    lb_7: TLabel;
    lb_11: TLabel;
    edt_11: TEdit;
    lb_12: TLabel;
    edt_12: TEdit;
    lb_13: TLabel;
    dbt_rank: TDBEdit;
    lb_14: TLabel;
    edt_13: TEdit;
    btn3: TSpeedButton;
    lb_8: TLabel;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    edt_4: TEdit;
    btn4: TSpeedButton;
    lb_9: TLabel;
    procedure bbt_cnlClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbt_resltClick(Sender: TObject);
    procedure sg_mtaddSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_mtlv1Click(Sender: TObject);
    procedure btn_alt1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sg_mtaddDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure bbt_3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_madd: Tfm_madd;

implementation
 uses damo, emp,  Pick_Item_Single, ConstVar, common, frm_main_u;//main,
 var
   flag:Boolean=False;
{$R *.dfm}

procedure Tfm_madd.bbt_cnlClick(Sender: TObject);
begin
  Close;
end;

procedure Tfm_madd.FormShow(Sender: TObject);
var
  i: Integer;
begin
  //获得变更类型
  with DM.qry_detail do
  begin
    open;
    cbb_LZtype.Items.Clear;
    cbb_LZtype.DropDownCount := 0;
    cbb_type.Items.Clear;
    cbb_type.DropDownCount := 0;
    filter := damo.base;
    first;
    while not eof do
    begin
        cbb_LZtype.DropDownCount:=cbb_type.DropDownCount+1;
        cbb_LZtype.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
        cbb_type.DropDownCount := cbb_type.DropDownCount+1;
        cbb_type.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
        next;
    end;
    cbb_type.ItemIndex := 0;
    cbb_LZtype.ItemIndex := 0;
    close;
    open;
    //获取雇佣类型
    filter:='dictid=5';
    filtered := true;
    first;
    cbb_emp.Items.Clear;
    cbb_emp.DropDownCount := 0;
    while not eof do
    begin
      cbb_emp.DropDownCount := cbb_emp.DropDownCount+1;
      cbb_emp.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      next;
    end;

    cbb_emp.ItemIndex := 0;
    //关闭连接
    close;

  end;

  //初始化窗体
  grb_1.Visible := frm_main.pagecontrol1.ActivePageIndex =2;
  btn_alt1.Visible := grb_1.Visible;
  btn_mtlv1.Visible := not btn_alt1.Visible;
  lb_1.Visible := grb_1.Visible;
  if grb_1.Visible = False then
  begin
    grb_LZ.Top := sg_mtadd.Top + sg_mtadd.Height + 5 ;
    btn_alt1.Top := grb_LZ.top + grb_LZ.height + 10;
    btn_mtlv1.Top := grb_LZ.top + grb_LZ.height + 10;
    bbt_cnl.Top := grb_LZ.top + grb_LZ.height + 10;
    fm_madd.Height := 660;
  end;
  //ShowMessage(IntToStr(btn_mtlv1.Top)+ IntToStr(fm_madd.Height));
  if btn_mtlv1.Visible then
    begin
      Caption := '新增离职人员';
      grb_LZ.Visible := True;
      grb_1.Visible := False;
      Height:=height-grb_3.Height-70;
    end
  else
  begin
    Caption := '新增人员调动';
    dbt_pvalue.Color := cl3DLight;
    dbt_dept.Color := cl3DLight;
    dbt_posit.Color := cl3DLight;
    dbt_emp.Color := cl3DLight;
    dtp_operdate.Color := cl3DLight;
  end;
  //grid初始化
  with sg_mtadd do
  begin
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
  end;
  //日期初始化
  dtp_operdate.DateTime := now;
  dtp_alterdate.DateTime := now;
  dtpOperDate.DateTime := now;
  dtpLZdate.DateTime := now;
  n2.Enabled := false;
  with DM.qrytemp do
  begin
    SQL.Text := format('select data0005.rkey, employee_name from data0005 inner join data0073 on data0073.employee_ptr=data0005.rkey '
      + 'where data0073.rkey=''%s'' ', [rkey73]);
    open;
    edt_11.Text := fieldbyName('employee_name').AsString;
    edt_12.Text := fieldbyName('employee_name').AsString;
    edt_11.Tag := fieldbyName('rkey').AsInteger;
    edt_12.Tag := fieldbyName('rkey').AsInteger;
  end;
end;

procedure Tfm_madd.FormCreate(Sender: TObject);
begin
  // 获取离职原因
  with dm.qry_detail do
  begin
    //打开连接
    open;
    filter := 'dictid=10';
    filtered := true;
    first;
    cbb_LZrs.Items.Clear;
    while not eof do
    begin
      cbb_LZrs.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      next;
    end;
    cbb_LZrs.ItemIndex := 0;
    Close;
    Open;
    //获取雇佣类型
    filter:='dictid=5';
    filtered := true;
    first;
    cbb_emp.Items.Clear;
    cbb_emp.DropDownCount := 0;
    while not eof do
    begin
      cbb_emp.DropDownCount := cbb_emp.DropDownCount+1;
      cbb_emp.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      next;
    end;

    cbb_emp.ItemIndex := 0;
    //关闭连接
    close;
  end;  
end;

procedure Tfm_madd.btn_mtlv1Click(Sender: TObject);
var
  i, count: integer;
  rk, employeeid, chinesename: string;
begin
//批量离职处理

    if not n2.Enabled then
    begin
      showmessage('对不起，没有可更新的记录!');
      exit;
    end;
    count := 0;
    DM.qrySchEmpCode.Close;
    DM.qrySchEmpCode.SQL.Clear;
    DM.qrySchEmpID.Close;
    DM.qrySchEmpID.SQL.Clear;
    for i:=1 to sg_mtadd.RowCount -1  do
    begin
      with dm.qry_msg do  //档案表
      begin
        Locate('rkey',inttostr(integer(sg_mtadd.Objects[1,i])),[]);
        DM.qrySchEmpCode.SQL.Text := 'select rkey,chinesename from employeemsg where employeecode ='+ quotedstr(sg_mtadd.Cells[2,i]);
        DM.qrySchEmpCode.Open;
        employeeid := DM.qrySchEmpCode.FieldValues['rkey'];
        chinesename := DM.qrySchEmpCode.FieldValues['chinesename'];
        DM.qrySchEmpID.SQL.Text := Format('SELECT * FROM employee_alteration '
          + 'inner join dbo.datadetail on datadetail.rkey=employee_alteration.type '
          + 'where datadetail.dictid=9 and employeeid=%d and active=0', [StrToInt(employeeid)]);
        DM.qrySchEmpID.Open;

        if not DM.qrySchEmpID.IsEmpty then
        begin
          ShowMessage('对不起，员工 '+chinesename+' 已有离职记录，请查证！');
          Continue;
        end;
      end;
      with dm.qry_alt do  //离职变动表
      begin
        append;
        FieldByName('employeeid').AsString := dm.qry_msg.FieldByName('rkey').asstring;
        fieldbyname('alterdate').Value := DateToStr(dtpLZdate.Date);
        fieldbyname('oper_date').AsDateTime := dtpOperDate.DateTime;
        fieldbyname('type').AsInteger := integer(cbb_LZtype.Items.Objects[cbb_LZtype.ItemIndex]);
        fieldbyname('reason').AsInteger := integer(cbb_LZrs.Items.Objects[cbb_LZrs.ItemIndex]);
        fieldbyname('active').AsInteger := 0;
        fieldbyname('oper_person').AsInteger:=edt_11.Tag;
        FieldByName('remark').AsString := Memo1.Text;
        fieldbyname('orginal_employeecode').Asstring := dm.qry_msg.fieldbyname('employeecode').Asstring;
        fieldbyname('orginal_departmentid').AsInteger := dm.qry_msg.fieldbyname('departmentid').AsInteger;
        fieldbyname('orginal_position').AsInteger := dm.qry_msg.fieldbyname('position').AsInteger;
        fieldbyname('orginal_employ_type').AsInteger := dm.qry_msg.fieldbyname('employ_type_rkey').AsInteger;
        fieldbyname('orginal_rank').AsInteger := dm.qry_msg.fieldbyname('rank').AsInteger;
        fieldbyname('orginal_ondutytime').AsString := FormatdateTime('YYYY-MM-DD',dm.qry_msg.fieldbyname('ondutytime').asdatetime);
        fieldbyname('orginal_outdutytime').AsString :=FormatdateTime('YYYY-MM-DD',dtpLZdate.Date);
        post;
      end;
      count := count + 1;
    end;
    ShowMessage('此次操作共计离职 ' + inttostr(count) + ' 人');
    flag := true;
    ModalResult := mrOk;
end;

procedure Tfm_madd.btn_alt1Click(Sender: TObject);
var
  i, count: integer;
  ismodify: boolean;
  employeeid, chinesename, msg1, msg: string;
begin
  if edt_4.Text = '' then
  begin
   showmessage('对不起，[新帐套]不可以为空!');
   edt_4.SetFocus;
   Abort;
  end;
//批量处理员工变动
  if not n2.Enabled then
  begin
    showmessage('对不起，没有可更新的记录!');
    edt_code.Text := '';
    edt_1.Text := '';
    edt_2.Text := '';
    cbb_emp.Text := '';
    abort;
  end;
  DM.qrySchEmpCode.Close;
  DM.qrySchEmpCode.SQL.Clear;
  DM.qrySchEmpID.Close;
  DM.qrySchEmpID.SQL.Clear;
  ismodify := true;
  count := 0;
  for i := 1 to sg_mtadd.RowCount - 1 do
  begin
    if cbb_type.Text = '复职' then
    begin
      with DM.qryTemp do
      begin
        SQL.Text := 'select employeecode from employeemsg where status= 1 ' +
        ' and employeecode='+quotedStr(edt_code.Text)+
        ' and chinesename <>'+quotedStr(sg_mtadd.Cells[3,2]);
        Open;
        if not FieldByName('employeecode').IsNull then
        begin
          ShowMessage('该工号已有记录，请重新输入工号！');
          Exit;
        end;
      end;
    end;

    with dm.qry_alt do  //复工变动表
    begin
      dm.qry_msg.Locate('rkey',inttostr(integer(sg_mtadd.Objects[1,i])),[]);
      append;
      FieldByName('employeeid').AsString := dm.qry_msg.FieldByName('rkey').asstring;
      fieldbyname('alterdate').Value := DateToStr(dtp_alterdate.Date);
      fieldbyname('oper_date').AsDateTime := trunc(dtp_operdate.DateTime);
      fieldbyname('type').AsInteger := integer(cbb_type.Items.Objects[cbb_type.ItemIndex]);
      fieldbyname('orginal_ondutytime').AsString :=  FormatDateTime('yyyy-MM-dd',dm.qry_msg.fieldbyname('ondutytime').AsDatetime);
      fieldbyname('orginal_outdutytime').AsString :=  FormatDateTime('yyyy-MM-dd',dm.qry_msg.fieldbyname('outdutytime').AsDatetime);
      fieldbyname('reason').AsInteger :=  dm.qry_msg.fieldbyname('old_reason').AsInteger;
      fieldbyname('orginal_employeecode').asstring := dbt_pvalue.Text;
      fieldbyname('orginal_departmentid').AsInteger := dm.qry_msg.fieldbyname('departmentid').AsInteger;
      fieldbyname('orginal_position').AsInteger := dm.qry_msg.fieldbyname('position').AsInteger;
      fieldbyname('orginal_employ_type').AsInteger := integer(cbb_emp.Items.Objects[cbb_emp.ItemIndex]);
      fieldbyname('new_employ_type').AsInteger := integer(cbb_emp.Items.Objects[cbb_emp.ItemIndex]);
      fieldbyname('orginal_accountid').AsInteger := dm.qry_msg.fieldbyname('wagetype').AsInteger;
      if trim(edt_4.Text) <>'' then fieldbyname('new_accountid').AsInteger := strtoint(lb_9.Caption);
      if trim(edt_code.Text) <> '' then  fieldbyname('new_employeecode').asstring := edt_code.Text
        else   fieldbyname('new_employeecode').asstring := dbt_pvalue.Text; ;
      if (Trim(edt_1.Text) <> Trim(dbt_dept.Text)) and (Trim(edt_1.Text)<>'') then
          fieldbyname('new_departmentid').AsInteger := StrToInt(lb_deptname.Caption)
      else  fieldbyname('new_departmentid').AsInteger :=dm.qry_msg.fieldbyname('departmentid').AsInteger;

      if (trim(edt_2.Text)<>trim(dbt_posit.Text)) and (Trim(edt_2.Text)<>'') then
          fieldbyname('new_position').AsInteger := StrToInt(lb_position.Caption)
      else fieldbyname('new_position').AsInteger := dm.qry_msg.fieldbyname('position').AsInteger;

      if (trim(cbb_emp.Text)<>trim(dbt_emp.Text)) and (Trim(cbb_emp.Text)<>'') then
        begin
          fieldbyname('new_employ_type').AsInteger := integer(cbb_emp.Items.Objects[cbb_emp.ItemIndex]);;
          with DM.qryTemp do
          begin
            SQL.Clear;
            SQL.Text := 'select rkey from datadetail where item='+quotedstr(dm.qry_msg.fieldbyname('employ_type').AsString);
            Open;
          end;
          fieldbyname('orginal_employ_type').AsInteger := DM.qryTemp.fieldbyname('rkey').AsInteger;
          ismodify := true;
        end;
      if (trim(edt_13.Text)<>trim(dbt_rank.Text)) and (Trim(edt_13.Text)<>'') then
        begin
          fieldbyname('new_rank').AsInteger := StrToInt(lb_8.Caption);
          fieldbyname('orginal_rank').AsInteger := dm.qry_msg.fieldbyname('rank').AsInteger;
          ismodify := true;
        end;
      if Trim(Memo2.Text) <> '' then
      begin
        FieldByName('remark').AsString := Memo2.Text;
        ismodify := true;
      end;
      fieldbyname('active').AsInteger:=0;
      fieldbyname('oper_person').AsInteger:=edt_12.Tag;
      if ismodify then
        begin
          post;
          count:=count+1;
        end
      else
        begin
          msg1 := msg1+','+inttostr(i);
          msg := Copy(msg1,2,Length(msg1)-1);
          cancel;
        end;
      DM.FZTime := dtp_alterdate.Date;
    end;
  end;
  if msg <> '' then ShowMessage('第 '+ msg +' 行记录无变更操作，不需要更新！');
  ShowMessage('此次操作共计变动 '+inttostr(count)+' 条记录');
  flag:=true;
  ModalResult:=mrOk;
end;

procedure Tfm_madd.bbt_resltClick(Sender: TObject);
var
  i: integer;
begin
  edt_code.Text := '';
  edt_1.Text := '';
  edt_2.Text := '';
  for i:=1 to sg_mtadd.RowCount-1 do sg_mtadd.Rows[i].Clear;
  sg_mtadd.RowCount:=2;
  n2.Enabled:=false;//禁用删除功能
end;

procedure Tfm_madd.sg_mtaddSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
    if sg_mtadd.Objects[1,arow]=nil then exit;
    with dm.qry_msg do
    begin
      filtered:=false;
      locate('rkey',integer(sg_mtadd.Objects[1,arow]),[]);
    end;
    //cbb_emp.ItemIndex:=cbb_emp.Items.IndexOf(trim(dbt_emp.Text));
    CanSelect:=true;
end;

procedure Tfm_madd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=false;
  if flag then CanClose:=True
  else
    begin
      if MessageDlg('信息可能丢失,你确定要继续关闭吗?',mtConfirmation,[mbYes,mbNo],0)=mryes then   CanClose:=True
      else CanClose:=false;
    end;
  if CanClose then dm.qry_msg.Close;
end;

procedure Tfm_madd.btn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_1.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      lb_deptname.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfm_madd.N1Click(Sender: TObject);
var
i:integer;
rw:boolean;//标记是不是第一次删除
begin
  if grb_LZ.Visible = True then DM.AUTag := 0;
  if grb_LZ.Visible = False then DM.AUTag := 1;
  if ((dm.AUTag =1) and (sg_mtadd.Cells[1,1]<>'')) then
  begin
    showmessage('复职记录只能单条新增');
    abort;
  end;
  rw:=n2.Enabled;
  fm_emp:=tfm_emp.Create(application);
  dm.qry_msg.open;
  dm.qry_dept.Open;//打开部门表

  if fm_emp.ShowModal=mrok then
    begin
      if fm_emp.dg_msg.SelectedRows.Count=0 then exit;
      sg_mtadd.RowCount:=sg_mtadd.RowCount+fm_emp.dg_msg.SelectedRows.Count;
      for i:=0 to fm_emp.dg_msg.SelectedRows.Count-1 do
      begin
        with dm.qry_msg do  //档案表
        begin
          //指向选择行
          GotoBookmark(Pointer(fm_emp.dg_msg.SelectedRows.items[i]));
          //添加入stringgrid
          sg_mtadd.cols[1].AddObject(fieldbyname('departmentname').AsString, tobject(fieldbyname('rkey').AsInteger));
          sg_mtadd.cols[2].Add(fieldbyname('employeecode').AsString);
          sg_mtadd.cols[3].Add(fieldbyname('chinesename').AsString);
          sg_mtadd.cols[4].Add(fieldbyname('sexy').AsString);
          sg_mtadd.cols[5].Add(fieldbyname('ondutytime').AsString);
          sg_mtadd.cols[6].Add(fieldbyname('pposition').asstring);
          sg_mtadd.cols[7].Add(fieldbyname('rankname').AsString);
          sg_mtadd.cols[8].Add(fieldbyname('province').asstring);
          sg_mtadd.cols[9].Add(fieldbyname('employ_type').AsString);
          sg_mtadd.cols[10].Add(fieldbyname('idcard').AsString);
        end;
      end;
      n2.Enabled:=true;
      if not rw then sg_mtadd.RowCount:=sg_mtadd.RowCount-1;
      sg_mtaddSelectCell(Sender, 1, 1, rw); //指向第一条
    end;
  dm.qry_dept.Close;
  fm_emp.Free;
end;

procedure Tfm_madd.N2Click(Sender: TObject);
var
del, i: integer;
begin
  with sg_mtadd do
  begin
    for del := Selection.Top to Selection.Bottom do
    begin
      for i := Selection.Top to sg_mtadd.RowCount-1 do
      begin
        rows[i].Assign(Rows[i+1]);
      end;
      if rowcount > 2 then rowcount := rowcount-1 else n2.Enabled := false;//留一空白行
    end;
  end;
end;

procedure Tfm_madd.sg_mtaddDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if sg_mtadd.RowCount > 2 then
    begin
      edt_code.Enabled := False;
      edt_code.Text := '';
      edt_code.Color := cl3DLight;
    end
  else
    begin
      edt_code.Enabled := True;
      //edt_code.Text := '';
      edt_code.Color := clWhite;
    end;
end;

procedure Tfm_madd.bbt_3Click(Sender: TObject);
begin
  close;
end;

procedure Tfm_madd.btn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'item/职位名称/350,';
    InputVar.Sqlstr :='select * from datadetail where dictid=1 order by 2';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_2.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      lb_position.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfm_madd.btn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'item/职级名称/350,';
    InputVar.Sqlstr :='select * from datadetail where dictid=2 order by 2';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_13.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      lb_8.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfm_madd.btn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'accountname/帐套名称/350,';
    InputVar.Sqlstr :='select accountname,rkey from salaryaccount';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_4.Text := frmPick_Item_Single.adsPick.FieldValues['accountname'];
      lb_9.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.


