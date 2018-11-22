unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DB, ExtCtrls, StdCtrls, Grids, DBGridEh, Buttons;

type
  TForm_main = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Edit4: TEdit;
    Label6: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridEh2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses demo,common, Usel;

{$R *.dfm}


procedure TForm_main.Edit2KeyPress(Sender: TObject; var Key: Char);
var a,b,c: string;
begin
 if key=#13 then
 begin
  if edit4.Text='' then Exit;
  if Edit1.Text='' then
  begin
    Label3.Caption:='提示:配料单号不能为空!';
   Edit1.SetFocus;
    Edit4.Clear;
    Exit;
  end;
  if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
  begin
    messagedlg('对不起!您没有发料权限,请联系管理员',mtinformation,[mbok],0);
    Edit4.Clear;
    Exit;
  end;
  try
     with DM.ADOQuery3 do
   begin
    Close;
    SQL.Text :='SELECT * FROM DATA0492 WHERE CUT_NO= '+QuotedStr(Edit1.Text);
    Open;
    if not fieldBYName('ConfMan').IsNull then
    begin
      Label3.Caption:='提示:此配料单已领料完成!';
      DM.ADOQuery1.Close;
      DM.ADOQuery1.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADOQuery1.Open;
      Edit1.Clear;
      //Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Exit;
    end;

    if IsEmpty then
    begin
      Label3.Caption:= '提示:没有此配料单!';
      Edit1.SetFocus;
      Edit1.Clear;
      Edit4.Clear;
      Exit;
    end;
   end;
  except
   Label3.Caption:='异常,尝试重启程序或联系管理员';
  end;

  try
    DM.ADOQuery3.Close;
    DM.ADOQuery3.SQL.Text:='SELECT chinesename, employeecode, rkey, ICCardno FROM dbo.employeemsg'
                          +' WHERE employeecode= '+QuotedStr(Edit4.Text);
    DM.ADOQuery3.Open;
    if not DM.ADOQuery3.IsEmpty then
    begin
      Edit4.Text:=DM.ADOQuery3.fieldBYName('employeecode').AsString;
      edit3.Text:=DM.ADOQuery3.fieldBYName('chinesename').AsString;
      DM.ADOQuery3.Close;
      DM.ADOQuery3.SQL.Text:='update DATA0492 set ConfMan = '+ QuotedStr(Edit4.Text)+' WHERE CUT_NO= '+ QuotedStr(Edit1.Text);
      DM.ADOQuery3.ExecSQL;
      Label3.Caption:='领料成功!';
      Edit1.Clear;
      Edit4.Clear;
      Edit3.Clear;
      DM.ADOQuery1.Close;
      DM.ADOQuery1.Open;
      //DM.ADOQuery1.Close;
      Edit1.SetFocus;
    end
    else
    begin
      Label3.Caption:='系统没有此员工！';
      //Edit2.Text:='';
      Edit3.Text:='';
      Edit4.Text:='';
      Edit4.SetFocus;
      Exit;
    end;
  except
   Label3.Caption:='异常,尝试重启程序或联系管理员';
   end;
 end;

end;

procedure TForm_main.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 Label3.Caption:='';
 if Key = #13 then
 begin

     label3.Caption:='';
  if Edit1.Text='' then
   begin
    Label3.Caption:='提示:配料单号不能为空!';
    Edit1.SetFocus;
    Edit4.Clear;
    Exit;
   end;
  try
   with DM.ADOQuery3 do
   begin
    Close;
    SQL.Text :='SELECT * FROM DATA0492 WHERE CUT_NO= '+QuotedStr(Edit1.Text);
    Open;
    if not fieldBYName('ConfMan').IsNull then
    begin
      Label3.Caption:='提示:此配料单已领料完成!';
      DM.ADOQuery1.Close;
      DM.ADOQuery1.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADOQuery1.Open;
      Edit1.Clear;
      //Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Exit;
    end;

    if IsEmpty then
    begin
      Label3.Caption:= '提示:没有此配料单!';
      Edit1.SetFocus;
      Edit1.Clear;
      Exit;
    end;
   end;
    DM.ADOQuery1.Close;
    DM.ADOQuery1.Parameters[0].Value:=Trim(Edit1.Text);
    DM.ADOQuery1.Open;
    DM.ADOQuery2.Close;
    DM.ADOQuery2.Parameters[0].Value:= DM.ADOQuery1.FieldValues['CUT_NO'] ;
    DM.ADOQuery2.Open;
    Edit4.SetFocus;
    Edit4.Clear;
    Edit3.Clear;
  except
   Label3.Caption:='异常,尝试重启程序或联系管理员';
  end;
  end;
end;

procedure TForm_main.Edit1Enter(Sender: TObject);
begin
 Edit4.Color:= clScrollBar;
end;

procedure TForm_main.Edit1Exit(Sender: TObject);
begin
 edit4.Color:=clWindow;
 
end;

procedure TForm_main.Edit2Enter(Sender: TObject);
begin
  Edit1.Color:= clScrollBar;
end;

procedure TForm_main.Edit2Exit(Sender: TObject);
begin
 edit1.Color:=clWindow;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConnection1) then
   begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
   end;
//  rkey73:= '3685';
//  user_ptr:='4330'; //员工代码05.rey
//  vprev:= '4';
    self.Caption:=application.Title;
end;

procedure TForm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if gdSelected in State then
    Exit;
  if DM.ADOQuery1.RecNo mod 2 = 0 then
    DBGridEh1.Canvas.Brush.Color := clInfoBk
  else
    DBGridEh1.Canvas.Brush.Color := RGB(191, 255, 223);
    DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    DBGridEh1.Canvas.Pen.Color := $00C08000;
    DBGridEh1.Canvas.MoveTo(Rect.Left, Rect.Bottom);
    DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
    DBGridEh1.Canvas.MoveTo(Rect.Right, Rect.Top);
    DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
end;

procedure TForm_main.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if gdSelected in State then
    Exit;
  if DM.ADOQuery1.RecNo mod 2 = 0 then
    DBGridEh1.Canvas.Brush.Color := clInfoBk
  else
    DBGridEh2.Canvas.Brush.Color := RGB(191, 255, 223);
    DBGridEh2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    DBGridEh2.Canvas.Pen.Color := $00C08000;
    DBGridEh2.Canvas.MoveTo(Rect.Left, Rect.Bottom);
    DBGridEh2.Canvas.LineTo(Rect.Right, Rect.Bottom);
    DBGridEh2.Canvas.MoveTo(Rect.Right, Rect.Top);
    DBGridEh2.Canvas.LineTo(Rect.Right, Rect.Bottom);
end;

procedure TForm_main.DBGridEh1DblClick(Sender: TObject);
begin
 Edit1.SetFocus;
 Exit;
end;

procedure TForm_main.DBGridEh1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Edit1.SetFocus;
 Exit;
end;

procedure TForm_main.DBGridEh2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Edit1.SetFocus;
 Exit;
end;

procedure TForm_main.DBGridEh2DblClick(Sender: TObject);
begin
 Edit1.SetFocus;
 Exit;
end;

procedure TForm_main.FormShow(Sender: TObject);
begin
 DM.ADO6.Close;
 DM.ADO6.Parameters[0].Value:=StrToInt(rkey73);
 DM.ADO6.Open;
 Label7.Caption:='欢迎您:' + DM.ADO6.FieldByName('USER_FULL_NAME').AsString+'!' ;
end;

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
  try
    Form_sel:=TForm_sel.Create(Application);
    Form_sel.ShowModal;
  finally
    Form_sel.Free;
    end;
end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
begin
 Application.Terminate;
end;

end.
