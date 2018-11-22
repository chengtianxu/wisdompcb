unit WorkLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MC_unt,  Menus, ppEndUsr, ppBands, ppPrnabl, ppClass,
  ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  DBClient, cds, Provider, ADODB, ImgList, 
  Grids, DBGridEh, ToolWin, ComCtrls,  StdCtrls, RzPanel, ExtCtrls,
  EditBit, Buttons, Mask, RzEdit, RzBtnEdt, ButtonEdit,DateUtils,
  RzDBEdit, RzDBBnEd, DBButtonEdit, DBCtrlsEh, DBCtrls, RzButton;

type
  TWorkLog_f = class(TMC_frm)
    cdsMainUSER_FULL_NAME: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainWorkDate: TDateTimeField;
    cdsMainD073_ptr: TIntegerField;
    dtMainUSER_FULL_NAME: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainWorkDate: TDateTimeField;
    dtMainD073_ptr: TIntegerField;
    cdsChildNumber: TSmallintField;
    cdsChildD807_ptr: TIntegerField;
    cdsChildBeginDate: TStringField;
    cdsChildEndDate: TStringField;
    cdsChildDescText: TWideStringField;
    cdsChildStatus: TSmallintField;
    cdsChildAssist: TWideStringField;
    cdsChildForeDate: TDateTimeField;
    cdsChildCompleteDate: TDateTimeField;
    dtChildNumber: TWordField;
    dtChildD807_ptr: TIntegerField;
    dtChildBeginDate: TStringField;
    dtChildEndDate: TStringField;
    dtChildDescText: TWideStringField;
    dtChildStatus: TWordField;
    dtChildAssist: TWideStringField;
    dtChildForeDate: TDateTimeField;
    dtChildCompleteDate: TDateTimeField;
    cdsRead0073: TClientDataSet;
    cdsRead0073USER_FULL_NAME: TStringField;
    cdsRead0073USER_LOGIN_NAME: TStringField;
    dtMainStatus: TWordField;
    cdsMainStatus: TSmallintField;
    cdsMainv_Status: TStringField;
    cdsChildv_Status: TStringField;
    BtFind: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    btEdt_USER_LOGIN_NAME: TButtonEdit;
    RadioGroup2: TRadioGroup;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    btn2: TButton;
    bt_Expand: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edt_Number: TDBEdit;
    edt_v_Status: TDBEdit;
    edt_DescText: TDBMemo;
    edt_Assist: TDBEdit;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    DBDateTimeEditEh7: TDBDateTimeEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    edt_BeginDate: TDBEdit;
    edt_EndDate: TDBEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cdsChildNewRecord(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure cdsChildCalcFields(DataSet: TDataSet);
    procedure btn2Click(Sender: TObject);
    procedure BtFindClick(Sender: TObject);
    procedure cdsChildBeginDateChange(Sender: TField);
    procedure dsMainStateChange(Sender: TObject);
    procedure cdsChildBeforeInsert(DataSet: TDataSet);
    procedure RadioGroup2Click(Sender: TObject);
    procedure bt_ExpandClick(Sender: TObject);
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
  private
    current_date:TDate;
    procedure Set_ToolbarButtonStatus(Flag: Boolean);  override;
    function SaveBeforeCheck ():Boolean  ; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WorkLog_f: TWorkLog_f;

implementation

uses DM_unt, PublicFile;

{$R *.dfm}

function TWorkLog_f.SaveBeforeCheck():Boolean  ;
var
  strMsg,strSQL:string;
  I_Row :Integer;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
    if FieldByName('USER_FULL_NAME').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('USER_FULL_NAME').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('WorkDate').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('WorkDate').DisplayLabel+'”的值不能为空！！！'+#13 ;

    if  (FieldByName('WorkDate').IsNull =False)and(FieldByName('D073_ptr').IsNull =False) then
    if (UpdateStatus=usInserted)
         or((UpdateStatus=usModified) and ((UpperCase(FieldByName('WorkDate').NewValue)<>UpperCase(FieldByName('WorkDate').OldValue)))
           ) then
    begin
      strSQL:='select * from data0807 where WorkDate='+QuotedStr(FieldByName('WorkDate').AsString)
        +' and D073_ptr='+ FieldByName('D073_ptr').AsString  ;
      if RecordExists(strSQL,cdsRead)then
      strMsg:=strMsg+'字段：“'+FieldByName('WorkDate').DisplayLabel+'”的值“'+trim(FieldByName('WorkDate').NewValue)+'”  '
                    +'“'+FieldByName('USER_FULL_NAME').DisplayLabel+'”的值“'+trim(FieldByName('USER_FULL_NAME').Value)
          +'”已经存在！！！'+#13
    end;

  end;

  if cdsChild.State in [dsEdit ,dsInsert] then     //usModified
  cdsChild.Post;
//  if cdsChild.IsEmpty then
//    strMsg:=strMsg+'明细表至少要有一行记录！！！'+#13
//  else
  begin
    DM_frm.cdsClone.Close;
    DM_frm.cdsClone.CloneCursor(cdsChild,True);
    with DM_frm.cdsClone do
    try
      DisableControls ;
      First;
      for I_Row:=0 to RecordCount-1 do
      begin
        if FieldByName('Number').IsNull then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('Number').DisplayLabel+'”的值不能为空！！！'+#13;
        if (FieldByName('BeginDate').IsNull) then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('BeginDate').DisplayLabel+'”的值不能为空！！！'+#13
        else
          if IsEffectiveTime(FieldByName('BeginDate').AsString)=False then
             strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('BeginDate').DisplayLabel+'”的值不是有效的时间！！！'+#13 ;

        if (FieldByName('EndDate').IsNull=False )and(FieldByName('EndDate').AsString<>'') then
        if IsEffectiveTime(FieldByName('EndDate').AsString)=False then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('EndDate').DisplayLabel+'”的值不是有效的时间！！！'+#13 ;

        if (FieldByName('DescText').IsNull) then 
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('DescText').DisplayLabel+'”的值不能为空！！！'+#13;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure TWorkLog_f.Set_ToolbarButtonStatus(Flag: Boolean);
begin
  if  NeedSave then
  if (cdsMain.F_IsBatchOperating<>True)
              or(cdsChild.F_IsBatchOperating<>True) then
  begin                        //只有批处理=false 的时候，才执行按钮刷新。
    with   ActiveGridEH.DataSource.DataSet as TClientDataSet do
    begin
      tblAdd.Enabled:=(not Flag) and (StrToInt(vprev)in [2,4]);
      tblEdit.Enabled:=(not Flag) and (StrToInt(vprev)in [2,4])and(IsEmpty=False)
      and(cdsMainstatus.AsInteger = 0 )and(cdsMainD073_ptr.AsInteger=UserRKEY)and(cdsMainWorkDate.AsDateTime>=current_date);
      tblDelete.Enabled:=(not  Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])
      and(cdsMainstatus.AsInteger = 0 )and(cdsMainD073_ptr.AsInteger=UserRKEY)and(cdsMainWorkDate.AsDateTime>=current_date);
      if ActiveGridEH=DghMain then
      begin
        if cdsMain.Active then       //(cdsMain.UpdateStatus=usModified)
        if (cdsMain.ChangeCount>0)or(cdsMain.State in [dsEdit,dsInsert])    then
        begin
          tblCancel.Enabled:=True;
        end
        else
        begin
          tblCancel.Enabled:=False;
        end;
      end
      else
      if ActiveGridEH=dghChild then
      begin
        if (cdsChild.ChangeCount>0)or(cdsChild.State in [dsEdit,dsInsert])    then
        begin
          tblCancel.Enabled:=True;
        end
        else
        begin
          tblCancel.Enabled:=False;
        end;
        tblAdd.Enabled:=(not Flag) and (StrToInt(vprev)in [2,4])and(cdsMainStatus.AsInteger = 0)
        and(cdsMainD073_ptr.AsInteger=UserRKEY)and(cdsMainWorkDate.AsDateTime>=current_date);
      end;

      if ((cdsMain.State  in [dsEdit,dsInsert])or(cdsMain.ChangeCount>0))
                  or((cdsChild.State  in [dsEdit,dsInsert])or(cdsChild.ChangeCount>0))and(StrToInt(vprev)in [2,4])  then
        begin
          tblSave.Enabled:=True;
          tblfind.Enabled:=False;
          tblRefresh.Enabled:=False;
          tblExport.Enabled:=False;
          tblPrint.Enabled:= False;      //打印
          tblDesign.Enabled:=False ;      //报表设计
          tblFilter.Enabled:= False;
          bt_Expand.Enabled:=False;
        end
      else
        begin
          tblSave.Enabled:=False;
          tblfind.Enabled:= True;
          tblRefresh .Enabled:=True;
          tblExport.Enabled:=True;
          tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
          tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
          tblFilter.Enabled:= True;
          bt_Expand.Enabled:=True   and (StrToInt(vprev)in [2,4])and (cdsMain.FieldByName('Status').AsInteger=0)
          and (cdsMainD073_ptr.AsInteger = UserRKEY) ;   //提交
        end ;
    end;
    with cdsMainstatus do    //根据状态值和权限码，且本人、今天的记录，设置窗口的哪些对象可编辑。
    if (AsInteger =0)and (StrToInt(vprev) in [2,4])and(cdsMainD073_ptr.AsInteger=UserRKEY)
       and(cdsMainWorkDate.AsDateTime>=current_date) then
    begin
      SetControlsReadOnly([edt_Number,edt_BeginDate,edt_EndDate,edt_DescText,
          edt_Assist,DBDateTimeEditEh4,DBDateTimeEditEh7,DBDateTimeEditEh3,DBDateTimeEditEh1],False);
      SetColsReadOnly(DghMain,['WorkDate'],False);
      SetColsReadOnly(dghChild,['Number','BeginDate','EndDate','DescText','Assist','ForeDate','CompleteDate'],False);
      btn2.Enabled:=True and(cdsChildStatus.AsInteger=0); //"完成"按钮
      dghChild.ReadOnly := False;
    end
    else                                                  
    begin
      SetControlsReadOnly([edt_Number,edt_BeginDate,edt_EndDate,edt_DescText,
          edt_Assist,DBDateTimeEditEh4,DBDateTimeEditEh7,DBDateTimeEditEh3,DBDateTimeEditEh1]);
      SetColsReadOnly(DghMain,['WorkDate']);
      SetColsReadOnly(dghChild,['Number','BeginDate','EndDate','DescText','Assist','ForeDate','CompleteDate']);
      btn2.Enabled:=False;                                //"完成"按钮
      dghChild.ReadOnly := True;
    end;

    Set_ButtonStatus;    //数据集的状态发生更改时，重新设置右边竖工具条的状态。20141116添加
  end;
  with ActiveGridEH do
  begin
    if  DataSource.DataSet.Eof  then
    begin
    tblNext.Enabled:=False ;
    tblLast.Enabled:=False ;
    end
    else
    begin
    tblNext.Enabled:=True ;
    tblLast.Enabled:=True ;
    end;

    if  DataSource.DataSet.Bof  then
    begin
    tblPrior.Enabled:=False     ;
    tblFirst.Enabled:=False     ;
    end
    else
    begin
    tblPrior.Enabled:=True     ;
    tblFirst.Enabled:=True     ;
    end;  
  end;
