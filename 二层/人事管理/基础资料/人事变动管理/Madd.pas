unit Madd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, ComCtrls,DateUtils,
  Menus, ExtCtrls, ToolWin,DB, DBCtrlsEh, DBGridEh, DBClient, ADODB;

type
  TDropDownInfo=class
  private
  protected
  public
    L_GridName:       TDBGridEh;         //添加下拉列表将创建在哪个表格名上
    L_ListDataSetName:TDataSet;    //下拉列表数据集名
    L_DropdownColumn:string;             //添加下拉列表的表格列名
    L_ListDataSetFilterField:string;     // 下拉列表数据集过滤字段名，
    L_GetValueField :string;             //获取值的字段名
    L_ListResultField :string;           //下拉列表数据集返回的字段名     AnsiString
    L_FormWidth:Integer;                 //下拉窗体的宽度
    L_FormHeight:Integer;                //下拉窗体的高度
    L_FormType:Integer;                  //下拉窗体的类型 1:单选窗口，2：多选窗口
  end;

type
  Tfm_madd = class(TForm)
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
    bbt_reslt: TBitBtn;
    cbb_emp: TComboBox;
    btn_alt1: TBitBtn;
    bbt_2: TBitBtn;
    edt_dept: TEdit;
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
    edt_Posit: TEdit;
    lb_position: TLabel;
    btn2: TSpeedButton;
    lb_6: TLabel;
    lb_7: TLabel;
    lb_12: TLabel;
    edt_12: TEdit;
    lb_13: TLabel;
    dbt_rank: TDBEdit;
    lb_14: TLabel;
    edt_rank: TEdit;
    btn3: TSpeedButton;
    lb_8: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    edt_starLevel: TEdit;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    bbt_cnl: TBitBtn;
    dbt_starLevel: TDBEdit;
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
    procedure N2Click(Sender: TObject);
    procedure sg_mtaddDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure bbt_3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure CheckBox_employee_flagClick(Sender: TObject);
    procedure btn_employee_flagClick(Sender: TObject);
    procedure edt_starLevelKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbb_typeChange(Sender: TObject);
  private
    procedure DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);
    Function RecordExists(SQL:string; dt:TADODataSet):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_madd: Tfm_madd;
  DropDown_Info:array of TDropDownInfo;

implementation
 uses damo, emp, main, Pick_Item_Single, ConstVar, common,
  SelectItemUnit, SelectItemUnit2;
 var
   flag:Boolean=False;
{$R *.dfm}

Function Tfm_madd.RecordExists(SQL:string; dt:TADODataSet):boolean;
begin
  Result:=False;
  with  dt do
  begin
    Close;
    CommandText:=SQL;
    Open;              //功能：通过执行SQL语句（可以是多表复杂查找），查找相关表中是否存在相关记录，即存在查找。如果找到返回真值，否则返回假值。
                      //用法：if RecordExists('select * from GongYingShang where 供应商编号='+ quotedstr(trim(ADODateSet1.FieldByName('供应商编号').AsString )))=false then showmessage('不存在');
    if IsEmpty=False then
      Result:=true;
    close;
  end;
end;

procedure Tfm_madd.DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);  //
var
  i:Integer;
  L,T,W,X,H:Integer;
  Vpoint:   Tpoint;
