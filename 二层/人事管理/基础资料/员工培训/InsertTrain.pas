unit InsertTrain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,Pick_Item_Single,ConstVar, DB, ADODB,DateUtils;

type
  TFrm_InsertTrain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    dtpk3: TDateTimePicker;
    dtpk4: TDateTimePicker;
    Edit4: TEdit;
    Label13: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ComboBox1: TComboBox;
    Edit9: TEdit;
    DateTimePicker1: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    rdo1: TRadioButton;
    rdo2: TRadioButton;
    ComboBox2: TComboBox;
    Label18: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rdo1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure dtpk2Exit(Sender: TObject);
    procedure dtpk4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    status:Integer;
  end;

var
  Frm_InsertTrain: TFrm_InsertTrain;

implementation

uses common,dmo, PasPublic;

{$R *.dfm}

procedure TFrm_InsertTrain.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(Application);
  try
    InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
    InputVar.Sqlstr :='select rkey,chinesename,employeecode from employeemsg where status=1 '
    +'union select rkey,chinesename,employeecode from employeemsg where outdutytime>='''+DateToStr(StartOfTheMonth(Now))+''' and outdutytime<='''+DateToStr(EndOfTheMonth(Now))+'''';
    InputVar.AdoConn := DM.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['chinesename'];
      Label18.Caption:=frmPick_Item_Single.adsPick.FieldValues['employeecode'];
      Edit2.SetFocus;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_InsertTrain.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_InsertTrain.BitBtn2Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('培训员工不能为空');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
    ShowMessage('培训编号不能为空');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(Edit3.Text)='' then
  begin
    ShowMessage('培训主题不能为空');
    Edit3.SetFocus;
    Exit;
  end;
  if dtpk2.Date<dtpk1.Date then
  begin
    ShowMessage('结束时间不能小于开始时间');
    Exit;
  end;
  if (dtpk1.Date=dtpk2.Date) and (dtpk4.Time<=dtpk3.Time) then
  begin
    ShowMessage('结束时间不能小于开始时间');
    Exit;
  end;
  if Trim(Edit4.Text)='' then
  begin
    ShowMessage('培训时长不能为空');
    Edit4.SetFocus;
    Exit;
  end;
  if Trim(Edit5.Text)='' then
  begin
    ShowMessage('培训讲师不能为空');
    Edit5.SetFocus;
    Exit;
  end;
  if Trim(Edit6.Text)='' then
  begin
    ShowMessage('培训地点不能为空');
    Edit6.SetFocus;
    Exit;
  end;
  if Trim(Edit7.Text)='' then
  begin
    ShowMessage('培训成绩不能为空');
    Edit7.SetFocus;
    Exit;
  end;
  if Trim(Edit8.Text)='' then
  begin
    ShowMessage('培训结果不能为空');
    Edit8.SetFocus;
    Exit;
  end;
  if (not (rdo1.Checked)) and (not (rdo2.Checked)) then
  begin
    ShowMessage('请选择培训完成状态');
    Exit;
  end;
  if (ComboBox1.Text='') then
  begin
    ShowMsg('请选择培训类型！',1);
    Exit;
  end;
  if (Trim(Edit9.Text)='') then Edit9.Text:='0';
end;

procedure TFrm_InsertTrain.Edit1Exit(Sender: TObject);
begin
  if (Q_Ftp=0) then
  begin
    if Trim(Edit1.Text)<>'' then
    begin
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey,chinesename,employeecode from employeemsg where chinesename='''+trim(Edit1.Text)+'''';
        Open;
        if IsEmpty then
        begin
          ShowMessage('没有这个员工，请重新输入或选择');
          Edit1.SetFocus;
          Exit;

        end
        else
        begin
          Edit1.Tag := FieldValues['RKEY'];
          Edit1.Text := FieldValues['chinesename'];
          Label18.Caption:=FieldValues['employeecode'];
        end;
      end;
    end;
  end;
end;

procedure TFrm_InsertTrain.BitBtn2Click(Sender: TObject);
var tmpAdo:TADOQuery;
    ifeel,iCount:Integer;
    FIsInsert:Boolean;
    iRkey,iItem:Integer;
    sWhere:string;
begin
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('培训员工不能为空！',1);
    Exit;
  end;
  if (Trim(Edit2.Text)='') then
  begin
    ShowMsg('培训编号不能为空！',1);
    Exit;
  end;
  if (Trim(Edit7.Text)='') then
  begin
    ShowMsg('培训成绩不能为空！',1);
    Exit;
  end;
  if (Trim(Edit4.Text)='') then
  begin
    ShowMsg('培训时长不能为空！',1);
    Exit;
  end;
  if (Trim(Edit9.Text)='') then
  begin
    ShowMsg('培训费用不能为空！',1);
    Exit;
  end;
  if (Trim(ComboBox1.Text)='') then
  begin
    ShowMsg('培训类型不能为空！',1);
    Exit;
  end;
  if (DateTimePicker1.Format=' ') then
  begin
    ShowMsg('培训有效期不能为空！',1);
    Exit;
  end;
  if (Q_Ftp=0) then
  begin
    ifeel:=0;
    FIsInsert := True;
    if (Trim(Edit9.Text)='') then Edit9.Text:='0';
//    if (ComboBox2.ItemIndex=0) then ifeel:=0 else //未结案
//    if (ComboBox2.ItemIndex=1) then ifeel:=1;     //已结案
    if (Trim(ComboBox1.Text)='普通') then
    begin
      Q_Status:=GetDataRkey('datadetail','item',ComboBox1.Text,DM.ADOConn,'dictid=20');
      IFSingKey2(FIsInsert,'dbo.Employee_Train','employeeid',IntToStr(Edit1.Tag),'Train_no='''+Trim(Edit2.Text)+'''',DM.ADOConn);
      try
        try
          tmpAdo:=TADOQuery.Create(Application);
          tmpAdo.Connection:=DM.ADOConn;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='insert into Employee_Train(employeeid,Train_no,Train_topics,startdate,starttime,enddate,endtime,Train_time,Teacher,'
                          +'Train_place,Train_grade,Train_result,Train_content,Train_status,'
                          +'type_ptr,oprator_ptr,oprate_time,employeecode)'
                          +'values(:employeeid,:Train_no,:Train_topics,:startdate,:starttime,:enddate,:endtime,:Train_time,:Teacher,'
                          +':Train_place,:Train_grade,:Train_result,:Train_content,:Train_status,'
                          +':type_ptr,:oprator_ptr,:oprate_time,:employeecode)';
          tmpAdo.Parameters.ParamByName('employeeid').Value:=Edit1.Tag;
          tmpAdo.Parameters.ParamByName('Train_no').Value:=Trim(Edit2.Text);
          tmpAdo.Parameters.ParamByName('Train_topics').Value:=Trim(Edit3.Text);
          tmpAdo.Parameters.ParamByName('startdate').Value:=formatdatetime('yyyy-MM-dd',dtpk1.Date);
          tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('HH:MM:SS',dtpk3.Time);
          tmpAdo.Parameters.ParamByName('enddate').Value:=formatdatetime('yyyy-MM-dd',dtpk2.Date);
          tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('HH:MM:SS',dtpk4.Time);
          tmpAdo.Parameters.ParamByName('Train_time').Value:=Trim(Edit4.Text);
          tmpAdo.Parameters.ParamByName('Teacher').Value:=Trim(Edit5.Text);
          tmpAdo.Parameters.ParamByName('Train_place').Value:=Trim(Edit6.Text);
          tmpAdo.Parameters.ParamByName('Train_grade').Value:=Trim(Edit7.Text);
          tmpAdo.Parameters.ParamByName('Train_result').Value:=Trim(Edit8.Text);
          tmpAdo.Parameters.ParamByName('Train_content').Value:=Trim(Memo1.Lines.Text);
          tmpAdo.Parameters.ParamByName('Train_status').Value:=status;
          tmpAdo.Parameters.ParamByName('type_ptr').Value:=Q_Status;
          tmpAdo.Parameters.ParamByName('oprator_ptr').Value:=user_ptr;
          tmpAdo.Parameters.ParamByName('oprate_time').Value:=formatdatetime('yyyy-MM-dd',Now);
          tmpAdo.Parameters.ParamByName('employeecode').Value:=Label18.Caption;
          tmpAdo.ExecSQL;
        except on e: Exception do
        begin
           ShowMessage(e.Message);
        end;
        end;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
      end;
    end else
    begin
      Q_Status:=GetDataRkey('datadetail','item',ComboBox1.Text,DM.ADOConn,'dictid=20');
      IFSingKey2(FIsInsert,'dbo.Employee_Train','employeeid',IntToStr(Edit1.Tag),'Train_no='''+Trim(Edit2.Text)+'''',DM.ADOConn);
      try
        try
          tmpAdo:=TADOQuery.Create(Application);
          tmpAdo.Connection:=DM.ADOConn;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='insert into Employee_Train(employeeid,Train_no,Train_topics,startdate,starttime,enddate,endtime,Train_time,Teacher,'
                          +'Train_place,Train_grade,Train_result,Train_content,Train_status,'
                          +'type_ptr,train_feels,effective_date,feels_payed,oprator_ptr,oprate_time,employeecode)'
                          +'values(:employeeid,:Train_no,:Train_topics,:startdate,:starttime,:enddate,:endtime,:Train_time,:Teacher,'
                          +':Train_place,:Train_grade,:Train_result,:Train_content,:Train_status,'
                          +':type_ptr,:train_feels,:effective_date,:feels_payed,:oprator_ptr,:oprate_time,:employeecode)';
          tmpAdo.Parameters.ParamByName('employeeid').Value:=Edit1.Tag;
          tmpAdo.Parameters.ParamByName('Train_no').Value:=Trim(Edit2.Text);
          tmpAdo.Parameters.ParamByName('Train_topics').Value:=Trim(Edit3.Text);
          tmpAdo.Parameters.ParamByName('startdate').Value:=formatdatetime('yyyy-MM-dd',dtpk1.Date);
          tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('HH:MM:SS',dtpk3.Time);
          tmpAdo.Parameters.ParamByName('enddate').Value:=formatdatetime('yyyy-MM-dd',dtpk2.Date);
          tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('HH:MM:SS',dtpk4.Time);
          tmpAdo.Parameters.ParamByName('Train_time').Value:=Trim(Edit4.Text);
          tmpAdo.Parameters.ParamByName('Teacher').Value:=Trim(Edit5.Text);
          tmpAdo.Parameters.ParamByName('Train_place').Value:=Trim(Edit6.Text);
          tmpAdo.Parameters.ParamByName('Train_grade').Value:=Trim(Edit7.Text);
          tmpAdo.Parameters.ParamByName('Train_result').Value:=Trim(Edit8.Text);
          tmpAdo.Parameters.ParamByName('Train_content').Value:=Trim(Memo1.Lines.Text);
          tmpAdo.Parameters.ParamByName('Train_status').Value:=status;
          tmpAdo.Parameters.ParamByName('type_ptr').Value:=Q_Status;
          tmpAdo.Parameters.ParamByName('train_feels').Value:=Trim(Edit9.Text);
          tmpAdo.Parameters.ParamByName('effective_date').Value:=formatdatetime('yyyy-MM-dd',DateTimePicker1.Date);
          tmpAdo.Parameters.ParamByName('feels_payed').Value:=ifeel;
          tmpAdo.Parameters.ParamByName('oprator_ptr').Value:=user_ptr;
          tmpAdo.Parameters.ParamByName('oprate_time').Value:=formatdatetime('yyyy-MM-dd',Now);
          tmpAdo.Parameters.ParamByName('employeecode').Value:=Label18.Caption;
          tmpAdo.ExecSQL;
        except on e: Exception do
        begin
           ShowMessage(e.Message);
        end;
        end;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
      end;
    end;
  end else
  if (Q_Ftp=1) then
  begin
    FIsInsert := False;
    if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
    begin
      showmessage('已结案的记录不能再编辑！');
      exit;
    end;
    if (Trim(Edit9.Text)='') then Edit9.Text:='0';
    if (ComboBox2.ItemIndex=0) then ifeel:=0 else
    if (ComboBox2.ItemIndex=1) then ifeel:=1;
    if (strtoint(vprev)=2) then
    begin
      sWhere:=' feels_payed=0 and oprator_ptr='+user_ptr+'';
      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,sWhere);
      if (iCount=0) then
      begin
        ShowMsg('非创建者不可修改培训记录！！',1);
        Exit;
      end else
      begin
        try
          tmpAdo:=TADOQuery.Create(Application);
          tmpAdo.Connection:=DM.ADOConn;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='Update Employee_Train set employeeid=:employeeid,Train_no=:Train_no,Train_topics=:Train_topics'
          +',startdate=:startdate,starttime=:starttime,enddate=:enddate,endtime=:endtime,Train_time=:Train_time,Teacher=:Teacher,'
          +'Train_place=:Train_place,Train_grade=:Train_grade,Train_result=:Train_result,Train_content=:Train_content,Train_status=:Train_status,'
          +'type_ptr=:type_ptr,train_feels=:train_feels,effective_date=:effective_date,feels_payed=:feels_payed,oprator_ptr=:oprator_ptr,oprate_time=:oprate_time,'
          +'employeecode=:employeecode where Rkey=:rkey';
          tmpAdo.Parameters.ParamByName('employeeid').Value:=Edit1.Tag;
          tmpAdo.Parameters.ParamByName('Train_no').Value:=Trim(Edit2.Text);
          tmpAdo.Parameters.ParamByName('Train_topics').Value:=Trim(Edit3.Text);
          tmpAdo.Parameters.ParamByName('startdate').Value:=formatdatetime('yyyy-MM-dd',dtpk1.Date);
          tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('HH:MM:SS',dtpk3.Time);
          tmpAdo.Parameters.ParamByName('enddate').Value:=formatdatetime('yyyy-MM-dd',dtpk2.Date);
          tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('HH:MM:SS',dtpk4.Time);
          tmpAdo.Parameters.ParamByName('Train_time').Value:=Trim(Edit4.Text);
          tmpAdo.Parameters.ParamByName('Teacher').Value:=Trim(Edit5.Text);
          tmpAdo.Parameters.ParamByName('Train_place').Value:=Trim(Edit6.Text);
          tmpAdo.Parameters.ParamByName('Train_grade').Value:=Trim(Edit7.Text);
          tmpAdo.Parameters.ParamByName('Train_result').Value:=Trim(Edit8.Text);
          tmpAdo.Parameters.ParamByName('Train_content').Value:=Trim(Memo1.Lines.Text);
          tmpAdo.Parameters.ParamByName('Train_status').Value:=status;
          tmpAdo.Parameters.ParamByName('type_ptr').Value:=ComboBox1.Tag;
//          if (DM.ADOEmployee_Trainptr_flag.Value=True) then tmpAdo.Parameters.ParamByName('train_feels').Value:=DM.ADOEmployee_Traintrain_feels.Value else
          tmpAdo.Parameters.ParamByName('train_feels').Value:=StrToFloat(Edit9.Text);
          tmpAdo.Parameters.ParamByName('effective_date').Value:=formatdatetime('yyyy-MM-dd',DateTimePicker1.Date);
          tmpAdo.Parameters.ParamByName('feels_payed').Value:=ifeel;
          tmpAdo.Parameters.ParamByName('oprator_ptr').Value:=user_ptr;
          tmpAdo.Parameters.ParamByName('oprate_time').Value:=formatdatetime('yyyy-MM-dd',Now);
          tmpAdo.Parameters.ParamByName('employeecode').Value:=Label18.Caption;
          tmpAdo.Parameters.ParamByName('Rkey').Value:=dm.ADOEmployee_TrainRkey.Value;
          tmpAdo.ExecSQL;
        finally
          tmpAdo.Close;
          tmpAdo.Connection:=nil;
          tmpAdo.Free;
        end;
        if (ifeel=1) then
        begin
          sWhere:=' effective_date>'''+formatdatetime('yyyy-MM-dd',Now)+''' and oprator_ptr='+user_ptr+' and feels_payed=1';
          iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,sWhere);
          if (iCount=0) then
          begin
            try
              tmpAdo:=TADOQuery.Create(Application);
              tmpAdo.Connection:=DM.ADOConn;
              tmpAdo.Close;
              tmpAdo.SQL.Clear;
              tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
              tmpAdo.ExecSQL;
            finally
              tmpAdo.Close;
              tmpAdo.Connection:=nil;
              tmpAdo.Free;
            end;
          end else
          begin
            try
              tmpAdo:=TADOQuery.Create(Application);
              tmpAdo.Connection:=DM.ADOConn;
              tmpAdo.Close;
              tmpAdo.SQL.Clear;
              tmpAdo.SQL.Text:='select rkey from datadetail where dictid=15 and item =''负绩效''';
              tmpAdo.Open;
              if (tmpAdo.RecordCount>0) then
              begin
                iItem:=tmpAdo.FieldByName('Rkey').AsInteger;
              tmpAdo.Close;
              tmpAdo.SQL.Clear;
              tmpAdo.SQL.Text:='insert into employee_rewards_punishment (employeeid,type,money,flag,effectdate,remark) values(:employeeid,:type,:money,:flag,:effectdate,:remark)';
              tmpAdo.Parameters.ParamByName('employeeid').Value:=DM.ADOEmployee_Trainemployeeid.Value;
              tmpAdo.Parameters.ParamByName('type').Value:=iItem;
              tmpAdo.Parameters.ParamByName('money').Value:=DM.ADOEmployee_Traintrain_feels.Value;
              tmpAdo.Parameters.ParamByName('flag').Value:=1;
              tmpAdo.Parameters.ParamByName('effectdate').Value:=formatdatetime('yyyy-MM-dd',Now);
              tmpAdo.Parameters.ParamByName('remark').Value:=DM.ADOEmployee_TrainType_ptr.AsString+'培训挂帐';
              tmpAdo.ExecSQL;
              tmpAdo.Close;
              tmpAdo.SQL.Clear;
              tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
              tmpAdo.ExecSQL;
              end;
            finally
              tmpAdo.Close;
              tmpAdo.Connection:=nil;
              tmpAdo.Free;
            end;
          end;
        end;
      end;
    end;
    if (strtoint(vprev)=4) then
    begin
      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' feels_payed=0');
      if (iCount=0) then
      begin
        ShowMsg('本条培训记录已结案！！',1);
        Exit;
      end else
      begin
        try
          tmpAdo:=TADOQuery.Create(Application);
          tmpAdo.Connection:=DM.ADOConn;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='Update Employee_Train set employeeid=:employeeid,Train_no=:Train_no,Train_topics=:Train_topics'
          +',startdate=:startdate,starttime=:starttime,enddate=:enddate,endtime=:endtime,Train_time=:Train_time,Teacher=:Teacher,'
          +'Train_place=:Train_place,Train_grade=:Train_grade,Train_result=:Train_result,Train_content=:Train_content,Train_status=:Train_status,'
          +'type_ptr=:type_ptr,train_feels=:train_feels,effective_date=:effective_date,feels_payed=:feels_payed,oprator_ptr=:oprator_ptr,oprate_time=:oprate_time,'
          +'employeecode=:employeecode where Rkey=:rkey';
          tmpAdo.Parameters.ParamByName('employeeid').Value:=Edit1.Tag;
          tmpAdo.Parameters.ParamByName('Train_no').Value:=Trim(Edit2.Text);
          tmpAdo.Parameters.ParamByName('Train_topics').Value:=Trim(Edit3.Text);
          tmpAdo.Parameters.ParamByName('startdate').Value:=formatdatetime('yyyy-MM-dd',dtpk1.Date);
          tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('HH:MM:SS',dtpk3.Time);
          tmpAdo.Parameters.ParamByName('enddate').Value:=formatdatetime('yyyy-MM-dd',dtpk2.Date);
          tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('HH:MM:SS',dtpk4.Time);
          tmpAdo.Parameters.ParamByName('Train_time').Value:=Trim(Edit4.Text);
          tmpAdo.Parameters.ParamByName('Teacher').Value:=Trim(Edit5.Text);
          tmpAdo.Parameters.ParamByName('Train_place').Value:=Trim(Edit6.Text);
          tmpAdo.Parameters.ParamByName('Train_grade').Value:=Trim(Edit7.Text);
          tmpAdo.Parameters.ParamByName('Train_result').Value:=Trim(Edit8.Text);
          tmpAdo.Parameters.ParamByName('Train_content').Value:=Trim(Memo1.Lines.Text);
          tmpAdo.Parameters.ParamByName('Train_status').Value:=status;
          tmpAdo.Parameters.ParamByName('type_ptr').Value:=ComboBox1.Tag;
