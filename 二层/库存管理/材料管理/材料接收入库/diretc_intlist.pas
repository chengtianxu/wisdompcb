unit diretc_intlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    rkey17: TLabel;
    rkey16: TLabel;
    rkey02: TLabel;
    Label9: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    SHELF_LIFE: TLabel;
    ComboBox2: TComboBox;
    Label11: TLabel;
    dtpk1: TDateTimePicker;
    Label12: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   STOCK_BASE:currency;
  public
    { Public declarations }
     status:byte;
  end;

var
  Form5: TForm5;

implementation

uses inv_search, data_module, direct_ware, Unit_search,common;

{$R *.dfm}

procedure TForm5.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure TForm5.ComboBox1Change(Sender: TObject);
begin
 dm.aq16.MoveBy(combobox1.ItemIndex+1-dm.aq16.RecNo);
 rkey16.Caption:=dm.aq16rkey.AsString;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  try
    form_inv := tform_inv.Create(application);
    form_inv.ADOQuery1.Close;
    form_inv.ADOQuery1.Parameters.ParamByName('INV_NAME').Value:='%'+trim(edit1.Text)+'%';
    form_inv.ADOQuery1.Open;
    if form_inv.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
      edit2.SetFocus;
    end
    else
    if form_inv.ShowModal = mrok then
    begin
      edit1.Text:=form_inv.ADOQuery1INV_PART_NUMBER.Value;
      edit7.Text:=form_inv.ADOQuery1INV_NAME.Value;
      edit8.Text:=form_inv.ADOQuery1INV_DESCRIPTION.Value;
      rkey17.Caption:=form_inv.ADOQuery1RKEY.AsString;
      rkey02.Caption:=form_inv.ADOQuery1STOCK_UNIT_PTR.AsString;
      edit2.Text:=form_inv.ADOQuery1unit_code.Value;
      label9.Caption:=form_inv.ADOQuery1unit_name.Value;
      SHELF_LIFE.Caption:=form_inv.adoquery1SHELF_LIFE.asstring;
      self.dtpk1.Date:= getsystem_date(dm.ADOQuery1,1);// +form_inv.adoquery1SHELF_LIFE.Value
      STOCK_BASE:=form_inv.ADOQuery1STOCK_BASE.Value;
      combobox1.SetFocus;
    end
    else
      edit1.SetFocus;
  finally
    form_inv.free;
  end;
end;

procedure TForm5.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2')
   and (trim(edit1.Text)<>'') then
 try
  form_inv := tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters.ParamByName('INV_NAME').Value:='%'+trim(edit1.Text)+'%';
  form_inv.ADOQuery1.Open;
  if comparetext(trim(edit1.text),trim(form_inv.ADOQuery1inv_part_number.Value))=0 then
   begin
    if form_inv.ADOQuery1RKEY.Value<>strtoint(rkey17.Caption) then
     begin
      edit7.Text:=form_inv.ADOQuery1INV_NAME.Value;
      edit8.Text:=form_inv.ADOQuery1INV_DESCRIPTION.Value;
      rkey17.Caption:=form_inv.ADOQuery1RKEY.AsString;
      rkey02.Caption:=form_inv.ADOQuery1STOCK_UNIT_PTR.AsString;
      edit2.Text:=form_inv.ADOQuery1unit_code.Value;
      label9.Caption:=form_inv.ADOQuery1unit_name.Value;
      SHELF_LIFE.Caption:=form_inv.adoquery1SHELF_LIFE.asstring;
      self.dtpk1.Date:= getsystem_date(dm.ADOQuery1,1) +form_inv.adoquery1SHELF_LIFE.Value;
      STOCK_BASE:=form_inv.ADOQuery1STOCK_BASE.Value;
     end;
   end
  else
   begin
    messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
    edit7.Text:='';
    edit8.Text:='';
    edit1.SetFocus;
   end;
 finally
  form_inv.Free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2')
 and (trim(edit1.Text) = '') then
 begin
  label8.Caption := '';
  rkey17.Caption:='0';
  rkey02.Caption:='0';
  edit2.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  label9.Caption:='';
 end;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
form_unit:=tform_unit.Create(application);
if form_unit.ShowModal=mrok then
 begin
  edit2.Text:=form_unit.ADOQuery1unit_code.Value;
  label9.Caption:=form_unit.ADOQuery1unit_name.Value;
  rkey02.Caption:=form_unit.ADOQuery1rkey.AsString;
  edit3.SetFocus;
 end;
form_unit.Free;
end;

