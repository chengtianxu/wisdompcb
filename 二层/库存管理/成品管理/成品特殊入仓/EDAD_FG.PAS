unit edad_fg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    rkey15: TLabel;
    rkey16: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    rkey50: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit10Click(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   v_type:byte; 
  end;

var
  Form2: TForm2;

implementation

uses main, warehouse_search, location_search, main_one, custpart_search;

{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
TRY
 form_wh:=tform_wh.Create(application);
 form_wh.Edit1.Text := trim(edit9.Text);
 if form_wh.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
   edit9.SetFocus;
  end
 else
 if form_wh.ShowModal=mrok then
  begin
   edit9.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   edit9.Font.Color := clwindowtext;
   label12.Caption := form_wh.ADOQuery1.FieldValues['abbr_name'];
   rkey15.Caption :=form_wh.ADOQuery1.fieldbyname('rkey').AsString;
   edit10.SetFocus;
  end
 else
  edit9.SetFocus;
FINALLY
 form_wh.free;
END;
end;

procedure TForm2.Edit10Click(Sender: TObject);
begin
if edit10.Font.Color=clwindowtext then
 begin
  edit10.SelectAll;
  edit10.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit9Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') AND
   (trim(edit9.Text)<>'') then
 try
  form_wh:=Tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit9.Text);
  if comparetext(trim(edit9.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
   begin
    edit9.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
    edit9.Font.Color := clwindowtext;
    label12.Caption :=form_wh.ADOQuery1.fieldbyname('abbr_name').AsString;
    rkey15.Caption := form_wh.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的仓库代码!',mterror,[mbcancel],0);
    edit9.SetFocus;
   end;
 finally
  form_wh.free;
 end
else
 begin
  label12.Caption := '';
  rkey15.Caption := '0';
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
 try
  form_lo:=Tform_lo.create(application);
  if strtoint(rkey15.Caption)<>0 then
   form_lo.ADOQuery1.SQL.Insert(3,'and whouse_ptr='+rkey15.Caption);
  form_lo.adoquery1.Open;
  form_lo.Edit1.Text := trim(edit10.Text);
  if form_lo.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit10.SetFocus;
   end
  else
  if form_lo.ShowModal=mrok then
   begin
    EDIT10.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit10.Font.Color := clwindowtext;
    label13.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16.Caption :=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
    if strtoint(rkey15.Caption)=0 then
     begin
      rkey15.Caption :=form_lo.ADOQuery1.fieldbyname('whouse_ptr').AsString;
      edit9.Text:=form_lo.ADOQuery1.fieldbyname('warehouse_code').AsString;
      edit9.Font.Color:=clwindowtext;
      label12.Caption:=form_lo.ADOQuery1.fieldbyname('abbr_name').AsString;
     end;
    edit11.SetFocus;
   end
  else
   edit10.SetFocus;
 finally
  form_lo.free;
 end;
end;

procedure TForm2.Edit10Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4')
   and (trim(edit10.Text)<>'') then
 try
  form_lo:=Tform_lo.Create(application);
  if strtoint(rkey15.Caption)<>0 then
   form_lo.ADOQuery1.SQL.Insert(3,'and whouse_ptr='+rkey15.Caption);
  form_lo.adoquery1.Open;
  form_lo.Edit1.Text := trim(edit10.Text);
  if comparetext(trim(edit10.text),trim(form_lo.ADOQuery1.Fieldbyname('code').AsString))=0 then
   begin
    EDIT10.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit10.Font.Color := clwindowtext;
    label13.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16.Caption := form_lo.ADOQuery1.fieldbyname('rkey').AsString;
    if strtoint(rkey15.Caption)=0 then
     begin
      rkey15.Caption :=form_lo.ADOQuery1.fieldbyname('whouse_ptr').AsString;
      edit9.Text:=form_lo.ADOQuery1.fieldbyname('warehouse_code').AsString;
      edit9.Font.Color:=clwindowtext;
      label12.Caption:=form_lo.ADOQuery1.fieldbyname('warehouse_name').AsString;
     end;
   end
  else
   begin
    messagedlg('请输入正确的位置代码!',mterror,[mbcancel],0);
    edit10.SetFocus;
   end;
 finally
  form_lo.free;
 end
else
 begin
  label13.Caption := '';
  rkey16.Caption := '0';
 end;
end;

procedure TForm2.Edit9Click(Sender: TObject);
begin
if edit9.Font.Color=clwindowtext then
 begin
  edit9.SelectAll;
  edit9.Font.Color:=clblue;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 IF v_type=1 then //新增
  begin
   self.ModalResult:=mrok;
  end
 else //编辑
  begin

   IF strtofloat(edit11.Text) < form1.ADO53QUANTITY.Value-form1.ADO53QTY_ON_HAND.Value then
   begin
    messagedlg('数量必须大于等于'+
    floattostr(form1.ADO53QUANTITY.Value-form1.ADO53QTY_ON_HAND.Value),mtinformation,[mbok],0);
    edit11.SetFocus;
    exit;
   end;

   ModalResult:=mrok;
  end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit9.Text)='' then
 begin
  messagedlg('请输入厂房代码!',mtinformation,[mbok],0);
  edit9.SetFocus;
  exit;
 end;
if trim(edit10.Text)='' then
 begin
  messagedlg('请输入仓库代码!',mtinformation,[mbok],0);
  edit10.SetFocus;
  exit;
 end;
if strtoint(edit11.Text)=0 then
 begin
  messagedlg('数量必需大于零!',mtinformation,[mbok],0);
  edit11.SetFocus;
  exit;
 end;
end;

procedure TForm2.Edit11Exit(Sender: TObject);
begin
if trim(edit11.Text)='' then
 edit11.Text := '0';
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn5') AND
   (trim(edit2.Text)<>'') then
 try
  frmcustpart:=Tfrmcustpart.Create(application);

  frmcustpart.Edit1.Text := trim(edit2.Text);
  if Comparetext(trim(edit2.Text),trim(frmcustpart.ADOQuery1.Fieldbyname('manu_part_number').AsString))=0 then
   begin
    EDIT2.Text := trim(frmcustpart.ADOQuery1.FieldValues['manu_part_number']);
    edit2.Font.Color := clwindowtext;
    label5.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];

    rkey50.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的客户部品!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
   end;
 finally
  frmcustpart.free;
 end
else
 begin

  rkey50.Caption := '0';
  label5.Caption := '';

 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  frmcustpart.Edit1.Text := trim(edit2.Text);
  if frmcustpart.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
  if frmcustpart.ShowModal=mrok then
   begin
    EDIT2.Text := trim(frmcustpart.ADOQuery1.FieldValues['manu_part_number']);
    edit2.Font.Color := clwindowtext;
    label5.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];

    rkey50.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
    edit9.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  frmcustpart.free;
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if self.v_type=2 then   edit11.SetFocus;
end;

end.
