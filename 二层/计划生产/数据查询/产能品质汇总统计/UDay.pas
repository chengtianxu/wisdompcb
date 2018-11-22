unit UDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DM;

type
  TFrmUDay = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUDay: TFrmUDay;

implementation

{$R *.dfm}

procedure TFrmUDay.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  if Edit1.Text ='' then
  begin
    showmessage('您输入的有效计算天数为空，保存失败！');
    Exit;
  end;
  if damo.UDayStr = '' then
  begin
    showmessage('请先选择要修改的部门(控制项目)，保存失败！');
    Exit;
  end;
  with Damo.qrytemp do
  begin
    SQL.Clear;
    SQL.Text := 'update dbo.Data0729 set MFinalProTax = (MProNum / (' + Edit1.Text
      + '*DTarNum))*100 where rkey in (' + Damo.UDayStr + ')';
    if MessageDlg('您确定要保存吗？', mtInformation, [mbYes, mbNo], 1) = mryes then
    begin
      ExecSQL;
      ShowMessage('保存成功！');     
    end;
  end;
  close;
  damo.qry729s.Close;
  damo.qry729s.Open;
end;

procedure TFrmUDay.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
