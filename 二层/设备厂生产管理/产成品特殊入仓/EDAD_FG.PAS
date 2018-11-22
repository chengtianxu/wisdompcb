unit edad_fg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BitBtn4: TBitBtn;
    Label13: TLabel;
    rkey16: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    rkey50: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   v_type:byte; 
  end;

var
  Form2: TForm2;

implementation

uses main, warehouse_search, location_search, main_one, custpart_search,
  damo, so_list;

{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit11.Text)>0  then abort;
end;

procedure TForm2.Edit10Click(Sender: TObject);
begin
if edit10.Font.Color=clwindowtext then
 begin
  edit10.SelectAll;
  edit10.Font.Color:=clblue;
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
 try
  form_lo:=Tform_lo.create(application);
  form_lo.ADOQuery1.SQL.Insert(2,'where whouse_ptr='+dm.ADO416warehouse_ptr.AsString+
  ' and LOCATION_TYPE=1');
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

    edit12.SetFocus;
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
  form_lo.ADOQuery1.SQL.Insert(2,'where whouse_ptr='+dm.ADO416warehouse_ptr.asstring);
  form_lo.adoquery1.Open;
  form_lo.Edit1.Text := trim(edit10.Text);
  if comparetext(trim(edit10.text),trim(form_lo.ADOQuery1.Fieldbyname('code').AsString))=0 then
   begin
    EDIT10.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit10.Font.Color := clwindowtext;
    label13.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16.Caption := form_lo.ADOQuery1.fieldbyname('rkey').AsString;
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

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 IF v_type=1 then //新增
  begin
   self.ModalResult:=mrok;
  end
 else //编辑
  begin
    ModalResult:=mrok;
  end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit2.Text)='' then
 begin
  messagedlg('请输入仓产品编码!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;
if trim(edit10.Text)='' then
 begin
  messagedlg('请输入仓库代码!',mtinformation,[mbok],0);
  edit10.SetFocus;
  exit;
 end;
if strtocurr(edit11.Text)=0 then
 begin
  messagedlg('数量必需大于零!',mtinformation,[mbok],0);
  edit11.SetFocus;
  exit;
 end;
end;

procedure TForm2.Edit11Exit(Sender: TObject);
begin
    if trim(edit11.Text)='' then edit11.Text := '0';
    edit11.Text:=formatfloat('0.00',strtocurr(edit11.Text));
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
  if dm.ADO416type.Value=4 then Exit;
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn5') AND
   (trim(edit2.Text)<>'') then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0008.rkey, data0008.PROD_CODE,PRODUCT_NAME , data0008.new_price , ');
    sql.Add('data0002.unit_name,PRODUCT_DESC');
    sql.Add('from data0008 inner join data0002');
    sql.Add('on data0008.unit_ptr=data0002.rkey');
    sql.Add('where data0008.PROD_CODE='''+trim(edit2.Text)+'''');
    sql.Add('and data0008.dept_ptr='+dm.ADO416dept_ptr.AsString);
    open;
   end;
  if not dm.ADOQuery1.IsEmpty then
   begin
    edit2.Font.Color := clwindowtext;
    edit1.Text:=dm.ADOQuery1.FieldValues['unit_name'];
    label5.Caption := dm.ADOQuery1.FieldValues['PRODUCT_NAME'];
    rkey50.Caption := dm.ADOQuery1.Fieldbyname('rkey').AsString;
    Edit4.Text:= '';
    Edit4.Text:= dm.ADOQuery1.Fieldbyname('new_price').AsString;
   end
  else
   begin
    messagedlg('请输入正确的客户部品!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
   end;
 end
else
 begin
  rkey50.Caption := '0';
  label5.Caption := '';
 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
if dm.ADO416type.Value=1 then
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  frmcustpart.ADOQuery1.Close;
  frmcustpart.ADOQuery1.Parameters[0].Value:=dm.ADO416dept_ptr.Value;
  frmcustpart.ADOQuery1.Open;
  
  frmcustpart.Edit1.Text := trim(edit2.Text);
  if frmcustpart.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtInformation,[mbok],0);
    edit2.SetFocus;
   end
  else
  if frmcustpart.ShowModal=mrok then
   begin
    EDIT2.Text := trim(frmcustpart.ADOQuery1PROD_CODE.Value);
    edit2.Font.Color := clwindowtext;
    label5.Caption := frmcustpart.ADOQuery1PRODUCT_NAME.Value;
    label6.Caption := frmcustpart.ADOQuery1PRODUCT_DESC.Value;
    rkey50.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
    Edit4.Text:= frmcustpart.ADOQuery1new_price.AsString;
    edit1.Text:=frmcustpart.ADOQuery1unit_name.Value;
    edit11.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  frmcustpart.free;
 end
else
 try
  form_solist:=tform_solist.Create(application);
  form_solist.AqD63.Close;
  form_solist.AqD63.Parameters[0].Value:=dm.ADO416so_ptr.Value;
  form_solist.AqD63.Open;
  if form_solist.AqD63.IsEmpty then
   Messagedlg('没有找到可再退货的记录!',mtinformation,[mbok],0)
  else
  if form_solist.ShowModal=mrok then
   begin
    edit2.Text:=form_solist.AqD63PROD_CODE.Value;
    edit2.Font.Color := clwindowtext;
    label5.Caption := form_solist.AqD63PRODUCT_NAME.Value;
    rkey50.Caption := form_solist.AqD63prod_ptr.AsString;
    edit1.Text:=form_solist.AqD63UNIT_NAME.Value;
    rkey16.Caption:=form_solist.AqD63location_ptr.AsString;
    edit10.Text:=form_solist.AqD63CODE.Value;
    label13.Caption:=form_solist.AqD63LOCATION.Value;
    edit11.SetFocus;
   end;
 except
  form_solist.Free;
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  if (self.v_type=2) and (dm.ADO416type.Value<>4) then edit11.SetFocus;
  if dm.ADO416type.Value = 4 then Edit10.SetFocus;
end;

procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  DotPos,Len:integer;
begin
  DotPos:=pos('.',(Sender   as   TEdit).Text);
  Len:=length((Sender   as   TEdit).Text);
  if key in ['0'..'9','.',#8] then
  begin
          if key in ['0'..'9'] then
              if (DotPos>0) and (DotPos<=Len-2) and ((Sender as TEdit).SelStart>=DotPos) then
                  key:=#0;
          if key in ['.'] then
          if (DotPos>0) then
          begin
                key:=#0;
                exit;
          end;

  end else
  begin
      key:=#0;
      abort;
  end;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
  if trim(edit4.Text)='' then edit4.Text := '0';
  edit4.Text:=formatfloat('0.00',strtocurr(edit4.Text));
  if length(Trim(edit4.Text)) > 11 then
  begin
        ShowMessage('数据不在合理范围以内，请修改');
        edit4.Text := '0.00';
        edit4.SetFocus;
        edit4.SelectAll;
  end;
end;

end.