//          if (DM.ADOEmployee_Trainptr_flag.Value=True) then tmpAdo.Parameters.ParamByName('train_feels').Value:=DM.ADOEmployee_Traintrain_feels.Value else
          tmpAdo.Parameters.ParamByName('train_feels').Value:=StrToFloat(Edit9.Text);
          tmpAdo.Parameters.ParamByName('effective_date').Value:=formatdatetime('yyyy-MM-dd',DateTimePicker1.Date);
          tmpAdo.Parameters.ParamByName('feels_payed').Value:=ifeel;
          tmpAdo.Parameters.ParamByName('oprator_ptr').Value:=user_ptr;
          tmpAdo.Parameters.ParamByName('oprate_time').Value:=formatdatetime('yyyy-MM-dd',Now);
          tmpAdo.Parameters.ParamByName('employeecode').Value:=Label18.Caption;
          tmpAdo.Parameters.ParamByName('Rkey').Value:=dm.ADOEmployee_TrainRkey.Value;
          tmpAdo.ExecSQL;
        finally
          tmpAdo.Close;
          tmpAdo.Connection:=nil;
          tmpAdo.Free;
        end;
        if (ifeel=1) then
        begin
          sWhere:=' effective_date>'''+formatdatetime('yyyy-MM-dd',Now)+''' and feels_payed=1';
          iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,sWhere);
          if (iCount=0) then
          begin
            try
              tmpAdo:=TADOQuery.Create(Application);
              tmpAdo.Connection:=DM.ADOConn;
              tmpAdo.Close;
              tmpAdo.SQL.Clear;
              tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprator_ptr='+user_ptr+',oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
              tmpAdo.ExecSQL;
            finally
              tmpAdo.Close;
              tmpAdo.Connection:=nil;
              tmpAdo.Free;
            end;
          end else
          begin
            try
              tmpAdo:=TADOQuery.Create(Application);
              tmpAdo.Connection:=DM.ADOConn;
              tmpAdo.Close;
              tmpAdo.SQL.Clear;
              tmpAdo.SQL.Text:='select rkey from datadetail where dictid=15 and item =''负绩效''';
              tmpAdo.Open;
              if (tmpAdo.RecordCount>0) then
              begin
                iItem:=tmpAdo.FieldByName('Rkey').AsInteger;
                tmpAdo.Close;
                tmpAdo.SQL.Clear;
                tmpAdo.SQL.Text:='insert into employee_rewards_punishment (employeeid,type,money,flag,effectdate,remark) values(:employeeid,:type,:money,:flag,:effectdate,:remark)';
                tmpAdo.Parameters.ParamByName('employeeid').Value:=DM.ADOEmployee_Trainemployeeid.Value;
                tmpAdo.Parameters.ParamByName('type').Value:=iItem;
                tmpAdo.Parameters.ParamByName('money').Value:=DM.ADOEmployee_Traintrain_feels.Value;
                tmpAdo.Parameters.ParamByName('flag').Value:=1;
                tmpAdo.Parameters.ParamByName('effectdate').Value:=formatdatetime('yyyy-MM-dd',Now);
                tmpAdo.Parameters.ParamByName('remark').Value:=DM.ADOEmployee_TrainType_ptr.AsString+'培训挂帐';
                tmpAdo.ExecSQL;
                tmpAdo.Close;
                tmpAdo.SQL.Clear;
                tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprator_ptr='+user_ptr+',oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
                tmpAdo.ExecSQL;
              end;
            finally
              tmpAdo.Close;
              tmpAdo.Connection:=nil;
              tmpAdo.Free;
            end;
          end;
        end;
      end;
    end;
    ShowMsg('修改成功！',1);
  end;
  ModalResult:=mrOk;
