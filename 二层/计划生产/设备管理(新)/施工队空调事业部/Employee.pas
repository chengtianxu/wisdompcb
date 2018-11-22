unit Employee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, DBCtrlsEh;

type
  TFrm_Employee = class(TForm)
    BitCancel: TBitBtn;
    BtnSave: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    LabEmployee: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label5: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label3: TLabel;
    Label6: TLabel;
    Edt_timereset: TEdit;
    Label7: TLabel;
    Memo_Remark: TMemo;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edt_timeresetKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
     function EmployeeStatusCheck(vEmpl_ptr:string):Boolean;
    { Private declarations }
  public
    v_status,rkey837:Integer;
    { Public declarations }
  end;

var
  Frm_Employee: TFrm_Employee;

implementation

uses damo,Pick_Item_Single,ConstVar,common,DateUtils;

{$R *.dfm}

procedure TFrm_Employee.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'EMPL_CODE/雇员代码/180,EMPLOYEE_NAME/雇员名称/250';
    InputVar.Sqlstr := 'select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005 ORDER by EMPL_CODE';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('EMPL_CODE').AsString;
      Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      LabEmployee.Caption := frmPick_Item_Single.adsPick.FieldByName('EMPLOYEE_NAME').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end
end;

procedure TFrm_Employee.Edt_timeresetKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edt_timereset.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure TFrm_Employee.FormShow(Sender: TObject);
begin
  if v_status=0 then
  begin
    DateTimePicker1.Date := getsystem_date(DM.tmp,0);
    DateTimePicker2.Time := getsystem_date(DM.tmp,0);
    DateTimePicker3.Date := getsystem_date(DM.tmp,1);
    DBDateTimeEditEh1.Enabled := False;
    Edt_timereset.Enabled := False;
    DateTimePicker1.Enabled := False;
    DateTimePicker2.Enabled := False;
    DateTimePicker3.Enabled := False;
  end
  else
  if v_status=1 then
  begin
    if StrToInt(vprev) in[1,2,3] then
    begin
      BitBtn1.Enabled := False;
      DBDateTimeEditEh1.Enabled := False;
      Edt_timereset.Enabled := False;
      DateTimePicker1.Enabled := False;
      DateTimePicker2.Enabled := False;
      DateTimePicker3.Enabled := False;
      Memo_Remark.Enabled:=False;
    end
  end;
end;

function TFrm_Employee.EmployeeStatusCheck(vEmpl_ptr: string): Boolean;
begin
  Result:=False;
  with DM.tmp do
  begin
    Close;
    SQL.Text:='select data0835.WorkOrder,Data0005.EMPLOYEE_NAME from Data0837 inner join data0835 on Data0837.work_ptr=data0835.rkey '
        +'INNER JOIN  Data0005 ON Data0837.Empl_ptr = Data0005.RKEY where Data0837.empl_ptr='+vEmpl_ptr+' and Data0837.status=3';
    Open;

    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
     // vNUMBER:= FieldByName('WorkOrder').AsString;
      ShowMessage('雇员:“'+FieldByName('EMPLOYEE_NAME').AsString+'“在工作单：“'+FieldByName('WorkOrder').AsString+'”存在未完成的记录！！！');
      Result:=True;
    end;
  end;
end;

procedure TFrm_Employee.BtnSaveClick(Sender: TObject);
var
  Worketime:Double;
  TimeReset:string;
begin
  if Edit1.Text ='' then
  begin
    ShowMessage('请选择雇员代码');
    Exit;
  end;
  if v_status=1 then
  if DM.ADS837MainExecStat.Value='已结束' then
  begin
    if Edt_timereset.Text<>'' then
    begin
      if (MinutesBetween(StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))
          ,DBDateTimeEditEh1.Value)/60.0 - StrToFloat(Edt_timereset.Text)<0) then
      begin
        messagedlg('操作不合法，雇员工作时间小于0!',mtinformation,[mbcancel],0);
        Exit;
      end;
    end
    else
    begin
      if (MinutesBetween(StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))
          ,DBDateTimeEditEh1.Value)/60.0 <0) then
      begin
        messagedlg('操作不合法，雇员工作时间小于0!',mtinformation,[mbcancel],0);
        Exit;
      end;
      
    end;
  end;

  try
    if v_status=0 then
    begin
      if EmployeeStatusCheck(IntToStr(Edit1.Tag)) then
      begin
        Exit;
      end;

      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'select  Data0837.rkey, data0837.Work_ptr, data0837.WorkDate, data0837.BeginTime,'+
               ' data0837.Empl_ptr,data0837.Status,data0837.remark from data0837 where rkey is null';
        Open;
        Append;
        FieldByName('Work_ptr').Value := DM.ADS835rkey.Value;
        FieldByName('WorkDate').Value := FormatDateTime('yyyy-MM-dd',DateTimePicker3.Date);
        FieldByName('BeginTime').Value := StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time));
        FieldByName('Empl_ptr').Value := Edit1.Tag;
        FieldByName('Status').Value := 3;
        FieldByName('remark').Value := Memo_Remark.Lines.Text;
        Post;
        rkey837 := FieldByName('rkey').Value;
      end;
      DM.ADOConnection1.CommitTrans;
