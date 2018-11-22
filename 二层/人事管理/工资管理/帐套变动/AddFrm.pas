unit AddFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, damo, common, Pick_Item_Single,
  ConstVar, DateUtils, DB, ADODB;

type
  TFrmAdd = class(TForm)
    lb_1: TLabel;
    edt_1: TEdit;
    bbt_EmpDtp: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    bbt_2: TBitBtn;
    bbt_3: TBitBtn;
    edt_5: TEdit;
    lb_5: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    ComboBox1: TComboBox;
    lblName: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    procedure bbt_EmpDtpClick(Sender: TObject);
    procedure bbt_3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdd: TFrmAdd;

implementation

{$R *.dfm}

procedure TFrmAdd.bbt_EmpDtpClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  i, j: Integer;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'employeecode/员工工号/100,chinesename/员工姓名/120,ondutytime/入职时间/150,';
    InputVar.Sqlstr := 'select rkey,employeecode, chinesename, ondutytime, wagetype from employeemsg where status=1 and wagetype is not null';
    InputVar.AdoConn := DM.con1;
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
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select rkey, accountName from salaryAccount';
        Open;
        ComboBox1.Clear;
        First;
        for i := 0 to RecordCount - 1 do
        begin
          if FieldValues['accountName'] = Edit1.Text then j := i;
          ComboBox1.Items.Add(FieldValues['accountName']);
          Next;
        end;
        ComboBox1.Items.Delete(j);
        ComboBox1.Style := csDropDownList;
        ComboBox1.ItemIndex := 0;
      end;
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.bbt_3Click(Sender: TObject);
var
  AccountRkey: Integer;
begin
  if Trim(edt_1.Text) = '' then
  begin
    ShowMessage('对不起，您输入的信息不完整，请检查！');
    Exit;
  end;
  try
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) counts from employee_alteration where employeeid = ' + IntToStr(bbt_EmpDtp.Tag)
        + ' and alterdate= ' + QuotedStr(DateToStr(DateTimePicker1.Date))
        + ' and orginal_accountid is not null '
        + ' and active= 1';
      Open;
      if FieldByName('counts').AsInteger > 0 then
      begin
        ShowMessage('对不起，员工：' + lblName.Caption + ',' + #13 + #13
          + IntToStr(YearOf(DateTimePicker1.Date)) + '年' + IntToStr(MonthOf(DateTimePicker1.Date))
          + '月份已有生效帐套调整记录，请勿重复添加！');
        Exit;
      end;
    end;

    //获取下拉框中帐套对应的Rkey值（新帐套的Rkey）
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from salaryaccount where accountName = ' + QuotedStr(ComboBox1.Text);
      Open;
      AccountRkey := FieldValues['rkey'];
    end;

    try
      DM.con1.BeginTrans;
      //新增帐套变动记录
      if DM.UpdateTag = 0 then
      begin
        with DM.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text := Format('insert into employee_alteration(employeeid, orginal_accountid, new_accountid, oper_person, '
            + 'oper_date, alterdate, active, remark) '
            + 'values(%d, %d, %d, %d, ''%s'', ''%s'', %d, ''%s'')',
            [bbt_EmpDtp.Tag, Edit1.Tag, AccountRkey, StrToInt(user_ptr),
            Edit2.Text, IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01',
            0, Memo1.Text]);
          ExecSQL;
        end;
        DM.con1.CommitTrans;
        ShowMessage('该记录已保存成功！');
      end;

      //修改帐套变动记录
      if DM.UpdateTag = 1 then
      begin
        with DM.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text := Format('update employee_alteration set new_accountid= %d, '
            + 'oper_person= %d, oper_date= ''%s'', alterdate= ''%s'',  remark= ''%s'' where rkey= %d ',
            [AccountRkey, StrToInt(user_ptr), Edit2.Text,
            IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01',
            Memo1.Text, DM.qry1.FieldByName('Altrkey').AsInteger]);
          ExecSQL;
        end;
        DM.con1.CommitTrans;
        ShowMessage('该记录已修改成功！');
      end;
    except
      on e: Exception do
      begin
        DM.con1.RollbackTrans;
        ShowMessage('网络异常...... (' + e.Message + ')');
      end;
    end;
  finally
    Close;
  end;
end;

procedure TFrmAdd.FormShow(Sender: TObject);
var
  i: Integer;
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select rkey, accountName from salaryAccount';
    Open;
    ComboBox1.Clear;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      ComboBox1.Items.Add(FieldValues['accountName']);
      Next;
    end;
    ComboBox1.Style := csDropDownList;
    ComboBox1.ItemIndex := 0;
  end;

  if DM.UpdateTag = 1 then     //修改
  begin
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(DM.qry1.FieldValues['NewName']);
    if DM.qry1.FieldByName('ActiveName').Value = '是' then
    begin
      ComboBox1.Enabled := False;
      ComboBox1.Color := clSkyBlue;
      Memo1.Enabled := False;
    end;
    bbt_EmpDtp.Tag := DM.qry1.FieldValues['EmpRkey'];
    bbt_EmpDtp.Enabled := False;
    edt_1.Text := DM.qry1.FieldValues['employeecode'];
    edt_1.ReadOnly := True;
    lblName.Caption := DM.qry1.FieldValues['chinesename'];
    Edit2.Text := DM.qry1.FieldValues['oper_date'];
    edt_5.Text := DM.qry1.FieldValues['OperName'];
    if not DM.qry1.FieldByName('Remark').IsNull then Memo1.Text := DM.qry1.FieldValues['remark'];
    Edit1.Text := DM.qry1.FieldValues['OldName'];
    Edit1.Tag := DM.qry1.FieldValues['orginal_accountid'];
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

procedure TFrmAdd.bbt_2Click(Sender: TObject);
begin
  Close;
end;

end.
