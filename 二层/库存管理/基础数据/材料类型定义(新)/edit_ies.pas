unit edit_ies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    ies_rkey: TLabel;
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses damo, IES_search,edit_invt;
{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 try
  form_ies:=tform_ies.Create(application);
  form_ies.Edit1.Text:=trim(edit1.Text);
  if form_ies.aq278.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
   end
  else
  if form_ies.ShowModal=mrok then
   begin
    edit1.Text:=form_ies.aq278PARAMETER_NAME.Value;
    edit1.Font.Color:=clwindowtext;
    label1.Caption:=form_ies.aq278PARAMETER_DESC.Value;
    ies_rkey.Caption:=form_ies.aq278rkey.AsString;
    edit2.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_ies.free;
 end;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color = clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (trim(edit1.Text)<>'') and
    (activecontrol.Name<>'Button2')  then
 try
  form_ies := Tform_ies.Create(Application);
  form_ies.Edit1.Text:=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_ies.aq278PARAMETER_NAME.Value))=0 then
  begin
   edit1.Text:=form_ies.aq278PARAMETER_NAME.Value;
   edit1.Font.Color:=clwindowtext;
   label1.Caption:=form_ies.aq278PARAMETER_DESC.Value;
   ies_rkey.Caption:=form_ies.aq278rkey.AsString;
  end
 else
  begin
   messagedlg('参数名称不正确,请重新输入或选择',mtinformation,[mbok],0);

   edit1.SetFocus;
  end;
 finally
  form_ies.free;
 end
else
 edit1.Font.Color :=clblue;
end;

procedure TForm3.Button1Click(Sender: TObject);
var
 i:byte;
begin
 if trim(edit1.Text)='' then
  begin
   messagedlg('参数名称不能为空!',mtwarning,[mbcancel],0);
   edit1.SetFocus;
   exit;
  end;
if strtoint(label4.Caption)=0 then //新增
 begin
 for i:=1 to form2.SGrid2.RowCount-2 do
  if strtoint(form2.sgrid2.Cells[0,i])=strtoint(ies_rkey.Caption) then
   begin
    messagedlg('参数名称重复!',mtwarning,[mbcancel],0);
    exit;
   end;
 end
else           //在编辑状态下检查是否重复被编辑的记录不需要检查
 for i := 1 to form2.SGrid2.RowCount-2 do
  if i <> form2.sgrid1.Row then
   if strtoint(form2.sgrid2.Cells[0,i])=strtoint(ies_rkey.Caption) then
     begin
      messagedlg('参数名称重复!',mtwarning,[mbcancel],0);
      exit;
     end;
 ModalResult:=mrok;
end;

end.

