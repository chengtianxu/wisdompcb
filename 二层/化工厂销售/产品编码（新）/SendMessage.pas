unit SendMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DM_u, common, Grids, DBGridEh, DB, ADODB;

type
  TFrmMessage = class(TForm)
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    StringGrid1: TStringGrid;
    qry1RKEY: TAutoIncField;
    qry1USER_FULL_NAME: TStringField;
    qry1USER_LOGIN_NAME: TStringField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMessage: TFrmMessage;

implementation

{$R *.dfm}

procedure TFrmMessage.FormCreate(Sender: TObject);
begin
  qry1.Close;
  qry1.Open;
  StringGrid1.Cells[0,0] := '工号';
  StringGrid1.Cells[1,0] := '姓名';
  StringGrid1.ColWidths[2] := 0;
end;

procedure TFrmMessage.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if Trim(StringGrid1.Cells [0,i]) = qry1USER_LOGIN_NAME.AsString then
    begin
      ShowMessage('不能重复添加人员');
      Exit;
    end;
  end;
  StringGrid1.Cells[0, StringGrid1.RowCount - 1] := qry1USER_LOGIN_NAME.AsString;
  StringGrid1.Cells[1, StringGrid1.RowCount - 1] := qry1USER_FULL_NAME.AsString;
  StringGrid1.Cells[2, StringGrid1.RowCount - 1] := qry1RKEY.AsString;
  StringGrid1.RowCount := StringGrid1.RowCount + 1;
end;

procedure TFrmMessage.BitBtn2Click(Sender: TObject);
var
  i, rkey73tmp, rkey14tmp: Integer;
begin
  if Trim(StringGrid1.Cells[0,1]) = '' then
  begin
    Exit;
  end;
  try
    DM.ADOCon.BeginTrans;
    with DM.Tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select data0073.rkey from data0073 inner join data0005 on data0073.employee_ptr=data0005.rkey '
        + ' where data0005.rkey = ' + user_ptr;
      Open;
      if not IsEmpty then rkey73tmp := FieldValues['rkey'];

      Close;
      SQL.Clear;
      SQL.Text := Format('insert into data0014(MESSAGE, senddate, whosend) '
        + ' values(''%s'', ''%s'', %d)', [Memo1.Text, DateTimeToStr(Now), rkey73tmp]);
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.text := 'SELECT IDENT_CURRENT(''data0014'') as rkey';
      Open;
      rkey14tmp := FieldValues['rkey'];  

      for i := 1 to StringGrid1.RowCount - 2 do
      begin
        Close;
        SQL.Clear;
        SQL.Text := Format('insert into data0314(emp_ptr, d14_ptr) '
          + ' values(%d, %d)', [ StrToInt(StringGrid1.Cells[2,i]), rkey14tmp]);
        ExecSQL;
      end;
    end;
    DM.ADOCon.CommitTrans;
    ShowMessage('发送成功');
    ModalResult := mrOk;
  except
    DM.ADOCon.RollbackTrans;
    ShowMessage('发送失败！');
  end;
end;

procedure TFrmMessage.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
