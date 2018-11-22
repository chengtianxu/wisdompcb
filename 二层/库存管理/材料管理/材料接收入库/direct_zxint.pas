unit direct_zxint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TForm7 = class(TForm)
    Label8: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    dtpk1: TDateTimePicker;
    Label10: TLabel;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    rkey16: TLabel;
    rkey02: TLabel;
    Label13: TLabel;
  procedure Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    status:byte;
  end;

var
  Form7: TForm7;

implementation

uses data_module, direct_ware, Unit_search,common, direct_zxlist;

{$R *.dfm}

procedure TForm7.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure TForm7.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=112 then combobox3.DroppedDown:=true;
if key=13 then ComboBox1.SetFocus;
end;

procedure TForm7.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=113 then combobox1.DroppedDown:=true;
if key=13 then edit3.SetFocus;
end;

procedure TForm7.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox2.DroppedDown:=true;
if key=13 then dtpk1.SetFocus;
end;

procedure TForm7.ComboBox1Change(Sender: TObject);
begin
 dm.aq16.MoveBy(combobox1.ItemIndex+1-dm.aq16.RecNo);
 rkey16.Caption:=dm.aq16rkey.AsString;
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
form_unit:=tform_unit.Create(application);
if form_unit.ShowModal=mrok then
 begin
  edit3.Text:=form_unit.ADOQuery1unit_code.Value;
  label13.Caption:=form_unit.ADOQuery1unit_name.Value;
  rkey02.Caption:=form_unit.ADOQuery1rkey.AsString;
  edit4.SetFocus;
 end;
form_unit.Free;
end;

procedure TForm7.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
    and (trim(edit3.Text)<>'') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
 if comparetext(trim(edit3.text),trim(form_unit.ADOQuery1unit_code.Value))=0 then
   begin
    label13.Caption := form_unit.ADOQuery1unit_name.Value;
    rkey02.Caption := form_unit.ADOQuery1rkey.AsString;
   end
  else
   begin
    messagedlg('单位不正确,请重新输入或选择',mtinformation,[mbok],0);
    label13.Caption := '';
    edit3.SetFocus;
   end;
 finally
  form_unit.free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
    and (trim(edit3.Text)='') then
 begin
  label13.Caption := '';
  rkey02.Caption:='0';
 end;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('物品名称不允许为空!');
  edit1.SetFocus;
  exit;
 end;
 if trim(edit2.Text)='' then
 begin
  showmessage('物品规格不允许为空!');
  edit2.SetFocus;
  exit;
 end;
if trim(edit3.Text)='' then
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
if strtofloat(edit4.Text)<=0 then
 begin
  showmessage('入仓数量必须大于零!');
  edit4.SetFocus;
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
  with form10 do
   begin
    strgrid1.Cells[0,strgrid1.RowCount-1] := self.Edit1.Text;//物品名称
    strgrid1.Cells[1,strgrid1.RowCount-1] := self.edit2.Text;//物品规格
    strgrid1.Cells[2,strgrid1.RowCount-1] := self.ComboBox3.Text;//物品类别
    strgrid1.Cells[3,strgrid1.RowCount-1] := self.combobox1.Text;//仓库位置
    strgrid1.Cells[4,strgrid1.RowCount-1] := self.label13.Caption;//单位
    strgrid1.Cells[5,strgrid1.RowCount-1] := self.edit4.Text;//数量
    strgrid1.Cells[6,strgrid1.RowCount-1] := self.edit5.Text;//含税价格
    strgrid1.Cells[7,strgrid1.RowCount-1] := self.edit6.Text;//税率
    strgrid1.Cells[8,strgrid1.RowCount-1] := self.edit7.Text;//备注
    strgrid1.Cells[9,strgrid1.RowCount-1] := self.combobox2.Text;//环保标志
    strgrid1.Cells[10,strgrid1.RowCount-1] := datetostr(dtpk1.Date);//制造日期

    stgrid2.Cells[0,stgrid2.RowCount-1] :='';
    stgrid2.Cells[1,stgrid2.RowCount-1] :=rkey02.Caption;
    stgrid2.Cells[2,stgrid2.RowCount-1] :=rkey16.Caption;
    stgrid2.Cells[3,stgrid2.RowCount-1] :='';
    stgrid2.Cells[4,stgrid2.RowCount-1] :='';

    stgrid2.RowCount:=stgrid2.RowCount+1;
    strgrid1.RowCount:=strgrid1.RowCount+1;
   end;
  rkey02.Caption:='0';
  dtpk1.Date:=getsystem_date(dm.ADOQuery1,1);
  edit1.Text:='';
  edit3.Text:='';
  edit7.Text:='';
  label13.Caption:='';
  edit2.Text:='';
  edit4.Text:='0.0000';
  edit5.Text:='0.000';
  edit6.Text:='0.00';
  edit1.SetFocus;
 end;
end;

procedure TForm7.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm7.Edit6Exit(Sender: TObject);
begin
if edit6.Text = '' then edit6.Text := '0';
 edit6.Text := formatfloat('0.00',strtofloat(edit6.Text));
end;

procedure TForm7.Edit5Exit(Sender: TObject);
begin
if edit5.Text = '' then edit5.Text := '0';
 edit5.Text := formatfloat('0.0000',strtofloat(edit5.Text));
end;

procedure TForm7.Edit4Exit(Sender: TObject);
begin
if edit4.Text = '' then edit4.Text := '0';
 edit4.Text := formatfloat('0.0000',strtofloat(edit4.Text));
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
if  status=1 then
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select unit_code,unit_name from data0002 '+
              'where rkey='+rkey02.Caption;
   open;
   if not isempty then
   edit3.Text:=fieldbyname('unit_code').AsString;
  end;
end;

end.
