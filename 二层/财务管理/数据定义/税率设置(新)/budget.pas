unit budget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, StdCtrls, DB, ADODB;

type
  TForm_budget = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ToolBar1: TToolBar;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
   v_status,rkey189:Integer;
  end;

var
  Form_budget: TForm_budget;

implementation

uses damo, main;

{$R *.dfm}

procedure TForm_budget.FormActivate(Sender: TObject);
begin
  begin
    if v_status=0 then
    begin
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
    end
    else
    begin
      Edit1.Text:=DM.ds189STATE_ID.AsString;
      Edit2.Text:=DM.ds189NAME.AsString;
      Edit3.Text:=DM.ds189STATE_TAX.AsString;
    end;  
  end;  

end;  

procedure TForm_budget.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',edit3.Text)>0
     then
      abort;
  end;
end;

procedure TForm_budget.SpeedButton6Click(Sender: TObject);
begin
 close;
end;

procedure TForm_budget.SpeedButton7Click(Sender: TObject);
begin
  if trim(edit1.text)='' then
  begin
    MessageDlg('请输入代号！',mtInformation,[MbOk],0);
    edit1.SetFocus ;
    exit;
  end;
  if trim(edit2.text)='' then
  begin
    MessageDlg('请输入有效的名称！',mtInformation,[MbOk],0);
    edit2.SetFocus ;
    exit;
  end;
  if strtofloat(trim(edit3.text))<=0 then
  begin
    MessageDlg('请输入有效的税率！',mtInformation,[MbOk],0);
    edit3.SetFocus ;
    exit;
  end;
if Self.v_status=0  then
 begin
  try
  dm.ADOConnection1.BeginTrans;
  with dm.ADOQuery1 do
   begin
    close;
    SQL.Text:=
    'select rkey,STATE_ID,NAME,STATE_TAX from data0189 where rkey is null ';
    Open;
    Append;
    Fieldbyname('state_id').asstring:=Edit1.Text;
    Fieldbyname('name').asstring:=Edit2.Text;
    Fieldbyname('STATE_TAX').asstring:=Edit3.Text;
    Post;
   end;
   dm.ADOConnection1.CommitTrans;
   ModalResult:=mrOk;

  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

 end
else
if Self.v_status=1 then

 begin
 try
  dm.ADOConnection1.BeginTrans;
  with dm.ADOQuery1 do
  begin
   Close;
   sql.Text:=
   'select rkey,STATE_ID,NAME,STATE_TAX from data0189 where rkey ='+inttostr(rkey189);
   open;
   Edit;
   FieldByName('STATE_ID').AsString:=edit1.Text;
   FieldByName('NAME').AsString:=edit2.Text;
   FieldByName('STATE_TAX').AsString:=Edit3.Text;
   Post;
  end;
  dm.ADOConnection1.CommitTrans;
   ModalResult:=mrok;

 except
 on E: Exception do
  begin
  dm.ADOConnection1.RollbackTrans;
  messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end;
 end;

end;

end.
