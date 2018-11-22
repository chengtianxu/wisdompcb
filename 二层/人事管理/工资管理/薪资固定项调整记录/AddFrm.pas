unit AddFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, damo, common, Pick_Item_Single,
  ConstVar, DateUtils, DB, ADODB;

type
  TFrmAdd = class(TForm)
    bbt_2: TBitBtn;
    bbt_3: TBitBtn;
    lb_1: TLabel;
    edt_1: TEdit;
    bbt_EmpDtp: TBitBtn;
    edt_2: TEdit;
    lb_2: TLabel;
    lb_8: TLabel;
    edt_6: TEdit;
    lb_3: TLabel;
    edt_3: TEdit;
    lb_5: TLabel;
    edt_5: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    lblName: TLabel;
    btn_SalaryItem: TBitBtn;
    lbldataField: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbt_3Click(Sender: TObject);
    procedure bbt_EmpDtpClick(Sender: TObject);
    procedure btn_SalaryItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetWagetype();
  public
    { Public declarations }
  end;

var
  FrmAdd: TFrmAdd;

implementation

{$R *.dfm}

procedure TFrmAdd.GetWagetype();
begin
  with DM.sp1 do
  begin
    Close;
    Parameters[1].Value := bbt_EmpDtp.Tag;
    Parameters[2].Value := IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date));
    Parameters[3].Value := Edit1.Tag;
    Prepared := True;
    ExecProc;
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey, AccountName from salaryaccount where rkey = ' + IntToStr(DM.sp1.Parameters[0].Value);
      Open;
      if not IsEmpty then
      begin
        Edit1.Text := FieldValues['AccountName'];
        Edit1.Tag := FieldValues['rkey'];
      end;
    end;
  end;
end;

procedure TFrmAdd.FormCreate(Sender: TObject);
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := format('select rkey, employee_name, convert(varchar(100), getdate(), 23) as sysdate '
      + 'from data0005 where data0005.rkey=''%s'' ', [user_ptr]);
    Open;
    edt_5.Text := FieldValues['EmpLoyee_name'];
    edt_5.tag := FieldValues['rkey'];
    DateTimePicker1.Date := StrToDate(inttostr(YearOf(StrToDate(FieldValues['sysdate']))) + '-' + inttostr(MonthOf(StrToDate(FieldValues['sysdate']))) + '-01');
    Edit2.Text := FieldValues['sysdate'];
  end;
end;

procedure TFrmAdd.FormShow(Sender: TObject);
begin
  if DM.UpdateTag = 1 then
  begin
    if DM.qrySalaryJL.FieldByName('effect_flag').Value = '是' then
    begin
      edt_3.ReadOnly := True;
      edt_3.Color := clSkyBlue;
      btn_SalaryItem.Enabled := False;
    end;

    edt_1.Text := DM.qrySalaryJL.FieldValues['employeecode'];
    edt_1.Tag := DM.qrySalaryJL.FieldValues['employeeid'];
    edt_2.Text := DM.qrySalaryJL.FieldValues['itemname'];
    edt_6.Text := FloatToStr(DM.qrySalaryJL.FieldValues['originaldata']);
    edt_3.Text := FloatToStr(DM.qrySalaryJL.FieldValues['newdata']);
    Edit1.Text := DM.qrySalaryJL.FieldValues['AccountName'];
    Edit1.Tag := DM.qrySalaryJL.FieldValues['Accountid'];
    if not DM.qrySalaryJL.FieldByName('remark').IsNull then
      Memo1.Text := DM.qrySalaryJL.FieldValues['remark'];
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select datafield from DesignSalaryItem where itemname=' + QuotedStr(edt_2.Text);
      open;
      if not IsEmpty then lbldataField.Caption := FieldValues['datafield'];

      Close;
      SQL.Clear;
      SQL.Text := 'select rkey,chinesename from employeemsg where employeecode=' + QuotedStr(edt_1.Text);
      open;
      if not IsEmpty then
      begin
        lblName.Caption := FieldValues['chinesename'];
        bbt_EmpDtp.Tag := FieldValues['rkey'];
      end;

      Close;
      SQL.Clear;
      SQL.Text := 'select datadetail.rkey, datadetail.item from datadetail inner join basicsalary_Alteration '
        + ' on datadetail.rkey = basicsalary_Alteration.alter_reason where basicsalary_Alteration.rkey ='
        + IntToStr(DM.qrySalaryJL.FieldValues['rkey']);
      open;
      if not IsEmpty then
      begin
        Edit3.Text := FieldValues['item'];
        Edit3.Tag := FieldValues['rkey'];
      end;

    end;
    if lbldataField.Caption = 'F2' then
    begin
      edt_2.Color := cl3DLight;
      edt_2.ReadOnly := True;
      btn_SalaryItem.Enabled := False;
    end;
    bbt_EmpDtp.Enabled := False;
    edt_1.ReadOnly := True;
  end;
end;

