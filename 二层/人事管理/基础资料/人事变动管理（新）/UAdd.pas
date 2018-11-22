unit UAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, ComCtrls,DateUtils,
  Menus, ExtCtrls, ToolWin,DB, DBCtrlsEh, DBGridEh, DBClient, ADODB;

type
  TFrmAdd = class(TForm)
    Panel1: TPanel;
    lb_1: TLabel;
    bbt_reslt: TBitBtn;
    btn_Del: TBitBtn;
    bbt_3: TBitBtn;
    bbt_cnl: TBitBtn;
    btn_alt1: TBitBtn;
    grb_1: TGroupBox;
    grb_2: TGroupBox;
    Label12: TLabel;
    Label8: TLabel;
    lb_pvalue: TLabel;
    Label4: TLabel;
    lb_13: TLabel;
    Label1: TLabel;
    dbt_dept: TDBEdit;
    dbt_posit: TDBEdit;
    dbt_emp: TDBEdit;
    dbt_OEmpCode: TDBEdit;
    dbt_rank: TDBEdit;
    grb_3: TGroupBox;
    lb_cvalue: TLabel;
    btn1: TSpeedButton;
    Label11: TLabel;
    lb_type: TLabel;
    lb_alterdate: TLabel;
    lb_operdate: TLabel;
    lb_deptname: TLabel;
    lb_position: TLabel;
    btn_selPosition: TSpeedButton;
    lb_6: TLabel;
    lb_7: TLabel;
    lb_12: TLabel;
    lb_14: TLabel;
    btn_SelRank: TSpeedButton;
    lb_8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbb_emp: TComboBox;
    edt_code: TEdit;
    edt_dept: TEdit;
    dtp_alterdate: TDateTimePicker;
    dtp_operdate: TDateTimePicker;
    edt_Posit: TEdit;
    edt_oper_Person: TEdit;
    edt_rank: TEdit;
    Memo2: TMemo;
    edt_starLevel: TEdit;
    Panel2: TPanel;
    dbgrdh_Add: TDBGridEh;
    qry_Add: TADOQuery;
    ds_add: TDataSource;
    qry_msg: TADOQuery;
    qry_msgrkey: TIntegerField;
    qry_msgemployeecode: TWideStringField;
    qry_msgchinesename: TWideStringField;
    qry_msgdepartmentname: TWideStringField;
    qry_msgstatus: TWordField;
    qry_msgrankname: TWideStringField;
    qry_msgrank: TIntegerField;
    qry_msgsexy: TStringField;
    qry_msgondutytime: TDateTimeField;
    qry_msgoutdutytime: TDateTimeField;
    qry_msgprovince: TWideStringField;
    qry_msgIDCard: TWideStringField;
    qry_msgdepartmentid: TIntegerField;
    qry_msgpposition: TWideStringField;
    qry_msgemploy_type: TWideStringField;
    qry_msgposition: TIntegerField;
    qry_msgstarLevel: TIntegerField;
    qry_msgtrain_flag: TBooleanField;
    qry_Addtrain_flag: TBooleanField;
    qry_Addemployeecode: TWideStringField;
    qry_Addchinesename: TWideStringField;
    qry_AddTrain_NO: TStringField;
    qry_AddTrain_topics: TWideStringField;
    qry_Addstatus: TWordField;
    qry_Addrankname: TWideStringField;
    qry_Addrank: TIntegerField;
    qry_Addsexy: TStringField;
    qry_Addondutytime: TDateTimeField;
    qry_Addoutdutytime: TDateTimeField;
    qry_Addprovince: TWideStringField;
    qry_AddIDCard: TWideStringField;
    qry_Adddepartmentid: TIntegerField;
    qry_Addpposition: TWideStringField;
    qry_Addemploy_type: TWideStringField;
    qry_Adddepartmentname: TWideStringField;
    qry_Addposition: TIntegerField;
    qry_AddstarLevel: TIntegerField;
    qry_AddEMPLOYEE_NAME: TStringField;
    qry_Addrkey: TAutoIncField;
    qry_Addemployeeid: TIntegerField;
    qry_Addtype: TIntegerField;
    qry_Addreason: TIntegerField;
    qry_Addalterdate: TDateTimeField;
    qry_Addorginal_employeecode: TWideStringField;
    qry_Addorginal_departmentid: TIntegerField;
    qry_Addorginal_position: TIntegerField;
    qry_Addorginal_employ_type: TIntegerField;
    qry_Addorginal_politics_face: TIntegerField;
    qry_Addorginal_education: TIntegerField;
    qry_Addorginal_marriage: TIntegerField;
    qry_Addorginal_rank: TIntegerField;
    qry_Addorginal_accountid: TIntegerField;
    qry_Addnew_employeecode: TWideStringField;
    qry_Addnew_departmentid: TIntegerField;
    qry_Addnew_position: TIntegerField;
    qry_Addnew_employ_type: TIntegerField;
    qry_Addnew_politics_face: TIntegerField;
    qry_Addnew_education: TIntegerField;
    qry_Addnew_marriage: TIntegerField;
    qry_Addnew_rank: TIntegerField;
    qry_Addnew_accountid: TIntegerField;
    qry_Addoper_person: TIntegerField;
    qry_Addoper_date: TDateTimeField;
    qry_Addactive: TIntegerField;
    qry_Addremark: TWideStringField;
    qry_Addorginal_ondutytime: TWideStringField;
    qry_Addorginal_outdutytime: TWideStringField;
    qry_Addemployee_train_ptr: TIntegerField;
    qry_Addemployee_train_flag: TBooleanField;
    qry_Addorginal_star: TIntegerField;
    qry_Addnew_star: TIntegerField;
    qry_Train: TADOQuery;
    qry_Trainrkey: TAutoIncField;
    qry_TrainTrain_NO: TStringField;
    qry_TrainTrain_topics: TWideStringField;
    qry_Trainstartdate: TDateTimeField;
    qry_Trainenddate: TDateTimeField;
    qry_TrainTeacher: TWideStringField;
    qry_TrainTrain_place: TWideStringField;
    qry_TrainTrain_grade: TWideStringField;
    qry_TrainTrain_result: TWideStringField;
    qry_TrainTrain_content: TWideStringField;
    qry_TrainTrain_status: TIntegerField;
    cbb_type: TComboBox;
    qry_save: TADOQuery;
    qry_saverkey: TAutoIncField;
    qry_saveemployeeid: TIntegerField;
    qry_savetype: TIntegerField;
    qry_savereason: TIntegerField;
    qry_savealterdate: TDateTimeField;
    qry_saveorginal_employeecode: TWideStringField;
    qry_saveorginal_departmentid: TIntegerField;
    qry_saveorginal_position: TIntegerField;
    qry_saveorginal_employ_type: TIntegerField;
    qry_saveorginal_politics_face: TIntegerField;
    qry_saveorginal_education: TIntegerField;
    qry_saveorginal_marriage: TIntegerField;
    qry_saveorginal_rank: TIntegerField;
    qry_saveorginal_accountid: TIntegerField;
    qry_savenew_employeecode: TWideStringField;
    qry_savenew_departmentid: TIntegerField;
    qry_savenew_position: TIntegerField;
    qry_savenew_employ_type: TIntegerField;
    qry_savenew_politics_face: TIntegerField;
    qry_savenew_education: TIntegerField;
    qry_savenew_marriage: TIntegerField;
    qry_savenew_rank: TIntegerField;
    qry_savenew_accountid: TIntegerField;
    qry_saveoper_person: TIntegerField;
    qry_saveoper_date: TDateTimeField;
    qry_saveactive: TIntegerField;
    qry_saveremark: TWideStringField;
    qry_saveorginal_ondutytime: TWideStringField;
    qry_saveorginal_outdutytime: TWideStringField;
    qry_saveemployee_train_ptr: TIntegerField;
    qry_saveemployee_train_flag: TBooleanField;
    qry_saveorginal_star: TIntegerField;
    qry_savenew_star: TIntegerField;
    btn2: TSpeedButton;
    intgrfld_Addorginal_station: TIntegerField;
    intgrfld_Addnew_station: TIntegerField;
    wdstrngfld_Addstationitem: TWideStringField;
    intgrfld_Addstation: TIntegerField;
    wdstrngfld_msgstationitem: TWideStringField;
    intgrfld_msgstation: TIntegerField;
    intgrfld_saveorginal_station: TIntegerField;
    intgrfld_savenew_station: TIntegerField;
    dbedtstationitem: TDBEdit;
    Label5: TLabel;
    cbb_DormiDegrad: TComboBox;
    Label6: TLabel;
    dbedt_DormiGrade: TDBEdit;
    qry_AddDormiGrade: TWideStringField;
    Label7: TLabel;
    cbb_NewIsKeyP: TComboBox;
    lbl1: TLabel;
    dbedtOldIsKeyP: TDBEdit;
    lbl2: TLabel;
    dbedtOldKeyPID: TDBEdit;
    Label9: TLabel;
    edt_NewKeyPID: TEdit;
    SpeedButton1: TSpeedButton;
    qry_saveOldIsKeyP: TIntegerField;
    qry_saveNewIsKeyP: TIntegerField;
    qry_saveOldKeyPID: TIntegerField;
    qry_saveNewKeyPID: TIntegerField;
    qry_AddOldIsKeyP: TIntegerField;
    qry_AddNewIsKeyP: TIntegerField;
    qry_AddOldKeyPID: TIntegerField;
    qry_AddNewKeyPID: TIntegerField;
    qry_AddIsKeyPosition: TIntegerField;
    qry_AddKeyPositionName: TWideStringField;
    qry_msgIsKeyposition: TIntegerField;
    qry_msgpositionName: TWideStringField;
    qry_msgWYear: TBCDField;
    qry_AddWYear: TBCDField;
    Label10: TLabel;
    lbl3: TLabel;
    dbedtGrade: TDBEdit;
    lbl4: TLabel;
    edtGrade: TEdit;
    btnGrade: TSpeedButton;
    qry_AddOldPGrade: TIntegerField;
    qry_AddnewPGrade: TIntegerField;
    qry_AddPGrade: TWideStringField;
    qry_msgstrPGrade: TWideStringField;
    qry_msgstrDGrade: TWideStringField;
    qry_saveOldPGrade: TIntegerField;
    qry_savenewPGrade: TIntegerField;
    procedure bbt_3Click(Sender: TObject);
    procedure dbgrdh_AddEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbt_resltClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn_selPositionClick(Sender: TObject);
    procedure btn_SelRankClick(Sender: TObject);
    procedure btn_alt1Click(Sender: TObject);
    procedure btn_DelClick(Sender: TObject);
    procedure bbt_cnlClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGradeClick(Sender: TObject);
  private
    { Private declarations }
    function GetOne(FN,ssql:string):Variant;
    function OpenQry(ssql:string):string;

  public
    { Public declarations }
  end;

