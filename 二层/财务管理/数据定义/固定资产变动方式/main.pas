unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,ass_add,ass_edit,common;
{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin

dm.ADOQuery1.Open;
dm.ado0525.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  application.CreateForm(tform_add, form_add);
  form_add.ShowModal;
  form_add.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 application.CreateForm(tform_edit,form_edit);
 if not dm.ADOQuery1.IsEmpty then
 begin
 form_edit.Edit1.Text:=trim(dm.ADOQuery1.FieldValues['fasset_alt_type']);
 if dm.ADOQuery1ALT_FLAG.AsInteger=0 then form_edit.RadioButton1.Checked:=true
  else
    form_edit.RadioButton2.Checked:=true;
 form_edit.ShowModal;
 end
 else
 messagedlg('数据集为空，无法进行编辑！',mtwarning,[mbok],0);
 form_edit.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 dm.ado0525.Parameters[0].Value:=dm.ADOQuery1.FieldValues['rkey'];
 dm.ado0525.Close;
 dm.ado0525.Open;
 if not dm.ado0525.IsEmpty then
  begin
   messagedlg('数据发生冲突,无法删除！',mtwarning,[mbcancel],0);
   exit;
   end;
 if  not dm.ADOQuery1.IsEmpty  then
 begin
  try
  dm.ADOConnection1.BeginTrans;
  if messagedlg('确认要删除该固定资产变动方式吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
  dm.ADOQuery1.Delete ;
  dm.ADOConnection1.CommitTrans;
  messagedlg('数据删除成功',mtinformation,[mbok],0);
  end;
  except
   on e: exception do
   begin
   dm.ADOConnection1.RollbackTrans;
   dm.ADOQuery1.Cancel;
   messagedlg(e.Message,mtwarning,[mbcancel],0);
   end;
  end;
end
 else
  messagedlg('数据集为空，无法删除！',mtwarning,[mbok],0);
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
 end;

end.
