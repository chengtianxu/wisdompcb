unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    OldGridWnd : TWndMethod;

   procedure NewGridWnd(var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses damo,ass_add,ass_edit,common;
{$R *.dfm}
procedure tform1.NewGridWnd(var message:tmessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1);
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not App_Init(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption :=Application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
application.CreateForm(tform_add,form_add);
form_add.ShowModal;
self.DBGrid1.SetFocus;
form_add.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
application.CreateForm(tform_edit,form_edit);
if not dm.ADOQuery1.IsEmpty then
 begin
  form_edit.Edit1.Text :=dm.ADOQuery1FASSET_TYPE.AsString;
  form_edit.Edit2.Text:=dm.ADOQuery1expected_life.AsString;
  form_edit.Edit3.Text:=dm.ADOQuery1expected_surplus_rate.AsString;
  form_edit.Edit4.Text:=dm.ADOQuery1prechar1.AsString;
  case dm.ADOQuery1.FieldByName('depr_mthd_ptr').AsInteger of
   0: form_edit.RadioButton1.Checked:=true;
   1: form_edit.RadioButton2.Checked:=true;
   2: form_edit.RadioButton3.Checked:=true;
   3: form_edit.RadioButton4.Checked:=true;
   4: form_edit.RadioButton5.Checked:=true;
  end;
 form_edit.ShowModal ;
 dbgrid1.SetFocus;
 end
 else
  messagedlg('数据集为空,无法进行编辑!',mtwarning,[mbok],0);
form_edit.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if not dm.ADOQuery1.IsEmpty then
 begin
  if messagedlg('确认要删除该固定资产类别吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
   dm.ADOQuery1.Delete;
   dbgrid1.SetFocus;
 end
 else
  messagedlg('数据集为空,无法进行删除!',mtwarning,[mbok],0);
end;  

procedure TForm1.FormShow(Sender: TObject);
begin

  dm.ADOQuery1.open;
end;

end.
