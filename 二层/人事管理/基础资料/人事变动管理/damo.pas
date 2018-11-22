unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider,Variants,Dialogs;

type
  TDM = class(TDataModule)
    cn_change: TADOConnection;
    qry_info: TADOQuery;
    ds_info: TDataSource;
    qry_msg: TADOQuery;
    qry_detail: TADOQuery;
    ds_detail: TDataSource;
    qryUpdateBD: TADOQuery;
    atncfld_inforkey: TAutoIncField;
    intgrfld_infoemployeeid: TIntegerField;
    intgrfld_infotype: TIntegerField;
    intgrfld_inforeason: TIntegerField;
    dtmfld_infoalterdate: TDateTimeField;
    wdstrngfld_infoorginal_employeecode: TWideStringField;
    intgrfld_infoorginal_departmentid: TIntegerField;
    intgrfld_infoorginal_position: TIntegerField;
    intgrfld_infoorginal_employ_type: TIntegerField;
    intgrfld_infoorginal_politics_face: TIntegerField;
    intgrfld_infoorginal_education: TIntegerField;
    intgrfld_infoorginal_marriage: TIntegerField;
    intgrfld_infoorginal_rank: TIntegerField;
    wdstrngfld_infonew_employeecode: TWideStringField;
    intgrfld_infonew_departmentid: TIntegerField;
    intgrfld_infonew_position: TIntegerField;
    intgrfld_infonew_employ_type: TIntegerField;
    intgrfld_infonew_politics_face: TIntegerField;
    intgrfld_infonew_education: TIntegerField;
    intgrfld_infonew_marriage: TIntegerField;
    intgrfld_infonew_rank: TIntegerField;
    dtmfld_infooper_date: TDateTimeField;
    intgrfld_infoactive: TIntegerField;
    wdstrngfld_infochinesename: TWideStringField;
    wdstrngfld_infoemployeecode: TWideStringField;
    dtmfld_infoondutytime: TDateTimeField;
    intgrfld_infoemploy_type: TIntegerField;
    intgrfld_infosex: TIntegerField;
    dtmfld_infooutdutytime: TDateTimeField;
    wdstrngfld_inforreason: TWideStringField;
    wdstrngfld_infottype: TWideStringField;
    wdstrngfld_infopposition: TWideStringField;
    intgrfld_infodictid: TIntegerField;
    wdstrngfld_infonposition: TWideStringField;
    wdstrngfld_infooposition: TWideStringField;
    wdstrngfld_infonhtype: TWideStringField;
    wdstrngfld_infoohtype: TWideStringField;
    wdstrngfld_infophtype: TWideStringField;
    wdstrngfld_infodepartmentname: TWideStringField;
    wdstrngfld_infondepartmentname: TWideStringField;
    wdstrngfld_infoodepartmentname: TWideStringField;
    qry_infosexy: TStringField;
    qryTemp: TADOQuery;
    qry_infoemployee_name: TStringField;
    qry_infoorank: TStringField;
    qry_infonrank: TStringField;
    qry_inforank: TStringField;
    qry_inforemark: TWideStringField;
    qry_infoorginal_star: TIntegerField;
    qry_infonew_star: TIntegerField;
    qry_Employee_Train: TADOQuery;
    qry_Employee_Trainrkey: TAutoIncField;
    qry_Employee_TrainTrain_NO: TStringField;
    qry_Employee_TrainTrain_topics: TWideStringField;
    qry_Employee_Trainstartdate: TDateTimeField;
    qry_Employee_Trainenddate: TDateTimeField;
    qry_Employee_TrainTeacher: TWideStringField;
    qry_Employee_TrainTrain_place: TWideStringField;
    qry_Employee_TrainTrain_grade: TWideStringField;
    qry_Employee_TrainTrain_result: TWideStringField;
    qry_Employee_TrainTrain_content: TWideStringField;
    qry_Employee_TrainTrain_status: TIntegerField;
    qry_infoTrain_NO: TStringField;
    qry_infoemployee_train_flag: TBooleanField;
    dsp_alt: TDataSetProvider;
    cds_alt: TClientDataSet;
    dt_alt: TADODataSet;
    ds_alt: TDataSource;
    cds_altdepartmentname: TWideStringField;
    cds_altchinesename: TWideStringField;
    cds_altemployeecode: TWideStringField;
    cds_altondutytime: TDateTimeField;
    cds_altemployee_train_flag: TBooleanField;
    cds_altorginal_star: TIntegerField;
    cds_altnew_star: TIntegerField;
    cds_altstatus: TSmallintField;
    cds_altrankname: TWideStringField;
    cds_altrank: TIntegerField;
    cds_altsexy: TStringField;
    cds_altoutdutytime: TDateTimeField;
    cds_altprovince: TWideStringField;
    cds_altIDCard: TWideStringField;
    cds_altdepartmentid: TIntegerField;
    cds_altpposition: TWideStringField;
    cds_altemploy_type: TWideStringField;
    cds_altposition: TIntegerField;
    cds_altstarLevel: TIntegerField;
    cds_altrkey: TAutoIncField;
    cds_altemployeeid: TIntegerField;
    cds_alttype: TIntegerField;
    cds_altreason: TIntegerField;
    cds_altalterdate: TDateTimeField;
    cds_altorginal_employeecode: TWideStringField;
    cds_altorginal_departmentid: TIntegerField;
    cds_altorginal_position: TIntegerField;
    cds_altorginal_employ_type: TIntegerField;
    cds_altorginal_politics_face: TIntegerField;
    cds_altorginal_education: TIntegerField;
    cds_altorginal_marriage: TIntegerField;
    cds_altorginal_rank: TIntegerField;
    cds_altorginal_accountid: TIntegerField;
    cds_altnew_employeecode: TWideStringField;
    cds_altnew_departmentid: TIntegerField;
    cds_altnew_position: TIntegerField;
    cds_altnew_employ_type: TIntegerField;
    cds_altnew_politics_face: TIntegerField;
    cds_altnew_education: TIntegerField;
    cds_altnew_marriage: TIntegerField;
    cds_altnew_rank: TIntegerField;
    cds_altnew_accountid: TIntegerField;
    cds_altoper_person: TIntegerField;
    cds_altoper_date: TDateTimeField;
    cds_altactive: TIntegerField;
    cds_altremark: TWideStringField;
    cds_altorginal_ondutytime: TWideStringField;
    cds_altorginal_outdutytime: TWideStringField;
    cds_altemployee_train_ptr: TIntegerField;
    cds_altTrain_NO: TStringField;
    cds_altTrain_topics: TWideStringField;
    dt_altemployeecode: TWideStringField;
    dt_altchinesename: TWideStringField;
    dt_altTrain_NO: TStringField;
    dt_altTrain_topics: TWideStringField;
    dt_altstatus: TWordField;
    dt_altrankname: TWideStringField;
    dt_altrank: TIntegerField;
    dt_altsexy: TStringField;
    dt_altondutytime: TDateTimeField;
    dt_altoutdutytime: TDateTimeField;
    dt_altprovince: TWideStringField;
    dt_altIDCard: TWideStringField;
    dt_altdepartmentid: TIntegerField;
    dt_altpposition: TWideStringField;
    dt_altemploy_type: TWideStringField;
    dt_altdepartmentname: TWideStringField;
    dt_altposition: TIntegerField;
    dt_altstarLevel: TIntegerField;
    dt_altrkey: TAutoIncField;
    dt_altemployeeid: TIntegerField;
    dt_alttype: TIntegerField;
    dt_altreason: TIntegerField;
    dt_altalterdate: TDateTimeField;
    dt_altorginal_employeecode: TWideStringField;
    dt_altorginal_departmentid: TIntegerField;
    dt_altorginal_position: TIntegerField;
    dt_altorginal_employ_type: TIntegerField;
    dt_altorginal_politics_face: TIntegerField;
    dt_altorginal_education: TIntegerField;
    dt_altorginal_marriage: TIntegerField;
    dt_altorginal_rank: TIntegerField;
    dt_altorginal_accountid: TIntegerField;
    dt_altnew_employeecode: TWideStringField;
    dt_altnew_departmentid: TIntegerField;
    dt_altnew_position: TIntegerField;
    dt_altnew_employ_type: TIntegerField;
    dt_altnew_politics_face: TIntegerField;
    dt_altnew_education: TIntegerField;
    dt_altnew_marriage: TIntegerField;
    dt_altnew_rank: TIntegerField;
    dt_altnew_accountid: TIntegerField;
    dt_altoper_person: TIntegerField;
    dt_altoper_date: TDateTimeField;
    dt_altactive: TIntegerField;
    dt_altremark: TWideStringField;
    dt_altorginal_ondutytime: TWideStringField;
    dt_altorginal_outdutytime: TWideStringField;
    dt_altemployee_train_ptr: TIntegerField;
    dt_altemployee_train_flag: TBooleanField;
    dt_altorginal_star: TIntegerField;
    dt_altnew_star: TIntegerField;
    cdsTemp: TClientDataSet;
    dt_temp: TADODataSet;
    dt_altEMPLOYEE_NAME: TStringField;
    cds_altEMPLOYEE_NAME: TStringField;
    qry_infooper_person: TIntegerField;
    qry_infoorginal_ondutytime: TWideStringField;
    qry_infoorginal_outdutytime: TWideStringField;
    qry_infoemployee_train_ptr: TIntegerField;
    qry_infoorginal_accountid: TIntegerField;
    qry_infonew_accountid: TIntegerField;
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
    qry_infostarLevel: TIntegerField;
    qry_dept: TADOQuery;
    qry_detailrkey: TIntegerField;
    qry_detaildictid: TIntegerField;
    qry_detailitem: TWideStringField;
    qry_detailMemo: TWideStringField;
    dt_alttrain_flag: TBooleanField;
    cds_alttrain_flag: TBooleanField;
    qry_msgtrain_flag: TBooleanField;
    qry_detailtrain_flag: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_infoAfterScroll(DataSet: TDataSet);
    procedure intgrfld_infoactiveGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cds_altemployeecodeChange(Sender: TField);
    procedure cds_altAfterInsert(DataSet: TDataSet);
    procedure cds_altemployee_train_flagChange(Sender: TField);
    procedure cds_altAfterScroll(DataSet: TDataSet);
    procedure cds_altTrain_NOChange(Sender: TField);
    procedure dsp_altGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cds_altBeforePost(DataSet: TDataSet);
    procedure dsp_altAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure cds_altReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }

  public
    { Public declarations }
    AUTag: Integer;
    FZTime: TDateTime;
  end;