var
  FrmAdd: TFrmAdd;

implementation
        uses udm, Pick_Item_Single, ConstVar, common, UChange,USelKeyP;
{$R *.dfm}
function TFrmAdd.OpenQry(ssql:string):string;
var
  Errstr:string;
begin
 try
   result:='';
   with dm.qrytemp do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open
   end;
  except on e:exception do
  begin
   Errstr:='错误：'+e.Message;
   ShowMessage(Errstr);
   //exit;
  end;

 end;
   result:=Errstr;
end;


function TFrmAdd.GetOne(FN,ssql:string):Variant;
begin

 result:='';
 try
  with dm.qrytemp do

  begin
   close;
   sql.clear;
   sql.text:=ssql;
   Open;
  end;
  if not DM.qrytemp.IsEmpty  then
  Result:=DM.qrytemp.fieldbyname(fn).Value;
  except on e: exception do
  begin
   ShowMessage('出错：'+e.Message);
  exit;
  end;
  end;
  
end;


procedure TFrmAdd.bbt_3Click(Sender: TObject);
begin
close;
end;

procedure TFrmAdd.dbgrdh_AddEditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin

  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

    // with ((Sender as TControl).Parent).Parent as TDBGridEh do
    with (Sender  as TDBGridEh) do
     begin
       qry_Add.edit;
       if SelectedField.FieldName='employeecode' then
       begin
         // ShowMessage('test');

        InputVar.Fields := 'employeecode/工号/100,chinesename/姓名/100,sexy/性别/50,departmentname/部门名称/100,ondutytime/入职日期/120,train_flag/培训/100,stationitem/岗位/120';
        InputVar.Sqlstr := qry_msg.sql.text;
       // showmessage(qry_msg.sql.text);
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
         // SelectedField.Text:= frmPick_Item_Single.adsPick.FieldValues['departmentname'];
          //lb_deptname.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
          Fields[1].Text:= frmPick_Item_Single.adsPick.fieldbyname('employeecode').asstring;
          Fields[0].Text:= frmPick_Item_Single.adsPick.fieldbyname('departmentname').asstring;
          Fields[2].Text:= frmPick_Item_Single.adsPick.fieldbyname('chinesename').asstring;
          Fields[3].Text:= frmPick_Item_Single.adsPick.fieldbyname('ondutytime').asstring;
          Fields[4].Text:= frmPick_Item_Single.adsPick.fieldbyname('train_flag').asstring;
          Fields[7].Text:= frmPick_Item_Single.adsPick.fieldbyname('pposition').asstring;
          Fields[8].Text:= frmPick_Item_Single.adsPick.fieldbyname('rankName').asstring;
          Fields[9].Text:= frmPick_Item_Single.adsPick.fieldbyname('province').asstring;
          Fields[10].Text:= frmPick_Item_Single.adsPick.fieldbyname('employ_type').asstring;
          Fields[11].Text:= frmPick_Item_Single.adsPick.fieldbyname('IDCard').asstring;
          Fields[13].Text:= frmPick_Item_Single.adsPick.fieldbyname('stationitem').asstring;

         //20170908 TCX
          Fields[14].Text:= frmPick_Item_Single.adsPick.fieldbyname('IsKeyPosition').asstring;
          Fields[15].Text:= frmPick_Item_Single.adsPick.fieldbyname('positionName').asstring;
          Fields[16].Text:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asstring;

          Fields[17].Text:= frmPick_Item_Single.adsPick.fieldbyname('Departmentid').asstring;
          Fields[18].Text:= frmPick_Item_Single.adsPick.fieldbyname('WYear').asstring;
          Fields[19].Text:= frmPick_Item_Single.adsPick.fieldbyname('strDGrade').asstring;
          Fields[20].Text:= frmPick_Item_Single.adsPick.fieldbyname('strPGrade').asstring;
        end ;

       end;
      // Train_NO
     { if SelectedField.FieldName='Train_NO' then
       begin
       if  Fields[4].Value=0  then Exit;
        if Fields[1].Text=''  then
       begin
        //ShowMessage('请先选择员工工号!');
       exit;
       end;
        InputVar.Fields := 'Train_NO/培训编号/100, Train_topics/培训主题/120, Train_content/培训内容/120, Train_result/培训结果/100,Train_status/培训状态/120';

        InputVar.Sqlstr :=' select rkey ,Train_NO ,Train_topics ,startdate , '+
                         ' enddate	,Teacher	,Train_place	,Train_grade	,Train_result ,  '+
                         ' Train_content ,Train_status ,ptr_flag              '+
                         ' from dbo.Employee_Train             '+
                         ' where (employeeid='''+Fields[1].Text+''') and (ptr_flag is null or ptr_flag=0) '+
                          '  and type_ptr =(select rkey from datadetail where dictid=20 and item =''升职'') ' ;

        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          Fields[5].Text:= frmPick_Item_Single.adsPick.fieldbyname('Train_NO').asstring;
          Fields[6].Text:= frmPick_Item_Single.adsPick.fieldbyname('Train_topics').asstring;
        
        end;


       end;}

        qry_Add.post;
     end;


  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;




end;

procedure TFrmAdd.FormCreate(Sender: TObject);
begin
 if not qry_Add.Active  then qry_Add.Open;
 
  //加载合同类型：
  

end;

procedure TFrmAdd.bbt_resltClick(Sender: TObject);
begin
if qry_Add.IsEmpty then exit;

qry_Add.First;
while not qry_Add.Eof do
begin
  qry_Add.Delete;
      qry_Add.Next;
end;

end;

procedure TFrmAdd.FormShow(Sender: TObject);
var
  ssql,err:string;
begin

  dtp_alterdate.date:=now;
  dtp_operdate.Date:=now;

  //初始化操作人:
   with DM.qrytemp do
  begin
    sql.clear;
    ssql:=' select data0005.rkey, employee_name from data0005 inner join data0073 on data0073.employee_ptr=data0005.rkey '
      + ' where data0073.rkey='+rkey73+' ' ;
    SQL.Text :=ssql;
    open;
    edt_oper_Person.Text := fieldbyName('employee_name').AsString;
   // edt_12.Text := fieldbyName('employee_name').AsString;
    edt_oper_Person.Tag := fieldbyName('rkey').AsInteger;
   // edt_12.Tag := fieldbyName('rkey').AsInteger;
  end;
 

  //加载异动类型：
  ssql:='select rkey,item from datadetail  where dictid=7 and item <>''离职'' and item <>''复职''  ';
  err:= self.OpenQry(ssql);
  if err='' then
  begin
   if not  dm.qrytemp.IsEmpty then
   begin
     dm.qrytemp.First;
     cbb_type.Items.Clear;
     while not dm.qrytemp.Eof  do
     begin
        cbb_type.Items.AddObject(dm.qrytemp.fieldbyname('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').AsInteger));
        dm.qrytemp.next;
     end;
   end;
  end
  else
  begin
  ShowMessage(err);
  exit;
  end;

   //加宿舍等级：
  ssql:='select rkey,item from datadetail  where dictid=24  ';
  err:= self.OpenQry(ssql);
  if err='' then
  begin
   if not  dm.qrytemp.IsEmpty then
   begin
     dm.qrytemp.First;
     cbb_DormiDegrad.Items.Clear;
     while not dm.qrytemp.Eof  do
     begin
        cbb_DormiDegrad.Items.AddObject(dm.qrytemp.fieldbyname('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').AsInteger));
        dm.qrytemp.next;
     end;
   end;
  end
  else
  begin
  ShowMessage(err);
  exit;
  end;




    //加载合同类型：cbb_emp.Items.AddObject(dm.qrytemp.fieldbyname('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').AsInteger));
  ssql:='select rkey,item from datadetail  where dictid=5  ';
  err:= self.OpenQry(ssql);
  if err='' then
  begin
   if not  dm.qrytemp.IsEmpty then
   begin
     dm.qrytemp.First;
     cbb_emp.Items.Clear;
     while not dm.qrytemp.Eof  do
     begin
       cbb_emp.Items.AddObject(dm.qrytemp.fieldbyname('item').AsString, TObject(dm.qrytemp.FieldByName('rkey').AsInteger));
        dm.qrytemp.next;
     end;
   end;
  end
  else
  begin
  ShowMessage(err);
  exit;
  end;



end;

procedure TFrmAdd.btn1Click(Sender: TObject);
   var
     InputVar:PDlginput;
 begin
   try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(nil) ;

        InputVar.Fields := 'departmentname/部门/120,departmentcode/部门编号/100,rkey/ID/50';
        InputVar.Sqlstr := 'select  departmentname,departmentcode,rkey  from datadepartment where invalid=0 ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          edt_dept.text:=frmPick_Item_Single.adsPick.fieldbyname('departmentname').asstring;
          edt_dept.tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
        
        end;

  finally
   frmPick_Item_Single.Free;

  end;

  end;

procedure TFrmAdd.btn_selPositionClick(Sender: TObject);
   var
     InputVar:PDlginput;
 begin
   try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(nil) ;

        InputVar.Fields := 'item/职务名称/200,rkey/ID/50';
        InputVar.Sqlstr := 'select  item,rkey  from datadetail  where  dictid=1 ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          edt_Posit.text:=frmPick_Item_Single.adsPick.fieldbyname('item').asstring;
          edt_Posit.tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
        end;
  finally
   frmPick_Item_Single.Free;

  end;
end;

procedure TFrmAdd.btn_SelRankClick(Sender: TObject);
   var
     InputVar:PDlginput;
 begin
   try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(nil) ;

        InputVar.Fields := 'item/职务名称/200,rkey/ID/50';
        InputVar.Sqlstr := 'select  item,rkey  from datadetail where dictid=2  ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          edt_rank.text:=frmPick_Item_Single.adsPick.fieldbyname('item').asstring;
          edt_rank.tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
        end;

  finally
   frmPick_Item_Single.Free;

  end;
end;

//保存
procedure TFrmAdd.btn_alt1Click(Sender: TObject);
var
  ssql,err:string;
  Rkey:integer;
begin
  //
    if  cbb_type.Text=''  then
    begin
    ShowMessage('异动类型不能为空！');
    exit;
    end;

    if Trim(dbedt_DormiGrade.Text) <> '' then
    begin

    end;

 //更换工号时一次只能更新一个：
 if (Trim(edt_code.Text)<>'') and (qry_Add.RecordCount>1 ) then
 begin
  ShowMessage('更新工号一次只能更换一个人！！');
 exit;
 end;


  //内容无变更的不能save:
  if (Trim(Self.dbt_dept.Text)=trim(edt_dept.Text)) and  (Trim(Self.dbt_OEmpCode.Text)=trim(edt_code.Text)) and
  (Trim(Self.dbt_posit.Text)=trim(edt_Posit.Text)) and (Trim(Self.dbt_rank.Text)=trim(edt_rank.Text)) and
   (Trim(Self.dbt_emp.Text)=trim(cbb_emp.Text)) and (Trim(Self.dbedtstationitem.Text)=trim(edt_starLevel.Text))  then
   begin
    ShowMessage('当前没有任何变更，请检查！');
    Exit;
   end;
  //

  if not qry_save.Active  then qry_save.Open;
  qry_Add.First;

  try
    if not DM.con1.InTransaction then dm.con1.BeginTrans;
   while not qry_Add.Eof do
    begin
       if qry_Add.fieldbyname('employeecode').asstring=''  then
     begin
      ShowMessage('工号不能为空！');
     exit;
     end;

   //看当前员工有无未生效的异动；

    ssql:=' select rkey from employee_alteration  where orginal_employeecode='''+qry_add.fieldbyname('employeecode').asstring+'''  and active=0 ';
     err:=openqry(ssql);
     if err=''  then
     begin
     if not dm.qrytemp.IsEmpty then
     begin
      ShowMessage('员工：'''+qry_add.fieldbyname('employeecode').asstring+ qry_add.fieldbyname('chinesename').asstring+'''还有未审核的异动，请先审核！');
     exit;
     end;
     end
     else
     begin
     ShowMessage(err);
     Exit;
     end;


     //  不能重复录入异动；  //20170904
//
//    ssql:=' select rkey from employee_alteration  where orginal_employeecode='''+qry_add.fieldbyname('employeecode').asstring+''' and  alterdate ';
//     err:=openqry(ssql);
//     if err=''  then
//     begin
//     if not dm.qrytemp.IsEmpty then
//     begin
//      ShowMessage('员工：'''+qry_add.fieldbyname('employeecode').asstring+ qry_add.fieldbyname('chinesename').asstring+'''还有未审核的异动，请先审核！');
//     exit;
//     end;
//     end
//     else
//     begin
//     ShowMessage(err);
//     Exit;
//     end;



       //开始保存：
    with qry_save do
    begin
      qry_save.Append;
      qry_save.FieldByName('active').value:=0;
      qry_save.FieldByName('type').value:=integer(cbb_type.Items.Objects[cbb_type.ItemIndex]);



    // if Trim(edt_code.Text)<>''  then
   //  begin
      ssql:=' select rkey from  employeemsg where  employeecode='''+qry_add.fieldbyname('employeecode').asstring+''' ';
      qry_save.FieldByName('employeeid').value:= self.GetOne('rkey',ssql);
     // end;

     qry_save.FieldByName('alterDate').AsDateTime:= strtodate(FormatDateTime('yyyy-mm-dd',dtp_alterdate.date));
     qry_save.FieldByName('remark').value:= Trim(self.Memo2.Text);
     qry_save.FieldByName('oper_date').AsDateTime:= now ;// strtodate(FormatDateTime('yyyy-mm-dd',now));
     qry_save.FieldByName('oper_person').value:= common.user_ptr;

     qry_save.FieldByName('orginal_employeecode').value:=Trim(dbt_OEmpCode.text);


     if trim(edt_code.text)<>'' then
      qry_save.FieldByName('new_employeecode').value:=Trim(edt_code.text);


      // 宿舍等级
       //qry_save.FieldByName('orginal_star').value:=Trim(dbedt_DormiGrade.text);
       if   dbedt_DormiGrade.text<>''  then
       begin
       ssql:='select rkey from  datadetail  where item='''+dbedt_DormiGrade.text+'''';
       qry_save.FieldByName('orginal_star').value:=self.GetOne('rkey',ssql);
       end;

      if trim(cbb_DormiDegrad.text)<>'' then
       qry_save.FieldByName('new_star').value:=integer(cbb_DormiDegrad.Items.Objects[cbb_DormiDegrad.ItemIndex]);
      // 宿舍等级end

      
       
     if   dbt_dept.text<>''  then 
     begin
     ssql:='select rkey from  datadepartment  where departmentname='''+dbt_dept.text+'''';
     qry_save.FieldByName('orginal_departmentid').value:=self.GetOne('rkey',ssql);
     end;

     if trim(edt_dept.text)<>'' then
      qry_save.FieldByName('new_departmentid').value:=IntToStr(edt_dept.Tag);


      if dbt_posit.text<>''  then
      begin
      ssql:='select rkey from  datadetail  where item='''+dbt_posit.text+'''';
       qry_save.FieldByName('orginal_position').value:=self.GetOne('rkey',ssql);
      end;
     if trim(edt_Posit.text)<>'' then
      qry_save.FieldByName('new_position').value:=IntToStr(edt_Posit.Tag);

      if   dbt_rank.text<>'' then
      begin
       ssql:='select rkey from  datadetail  where item='''+dbt_rank.text+'''';
      qry_save.FieldByName('orginal_rank').value:=self.GetOne('rkey',ssql);
      end;

     if trim(edt_rank.text)<>'' then
     qry_save.FieldByName('new_rank').value:=IntToStr(edt_rank.Tag);

     if  dbt_emp.text<>''  then
     begin
     ssql:='select rkey from  datadetail  where item='''+dbt_emp.text+'''';
     qry_save.FieldByName('orginal_employ_type').value:=self.GetOne('rkey',ssql);
     end;
     if cbb_emp.text<>'' then
      qry_save.FieldByName('new_employ_type').value:=Integer(cbb_emp.Items.Objects[cbb_emp.ItemIndex]);

      if trim(edt_starLevel.text)<>'' then
      begin
        if trim(dbedtstationitem.Text)<>''  then
         begin
            ssql:='select rkey from  datadetail  where item='''+dbedtstationitem.text+'''';
         qry_save.FieldByName('orginal_station').value:=self.GetOne('rkey',ssql);
         end;
      if  trim(edt_starLevel.text)<>'' then
      qry_save.FieldByName('new_station').value:=edt_starLevel.tag;
      end;

      //20170908 TCX
      //旧 --是否关键岗位：
      if trim(dbedtOldIsKeyP.text)<>'' then
      begin
      if trim(dbedtOldIsKeyP.text)='1' then
      qry_save.FieldByName('OldIsKeyP').value:=1
      else
      qry_save.FieldByName('OldIsKeyP').value:=0;
      end;


      //新--是否关键岗位： dbedtNewIsKeyP
      if trim(cbb_NewIsKeyP.text)<>'' then
      begin
      if trim(cbb_NewIsKeyP.text)='是'  then 
      qry_save.FieldByName('NewIsKeyP').value:=1
      else
      qry_save.FieldByName('NewIsKeyP').value:=0;
      end;
      
    /////////////////////////  
    //旧关键岗位：
     if  trim(dbedtOldKeyPID.text)<>''  then
     begin
     ssql:='select rkey from  hr_keyposition  where positionname='''+trim(dbedtOldKeyPID.text)+'''';
     qry_save.FieldByName('OldKeyPID').value:=self.GetOne('rkey',ssql);
     end;

    //新--- 关键岗位：
     if  trim(edt_NewKeyPID.text)<>''  then
     begin
     ssql:='select rkey from  hr_keyposition  where positionname='''+trim(edt_NewKeyPID.text)+'''';
     qry_save.FieldByName('NewKeyPID').value:=self.GetOne('rkey',ssql);
     end;

      if Trim(dbedtGrade.Text) <> '' then
      begin
       ssql:='select rkey from  datadetail  where item ='''+trim(dbedtGrade.text)+'''';
       qry_save.FieldByName('OldPGrade').value:=self.GetOne('rkey',ssql);
      end;
      if Trim(edtGrade.Text) <> '' then
      begin
       qry_save.FieldByName('NewPGrade').value:= edtGrade.Tag;
      end;

       qry_save.Post;
    end;

     qry_add.Next;
   end;
  qry_save.UpdateBatch(arall);

    Rkey:=qry_save.FieldByName('rkey').asinteger;
    frmchange.qry_main.Requery; 
    frmchange.qry_main.Locate('rkey',Rkey,[]);

    dm.con1.CommitTrans;
    close;
  except on  e:Exception do
  begin
  ShowMessage('错误：'+e.Message);
  dm.con1.RollbackTrans;
  exit;
  end;
  end;




end;

procedure TFrmAdd.btn_DelClick(Sender: TObject);
begin
if qry_Add.IsEmpty then exit;
qry_Add.Delete;

end;

procedure TFrmAdd.bbt_cnlClick(Sender: TObject);
begin
  qry_Add.CancelBatch(arall);
   close;
end;

procedure TFrmAdd.btn2Click(Sender: TObject);
  var
     InputVar:PDlginput;
 begin
   try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(nil) ;

        InputVar.Fields := 'item/岗位名称/200,rkey/ID/50';
        InputVar.Sqlstr := 'select  item,rkey  from datadetail where dictid=16  ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          edt_starLevel.text:=frmPick_Item_Single.adsPick.fieldbyname('item').asstring;
          edt_starLevel.tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
        end;

  finally
   frmPick_Item_Single.Free;

  end;

end;

procedure TFrmAdd.SpeedButton1Click(Sender: TObject);
var
  Lfrm:TfrmSelKeyP ;
begin
   Lfrm:=TfrmSelKeyP.create(self);
   Lfrm.PEmployeeid:= qry_add.fieldbyname('employeeid').Value;
   //Lfrm.PWYear:=qry_add.fieldbyname('WYear').Value ;
   Lfrm.PDeptid:= qry_add.fieldbyname('departmentid').Value ;
   LFrm.edt_WYear.Text:=qry_add.fieldbyname('WYear').asstring ;

   try
   if Lfrm.ShowModal=mrok then
   begin
    edt_NewKeyPID.Text:=Lfrm.edt_KeyP.Text;
    edt_NewKeyPID.Tag:=Lfrm.edt_KeyP.Tag;
   end;
   finally
     Lfrm.free;
   end;  
end;

procedure TFrmAdd.btnGradeClick(Sender: TObject);
var
  InputVar: PDlginput;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);

    InputVar.Fields := 'item/职等级别/40,rkey/备注/300';
    InputVar.Sqlstr := 'select datadetail.rkey,datadetail.item,datadetail.Memo '+#13+
                       ' from datadetail  '+#13+
                       '   inner join datadict on datadict.rkey = datadetail.dictid   '+#13+
                       ' where datadict.item = ''职等''';
    InputVar.AdoConn := dm.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edtGrade.text := frmPick_Item_Single.adsPick.fieldbyname('item').asstring;
      edtGrade.tag := frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
    end;

  finally
    frmPick_Item_Single.Free;

  end;
end;

end.