end;

procedure TFrm_InsertTrain.rdo1Click(Sender: TObject);
begin
  if rdo1.Checked then
    status:=0
  else
    status:=1;
end;

procedure TFrm_InsertTrain.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

procedure TFrm_InsertTrain.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9','.',#8,#13]) then Key:=#0;
end;

procedure TFrm_InsertTrain.Edit2Exit(Sender: TObject);
begin
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM Employee_Train WHERE Train_No='''+Trim(Edit2.Text)+''' and employeeid='+IntToStr(Edit1.Tag);
    Open;
    if not IsEmpty then
    begin
      ShowMessage('本员工该培训编号已存在，请重新输入');
      Edit2.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFrm_InsertTrain.FormShow(Sender: TObject);
var TmpAdo:TADOQuery;
begin
  TmpAdo:=TADOQuery.Create(Application);
  TmpAdo.Connection:=DM.ADOConn;
  TmpAdo.Close;
  TmpAdo.SQL.Clear;
  TmpAdo.SQL.Add('select * from dbo.datadetail where dictid=20');
  TmpAdo.Open;
  try
    try
      if not TmpAdo.Eof then
      begin
        while not TmpAdo.Eof do
        begin
          ComboBox1.Items.Add(TmpAdo.FieldByName('item').AsString);
          TmpAdo.Next;
        end;
        ComboBox1.Text:='普通';
      end else
      begin
        Messagedlg('培训类型基础数据不全，请设置培训类型！',mtinformation,[mbok],0);
        Exit;
      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection := nil;
      tmpAdo.Free;
      tmpAdo := nil;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
  if (Q_Ftp=0) then
  begin
    status:=1;
    dtpk1.Date:=Now;
    dtpk2.Date:=Now;
    DateTimePicker1.Date:=IncYear(Now,3);
    ComboBox2.Enabled:=False;
    ComboBox2.Visible:=False;
    Label17.Visible:=False;
  end else
  if (Q_Ftp=1) then
  begin
    ComboBox2.Enabled:=True;
    ComboBox2.Visible:=True;
    Label17.Visible:=True;
    
    Edit1.Text:=dm.ADOEmployee_Trainemployeecode.Value;
    Edit1.Tag:=DM.ADOEmployee_Trainemployeeid.Value;
    Label18.Caption:=dm.ADOEmployee_Trainemployeecode.Value;
    Edit2.Text:=DM.ADOEmployee_TrainTrain_NO.AsString;
    Edit3.Text:=DM.ADOEmployee_TrainTrain_topics.AsString;
    dtpk1.Date:=DM.ADOEmployee_Trainstartdate.AsDateTime;
    dtpk2.Date:=DM.ADOEmployee_Trainenddate.AsDateTime;
    dtpk3.Time:=StrToTime(DM.ADOEmployee_Trainstarttime.Value);
    dtpk4.Time:=StrToTime(DM.ADOEmployee_Trainendtime.Value);
    Edit4.Text:=DM.ADOEmployee_TrainTrain_time.AsString;
    Edit5.Text:=DM.ADOEmployee_TrainTeacher.AsString;
    Edit6.Text:=DM.ADOEmployee_TrainTrain_place.AsString;
    Edit7.Text:=DM.ADOEmployee_TrainTrain_grade.AsString;
    edit8.Text:=DM.ADOEmployee_TrainTrain_result.AsString;
    if ((DM.ADOEmployee_TrainTrain_status.Value='未完成') or (DM.ADOEmployee_TrainTrain_status.Value='0')) then
    begin
      rdo1.Checked:=True;
      status:=0;
    end else
    begin
      rdo2.Checked:=True;
      status:=1;
    end;
    Memo1.Lines.Text:=DM.ADOEmployee_TrainTrain_content.AsString;
    ComboBox1.Tag:=dm.ADOEmployee_TraindetailRkey.AsInteger;
    ComboBox1.Text:=DM.ADOEmployee_TrainType_ptr.AsString;
    Edit9.Text:=dm.ADOEmployee_Traintrain_feels.AsString;
    if (DM.ADOEmployee_Traineffective_date.AsString=null) or (DM.ADOEmployee_Traineffective_date.AsString='') then DateTimePicker1.Format:=' ' else
    DateTimePicker1.Date:=DM.ADOEmployee_Traineffective_date.AsDateTime;
    if ((DM.ADOEmployee_Trainfeels_payed.AsString='未结案') or (DM.ADOEmployee_Trainfeels_payed.AsString='0') or (DM.ADOEmployee_Trainfeels_payed.Value=False))  then ComboBox2.ItemIndex:=0 else ComboBox2.ItemIndex:=1;
  end;
  if (Q_Ftp=2) then
  begin
    ComboBox2.Enabled:=True;
    ComboBox2.Visible:=True;
    Label17.Visible:=True;

    Edit1.Text:=dm.ADOEmployee_Trainemployeecode.Value;
    Edit1.Tag:=DM.ADOEmployee_Trainemployeeid.Value;
    Edit2.Text:=DM.ADOEmployee_TrainTrain_NO.AsString;
    Edit3.Text:=DM.ADOEmployee_TrainTrain_topics.AsString;
    dtpk1.Date:=DM.ADOEmployee_Trainstartdate.AsDateTime;
    dtpk2.Date:=DM.ADOEmployee_Trainenddate.AsDateTime;
    dtpk3.Time:=StrToTime(DM.ADOEmployee_Trainstarttime.Value);
    dtpk4.Time:=StrToTime(DM.ADOEmployee_Trainendtime.Value);
    Edit4.Text:=DM.ADOEmployee_TrainTrain_time.AsString;
    Edit5.Text:=DM.ADOEmployee_TrainTeacher.AsString;
    Edit6.Text:=DM.ADOEmployee_TrainTrain_place.AsString;
    Edit7.Text:=DM.ADOEmployee_TrainTrain_grade.AsString;
    edit8.Text:=DM.ADOEmployee_TrainTrain_result.AsString;
    if ((DM.ADOEmployee_TrainTrain_status.Value='未完成') or (DM.ADOEmployee_TrainTrain_status.Value='0')) then
    begin
      rdo1.Checked:=True;
      status:=0;
    end else
    begin
      rdo2.Checked:=True;
      status:=1;
    end;
    Memo1.Lines.Text:=DM.ADOEmployee_TrainTrain_content.AsString;
    ComboBox1.Tag:=dm.ADOEmployee_TraindetailRkey.AsInteger;
    ComboBox1.Text:=DM.ADOEmployee_TrainType_ptr.AsString;
    Edit9.Text:=dm.ADOEmployee_Traintrain_feels.AsString;
    DateTimePicker1.Date:=DM.ADOEmployee_Traineffective_date.AsDateTime;
    if ((DM.ADOEmployee_Trainfeels_payed.AsString='未结案') or (DM.ADOEmployee_Trainfeels_payed.AsString='0') or (DM.ADOEmployee_Trainfeels_payed.Value=False))  then ComboBox2.ItemIndex:=0 else ComboBox2.ItemIndex:=1;
    ComboBox2.Text:=DM.ADOEmployee_Trainfeels_payed.AsString;
    BitBtn2.Enabled:=False;
    ComboBox2.Enabled:=False;
    BitBtn1.Enabled:=False;
    Edit1.Enabled:=False;
    ComboBox1.Enabled:=False;
    DateTimePicker1.Enabled:=False;
    dtpk1.Enabled:=False;
    dtpk2.Enabled:=False;
    dtpk3.Enabled:=False;
    dtpk4.Enabled:=False;
    Edit1.Enabled:=False;
    Edit2.Enabled:=False;
    Edit3.Enabled:=False;
    Edit4.Enabled:=False;
    Edit5.Enabled:=False;
    Edit6.Enabled:=False;
    Edit7.Enabled:=False;
    Edit8.Enabled:=False;
    Edit9.Enabled:=False;
    Memo1.Enabled:=False;
    GroupBox1.Enabled:=False;
  end;