end;

procedure TWorkLog_f.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ; {}

  {  DM_frm.ADOConnection1.Close;
  DM_frm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  DM_frm.ADOConnection1.Open;
  UserRKEY := 2012;
  EmplRKEY:=2995;
  vprev:='4';   }
  
  inherited;
  SetEmployeeInfo(dtRead,StatusBar1);

  cdsRead0073.Params[0].Value:= UserRKEY;
  cdsRead0073.Open;

//  Find_DisplayFields:=vararrayof(['WorkDate','USER_FULL_NAME']);
//  var_DropDown_Info:=TDropDownInfo.Create();
//  with var_DropDown_Info do
//  begin
//    L_SourceDataSet         :=cdsMain;
//    L_GridName              :=DghMain;
//    L_ColsInfo:='USER_LOGIN_NAME/用户登陆名/120,USER_FULL_NAME/用户名/120';
//    L_FindDataSet           :=cdsRead0073;
//    L_DropdownColumn        :='USER_FULL_NAME';
//    L_ListDataSetFilterField:='USER_FULL_NAME';
//    L_ListResultField       :='USER_FULL_NAME';
//    L_GetValueField         :='USER_FULL_NAME';
//  end;
//  DropDown_Info_List.Add(var_DropDown_Info) ;

  current_date := GetDataBaseDate(dtread,ADate) ;
  DateTimePicker2.Date:=current_date ;
  DateTimePicker1.Date:=DateTimePicker2.Date-7 ;
  cdsMain.Params.ParamByName('user073').Value:=UserRKEY;
  BtFindClick(nil);

  SetControlsReadOnly([edt_v_Status]);
  SetColsReadOnly(DghMain,['USER_FULL_NAME','v_Status']);
  SetColsReadOnly(dghChild,['v_Status']);