begin
  with ((Sender as TControl).Parent).Parent as TDBGridEh do
  begin     //   ShowMessage(DataSource.DataSet.Name );
    if  DataSource.DataSet is TClientDataSet then
    if ((((Sender as TControl).Parent).Parent as TDBGridEh).DataSource.DataSet as TClientDataSet).ReadOnly then
    Exit;
    if  DataSource.DataSet is TCustomADODataSet then
    if (DataSource.DataSet as TCustomADODataSet).LockType=ltReadOnly then
    Exit;
    if ReadOnly then        //如果当前表格控件是只读，退出。
    Exit;
    if SelectedField.ReadOnly then    //如果当前表格选择的字段是只读
    Exit;
  end;
 // ((Sender as TControl).Parent as TColumnEh).


  with ((Sender as TControl).Parent).Parent as TDBGridEh do  //Button的父是EDIT，EDIT的父才是DBGRIDEH控件
  begin
    try
      begin
        for i:=0 to High( DropDown_Info) do
        begin
          if Name= DropDown_Info[i].L_GridName.Name then  //当前正在下拉表格的名子= 遍历DropDown_Info中的表格名
          if UpperCase(DropDown_Info[i].L_DropdownColumn)=UpperCase(SelectedField.FieldName)  then
          with DropDown_Info[i] do
          begin
             Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
             t:= Vpoint.y+(Sender as TControl).Height;
             if L_FormWidth  =0 then
               w:=400
             else
               w:=L_FormWidth;
             if L_FormHeight  =0 then
               H:=240
             else
               H:=L_FormHeight;
             x:=Screen.Width- Vpoint.X-w- (Sender as TControl).Parent.Width;
             if x<0 then
               L:=Screen.Width -w- (Sender as TControl).Parent.Width
             else
               L:= Vpoint.X- (Sender as TControl).Parent.Width;
               //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
             if  (Screen.Height-t)<   h then t:=Screen.Height-h;

            if L_ListDataSetName.Active=False then
            L_ListDataSetName.Open;                  //
            //DataSource.DataSet.FieldByName(L_DropdownColumn).OnChange(DataSource.DataSet.FieldByName(L_DropdownColumn))
            //ShowMessage(IntToStr(w));
            if L_FormType<=1 then
            begin
              if ShowAddListForm2(Self,L_ListDataSetName,L_ListDataSetFilterField,
                        Trim(L_GridName.FieldColumns[L_DropdownColumn].Field.asstring),
                        L,T,w,DM.cds_alt,'employeecode') then  
              begin
                if not (L_GridName.DataSource.DataSet.State in [dsEdit,dsInsert]) then
                  L_GridName.DataSource.DataSet.Edit;
                L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
                              L_ListDataSetName.FieldByName(L_ListResultField).value;
                if L_GridName.DataSource.DataSet.Filtered then
                L_GridName.DataSource.DataSet.Filtered :=False;
              end  ;
            end;
          end;
        end;
      end;
    finally
    //  frmSelect.Free;
    end;
  end;
end;

procedure Tfm_madd.bbt_cnlClick(Sender: TObject);
begin
  DM.cds_alt.Cancel;
  DM.cds_alt.CancelUpdates;
  Close;
end;

procedure Tfm_madd.FormShow(Sender: TObject);
var
  i: Integer;
begin
  //获得变更类型
  with DM.qry_detail do
  begin
//    open;
    cbb_type.Items.Clear;
    cbb_type.DropDownCount := 0;
    filter :='dictid=7';// damo.base;
    first;
    while not eof do
    begin
        cbb_type.DropDownCount := cbb_type.DropDownCount+1;
        cbb_type.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
        next;
    end;
    cbb_type.ItemIndex := -1;
    cbb_type.Items.Delete(cbb_type.Items.IndexOf('复职'));
//    close;
  end;

  //初始化窗体
  btn_alt1.Visible := grb_1.Visible;
  lb_1.Visible := grb_1.Visible;
    Caption := '新增人员调动';
//    dbt_pvalue.Color := cl3DLight;
//    dbt_dept.Color := cl3DLight;
//    dbt_posit.Color := cl3DLight;
//    dbt_emp.Color := cl3DLight;
//    dtp_operdate.Color := cl3DLight;
  //end;

  //日期初始化
  dtp_operdate.DateTime := now;
  dtp_alterdate.DateTime := now;