var
  DM: TDM;
  base:string; //离职标记


implementation

uses main,common, Madd;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  base:='dictid=9';
end;

procedure TDM.qry_infoAfterScroll(DataSet: TDataSet);
begin

  with DataSet do
  fm_main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
end;

procedure TDM.intgrfld_infoactiveGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.Value=0 then
    Text:='未生效'
  else
  if Sender.Value=1 then
    Text:='已生效' ;
end;

procedure TDM.cds_altemployeecodeChange(Sender: TField);
begin
//  if Sender.DataSet.FieldByName('Train_NO').ReadOnly=False then
  if Sender.DataSet.FieldByName('Train_NO').IsNull=False then
    Sender.DataSet.FieldByName('Train_NO').Value:=null;
//  if Sender.DataSet.FieldByName('employee_train_flag').ReadOnly=False then
    Sender.DataSet.FieldByName('employee_train_flag').Value:=False;
  with DM.qry_msg do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      Sender.DataSet.FieldByName('employeeid').Value     := null;
      Sender.DataSet.FieldByName('departmentname').Value := null;
      Sender.DataSet.FieldByName('departmentid').Value   := null;
      Sender.DataSet.FieldByName('chinesename').Value    := null;
      Sender.DataSet.FieldByName('sexy').Value           := null;
      Sender.DataSet.FieldByName('ondutytime').Value     := null;
      Sender.DataSet.FieldByName('pposition').Value      := null;
      Sender.DataSet.FieldByName('rankname').Value       := null;
      Sender.DataSet.FieldByName('province').Value       := null;
      Sender.DataSet.FieldByName('employ_type').Value    := null;
      Sender.DataSet.FieldByName('idcard').Value         := null;
      Sender.DataSet.FieldByName('position').Value       := null;
      Sender.DataSet.FieldByName('rank').Value           := null;
      Sender.DataSet.FieldByName('employ_type').Value    := null;
      Sender.DataSet.FieldByName('train_flag').Value     := null;
     // Sender.DataSet.FieldByName('Train_NO').Value       := null;
     // Sender.DataSet.FieldByName('employ_type').Value    := null;
    end
    else
    begin
      if Locate('employeecode',Sender.Value,[loCaseInsensitive]) then
        begin
          Sender.DataSet.FieldByName('employeeid').Value     := FieldByName('rkey').Value ;
          Sender.DataSet.FieldByName('departmentname').Value :=FieldByName('departmentname').Value;
          Sender.DataSet.FieldByName('departmentid').Value   :=FieldByName('departmentid').Value;
          Sender.DataSet.FieldByName('chinesename').Value    :=FieldByName('chinesename').Value;
          Sender.DataSet.FieldByName('sexy').Value           :=FieldByName('sexy').Value;
          Sender.DataSet.FieldByName('ondutytime').Value     :=FieldByName('ondutytime').Value;
          Sender.DataSet.FieldByName('pposition').Value      :=FieldByName('pposition').Value;
          Sender.DataSet.FieldByName('rankname').Value       :=FieldByName('rankname').Value;
          Sender.DataSet.FieldByName('province').Value       :=FieldByName('province').Value;
          Sender.DataSet.FieldByName('employ_type').Value    :=FieldByName('employ_type').Value;
          Sender.DataSet.FieldByName('idcard').Value         :=FieldByName('idcard').Value;
          Sender.DataSet.FieldByName('starLevel').Value      :=FieldByName('starLevel').Value;
          Sender.DataSet.FieldByName('position').Value       :=FieldByName('position').Value;
          Sender.DataSet.FieldByName('rank').Value           :=FieldByName('rank').Value;
          Sender.DataSet.FieldByName('employ_type').Value    :=FieldByName('employ_type').Value;
          Sender.DataSet.FieldByName('train_flag').Value     :=FieldByName('train_flag').Value;
          if Trim(fm_madd.cbb_type.Text)<> '' then
          if   FieldByName('train_flag').AsBoolean then
          begin
            with DM.qry_detail do
            begin
              if Filtered then
                Filtered:=False;
              Locate('rkey',integer(fm_madd.cbb_type.Items.Objects[fm_madd.cbb_type.ItemIndex]),[]);
              if FieldByName('train_flag').AsBoolean then
              begin
                Sender.DataSet.Edit;
                Sender.DataSet.FieldByName('employee_train_flag').Value:=True;
                Sender.DataSet.Post;
              end;
            end;
          end
          else
          if cds_alt.state =dsEdit then
          if cds_altemployee_train_flag.AsBoolean then
          begin
            cds_altemployee_train_flag.AsBoolean:=False;
          end;
      //    Sender.DataSet.FieldByName('Train_NO').Value       := null;
          qry_Employee_Train.Close;
          qry_Employee_Train.Parameters.ParamByName('vEmployeeid').Value:=cds_alt.FieldByName('employeeid').AsInteger;
        end
      else
        begin
          Sender.DataSet.FieldByName('employeeid').Value     := null;
          Sender.DataSet.FieldByName('departmentname').Value := null;
          Sender.DataSet.FieldByName('departmentid').Value   := null;
          Sender.DataSet.FieldByName('chinesename').Value    := null;
          Sender.DataSet.FieldByName('sexy').Value           := null;
          Sender.DataSet.FieldByName('ondutytime').Value     := null;
          Sender.DataSet.FieldByName('pposition').Value      := null;
          Sender.DataSet.FieldByName('rankname').Value       := null;
          Sender.DataSet.FieldByName('province').Value       := null;
          Sender.DataSet.FieldByName('employ_type').Value    := null;
          Sender.DataSet.FieldByName('idcard').Value         := null;
          Sender.DataSet.FieldByName('position').Value       := null;
          Sender.DataSet.FieldByName('rank').Value           := null;
          Sender.DataSet.FieldByName('employ_type').Value    := null;
          Sender.DataSet.FieldByName('train_flag').Value     := null;
        //  Sender.DataSet.FieldByName('Train_NO').Value       := null;
         // ShowMessage('员工代码不存在！！！');
        end;
    end;
  end;
