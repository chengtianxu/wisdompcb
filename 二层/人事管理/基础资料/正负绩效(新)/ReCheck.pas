unit ReCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, common, Damo;

type
  TfrmReCheck = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    Label6: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    rg_rtype: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FlagChange();
  public
    { Public declarations }
  end;

var
  frmReCheck: TfrmReCheck;

implementation

{$R *.dfm}

procedure TfrmReCheck.FlagChange();
var
  i: Integer;
begin
  ComboBox1.Items.Clear;
  if RadioGroup1.ItemIndex = 0 then   //奖励类型明细  dictid=12
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=12';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;
  
  if RadioGroup1.ItemIndex = 1 then   //惩罚类型明细  dictid=15
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=15';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(DM.qry1.FieldValues['item']);
end;

procedure TfrmReCheck.FormCreate(Sender: TObject);
var
  Left: Double;
begin
  Label1.Caption :=
    '员工工号: ' + DM.qry1.FieldValues['employeecode'] + ',    '
    + '员工姓名: ' + DM.qry1.FieldValues['chinesename'] + ',    '
    + '所在部门: ' + DM.qry1.FieldValues['departmentname'] + ',    '
    + '入职时间: ' + DateToStr(DM.qry1.FieldValues['ondutytime']);
  {Left := (Self.Width - Label1.Width)/2;
  Label1.Left := Round(Left); }
  if DM.qry1.FieldValues['flag'] = 0 then RadioGroup1.ItemIndex := 0;
  if DM.qry1.FieldValues['flag'] = 1 then RadioGroup1.ItemIndex := 1;
  if DM.qry1.FieldValues['rtype'] = 0 then rg_rtype.ItemIndex := 0;
  if DM.qry1.FieldValues['rtype'] = 1 then rg_rtype.ItemIndex := 1;
  FlagChange();
  DateTimePicker1.Date := DM.qry1.FieldValues['effectdate'];
  Edit2.Text := DM.qry1.fieldByName('money').AsString;
  Memo1.Text := DM.qry1.FieldValues['remark'];
end;

procedure TfrmReCheck.RadioGroup1Click(Sender: TObject);
begin
  FlagChange();
  ComboBox1.ItemIndex := 0;
end;

procedure TfrmReCheck.BitBtn2Click(Sender: TObject);
var
  datadetailRkey: Integer;
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select * from dbo.datadetail where item=' + QuotedStr(ComboBox1.Text);
    Open;
    datadetailRkey := FieldValues['rkey'];

    Close;
    SQL.Clear;
    SQL.Text := Format('update employee_rewards_punishment '
      + ' set flag= %d, type= %d, effectdate= ''%s'', money= %f, remark= ''%s'' '
      + ' where rkey= %d ',
      [RadioGroup1.ItemIndex, datadetailRkey, DateToStr(DateTimePicker1.Date),
      StrToFloat(Edit2.Text), Memo1.Text, DM.qry1.FieldByName('rkey').AsInteger]);
    ExecSQL;
  end;
  ShowMessage('恭喜您，该记录已修改成功！');
  Close;
end;

procedure TfrmReCheck.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
