unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    BitBtn1: TBitBtn;
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
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Application.CreateForm(Tform_add,form_add);
 form_add.ShowModal;
  form_add.Free;;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 application.CreateForm( tform_edit,form_edit);
 form_edit.RadioGroup1.ItemIndex:=dm.ADOQuery1IN_DEPRECIATION.Value ;
 form_edit.Edit1.Text:=trim(dm.ADOQuery1FASSET_STATUS.AsString);
 form_edit.ShowModal;
 form_edit.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if not dm.ADOQuery1.IsEmpty then
 begin
  if messagedlg('确认要删除该固定资产变动类别吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  dm.ADOQuery1.Delete ;
 end
else
 messagedlg('数据集为空，无法进行删除！',mtwarning,[mbok],0);
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
