unit Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, ComCtrls, DB, ADODB;

type
  TForm_Reg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label8: TLabel;
    DateTimePicker5: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    ADOemployeemsg: TADODataSet;
    ADOemployeemsgrkey: TAutoIncField;
    ADOemployeemsgemployeecode: TWideStringField;
    ADOemployeemsgchinesename: TWideStringField;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    i:Integer;
  end;

var
  Form_Reg: TForm_Reg;

implementation

uses dmo, Single, common;

{$R *.dfm}

procedure TForm_Reg.FormCreate(Sender: TObject);
begin
  DM.ADOAskForLeave.Open;
end;

procedure TForm_Reg.BitBtn1Click(Sender: TObject);
begin
  try
    Form_Single:=TForm_Single.Create(Application);
    DM.ADOemployeemsg.Close;
    if Trim(Edit1.Text)<>'' then
    begin
      DM.ADOemployeemsg.Parameters[0].Value:=StrToInt(Trim(Edit1.Text));
//      Form_Single.Edit1.Enabled:=False;
    end
    else
    begin
      dm.ADOemployeemsg.Parameters[0].Value:='';
    end;
    DM.ADOemployeemsg.Open;
    if DM.ADOemployeemsg.IsEmpty then
      begin
         messagedlg('没有员工或已离职!',mtinformation,[mbok],0);
         Edit1.SetFocus;
      end
    else
    begin
      if Form_Single.ShowModal=mrok then
      begin
        Edit1.Text:=DM.ADOemployeemsgemployeecode.Value;
        Edit1.Font.Color:=clWindowText;
        Label9.Caption:=DM.ADOemployeemsgchinesename.Value;
      end;
    end;
  finally
    Form_Single.Free;
  end;
end;

procedure TForm_Reg.BitBtn3Click(Sender: TObject);
begin
  DM.ADOQuery1.Cancel;
  Close;
end;

procedure TForm_Reg.BitBtn2Click(Sender: TObject);
begin
  with DM.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey from employeemsg where employeecode='''+trim(Edit1.Text)+'''';
    Open;
    DM.ADOQuery1employeeid.Value:=DM.ADOQuery2.FieldValues['rkey'];
  end;

  DM.ADOAskForLeave.Close;
  DM.ADOAskForLeave.Parameters[0].Value:=Trim(ComboBox1.Text);
  DM.ADOAskForLeave.Open;
  DM.ADOQuery1leavetype.Value:=DM.ADOAskForLeaverkey.Value;

  DM.ADOQuery1startdate.Value:=DateTimePicker1.Date;
  DateTimePicker3.Date:=DateTimePicker1.Date;
  DM.ADOQuery1starttime.Value:=DateTimePicker3.DateTime;

  DM.ADOQuery1enddate.Value:=DateTimePicker2.Date;
  DateTimePicker4.Date:=DateTimePicker2.Date;
  DM.ADOQuery1endtime.Value:=DateTimePicker4.DateTime;

  if DateTimePicker3.DateTime>=DateTimePicker4.DateTime then
  begin
    ShowMessage('开始时间不能大于结束时间');
    DateTimePicker1.SetFocus;
    Exit;
  end;

  DM.ADO0073.Close;
  DM.ADO0073.Parameters[0].Value:=rkey73;
  DM.ADO0073.Open;
  DM.ADOQuery1RegisterMan.Value:=DM.ADO0073employee_ptr.Value;
//  DM.ADOQuery1RegisterMan.Value:=781;
  DM.ADOQuery1makedate.Value:=DateTimePicker5.DateTime;
  if CheckBox1.Checked then
    DM.ADOQuery1CurStatus.Value:=1
  else
    DM.ADOQuery1CurStatus.Value:=0;
  DM.ADOQuery1leavereason.Value:=Trim(Edit2.Text);
  DM.ADOQuery1remark.Value:=Trim(Edit3.Text);
  DM.ADOQuery1.Post;
  ModalResult:=mrOk;
end;

procedure TForm_Reg.Edit1Exit(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('请输入员工工号');
    BitBtn1.SetFocus;
    Exit;
  end
  else
  begin
    with DM.ADOQuery2 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select * from employeemsg where employeecode='''+Trim(Edit1.Text)+''' and [status]=1');
      Active:=True;
      if IsEmpty then
      begin
        ShowMessage('没有此工号或此员工已离职');
        Edit1.SetFocus;
        Exit;
      end;
    end;
  end;
end;

end.