end;

procedure TWorkLog_f.cdsChildNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Status').Value        :=0;
  DataSet.FieldByName('BeginDate').Value     := TimeToStr(GetDataBaseDate(dtread));
  DataSet.FieldByName('Number').Value        := DataSet.RecordCount+1;
end;

procedure TWorkLog_f.cdsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if FieldByName('Status').AsInteger=0  then
       FieldByName('v_Status').AsString:='未提交'
    else
    if FieldByName('Status').AsInteger=1  then
       FieldByName('v_Status').AsString:='已提交' ;
  end;
end;

procedure TWorkLog_f.cdsChildCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if FieldByName('Status').AsInteger=0  then
       FieldByName('v_Status').AsString:='处理中'
    else
    if FieldByName('Status').AsInteger=1  then
       FieldByName('v_Status').AsString:='已完成' ;
  end;
end;

procedure TWorkLog_f.btn2Click(Sender: TObject);
begin
  inherited;
  with cdsChild do
  begin
    if not(State in[dsEdit,dsInsert])then
    Edit;
    if FieldByName('CompleteDate').IsNull then
    begin
      FieldByName('CompleteDate').Value:=GetDataBaseSmallDate(cdsRead);
    end;

    FieldByName('status').Value:=1;
    Post;
    SaveData;
  end;