//保存
procedure TFrmAdd.bbt_3Click(Sender: TObject);
begin
  if (Trim(edt_1.Text) = '') or (Trim(edt_2.Text) = '') or (Trim(edt_3.Text) = '') or (Trim(edt_6.Text) = '') then
  begin
    ShowMessage('对不起，您输入的信息不完整，请检查！');
    Exit;
  end;

  try

    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) as counts from dbo.basicsalary_Alteration where employeeid = '
        + inttostr(bbt_EmpDtp.Tag)
        + ' and effect_date = ' + QuotedStr(DateToStr(DateTimePicker1.Date))
        + ' and datafield = ' + QuotedStr(lbldataField.Caption)
        + ' and effect_flag=1';
      Open;
      if FieldByName('counts').AsInteger > 0 then
      begin
        ShowMessage('员工：' + lblName.Caption + ', 薪资项目：' + edt_2.Text + #13 +  #13
          + IntToStr(YearOf(DateTimePicker1.Date)) + '年' + IntToStr(MonthOf(DateTimePicker1.Date))
          + '月份已有调薪记录，请勿重复添加！');
        Exit;
      end;
    end;
    try
      dm.qryTrainTemp.Parameters[0].Value := DM.qrySalaryJL.FieldValues['rkey'];
      DM.qryTrainTemp.Open;
      //DM.qryTrainTemp.Locate('rkey', DM.qrySalaryJL.FieldValues['rkey'], []);
      DM.qryTrainTemp.Edit;
      DM.qryTrainTemp.FieldByName('itemname').AsString := edt_2.Text;
      DM.qryTrainTemp.FieldByName('datafield').AsString := lbldataField.Caption;
      DM.qryTrainTemp.FieldByName('newdata').AsString := edt_3.Text;
      DM.qryTrainTemp.FieldByName('operator').AsString := user_ptr;
      DM.qryTrainTemp.FieldByName('effect_date').AsString := IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01';
      DM.qryTrainTemp.FieldByName('remark').AsString := Memo1.Text;
      DM.qryTrainTemp.FieldByName('operate_date').AsString := Edit2.Text;
      if Edit3.Tag >= 0 then
        DM.qryTrainTemp.FieldByName('alter_reason').Value := Edit3.Tag;
      DM.qryTrainTemp.Post;
      ShowMessage('该薪资记录已修改成功！');
    except
      on e: Exception do
      begin
        ShowMessage('网络异常...... (' + e.Message + ')');
      end;
    end;
  finally
    DM.qrySalaryJL.Close;
    DM.qrySalaryJL.Open;
    Close;
  end;
end;

procedure TFrmAdd.bbt_EmpDtpClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'employeecode/员工工号/80,chinesename/员工姓名/80,item/职务/100,ondutytime/入职时间/120,';
    InputVar.Sqlstr := 'select rkey,employeecode, chinesename, ondutytime, wagetype, datadetail.item from employeemsg '
      + ' inner join datadetail on position=datadetail.rkey '
      + ' where status=1 and wagetype is not null';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_1.Text := frmPick_Item_Single.adsPick.FieldValues['employeecode'];
      bbt_EmpDtp.Tag :=  frmPick_Item_Single.adsPick.FieldValues['rkey'];
      lblName.Caption := frmPick_Item_Single.adsPick.FieldValues['chinesename'];

      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select rkey, AccountName from salaryAccount where rkey=' + IntToStr(frmPick_Item_Single.adsPick.FieldValues['wagetype']);
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := FieldValues['AccountName'];
          Edit1.Tag := FieldValues['rkey']
        end;
      end;
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.btn_SalaryItemClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'datafield/薪资代码/180,itemname/薪资名称/180,';
    InputVar.Sqlstr := 'select itemname, datafield, employeemsg.rkey from dbo.DesignSalaryItem inner join employeemsg '
      + ' on employeemsg.wagetype=DesignSalaryItem.accountid where datasourcetype=2 and employeemsg.rkey = ' + IntToStr(bbt_EmpDtp.Tag)
      + ' and DesignSalaryItem.datafield <> ''F2'' ';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_2.Text := frmPick_Item_Single.adsPick.FieldValues['itemname'];
      lbldataField.Caption := frmPick_Item_Single.adsPick.FieldValues['datafield'];
    end;
    if edt_1.Text <> '' then
    begin
      with DM.qrytemp do
      begin
        SQL.Clear;
        SQL.Text := 'select ' + lbldataField.Caption + ' from Employeebasicsalary where employeeid=' + IntToStr(bbt_EmpDtp.Tag);
        open;
        if not IsEmpty then
          edt_6.Text := IntToStr(FieldValues[lbldataField.Caption])
        else ShowMessage('该员工没有固定项目!');
      end;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.DateTimePicker1Change(Sender: TObject);
begin
  GetWagetype;
end;

procedure TFrmAdd.bbt_2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAdd.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'item/调薪原因/380,';
    InputVar.Sqlstr := 'select * from datadetail where dictid=21';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit3.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      Edit3.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

end.