procedure TForm5.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
    and (trim(edit2.Text)<>'') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_unit.ADOQuery1unit_code.Value))=0 then
   begin
    label9.Caption := form_unit.ADOQuery1unit_name.Value;
    rkey02.Caption := form_unit.ADOQuery1rkey.AsString;
   end
  else
   begin
    messagedlg('单位不正确,请重新输入或选择',mtinformation,[mbok],0);
    label9.Caption := '';
    edit2.SetFocus;
   end;
 finally
  form_unit.free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
    and (trim(edit2.Text)='') then
 begin
  label9.Caption := '';
  rkey02.Caption:='0';
 end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin

if trim(edit1.Text)='' then
 begin
  showmessage('材料编码不允许为空!');
  edit1.SetFocus;
  exit;
 end;
if trim(edit2.Text)='' then
 begin
  showmessage('单位不允许为空!');
  edit2.SetFocus;
  exit;
 end;
if strtoint(rkey16.Caption)=0 then
 begin
  showmessage('入仓位置不允许为空!');
  combobox1.SetFocus;
  exit;
 end;
if strtofloat(edit3.Text)<=0 then
 begin
  showmessage('入仓数量必须大于零!');
  edit3.SetFocus;
  exit;
 end;
 if dtpk1.Date>common.getsystem_date(dm.tmp,1) then
 begin
   showmsg('入仓记录制造日期大于当前日期,不符合要求,请修改相关制造日期!',1);
   dtpk1.SetFocus;
   Exit;
 end;
 if status=1 then
 begin
  self.ModalResult:=mrok;
 end
 else
 begin
  with form4 do
   begin
    strgrid1.Cells[0,strgrid1.RowCount-1] := self.Edit1.Text;
    strgrid1.Cells[1,strgrid1.RowCount-1] := self.edit7.Text;
    strgrid1.Cells[2,strgrid1.RowCount-1] := self.edit8.Text;
    strgrid1.Cells[3,strgrid1.RowCount-1] := self.combobox1.Text;
    strgrid1.Cells[4,strgrid1.RowCount-1] := self.label9.Caption;
    strgrid1.Cells[5,strgrid1.RowCount-1] := self.edit3.Text;
    strgrid1.Cells[6,strgrid1.RowCount-1] := self.edit4.Text;
    strgrid1.Cells[7,strgrid1.RowCount-1] := self.edit5.Text;
    strgrid1.Cells[8,strgrid1.RowCount-1] := self.edit6.Text;
    strgrid1.Cells[9,strgrid1.RowCount-1] := self.combobox2.Text;
    strgrid1.Cells[10,strgrid1.RowCount-1] := datetostr(dtpk1.Date);

    stgrid2.Cells[0,stgrid2.RowCount-1] :=rkey17.Caption;
    stgrid2.Cells[1,stgrid2.RowCount-1] :=rkey02.Caption;
    stgrid2.Cells[2,stgrid2.RowCount-1] :=rkey16.Caption;
    stgrid2.Cells[3,stgrid2.RowCount-1] :=SHELF_LIFE.Caption;
    stgrid2.Cells[4,stgrid2.RowCount-1] :=currtostr(self.STOCK_BASE);

    stgrid2.RowCount:=stgrid2.RowCount+1;
    strgrid1.RowCount:=strgrid1.RowCount+1;
   end;
  rkey17.Caption:='0';
  rkey02.Caption:='0';
  SHELF_LIFE.Caption:='0';
  dtpk1.Date:=getsystem_date(dm.ADOQuery1,1);
  edit1.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  label9.Caption:='';
  edit2.Text:='';
  edit3.Text:='0.0000';
  edit4.Text:='0.000';
  edit5.Text:='0.00';
  edit1.SetFocus;
 end;
end;

procedure TForm5.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm5.Edit5Exit(Sender: TObject);
begin
if edit5.Text = '' then edit5.Text := '0';
 edit5.Text := formatfloat('0.00',strtofloat(edit5.Text));
end;

procedure TForm5.Edit4Exit(Sender: TObject);
begin
if edit4.Text = '' then edit4.Text := '0';
 edit4.Text := formatfloat('0.0000',strtofloat(edit4.Text));
end;

procedure TForm5.Edit3Exit(Sender: TObject);
begin
if edit3.Text = '' then edit3.Text := '0';
 edit3.Text := formatfloat('0.0000',strtofloat(edit3.Text));
end;

procedure TForm5.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=113 then combobox1.DroppedDown:=true;
if key=13 then edit3.SetFocus;
end;

procedure TForm5.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox2.DroppedDown:=true;
if key=13 then dtpk1.SetFocus;
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
if  status=1 then
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select unit_code,unit_name from data0002 '+
              'where rkey='+rkey02.Caption;
   open;
   if not isempty then
   edit2.Text:=fieldbyname('unit_code').AsString;
  end;
end;

end.