end;

procedure TFrm_InsertTrain.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9','-','.',#8,#13]) then Key:=#0;
  if ((Key='.') and (Pos('.',Edit9.Text)>0)) then Key:=#0;
end;

procedure TFrm_InsertTrain.ComboBox1Change(Sender: TObject);
begin
  if (Q_Ftp=0) then
  begin
    if (Trim(ComboBox1.Text)='普通') then
    begin
      ComboBox2.Visible:=False;
      Label17.Visible:=False;
    end else
    begin
      ComboBox2.Visible:=True;
      Label17.Visible:=True;
    end;
  end;
  ComboBox1.Tag:=GetDataRkey('datadetail','item',ComboBox1.Text,DM.ADOConn,'dictid=20');
end;

procedure TFrm_InsertTrain.dtpk2Exit(Sender: TObject);
var D1,D2:TDateTime;
begin
  if (dtpk1.Date=dtpk2.Date) and (dtpk4.Time<=dtpk3.Time) then
  begin
    ShowMessage('结束时间不能小于开始时间');
    Exit;
  end;
  D1:=dtpk1.Date+dtpk3.Time;
  D2:=dtpk2.Date+dtpk4.Time;
  Edit4.Text:=FormatFloat('#',MinuteSpan(D2,D1));
end;

procedure TFrm_InsertTrain.dtpk4Exit(Sender: TObject);
var D1,D2:TDateTime;
begin
  if (dtpk1.Date=dtpk2.Date) and (dtpk4.Time<=dtpk3.Time) then
  begin
    ShowMessage('结束时间不能小于开始时间');
    Exit;
  end;
  D1:=dtpk1.Date+dtpk3.Time;
  D2:=dtpk2.Date+dtpk4.Time;
  Edit4.Text:=FormatFloat('#',MinuteSpan(D2,D1));
end;

end.
