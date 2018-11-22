unit FinishFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmFinish = class(TForm)
    Label1: TLabel;
    edt1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edt3: TEdit;
    Label4: TLabel;
    edt4: TEdit;
    Label5: TLabel;
    edt2: TEdit;
    mmo1: TMemo;
    btn1: TBitBtn;
    btn2: TBitBtn;
    Lbl1: TLabel;
    edt5: TEdit;
    Lbl2: TLabel;
    edt6: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  FrmFinish: TFrmFinish;

implementation

uses
  common, Damo;

{$R *.dfm}

procedure TFrmFinish.FormShow(Sender: TObject);
begin
  with DM.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select convert(varchar(100),getdate(),23) as NowDate, EMPLOYEE_NAME from data0005 '
      + ' where rkey=' + user_ptr;
    Open;
    if not IsEmpty then
    begin
      edt1.Text := 'YS'+ FieldValues['NowDate'] + '_';
      edt5.Text := DM.qryMainPrice.AsString;
      edt6.Text := Copy(DM.qryMainEnt_Date.AsString, 0 ,10);
      edt3.Text := FieldValues['NowDate'];
      edt4.Text := FieldValues['EMPLOYEE_NAME'];
    end;
  end;
end;

procedure TFrmFinish.btn1Click(Sender: TObject);
begin
  if Trim(edt2.Text) = '' then
  begin
    ShowMessage('价格不能为空，请输入价格！');
    edt2.SetFocus;
    Exit;
  end;
  if StrToDate(edt3.Text) < StrToDate(edt6.Text) then
  begin
    ShowMessage('确认失败，外发时间大于验收时间，请检查！');
    edt2.SetFocus;
    Exit;
  end;
  try
    DM.ADOConnection1.BeginTrans;
    with DM.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Format('insert into WZCP0089(Rec_No, External_Rkey, Price, Check_Person, Remark, PutIntoRkey) '
        + ' values(''%s'', %d, %d, %d, ''%s'', %d)', [edt1.Text, DM.qryMainrkey.Value, StrToInt(edt2.Text),
        StrToInt(user_ptr), mmo1.Text, DM.qryMainPutIntoRkey.Value]);
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text := 'update WZCP0088 set status=3 where rkey= ' + DM.qryMainrkey.AsString;
      ExecSQL;
      ShowMessage('该外发单已验收成功！');
      ModalResult := mrOk;
    end;
    DM.ADOConnection1.CommitTrans;
  except
    ShowMessage('保存失败，请联系管理员...');
    DM.ADOConnection1.RollbackTrans;
  end;
end;

procedure TFrmFinish.btn2Click(Sender: TObject);
begin
  Close;
end;

end.