//  DBDateTimeEditEh1.Value:=Now;
  //dtpOperDate.DateTime := now;
  //dtpLZdate.DateTime := now;
  n2.Enabled := false;
 { with DM.qrytemp do
  begin
    SQL.Text := format('select data0005.rkey, employee_name from data0005 inner join data0073 on data0073.employee_ptr=data0005.rkey '
      + 'where data0073.rkey=''%s'' ', [rkey73]);
    open;
    //edt_11.Text := fieldbyName('employee_name').AsString;
    edt_12.Text := fieldbyName('employee_name').AsString;
    //edt_11.Tag := fieldbyName('rkey').AsInteger;
    edt_12.Tag := fieldbyName('rkey').AsInteger;
  end;    }
  edt_12.Text := vEmployee_name;
  edt_12.Tag:=StrToInt(user_ptr) ;
end;

procedure Tfm_madd.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  DM.cds_alt.Open;
  SetLength(DropDown_Info,2);
  DropDown_Info[0]:=TDropDownInfo.Create();
  with DropDown_Info[0] do
  begin
    L_GridName              :=DBGridEh1;
    L_ListDataSetName       :=DM.qry_msg;
    L_DropdownColumn        :='employeecode';
    L_ListDataSetFilterField:='employeecode';
    L_ListResultField       :='employeecode';
    L_GetValueField         :='employeecode';
  //  L_FormWidth             :=600;
  end;
  DropDown_Info[1]:=TDropDownInfo.Create();
  with DropDown_Info[1] do
  begin
    L_GridName              :=DBGridEh1;
    L_ListDataSetName       :=DM.qry_Employee_Train;
    L_DropdownColumn        :='Train_NO';
    L_ListDataSetFilterField:='Train_NO';
    L_ListResultField       :='Train_NO';
    L_GetValueField         :='Train_NO';
  end;
  for i:=0 to High(DropDown_Info) do
  begin
    with (DropDown_Info[i].L_GridName) do
    begin
      FieldColumns[DropDown_Info[i].L_DropdownColumn].ButtonStyle:=cbsDropDown;
      FieldColumns[DropDown_Info[i].L_DropdownColumn].AlwaysShowEditButton:=true;
      FieldColumns[DropDown_Info[i].L_DropdownColumn].OnEditButtonClick:= DBGridEHColumnsButtonClick;
    end;
  end;
  // 获取离职原因
  with dm.qry_detail do
  begin
    //打开连接
    open;
    filter := 'dictid=10';
    filtered := true;
    first;
    //cbb_LZrs.Items.Clear;
    {while not eof do
    begin
      cbb_LZrs.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      next;
    end;
    cbb_LZrs.ItemIndex := 0; }

    {filter := 'dictid=8';
    first;
    //cbb_reason.Items.Clear;
    //cbb_reason.DropDownCount:=0;   //显示item数目
    while not eof do
    begin
      cbb_reason.DropDownCount := cbb_reason.DropDownCount + 1;
      cbb_reason.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      next;
    end;
    cbb_reason.ItemIndex := 0; }

    //获取雇佣类型
    filter:='dictid=5';
    first;
    cbb_emp.Items.Clear;
    cbb_emp.DropDownCount := 0;
    while not eof do
    begin
      cbb_emp.DropDownCount := cbb_emp.DropDownCount+1;
      cbb_emp.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      next;
    end;
    cbb_emp.ItemIndex := -1;
    //关闭连接
//    close;
  end;
end;

procedure Tfm_madd.btn_mtlv1Click(Sender: TObject);
//var
//  i, count: integer;
//  rk, employeeid, chinesename: string;
begin
//批量离职处理

