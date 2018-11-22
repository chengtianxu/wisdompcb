unit PasAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,ADODB;

type
  TfrmAdd = class(TForm)
    pnl1: TPanel;
    btnSave: TBitBtn;
    btnExit: TBitBtn;
    pnl2: TPanel;
    lbName: TLabel;
    edtName: TEdit;
    edtCode: TEdit;
    lbCode: TLabel;
    lbTeacher: TLabel;
    lbPlace: TLabel;
    lbGrade: TLabel;
    lbResult: TLabel;
    lbContent: TLabel;
    edtTeacher: TEdit;
    edtPlace: TEdit;
    edtGrade: TEdit;
    edtResult: TEdit;
    memoContent: TMemo;
    lbBegin: TLabel;
    lbEnd: TLabel;
    lbTime: TLabel;
    lbType: TLabel;
    lbFeel: TLabel;
    lbEffectdate: TLabel;
    btnSearch: TBitBtn;
    edtTime: TEdit;
    cbbType: TComboBox;
    edtFeel: TEdit;
    dtpkEffectdate: TDateTimePicker;
    lbStatus: TLabel;
    rgStatus: TRadioGroup;
    dtpkBeginDate: TDateTimePicker;
    dtpkBeginTime: TDateTimePicker;
    dtpkEndDate: TDateTimePicker;
    dtpkEndTime: TDateTimePicker;
    lbPayed: TLabel;
    cbbPayed: TComboBox;
    Label1: TLabel;
    btnStart: TBitBtn;
    btnEnd: TBitBtn;
    lbempno: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    edtKey: TEdit;
    btn1: TBitBtn;
    edtTopic: TComboBox;
    lbldept: TLabel;
    Label4: TLabel;
    edt_tc: TEdit;
    btn_SelClass: TBitBtn;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtGradeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpkBeginTimeExit(Sender: TObject);
    procedure edtFeelExit(Sender: TObject);
    procedure edtGradeExit(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure dtpkEffectdateExit(Sender: TObject);
    procedure cbbTypeChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn_SelClassClick(Sender: TObject);
  private
    outSelRkey,inSelRkey,inbeginSelRkey,inendSelRkey:string;
    beginrkey,endrkey,deptid,PostID:Integer;
      iday:TDateTime;
//    obeginRkey,oendRkey:string;
    { Private declarations }
     procedure updatedb(adoTmp:TADOQuery);
     procedure LoadItem(keyid:Integer);
  public
    { Public declarations }
    selStart,selRkey:Integer;
  end;

var
  frmAdd: TfrmAdd;

implementation

uses DAMO,common,DateUtils,Pick_Item_Single,ConstVar,StrUtils, PasSelTime;

{$R *.dfm}

procedure TfrmAdd.FormShow(Sender: TObject);
var
  i:Integer;
begin
  outSelRkey:='-1';
  inSelRkey:='-1';
  beginrkey:=0;
  endrkey:=0;
  lbPayed.Visible:=False;
  cbbPayed.Visible:=False;
  dtpkBeginDate.Date:=getsystem_date(DM.adoTime,1);
  iday:=dtpkBeginDate.Date;
  dtpkEndDate.Date:=dtpkBeginDate.Date;
  dtpkEffectdate.Date:=IncYear(dtpkEndDate.Date,3);
  with dm.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,item from datadetail where dictid=20 order by rkey';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        cbbType.Items.AddObject(FieldByName('item').AsString,Pointer(FieldByName('rkey').AsInteger));
        Next;
      end;
    end;
  end;

  if (selStart=2) or (selStart=3) then
  begin
    btnSearch.Enabled:=False;
    lbPayed.Visible:=true;
    cbbPayed.Visible:=True;
//    with dm.adoTmp do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Text:='select rkey,flag from employee_train_eastid where card_date = '+ QuotedStr(TimeToStr(dtpkBeginDate.Date))+' and card_time = '+ QuotedStr(TimeToStr(dtpkBeginTime.Time));
//      Open;
//      if not IsEmpty then
//      begin
//        obeginRkey:= FieldByName('rkey').AsString;
//      end;
//    end;
//    with dm.adoTmp do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Text:='select rkey,flag from employee_train_eastid where card_date = '+ QuotedStr(TimeToStr(dtpkEndDate.Date))+' and card_time = '+ QuotedStr(TimeToStr(dtpkEndTime.Time));
//      Open;
//      if not IsEmpty then
//      begin
//        oendRkey:= FieldByName('rkey').AsString;
//      end;
//    end;
//    btnStart.Enabled:=False;
//    btnEnd.Enabled:=False;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT Employee_Train.rkey, employeeid,employeemsg.chinesename, Train_NO, Train_topics, startdate, starttime, enddate,tc_ptr,postID,trainClass.ccode, '+
                'Train_time, endtime, Teacher, Train_place, Train_grade, Train_result, Train_content,departmentid, '+
                'Train_status, train_feels,actually_feels, effective_date, feels_payed, type_ptr, ptr_flag,oprate_time,keypositionid,positionname '+ #13+
                'FROM  dbo.Employee_Train inner join employeemsg on Employee_Train.employeeid=employeemsg.rkey '+#13+
                ' left join hr_KeyPosition on hr_KeyPosition.rkey =  Employee_Train.keypositionid '+#13+
                ' left join trainClass on trainClass.rkey =  Employee_Train.tc_Ptr '+#13+
                'where Employee_Train.rkey = '+ IntToStr(selRkey);
      Open;
      //add by tcx 20171127
      edt_tc.Text:=FieldByName('ccode').AsString;
      edt_tc.tag:=FieldByName('tc_ptr').AsInteger;

      edtName.Text:=FieldByName('chinesename').AsString;
      edtName.Tag:=FieldByName('employeeid').AsInteger;
      edtCode.Text:=FieldByName('Train_NO').AsString;

      edtTeacher.Text:=FieldByName('Teacher').AsString;
      edtPlace.Text:=FieldByName('Train_place').AsString;
      edtGrade.Text:=FieldByName('Train_grade').AsString;
      edtResult.Text:=FieldByName('Train_result').AsString;
      rgStatus.ItemIndex:=FieldByName('Train_status').AsInteger;
      memoContent.Lines.Text:=FieldByName('Train_content').AsString;
      dtpkBeginDate.Date:=FieldByName('startdate').AsDateTime;

      if FieldByName('starttime').AsString<>'' then dtpkBeginTime.Time:=FieldByName('starttime').AsDateTime;
      dtpkEndDate.Date:=FieldByName('enddate').AsDateTime;
      if FieldByName('endtime').AsString<>''then dtpkEndTime.Time:=FieldByName('endtime').AsDateTime;
      edtTime.Text:=FieldByName('Train_time').AsString;
      edtFeel.Text:=FieldByName('train_feels').AsString;
      if not FieldByName('feels_payed').AsBoolean then
        if iday < IncDay(FieldByName('effective_date').AsDateTime,1) then
        begin
//          ShowMessage(IntToStr((MonthsBetween(iday,IncDay(FieldByName('effective_date').AsDateTime,1))+1)));
          Edit1.Text:= IntToStr(round((MonthsBetween(iday,FieldByName('effective_date').AsDateTime)+1)/36.0*FieldByName('train_feels').AsCurrency));
        end
        else
          Edit1.Text:='0'
      else
        Edit1.Text:= FieldByName('actually_feels').AsString;
//        if FieldByName('oprate_time').AsDateTime < IncDay(FieldByName('effective_date').AsDateTime,1) then
//          Edit1.Text:= IntToStr(round((MonthsBetween(FieldByName('oprate_time').AsDateTime,IncDay(FieldByName('effective_date').AsDateTime,1))+1)/36.0*FieldByName('train_feels').AsCurrency))
//        else
//          Edit1.Text:='0';
      dtpkEffectdate.Date:=FieldByName('effective_date').AsDateTime;
      deptid:= FieldByName('departmentid').AsInteger;
      edtKey.Text:= FieldByName('positionname').AsString;
      edtKey.Tag :=FieldByName('keypositionid').AsInteger;
      if edtKey.Tag > 0 then
      begin
        btn1.Enabled:= True;
        LoadItem(edtKey.Tag);
      end;
      edtTopic.Text:=FieldByName('Train_topics').AsString;
      if FieldByName('feels_payed').AsBoolean then cbbPayed.ItemIndex:=1
      else cbbPayed.ItemIndex:=0;
      for i:=0 to cbbType.Items.Count-1 do
      begin
        if FieldByName('type_ptr').AsInteger=Integer(cbbType.Items.Objects[i]) then
        begin
          cbbType.ItemIndex:=i;
          Break;
        end;
      end;
//
//      with DM.adoTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:='select rkey from employee_train_eastid where card_time = '+ QuotedStr(TimeToStr(dtpkBeginTime.Time));
//        Open;
//        if not IsEmpty then inbeginSelRkey:= FieldByName('rkey').AsString
//        else inbeginSelRkey:='-1';
//      end;
//
//      with DM.adoTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:='select rkey from employee_train_eastid where card_time = '+ QuotedStr(TimeToStr(dtpkEndTime.Time));
//        Open;
//        if not IsEmpty then inendSelRkey:= FieldByName('rkey').AsString
//        else inendSelRkey:='-1';
//      end;
    end;
    if selStart=3 then
    begin
      pnl2.Enabled:=False;
      btnSave.Enabled:=False;
    end;
    if selStart=2 then edtName.Enabled:=False;
  end;
end;

procedure TfrmAdd.btnSaveClick(Sender: TObject);
var
  i,inttype:Integer;
begin
//  ShowMessage(IntToStr(pnl2.ControlCount));
  for i:=0 to pnl2.ControlCount-1 do              //遍历EDIT是否有空值
  begin
    if pnl2.Controls[i] is TEdit then
    begin
      if Trim((pnl2.Controls[i] as TEdit).Text)='' then
      begin
        if ((pnl2.Controls[i] as TEdit).Name<>'edtFeel') and ((pnl2.Controls[i] as TEdit).Name<>'edit1')
                 and ((pnl2.Controls[i] as TEdit).Name<>'edtKey')  and ((pnl2.Controls[i] as TEdit).Name<>'edt_tc')   then
        begin
          ShowMessage((pnl2.Controls[i] as TEdit).Hint+ '不能为空');
          Exit;
        end;
      end;
    end;
  end;
  if (Trim(cbbType.Text) = '关键岗位') and (Trim(edtKey.Text) ='') then
  begin
    ShowMessage('关键岗位不能为空');
    Exit;
  end;
  if (Trim(edtTopic.Text) = '')then
  begin
    ShowMessage('培训主题不能为空');
    Exit;
  end;
  if Trim(edtFeel.Text)='' then edtFeel.Text:='0';
  if cbbType.Text='普通' then edtFeel.Text:='0';
  if dtpkBeginDate.Date>dtpkEndDate.Date then
  begin
    ShowMessage('开始日期大于结束日期');
    exit;
  end;
  if dtpkBeginTime.Time > dtpkEndTime.Time then
  begin
    ShowMessage('开始时间大于结束时间');
    Exit;
  end;
  if cbbType.Text='' then
  begin
    ShowMessage('培训类型不能为空');
    Exit;
  end;

  try
    if selStart=1 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey from Employee_Train where employeeid='+ IntToStr(edtName.Tag)+' and Train_NO='+ QuotedStr(Trim(edtCode.Text)));
        Open;
        if not IsEmpty then
        begin
          ShowMessage('已经存在工号：'+ Trim(edtName.Text)+' 培训编号：'+ Trim(edtCode.Text)+' 的记录');
          Exit;
        end;
      end;

      DM.ADOConnection1.BeginTrans;
      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='SELECT  rkey, employeeid, Train_NO, Train_topics, startdate, starttime, enddate, Train_time, '+
                  'endtime, Teacher, Train_place, Train_grade, Train_result, Train_content, Train_status, train_feels, '+
                  'effective_date, feels_payed, employeecode, type_ptr, ptr_flag, oprate_time, oprator_ptr,KeyPositionId,tc_ptr,DeptID,PostID '+#13+
                  'FROM dbo.Employee_Train'+#13+
                  'where rkey =0 ';
        Open;
        Append;
        updatedb(DM.adoTmp);
        Post;
        UpdateBatch(arAll);
      end;

      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update employee_train_eastid set flag=1 where rkey ='+ IntToStr(beginrkey)+ ' or rkey = '+ IntToStr(endrkey);
        ExecSQL;
      end;
      dm.ADOConnection1.CommitTrans;
    end;

    if selStart=2 then
    begin
      if vprev='2' then
      begin
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select rkey from employee_train where rkey = '+IntToStr(selRkey) +' and oprator_ptr = '+ user_ptr ;
          Open;
          if IsEmpty then
          begin
            ShowMessage('非创建者不可修改培训记录');
            Exit;
          end;
        end;
      end;

      DM.ADOConnection1.BeginTrans;
      with DM.adoTmp do                                                               //编辑状态下把取消了选择的时间点重新标为可选
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update employee_train_eastid set flag=0 where rkey in ('+ inSelRkey+')';
        ExecSQL;
      end;
      
      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='SELECT  rkey, employeeid, Train_NO, Train_topics, startdate, starttime, enddate, Train_time, '+
                  'endtime, Teacher, Train_place, Train_grade, Train_result, Train_content, Train_status, train_feels, '+
                  'effective_date, feels_payed, employeecode,actually_feels, type_ptr, ptr_flag, oprate_time, oprator_ptr,KeyPositionId,tc_ptr,DeptID,PostID '+#13+
                  'FROM dbo.Employee_Train'+#13+
                  'where rkey = '+ IntToStr(selRkey);
        Open;
        Edit;
        updatedb(DM.adoTmp);
        Post;
        UpdateBatch(arAll);

        if cbbPayed.ItemIndex=1 then
        begin
          if (dtpkEffectdate.Date>getsystem_date(DM.adoTime,1)) and (edtFeel.Text<>'0') then
          begin
            with DM.adoTmp do
            begin
              Close;
              SQL.Clear;
              SQL.Text:='select rkey,item from datadetail where item like ''%负绩效%''';
              Open;
              if not IsEmpty then inttype:= FieldByName('rkey').AsInteger
              else
              begin
                ShowMessage('不存在负绩效，请联系管理员');
                Exit;
              end;

              Close;
              SQL.Clear;
              sql.Text:='insert into employee_rewards_punishment(employeeid,type,money,flag,effectdate,ModiMan,remark) values(:employeeid,:type,:money,:flag,:effectdate,:ModiMan,:remark)';
              Parameters.ParamByName('employeeid').Value:=edtName.Tag;
              Parameters.ParamByName('type').Value:=inttype;
              Parameters.ParamByName('money').Value:= Edit1.Text;
              Parameters.ParamByName('flag').Value:=1;
              Parameters.ParamByName('effectdate').Value:=FormatDateTime('yyyy-MM-dd',Now);
              Parameters.ParamByName('ModiMan').Value := StrToInt(rkey73);
              Parameters.ParamByName('remark').Value:=cbbType.Text+'培训挂帐';
              ExecSQL;
            end;
          end;
        end;
      end;
      DM.ADOConnection1.CommitTrans;

    end;
    ModalResult:=mrYes;
  except
    on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

end;

procedure TfrmAdd.updatedb(adoTmp: TADOQuery);
begin
//  strend:=FormatDateTime('hh:mm:ss',dtpkEndTime.DateTime);
//  strbegin:=FormatDateTime('hh:mm:ss',dtpkBeginTime.DateTime);
  with adoTmp do
  begin
    FieldByName('employeecode').AsString:=lbempno.Caption;
    FieldByName('employeeid').AsInteger:=edtName.Tag;

    //add by tcx 20171127
    FieldByName('tc_ptr').AsInteger:=edt_tc.tag;
    FieldByName('DeptID').AsInteger:=DeptID;
    FieldByName('PostID').AsInteger:=PostID;

    FieldByName('Train_NO').AsString:=Trim(edtCode.Text);
    FieldByName('Train_topics').AsString:=Trim(edtTopic.Text);
    FieldByName('Teacher').AsString:= Trim(edtTeacher.Text);
    FieldByName('Train_place').AsString:=Trim(edtPlace.Text);
    FieldByName('Train_grade').AsString:=Trim(edtGrade.Text);
    FieldByName('Train_result').AsString:=Trim(edtResult.Text);
    FieldByName('Train_status').AsInteger:=rgStatus.ItemIndex;
    FieldByName('startdate').AsDateTime:= StrToDate(FormatDateTime('yyyy-MM-dd',dtpkBeginDate.Date));
    FieldByName('starttime').AsString:=FormatDateTime('hh:mm:ss',dtpkBeginTime.DateTime);
    FieldByName('enddate').AsDateTime:=StrToDate(FormatDateTime('yyyy-MM-dd',dtpkEndDate.Date));
    FieldByName('endtime').AsString:=FormatDateTime('hh:mm:ss',dtpkEndTime.DateTime);
    FieldByName('Train_time').AsFloat:=StrToFloat(Trim(edtTime.Text));
    FieldByName('type_ptr').AsInteger:=Integer(cbbType.Items.Objects[cbbType.ItemIndex]);
    if cbbType.Text<>'普通' then FieldByName('train_feels').AsCurrency:=StrToCurr(Trim(edtFeel.Text))
    else FieldByName('train_feels').AsCurrency:=0;
    FieldByName('effective_date').AsDateTime:=StrToDate(FormatDateTime('yyyy-MM-dd',dtpkEffectdate.Date));
    if cbbPayed.ItemIndex = 0 then FieldByName('feels_payed').AsBoolean:=False
    else FieldByName('feels_payed').AsBoolean:=True;
    FieldByName('Train_content').AsString:= memoContent.Lines.Text;
    FieldByName('oprator_ptr').AsInteger:=StrToInt(user_ptr);
    FieldByName('oprate_time').AsDateTime:=getsystem_date(DM.adoTime,1);

    if (selStart=2) and (cbbPayed.ItemIndex=1) then FieldByName('actually_feels').AsCurrency:=StrToCurr(Trim(Edit1.Text));
    if edtKey.Tag > 0 then FieldByName('KeyPositionId').AsInteger:= edtKey.Tag;
  end;
end;

procedure TfrmAdd.edtGradeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end
  else Abort;
end;

procedure TfrmAdd.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'employeecode/工号/120,chinesename/姓名/120,departmentname/部门/160';
    InputVar.Sqlstr := 'select rkey,employeecode,chinesename,departmentid,departmentname,station from v_employeemsg where status=1 ORDER by employeecode';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtName.Text:= frmPick_Item_Single.adsPick.fieldbyname('chinesename').AsString;
      lbempno.Caption:= frmPick_Item_Single.adsPick.fieldbyname('employeecode').AsString;
      edtName.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      deptid := frmPick_Item_Single.adsPick.fieldbyname('departmentid').AsInteger;
      PostID:= frmPick_Item_Single.adsPick.fieldbyname('station').AsInteger;
      lbldept.Caption:= frmPick_Item_Single.adsPick.fieldbyname('departmentname').AsString;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmAdd.edtNameExit(Sender: TObject);
begin
  if Trim(edtName.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,employeecode from employeemsg where status=1 and chinesename = '+ QuotedStr(Trim(edtName.Text)));
      Open;
      if IsEmpty then
      begin
        ShowMessage('姓名不存在或者员工已经离职，请重新输入！');
        edtName.SetFocus;
      end
      else
      begin
        edtName.tag:= FieldByName('rkey').AsInteger;
      end;
    end;
  end;
end;

procedure TfrmAdd.edtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
    edtNameExit(nil);
    edtCode.SetFocus;
  end;
end;


procedure TfrmAdd.dtpkBeginTimeExit(Sender: TObject);
var
  hh1,hh2:Integer;
  strbegin,strend:string;
begin
//  dtpkBeginTime.Time:= EncodeTime(23,59,59,0);
//  dtpkEndTime.Time:= EncodeTime(23,59,59,0);
  strend:=FormatDateTime('hh:mm:ss',dtpkEndTime.DateTime);
  strbegin:=FormatDateTime('hh:mm:ss',dtpkBeginTime.DateTime);
  hh1:=StrToInt(LeftStr(strend,2))*60 + StrToInt(MidStr(strend,4,2));
  hh2:=StrToInt(LeftStr(strbegin,2))*60 + StrToInt(MidStr(strbegin,4,2));
//  hh1:=StrToInt(LeftStr(TimeToStr(dtpkEndTime.Time),2))*60 + StrToInt(MidStr(TimeToStr(dtpkEndTime.Time),4,2)) ;
//  hh2:=StrToInt(LeftStr(TimeToStr(dtpkBeginTime.Time),2))*60 + StrToInt(MidStr(TimeToStr(dtpkBeginTime.Time),4,2)) ;
  if hh1-hh2>=0 then edtTime.Text:=IntToStr(hh1-hh2)
  else edtTime.Text:='0';
end;

procedure TfrmAdd.edtFeelExit(Sender: TObject);
begin
  if edtFeel.Text='' then Exit;
  if (Pos('.',Trim(edtFeel.Text))=1) or (Pos('.',Trim(edtFeel.Text))=Length(Trim(edtFeel.Text))) then
  begin
    ShowMessage('培训费用格式不对');
    edtFeel.SetFocus;
    Exit;
  end ;
  if iday < IncDay(dtpkEffectdate.Date,1) then
    Edit1.Text:= IntToStr(round((MonthsBetween(iday,dtpkEffectdate.Date)+1)/36.0* StrToCurr(Trim(edtFeel.Text))))
  else
    Edit1.Text:='0';

end;

procedure TfrmAdd.edtGradeExit(Sender: TObject);
begin
//  if edtGrade.Text='' then exit;
//  if (Pos('.',Trim(edtGrade.Text))=1) or (Pos('.',Trim(edtGrade.Text))=Length(Trim(edtGrade.Text))) then
//  begin
//    ShowMessage('培训成绩格式不对');
//    edtGrade.SetFocus;
//    Exit;
//  end;
//  if not( (StrToFloat(Trim(edtGrade.Text))>=0) and ((StrToFloat(Trim(edtGrade.Text))<=100) )) then
//  begin
//    ShowMessage('培训成绩必须在0-100之间');
//    edtGrade.SetFocus;
//    Exit;
//  end;
end;

procedure TfrmAdd.btnStartClick(Sender: TObject);
var
  ipos,ileng,tpos,tleng:Integer;
  tmpstr,tmpRkey,sqlstr:string;
begin
  tmpstr:='-1';
  tmpRkey:=inSelRkey;
  if edtName.Text='' then
  begin
    ShowMessage('请先选择一个员工');
    exit;
  end;

  try
//    ShowMessage(outSelRkey);
    frmSelTime:=TfrmSelTime.Create(Application);

    with dm.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,flag from employee_train_eastid where card_time = '+ QuotedStr(TimeToStr(dtpkBeginTime.Time));
      Open;
      if not IsEmpty then
      begin
        if not FieldByName('flag').AsBoolean then
        begin
//          ShowMessage(outSelRkey);
          tmpstr:=outSelRkey;
          ipos:=Pos(FieldByName('rkey').AsString,outSelRkey);
          ileng:=Length(FieldByName('rkey').AsString);
          outSelRkey:=LeftStr(outSelRkey,ipos-1)+ RightStr(outSelRkey,Length(outSelRkey)-ipos-ileng);
        end
        else
        begin
          if Pos(FieldByName('rkey').AsString,inSelRkey)= 0 then
          begin
            inSelRkey:= FieldByName('rkey').AsString+','+ inSelRkey;
          end;
        end;
      end;

    end;

    frmSelTime.employrkey:=edtName.Tag;
    frmSelTime.expRkey:=outSelRkey;
    frmSelTime.inRkey:=inSelRkey;
    frmSelTime.traindate:=DateToStr(dtpkBeginDate.Date);
    if frmSelTime.ShowModal=mryes then
    begin
      beginrkey:=DM.adoSelTimerkey.Value;
      if not (Pos(IntToStr(beginrkey),inSelRkey)>0) then
      begin
        outSelRkey:=IntToStr(DM.adoSelTimerkey.Value) +','+ outSelRkey;
      end
      else
      begin
        tpos:=Pos(DM.adoSelTimerkey.AsString,inSelRkey);
        tleng:=Length(DM.adoSelTimerkey.AsString);
        inSelRkey:=LeftStr(inSelRkey,tpos-1)+  RightStr(inSelRkey,Length(inSelRkey)-tpos-tleng);
      end;
      dtpkBeginTime.Time:=StrToTime(DM.adoSelTimecard_time.Value);
    end
    else inSelRkey:=tmpRkey;
  finally
    frmSelTime.Free;
  end;
  dtpkBeginTimeExit(nil);
end;

procedure TfrmAdd.btnEndClick(Sender: TObject);
var
  ipos,ileng,tpos,tleng:Integer;
  tmpstr,tmpRkey,sqlstr:string;
begin
  tmpRkey:=inSelRkey;
  if edtName.Text='' then
  begin
    ShowMessage('请先选择一个员工');
    exit;
  end;
  try
    frmSelTime:=TfrmSelTime.Create(Application);
    with dm.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,flag from employee_train_eastid where card_time = '+ QuotedStr(TimeToStr(dtpkEndTime.Time));
      Open;
      if not IsEmpty then
      begin
        if not FieldByName('flag').AsBoolean then
        begin
          tmpstr:=outSelRkey;
          ipos:=Pos(FieldByName('rkey').AsString,outSelRkey);
          ileng:=Length(FieldByName('rkey').AsString);
          outSelRkey:=LeftStr(outSelRkey,ipos-1)+  RightStr(outSelRkey,Length(outSelRkey)-ipos-ileng);
        end
        else
        begin
          if Pos(FieldByName('rkey').AsString,inSelRkey)= 0 then
          begin
            inSelRkey:= FieldByName('rkey').AsString+','+ inSelRkey;
          end;
        end;
      end;
    end;

    frmSelTime.employrkey:=edtName.Tag;
    frmSelTime.expRkey:=outSelRkey;
    frmSelTime.inRkey:=inSelRkey;
    frmSelTime.traindate:=DateToStr(dtpkBeginDate.Date);
    if frmSelTime.ShowModal=mryes then
    begin
      endrkey:=DM.adoSelTimerkey.Value;
      if not  Pos(IntToStr(beginrkey),inSelRkey)>0 then
      begin
        outSelRkey:=IntToStr(DM.adoSelTimerkey.Value) +','+ outSelRkey
      end
      else
      begin
        tpos:=Pos(DM.adoSelTimerkey.AsString,inSelRkey);
        tleng:=Length(DM.adoSelTimerkey.AsString);
        inSelRkey:=LeftStr(inSelRkey,tpos-1)+  RightStr(inSelRkey,Length(inSelRkey)-tpos-tleng);
      end;
      dtpkEndTime.Time:=StrToTime(DM.adoSelTimecard_time.Value);
    end
    else inSelRkey:=tmpRkey;
  finally
    frmSelTime.Free;
  end;
  dtpkBeginTimeExit(nil);
end;

procedure TfrmAdd.dtpkEffectdateExit(Sender: TObject);
begin
  if iday < IncDay(dtpkEffectdate.Date,1) then
    Edit1.Text:= IntToStr(round((MonthsBetween(iday,dtpkEffectdate.Date)+1)/36.0* StrToCurr(Trim(edtFeel.Text))))
  else
    Edit1.Text:='0';
end;

procedure TfrmAdd.cbbTypeChange(Sender: TObject);
begin
  if Trim(cbbType.Text) = '关键岗位' then
  begin
//    Label3.Visible:=True;
//    edtKey.Enabled:= True;
    btn1.Enabled:= True;
  end
  else
  begin
//    Label3.Visible:=False;
    edtKey.Enabled:= False;
    btn1.Enabled:= False;
    edtKey.Text:='';
    edtKey.Tag:=0;
  end;
end;

procedure TfrmAdd.btn1Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  if deptid = 0 then
  begin
    ShowMessage('请选择人员');
    exit;
  end;
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'positionname/岗位/400';
    InputVar.Sqlstr := 'SELECT  rkey, positionname FROM dbo.hr_KeyPosition where deptid = ' + IntToStr(deptid) + ' order by rkey ';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtKey.Text:= frmPick_Item_Single.adsPick.fieldbyname('positionname').AsString;
      edtKey.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      LoadItem(edtKey.Tag);
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmAdd.LoadItem(keyid: Integer);
var
  Ltmp:TADOQuery;
begin
  Ltmp:= TADOQuery.Create(nil);
  Ltmp.Connection:= dm.ADOConnection1;
  edtTopic.Text:= '';
  edtTopic.Items.Clear;
  try
    with Ltmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT reqitem FROM hr_PositionReq WHERE reqtype = 0 and keyid = '+ IntToStr(keyid);
      Open;
      if not IsEmpty then
      begin
        First;
        while not Eof do
        begin
          edtTopic.Items.Add(Trim(FieldByName('reqitem').AsString));
          next;
        end;
      end;
    end;
  finally
    Ltmp.Free;
  end;
end;

procedure TfrmAdd.btn_SelClassClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'ccode/课程编号/120,cname/课程名/120';
    InputVar.Sqlstr := 'select rkey,ccode,cname '+
                    ' from   trainclass ';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_tc.Text:= frmPick_Item_Single.adsPick.fieldbyname('ccode').AsString;
      edtCode.Text:= frmPick_Item_Single.adsPick.fieldbyname('ccode').AsString;
      memoContent.Text:= frmPick_Item_Single.adsPick.fieldbyname('cname').AsString;
      edt_tc.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      edtCode.Text:=FormatDateTime('yyyyMMdd',now)+lbempno.Caption;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

end.