//      with DM.tmp do
//      begin
//        Close;
//        SQL.Text:='insert into data0837(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status)values('
//        +DM.ADS835rkey.AsString+','+ QuotedStr(FormatDateTime('yyyy-MM-dd',DateTimePicker3.Date))
//        +','+ QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',(DateTimePicker1.Date+DateTimePicker2.Time)))
//        +','+inttostr(edit1.tag)+','+'3' +')' ;
//
//        ShowMessage(SQL.Text);
//        ExecSQL;
//      end;
      ModalResult := mrOk;
    end
    else if v_status =1 then
    begin
      if DM.ADS837Empl_ptr.Value <> Edit1.Tag then
      if EmployeeStatusCheck(IntToStr(Edit1.Tag)) then
      begin
        Exit;
      end;

      DM.ADOConnection1.BeginTrans;
      with dm.tmp do
      begin
        if Edt_timereset.Text = '' then
        begin
          TimeReset := '0' ;
        end
        else
        begin
          TimeReset :=Edt_timereset.text;
        end;
        Worketime :=0;
        Close;
        if DBDateTimeEditEh1.Value=null then
        begin
          SQL.Text := 'update data0837 set WorkDate='+QuotedStr(FormatDateTime('yyyy-MM-dd',DateTimePicker3.Date))+
          ',BeginTime='+quotedstr(DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))
          +',EndTime=null,TimeRest='+TimeReset+',remark='+
          quotedstr(Memo_Remark.Lines.Text)+',Empl_ptr='+inttostr(Edit1.Tag)+' where rkey='+dm.ADS837rkey.AsString;
        end
        else
        begin
          Worketime:=MinutesBetween(StrToDateTime( DateToStr(DateTimePicker1.Date)+
          FormatDateTime(' HH:mm:ss',DateTimePicker2.Time)),DBDateTimeEditEh1.Value)/60.0-StrToFloat(TimeReset) ;
          SQL.Text := 'update data0837 set WorkDate='+QuotedStr(FormatDateTime('yyyy-MM-dd',DateTimePicker3.Date))+
          ',BeginTime='+quotedstr(DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))+',EndTime='+
          QuotedStr(DBDateTimeEditEh1.Value)+',TimeRest='+TimeReset+',remark='+ quotedstr(Memo_Remark.Lines.Text)+',Empl_ptr='
          +inttostr(Edit1.Tag)+',WorkTime='+ FloatToStr(worketime)+
          ' where rkey='+dm.ADS837rkey.AsString;
        end;
        ExecSQL;
      end;
      with DM.tmp do
      begin
        Worketime := 0;
        DM.ADOQuery1.Close;
        DM.ADOQuery1.SQL.Text:='select  rkey,  WorkTime from data0837 where work_ptr ='+dm.ADS835rkey.AsString;
        DM.ADOQuery1.Open;
        Close;
        SQL.Text :='select rkey,status,ActuCons from data0835 where rkey='+dm.ADS835rkey.AsString;
        Open;
        DM.ADOQuery1.First;
        if FieldByName('status').AsInteger in[2,4] then
        begin
          while not DM.ADOQuery1.Eof do
          begin
            Worketime := Worketime + DM.ADOQuery1.FieldByName('worktime').Value;
            DM.ADOQuery1.Next;
          end;
          Edit;
          FieldByName('ActuCons').Value := Worketime;
          Post;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult :=mrOk;
    end;
  except
    on E:Exception do
    begin
      MessageDlg(e.Message,mtError,[mbCancel],0);
      DM.ADOConnection1.RollbackTrans;
    end;
  end
end;



end.