//    if not n2.Enabled then
//    begin
//      showmessage('对不起，没有可更新的记录!');
//      exit;
//    end;
//    count := 0;
//    DM.qrySchEmpCode.Close;
//    DM.qrySchEmpCode.SQL.Clear;
//    DM.qrySchEmpID.Close;
//    DM.qrySchEmpID.SQL.Clear;
//  {  for i:=1 to sg_mtadd.RowCount -1  do
//    begin
//      with dm.qry_msg do  //档案表
//      begin
//        Locate('rkey',inttostr(integer(sg_mtadd.Objects[1,i])),[]);
//        DM.qrySchEmpCode.SQL.Text := 'select rkey,chinesename from employeemsg where employeecode ='+ quotedstr(sg_mtadd.Cells[2,i]);
//        DM.qrySchEmpCode.Open;
//        employeeid := DM.qrySchEmpCode.FieldValues['rkey'];
//        chinesename := DM.qrySchEmpCode.FieldValues['chinesename'];
//        DM.qrySchEmpID.SQL.Text := Format('SELECT * FROM employee_alteration '
//          + 'inner join dbo.datadetail on datadetail.rkey=employee_alteration.type '
//          + 'where datadetail.dictid=9 and employeeid=%d and active=0', [StrToInt(employeeid)]);
//        DM.qrySchEmpID.Open;
//
//        if not DM.qrySchEmpID.IsEmpty then
//        begin
//          ShowMessage('对不起，员工 '+chinesename+' 已有离职记录，请查证！');
//          Continue;
//        end;
//      end;
//      {with dm.qry_alt do  //离职变动表
//      begin
//        append;
//        FieldByName('employeeid').AsString := dm.qry_msg.FieldByName('rkey').asstring;
//        //fieldbyname('alterdate').Value := DateToStr(dtpLZdate.Date);
//        //fieldbyname('oper_date').AsDateTime := dtpOperDate.DateTime;
//        //fieldbyname('type').AsInteger := integer(cbb_LZtype.Items.Objects[cbb_LZtype.ItemIndex]);
//        fieldbyname('reason').AsInteger := integer(cbb_LZrs.Items.Objects[cbb_LZrs.ItemIndex]);
//        fieldbyname('active').AsInteger := 0;
//        fieldbyname('oper_person').AsInteger:=edt_11.Tag;
//        FieldByName('remark').AsString := Memo1.Text;
//        post;
//      end; }
//      count := count + 1;
//    end;    }
//    ShowMessage('此次操作共计离职 ' + inttostr(count) + ' 人');
//    flag := true;
//    ModalResult := mrOk;
end;