end;

procedure TWorkLog_f.BtFindClick(Sender: TObject);
var
  str_SQL:string;
begin
  inherited;
  with cdsMain do
  begin
    if RadioGroup2.ItemIndex=0 then
      str_SQL:='and (data0073.rkey=@user073 )'
    else
    if RadioGroup2.ItemIndex=1 then
      str_SQL:='and (data0073.rkey in (select rkey73 from data0720 where ttype=1 and grpName '
          +'in (select distinct grpname from data0720 where rkey73=@user073  and ttype=0)))'
    else
    if RadioGroup2.ItemIndex=2 then
      str_SQL:='and ((data0073.rkey in (select rkey73 from data0720 where ttype=1 and grpName in  '+#13
          +'(select distinct grpname from data0720 where rkey73=@user073  and ttype=0)))or(data0073.rkey=@user073 )) ';

    if  (VarIsNull(DateTimePicker1.Date)=False)and(VarIsNull(DateTimePicker2.Date)=False) then
    begin
      F_SQLWhere:='where (data0807.WorkDate Between '+QuotedStr(DateToStr(DateTimePicker1.Date))
         +' and '+QuotedStr(DateToStr(DateTimePicker2.Date+1))+')' ;
    end;

    if btEdt_USER_LOGIN_NAME.Text<>'' then
    begin
      F_SQLWhere:= F_SQLWhere+#13+'and data0073.USER_LOGIN_NAME='+QuotedStr(btEdt_USER_LOGIN_NAME.Text);
    end
    else
      F_SQLWhere:= F_SQLWhere+#13+ str_SQL;

    Close;
    CommandText:=F_SQLSelectFrom
    +#13+F_SQLWhere
    +#13+F_SQLOrderBy;
    Open;
  end;
end;

procedure TWorkLog_f.cdsChildBeginDateChange(Sender: TField);
begin
  inherited;
  if (Sender.IsNull=False)and(Sender.AsString<>'') then
  if IsEffectiveTime(Sender.Value)=False then
  begin
    MsgError('不是有效的时间值！正确格式：13:30');
  end;
end;

procedure TWorkLog_f.dsMainStateChange(Sender: TObject);
begin
  inherited;
//  if (cdsMain.UpdateStatus=usInserted) then
//    cdsMain.FieldByName('WorkDate').ReadOnly:=false
//  else
//    cdsMain.FieldByName('WorkDate').ReadOnly:=true;
end;

procedure TWorkLog_f.cdsChildBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cdsMain.State in [dsInsert,dsEdit] then
  cdsMain.Post;
  if cdsMain.UpdateStatus= usInserted then
  if SaveBeforeCheck then
    SaveData
  else
    Abort;
end;

procedure TWorkLog_f.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  if btEdt_USER_LOGIN_NAME.Text<>''then
  btEdt_USER_LOGIN_NAME.Text:=''  ;
end;

procedure TWorkLog_f.bt_ExpandClick(Sender: TObject);
begin
  inherited;
  with cdsMain do
  begin
    if not (State in [dsEdit,dsInsert]) then
    begin
      Edit;
      FieldByName('Status').Value:=1;
      Post;
      SaveData;
    end;
  end;
end;

procedure TWorkLog_f.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Status').Value:=0;
  DataSet.FieldByName('USER_FULL_NAME').Value:=UserName;
  DataSet.FieldByName('d073_ptr').Value      :=UserRKEY;
  DataSet.FieldByName('WorkDate').Value     :=GetDataBaseDate(dtread,ADate);
end;

procedure TWorkLog_f.Button2Click(Sender: TObject);
begin
  inherited;
  with cdsMain do
  begin
    if not (State in [dsEdit,dsInsert]) then
    begin
      Edit;
      FieldByName('Status').Value:=0;
      Post;
      SaveData;
    end;
  end;
end;

end.