//  if  (Sender.DataSet.FieldByName('Train_NO').isnull=false)and(Sender.DataSet.FieldByName('Train_NO').AsString<>'') then
 

end;

procedure TDM.cds_altAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('employee_train_flag').Value:=False;
//  DataSet.FieldByName('oper_person').Value:=user_ptr;
 // ShowMessage(DataSet.FieldByName('oper_person').AsString);
//  DataSet.FieldByName('EMPLOYEE_NAME').Value:=vEmployee_name;
end;

procedure TDM.cds_altemployee_train_flagChange(Sender: TField);
begin
  if Sender.AsBoolean then
  //  fm_madd.DBGridEh1.FieldColumns['Train_NO'].ReadOnly:=false
    cds_altTrain_NO.ReadOnly:=False
  else
    begin
    //  fm_madd.DBGridEh1.FieldColumns['Train_NO'].ReadOnly:= True;
      if  cds_altTrain_NO.IsNull=False then
      cds_alt.FieldByName('Train_NO') .Value:=null;
      cds_altTrain_NO.ReadOnly:=True;
    end;
    
end;

procedure TDM.cds_altAfterScroll(DataSet: TDataSet);
begin
  if DataSet.FieldByName('employee_train_flag').AsBoolean then
   // fm_madd.DBGridEh1.FieldColumns['Train_NO'].ReadOnly:=false
    cds_altTrain_NO.ReadOnly:=False
  else
   // fm_madd.DBGridEh1.FieldColumns['Train_NO'].ReadOnly:= True;
    cds_altTrain_NO.ReadOnly:=True;

  qry_Employee_Train.Close;
  qry_Employee_Train.Parameters.ParamByName('vEmployeeid').Value:=cds_alt.FieldByName('employeeid').AsInteger;