procedure Tfm_madd.btn_alt1Click(Sender: TObject);
  function SaveCheck ():Boolean  ;
  var
    I_row:Integer;
    strMsg:string;
  begin
    Result:=True;
    DM.cdsTemp.CloneCursor(DM.cds_alt,False);
    with  DM.cdsTemp do
    begin
      First;
      for I_Row:=0 to RecordCount-1 do
      begin
        if FieldByName('employeeid').IsNull then //工号
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：“员工”的值不能为空！！！'+#13;
        if (FieldByName('employee_train_flag').AsBoolean) then
        {if (FieldByName('employee_train_ptr').IsNull) then 
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：“培训编号”的值不能为空！！！'+#13; }
        if RecordExists('SELECT rkey from employee_alteration where employeeid='+FieldByName('employeeid').AsString+' and active=0',DM.dt_temp) then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，该用户存在未生效的记录！！！'+#13;
        Next;
      end;
      Close;
    end;
    if strMsg<>'' then
    begin
      ShowMessage(Copy(strMsg,0,Length(strMsg)-1));
      Result:=False;
    end;
  end;
var
  i, count: integer;
  ismodify: boolean;
  employeeid, chinesename, msg1, msg: string;
begin
//批量处理员工变动
 { if not n2.Enabled then
  begin
    showmessage('对不起，没有可更新的记录!');
    edt_code.Text := '';
    edt_dept.Text := '';
    edt_Posit.Text := '';
    cbb_emp.Text := '';
    exit;
  end;   }
//  if CheckBox_employee_flag.Checked then
//  begin
//    if Trim(edt_Train_NO.Text)='' then
//    begin
//      ShowMessage('先输入培训编号！！！');
//      Exit;
//    end
//    else
//    begin
//      if DM.qry_Employee_Train.Locate('Train_NO',edt_Train_NO.Text,[])  then
//      begin
//        edt_Train_NO.Tag:= DM.qry_Employee_Train.fieldByName('rkey').Value;
//      end
//      else
//      begin
//        edt_Train_NO.Tag:=0 ;
//        ShowMessage('培训编号不正确！！！');
//        Exit;
//      end;
//    end;
//  end;
  with DM.cds_alt do
  begin
    if state in [dsEdit,dsInsert] then
    Post;
    if IsEmpty then
    begin
      ShowMessage('表格无记录！');
      Exit;
    end;
  end;
  if cbb_type.Text = '' then
  begin
    ShowMessage('对不起，变动类型不能为空！');
    exit;
  end;
  //{新工号}                     //新部门                  //新职务
  if (Trim(edt_code.Text)='')and(Trim(edt_dept.Text)='')and(Trim(edt_Posit.Text)='')
         //新职级                        //新合同类型              //新星级
  and(Trim(edt_rank.Text)='')and(Trim(cbb_emp.Text)='')and(Trim(edt_starLevel.Text)='')then
  begin
    ShowMessage('记录无变更内容，不需要更新！');
    Exit;
  end;
  if SaveCheck=False then
  Exit;

  begin
    try
      DM.cn_change.BeginTrans;
      with dm.cds_alt do
      begin
        First;
        while not Eof do
        begin
          if not(state in [dsEdit,dsInsert]) then
          Edit;
          fieldbyname('alterdate').Value := DateToStr(dtp_alterdate.Date);
          fieldbyname('oper_date').AsDateTime :=(dtp_operdate.DateTime);// trunc(dtp_operdate.DateTime);
          fieldbyname('type').AsInteger := integer(cbb_type.Items.Objects[cbb_type.ItemIndex]);

          if trim(edt_code.Text) <> '' then
            begin
              fieldbyname('new_employeecode').asstring := edt_code.Text;
              fieldbyname('orginal_employeecode').asstring := dbt_pvalue.Text;
              ismodify := true;
            end;
          if (Trim(edt_dept.Text) <> Trim(dbt_dept.Text)) and (Trim(edt_dept.Text)<>'') then
            begin
              fieldbyname('new_departmentid').AsInteger := StrToInt(lb_deptname.Caption);
              ismodify := true;
            end;
          fieldbyname('orginal_departmentid').AsInteger := fieldbyname('departmentid').AsInteger;

          if (trim(edt_Posit.Text)<>trim(dbt_posit.Text)) and (Trim(edt_Posit.Text)<>'') then
            begin
              fieldbyname('new_position').AsInteger := StrToInt(lb_position.Caption);
              fieldbyname('orginal_position').AsInteger := fieldbyname('position').AsInteger;
              ismodify := true;
            end;
          if (trim(cbb_emp.Text)<>trim(dbt_emp.Text)) and (Trim(cbb_emp.Text)<>'') then
            begin
              fieldbyname('new_employ_type').AsInteger := integer(cbb_emp.Items.Objects[cbb_emp.ItemIndex]);;
              with DM.qryTemp do
              begin
                Close;
                SQL.Clear;
                SQL.Text := 'select rkey from datadetail where item='+quotedstr(DM.cds_alt.fieldbyname('employ_type').AsString);
                Open;
              end;
              fieldbyname('orginal_employ_type').AsInteger := DM.qryTemp.fieldbyname('rkey').AsInteger;
//              ShowMessage(fieldbyname('new_employ_type').AsString);
//              ShowMessage(fieldbyname('orginal_employ_type').AsString);
              ismodify := true;
            end;
          if (trim(edt_rank.Text)<>trim(dbt_rank.Text)) and (Trim(edt_rank.Text)<>'') then
            begin
              fieldbyname('new_rank').AsInteger := StrToInt(lb_8.Caption);
              fieldbyname('orginal_rank').AsInteger := fieldbyname('rank').AsInteger;
              ismodify := true;
            end;

          if (trim(edt_starLevel.Text)<>trim(dbt_starLevel.Text)) and (Trim(edt_starLevel.Text)<>'') then
          begin
            if Trim(dbt_starLevel.Text)<>'' then
              fieldbyname('orginal_star').Value := dbt_starLevel.Text;
            fieldbyname('new_star').Value     := edt_starLevel.Text;
            ismodify := true;
          end;
          if Trim(Memo2.Text) <> '' then
          begin
            FieldByName('remark').AsString := Memo2.Text;
            ismodify := true;
          end;

          fieldbyname('active').AsInteger:=0;
          fieldbyname('oper_person').AsInteger:=edt_12.Tag;
          Post;
    //      DM.FZTime := dtp_alterdate.Date;
        

          {if FieldByName('employee_train_flag').AsBoolean then
          begin
            DM.qryTemp.Close;
            DM.qryTemp.SQL.Clear;
            DM.qryTemp.SQL.Text:='update dbo.Employee_Train set ptr_flag=1 where rkey='+FieldByName('employee_train_ptr').AsString;
            DM.qryTemp.ExecSQL;
          end;}
          Next;
        end;
      end;
//      ShowMessage(DM.cds_alt.FieldByName('oper_person').AsString);
      if dm.cds_alt.ApplyUpdates(0)>0 then
      Exit;
      DM.cn_change.CommitTrans;
      
    except
      DM.cn_change.RollbackTrans;
    end;
  end;
  ModalResult:=mrOk;
 //
//  if msg <> '' then ShowMessage('第 '+ msg +' 行记录无变更操作，不需要更新！');
//  ShowMessage('此次操作共计变动 '+inttostr(count)+' 条记录');
//  flag:=true;
  
end;

procedure Tfm_madd.bbt_resltClick(Sender: TObject);
var
  i: integer;
begin
  DM.cds_alt.Cancel;
  DM.cds_alt.CancelUpdates;
  edt_code.Text := '';
  edt_dept.Text := '';
  edt_Posit.Text := '';
  edt_starLevel.Text := '';
  edt_rank     .Text := '';
  cbb_emp.ItemIndex := -1;
  cbb_type.ItemIndex := -1;
//  for i:=1 to sg_mtadd.RowCount-1 do sg_mtadd.Rows[i].Clear;
//  sg_mtadd.RowCount:=2;
//  n2.Enabled:=false;//禁用删除功能
end;

procedure Tfm_madd.sg_mtaddSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 //   if sg_mtadd.Objects[1,arow]=nil then exit;
//    with dm.qry_msg do
//    begin
//      filtered:=false;
//      locate('rkey',integer(sg_mtadd.Objects[1,arow]),[]);
//    end;
//    cbb_emp.ItemIndex:=cbb_emp.Items.IndexOf(trim(dbt_emp.Text));
//    CanSelect:=true;
end;

procedure Tfm_madd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  CanClose:=false;
//  if flag then CanClose:=True
//  else
//    begin
//      if MessageDlg('信息可能丢失,你确定要继续关闭吗?',mtConfirmation,[mbYes,mbNo],0)=mryes then   CanClose:=True
//      else CanClose:=false;
//    end;
//  if CanClose then dm.qry_msg.Close;
end;

procedure Tfm_madd.btn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.cn_change;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_dept.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      lb_deptname.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfm_madd.N2Click(Sender: TObject);
var
del, i: integer;
begin
  with DM.cds_alt do
  if IsEmpty=False then
  begin
    Delete;
  end;
end;

procedure Tfm_madd.sg_mtaddDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//  if sg_mtadd.RowCount > 2 then
//    begin
//      edt_code.Enabled := False;
//      edt_code.Text := '';
//      edt_code.Color := cl3DLight;
//    end
//  else
//    begin
//      edt_code.Enabled := True;
//      //edt_code.Text := '';
//      edt_code.Color := clWhite;
//    end;
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
    InputVar.AdoConn := DM.cn_change;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_Posit.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
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
    InputVar.Fields := 'item/职位名称/350,';
    InputVar.Sqlstr :='select * from datadetail where dictid=2 order by 2';
    InputVar.AdoConn := DM.cn_change;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_rank.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      lb_8.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfm_madd.CheckBox_employee_flagClick(Sender: TObject);
begin
//  if CheckBox_employee_flag.Checked then
//    begin
//    edt_Train_NO.ReadOnly:=False  ;
//    btn_employee_flag.Enabled:=True;
//    end
//  else
//    begin
//    edt_Train_NO.ReadOnly:=True;
//    btn_employee_flag.Enabled:=False;
//    end;
end;

procedure Tfm_madd.btn_employee_flagClick(Sender: TObject);
var
  Vpoint:Tpoint;
begin
//  if sg_mtadd.RowCount<2 then
//  Exit;
//  with DM.qry_Employee_Train do
//  begin
//    Close;
//    Parameters.ParamByName('vEmployeeid').Value:=inttostr(integer(sg_mtadd.Objects[1,sg_mtadd.Row]));
//    Open;
//  end;

//  with  edt_Train_NO  do
//  begin
//    Vpoint:= Parent.ClientToScreen(Point(Left,Top));
//    if ShowAddListForm(self,DM.qry_Employee_Train,'Train_NO',Text,Vpoint.x,Vpoint.y+Height,800)then
//    begin
//      Tag                   := DM.qry_Employee_Train.FieldByName('rkey').Value;
//      Text                  := DM.qry_Employee_Train.FieldByName('Train_NO').Value;
//      edt_Train_topics.Text := DM.qry_Employee_Train.FieldByName('Train_topics').Value;
////        FieldByName('employeecode').Value:=   DM.AQ_employeemsg_extra.FieldByName('employeecode').Value;
////        FieldByName('chinesename').Value:=  DM.AQ_employeemsg_extra.FieldByName('chinesename').Value;
//
//    end;
//  end

end;

procedure Tfm_madd.edt_starLevelKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['1'..'9', #9, #13, #8]) then
  Key := #0;
                //  
end;

procedure Tfm_madd.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with  DM.cds_alt do
  begin
    if (State in [dsEdit,dsInsert])or(ChangeCount>0)then
    s:=messagebox(Self.Handle,'数据还没有保存，你要保存吗？','提示',MB_yesnocancel+MB_iconquestion)   ;
    if s=idyes then
      begin
        if  State in [dsInsert,dsEdit]then
          Post ;
        if ChangeCount>0 then
       btn_alt1.Click;
      end
    else
    if s=idCancel then
    begin

      Abort;
    end
    else
    if s=idNo then
    begin
      Cancel;
      CancelUpdates;
    end;
  end;
end;

procedure Tfm_madd.cbb_typeChange(Sender: TObject);
begin
  with DM.qry_detail do
  begin
    if Filtered then
      Filtered:=False;
    Locate('rkey',integer(cbb_type.Items.Objects[cbb_type.ItemIndex]),[]);
    if FieldByName('train_flag').AsBoolean then
    begin
      with DM.cds_alt do
      begin
        if state in [dsEdit,dsInsert] then
        Post;
        First;
        while not Eof do
        begin
          if FieldByName('train_flag').AsBoolean then
          begin
//            if FieldByName('employee_train_flag').ReadOnly then   
//              FieldByName('employee_train_flag').ReadOnly:=False;
            Edit;
            FieldByName('employee_train_flag').Value:=True;   //employee_train_flag:培训
            Post;
          end;
          Next;
        end;
      end;
    end
    else
    begin
      with DM.cds_alt do
      begin
        if state in [dsEdit,dsInsert] then
        Post;
        First;
        while not Eof do
        begin
          if FieldByName('train_flag').AsBoolean then
          begin
            Edit;
            FieldByName('employee_train_flag').Value:=False;
            if FieldByName('Train_NO').IsNull=False then
            if FieldByName('Train_NO').ReadOnly=False then
              FieldByName('Train_NO').Value:=null;
            Post;
          end;
          Next;
        end;
      end;
    end;
  end;
end;

end.


