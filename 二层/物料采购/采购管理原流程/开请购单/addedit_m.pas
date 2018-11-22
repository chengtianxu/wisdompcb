unit addedit_m;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TForm4 = class(TForm)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
    if_a_e:byte;
  end;

var
  Form4: TForm4;

implementation
uses damo, Unit_search;
{$R *.dfm}

procedure TForm4.Button2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO204.Cancel;
end;

procedure TForm4.Button1Click(Sender: TObject);
var
 desc1,gui_ge,desc2,reason:string;
 G_L_PTR:integer;
begin
 if trim(dbedit1.Text) = '' then
  begin
   messagedlg('第一行描述不能为空!',mtinformation,[mbcancel],0);
   dbedit1.SetFocus;
   exit;
  end;
 if trim(dbedit2.Text) = '' then
  begin
   messagedlg('规格不能为空!',mtinformation,[mbcancel],0);
   dbedit2.SetFocus;
   exit;
  end;
 if trim(dbcombobox1.Text) = '' then
  begin
   messagedlg('请购类别不能为空!',mtinformation,[mbcancel],0);
   dbcombobox1.SetFocus;
   exit;
  end;
 if dbedit3.Field.Value <= 0 then
  begin
   messagedlg('请输入采购数量!',mtinformation,[mbcancel],0);
   dbedit3.SetFocus;
   exit;
  end;

if trim(edit1.Text) = '' then
 begin
  messagedlg('采购单位不能为空',mtinformation,[mbcancel],0);
  edit1.SetFocus;
  exit;
 end;
if trim(dbedit4.Text) = '' then
 begin
  messagedlg('请输入请购原因!',mtinformation,[mbcancel],0);
  dbedit4.SetFocus;
  exit;
 end;
//==============================================================================
 dm.ADO204REQ_DATE.AsString := maskedit1.Text;
 if self.if_a_e=0 then
 begin
 dm.ADO204.Post;
 desc1 := dm.ADO204DESCRIPTION_1.Value;
 gui_ge := dm.ADO204GUI_GE.Value;
 desc2 := dm.ADO204DESCRIPTION_2.Value;
 g_l_ptr := dm.ADO204G_L_PTR.Value;
 reason := dm.ADO204reason.Value;
 dm.ADO204.Append;
 dm.ADO204QUANTITY_REQUIRED.Value := 0;
 dm.ADO204UNIT_PRICE.Value := 0;
 dm.ADO204TAX_FLAG.Value := 'N';
 dm.ADO204PURCHASE_REQ_PTR.Value :=dm.ADO68RKEY.Value; //给主表指针赋值
 dm.ADO204DESCRIPTION_1.Value := desc1;
 dm.ADO204GUI_GE.Value := gui_ge;
 dm.ADO204DESCRIPTION_2.Value := desc2;
 dm.ADO204G_L_PTR.Value := g_l_ptr;
 dm.ADO204reason.Value := reason;
 dbedit1.SetFocus;
 end
else
 begin
  v_close:=1;
  ModalResult :=mrok;
end; 
end;

procedure TForm4.DBEdit3Exit(Sender: TObject);
begin
 if trim(dbedit3.Text)='' then
  dbedit3.Field.Value :=0;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 dm.ADO204.Cancel;
end;

procedure TForm4.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit1.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;
end;

procedure TForm4.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=chr(46)) and (pos('.',(sender as tdbedit).Text)<>0) then abort;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Clear;
  sql.Add('select DESCRIPTION from data0075');
  sql.Add('order by DESCRIPTION');
  open;
  while not eof do
   begin
    dbcombobox1.Items.Add(trim(dm.ADOQuery2.FieldValues['DESCRIPTION']));
    dm.ADOQuery2.Next;
   end;
 end;
end;

procedure TForm4.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
abort;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color = clwindowtext then
 begin
  edit1.Font.Color :=clblue;
  edit1.SelectAll;
 end;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
    and (trim(edit1.Text)<>'') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
   begin
    edit1.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit1.Font.Color := clwindowtext;
    label4.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO204G_L_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('采购单位不正确,请重新输入或选择',mtinformation,[mbok],0);
    label4.Caption := '';
    edit1.SetFocus;
   end;
 finally
  form_unit.free;
 end;

end;

procedure TForm4.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit1.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit1.SetFocus;
   end
  else
  if form_unit.ShowModal=mrok then
   begin
    edit1.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit1.Font.Color := clwindowtext;
    label4.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO204G_L_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    maskedit1.SetFocus;
   end
  else
   edit1.SetFocus;
end;

procedure TForm4.BitBtn3Exit(Sender: TObject);
begin
  form_unit.free;
end;

procedure TForm4.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit4.SetFocus;
end;

procedure TForm4.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit2.SetFocus;
end;

procedure TForm4.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbcombobox1.SetFocus;
end;

procedure TForm4.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit3.SetFocus;
end;

procedure TForm4.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then edit1.SetFocus;
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then maskedit1.SetFocus;
end;

procedure TForm4.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then button1.SetFocus;
end;

end.