end;

procedure TDM.cds_altTrain_NOChange(Sender: TField);
begin
  with DM.qry_Employee_Train do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      Sender.DataSet.FieldByName('employee_train_ptr').Value := null;
      Sender.DataSet.FieldByName('Train_topics').Value       := null;
    end
    else
    begin
      if Locate('Train_NO',Sender.Value,[loCaseInsensitive]) then
        begin
          Sender.DataSet.FieldByName('employee_train_ptr').Value  := FieldByName('rkey').Value ;
          Sender.DataSet.FieldByName('Train_topics').Value        := FieldByName('Train_topics').Value ;

        end
      else
        begin
          Sender.DataSet.FieldByName('employee_train_ptr').Value := null;
          Sender.DataSet.FieldByName('Train_topics').Value       := null;
         // ShowMessage('员工代码不存在！！！');
        end;
    end;
  end;
end;

procedure TDM.dsp_altGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
   TableName:='employee_alteration';
end;

procedure TDM.cds_altBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('employeeid').IsNull=False then
  begin
    cdsTemp.CloneCursor(DM.cds_alt,False);
    with  cdsTemp do
    begin
      First;
      while not Eof do
      begin
        if (DataSet.FieldByName('employeeid').Value=FieldByName('employeeid').Value)
          and(DataSet.RecNo<>RecNo)  then
        begin
          //ShowMessage(IntToStr(DataSet.RecNo)+':'+ IntToStr(RecNo ));
          ShowMessage('工号的值不允许重复！！！');
          Abort;
        end;
        Next; 
      end;
    end;
  end;
end;

procedure TDM.dsp_altAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
     with DM.dt_temp  do
     begin
       Close;
       CommandText:='select @@identity';
       Open;
       DeltaDS.FieldByName('rkey').ReadOnly:=False;
       DeltaDS.FieldByName('rkey').NewValue:=DM.dt_temp .Fields[0].Value;
       Close;
     end;
  end;
end;

procedure TDM.cds_altReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

end.
