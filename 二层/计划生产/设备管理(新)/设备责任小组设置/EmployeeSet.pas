unit EmployeeSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Mask, DBCtrlsEh;

type
  Tfrm_EmployeeSet = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitEmployee: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    procedure BitEmployeeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
  private
    vD005_ptr:Integer;
      strmsg:string;
    function find_Employee(Employee:string):Boolean;
    { Private declarations }
  public
    v_status,rkey855:Integer;
    { Public declarations }
  end;

var
  frm_EmployeeSet: Tfrm_EmployeeSet;

implementation

uses damo,Pick_Item_Single,ConstVar,common;

{$R *.dfm}

procedure Tfrm_EmployeeSet.BitEmployeeClick(Sender: TObject);
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
      Label2.Caption := frmPick_Item_Single.adsPick.FieldByName('EMPLOYEE_NAME').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end

end;

procedure Tfrm_EmployeeSet.FormShow(Sender: TObject);
begin
  if v_status=0 then
  begin
    Label4.Visible := False;
    DBDateTimeEditEh1.Visible := False;
    DateTimePicker1.Date := getsystem_date(DM.tmp,1);
  end;
  if (v_status = 1)or (v_status=2)  then
  begin
    with DM.ADS855 do
    begin
      Edit1.Text := FieldByName('EMPL_CODE').Value;
      Edit1.Tag := FieldByName('D005_ptr').Value;
      Label2.Caption := FieldByName('EMPLOYEE_NAME').Value;
      DateTimePicker1.Date := FieldByName('EntrDate').Value;
      if not (DM.ADS855DepaDate.IsNull) then
      DBDateTimeEditEh1.Text := FieldByName('DepaDate').Value;
      if DM.ADS855type.Value='是' then
      begin
        CheckBox1.Checked := True;
      end
      else
      begin
        CheckBox1.Checked := False;
      end;
    end;
    vD005_ptr := Edit1.tag;
  end;
  if v_status=2 then
  begin
    BitSave.Enabled :=False;
    DateTimePicker1.Enabled := False;
    DBDateTimeEditEh1.Enabled := False;
    CheckBox1.Enabled :=False;
    BitEmployee.Enabled := False;
  end;
end;

function Tfrm_EmployeeSet.find_Employee(Employee: string): Boolean;
begin
  strmsg :='';
  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT  Data0855.Rkey,Data0855.D840_ptr,Data0005.EMPL_CODE,data0840.Location'+
  ' FROM Data0005 INNER JOIN Data0855 ON Data0005.RKEY = Data0855.D005_ptr'+
  ' INNER JOIN data0840 ON dbo.Data0855.D840_ptr = dbo.data0840.rkey'+
  ' where Data0005.EMPL_CODE='''+employee+'''';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
  begin
    Result:=False;
  end
  else
  begin
    strmsg :='责任小组'+DM.tmp.FieldByName('Location').Value+'中已存在该雇员';
    Result :=True;
  end;
end;

procedure Tfrm_EmployeeSet.BitSaveClick(Sender: TObject);
var
  ltype:Integer;
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('人员不能为空，请选择人员');
    Exit;
  end;


  if v_status =0 then
  begin
    if find_Employee(Edit1.Text) then
    begin
      MessageDlg(strmsg,mtInformation,[mbCancel],0);
      Edit1.SetFocus;
      Exit;
    end;
    try
      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text := ' SELECT Data0855.rkey,Data0855.D840_ptr,Data0855.D005_ptr, dbo.Data0855.TTYPE '+
        ' ,Data0855.EntrDate FROM Data0855 where rkey is null';
        Open;
        Append;
        FieldByName('D840_ptr').Value := DM.ADS840rkey.Value;
        FieldByName('D005_ptr').Value := Edit1.Tag;
        if CheckBox1.Checked then
        begin
          FieldByName('TTYPE').Value := 1;
        end
        else
        begin
          FieldByName('TTYPE').Value := 0;
        end;
        FieldByName('EntrDate').Value := DateTimePicker1.Date;
        Post;
        rkey855 := FieldByName('rkey').Value;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(e.Message,mtError,[mbCancel],0);
      end;
    end;
  end
  else
  begin
    if find_Employee(Edit1.Text) and( Edit1.Tag<>vD005_ptr) then
    begin
      MessageDlg(strmsg,mtInformation,[mbCancel],0);
      Edit1.SetFocus;
      Exit;
    end;
    if (DateTimePicker1.Date > DBDateTimeEditEh1.Value) and(DBDateTimeEditEh1.Value <>null) then
    begin
      ShowMessage('入职时间大于离职时间，请重新选择');
      Exit;
    end;
    try
      if CheckBox1.Checked then
      begin
        ltype := 1;
      end
      else
      begin
        ltype:=0;
      end;
      DM.ADOConnection1.BeginTrans;

      with DM.tmp do
      begin
        Close;
        if DBDateTimeEditEh1.Value =null then
        begin
          SQL.Text := ' update data0855 set D005_ptr='+inttostr(Edit1.Tag)+',ttype='+inttostr(ltype)+
          ' ,EntrDate='+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)) + ',DepaDate=null'+
          ' where rkey='+dm.ADS855Rkey.AsString;
        end
        else
        begin
          SQL.Text := ' update data0855 set D005_ptr='+inttostr(Edit1.Tag)+',ttype='+inttostr(ltype)+
          ' ,EntrDate='+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)) +',DepaDate='+
          QuotedStr(FormatDateTime('yyyy-mm-dd',DBDateTimeEditEh1.Value))+' where rkey='+dm.ADS855Rkey.AsString;
        end;
        ExecSQL;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(e.Message,mtError,[mbCancel],0);
      end;
    end;
  end;
end;



end.
