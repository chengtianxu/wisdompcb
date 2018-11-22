unit invt_insert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label8: TLabel;
    rkey05: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    rkey17: TLabel;
    rkey16: TLabel;
    rkey22: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    supp_name :string;
  end;

var
  Form5: TForm5;

implementation
uses damo, inv_serach, invt_received, employee_search, phy_counts;
{$R *.dfm}

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
try
 form_inv:=tform_inv.Create(application);
 if form_inv.ShowModal=mrok then
  begin
   form6:=tform6.Create(application);
   form6.ADOQuery1.Close;
   form6.ADOQuery1.Parameters[0].Value:=dm.ADO92WHOUSE_PTR.Value;
   form6.ADOQuery1.Parameters[1].Value:=form_inv.ADOQuery1RKEY.Value;
   form6.ADOQuery1.Open;
   form6.Caption:='库存材料:'+form_inv.ADOQuery1INV_PART_NUMBER.Value+'入仓记录';
   if form6.ADOQuery1.IsEmpty then
    begin
     messagedlg('对不起!该材料从未入过仓!',mtinformation,[mbok],0);
    end
   else
   if form6.ShowModal=mrok then
    begin
     edit1.Text:=form_inv.ADOQuery1INV_PART_NUMBER.Value;
     label9.Caption:=form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
     edit8.Text:=form_inv.ADOQuery1group_name.Value;
     label11.Caption:=form_inv.ADOQuery1group_desc.Value;
     edit2.Text:=form6.ADOQuery1CODE.Value;
     edit3.Text:=form6.ADOQuery1LOCATION.Value;
     edit4.Text:=form6.ADOQuery1BARCODE_ID.Value;
     edit5.Text:=formatfloat('0.0000',form6.ADOQuery1QUAN_ON_HAND.value);
     rkey17.Caption:=form6.ADOQuery1INVENTORY_PTR.AsString;
     rkey22.Caption:=form6.ADOQuery1RKEY.AsString;
     rkey16.Caption:=form6.ADOQuery1LOCATION_PTR.AsString;
     supp_name := form6.adoquery1abbr_name.value;
     edit6.SetFocus;
    end;
   form6.free;
  end;
finally
 form_inv.free;
end;
end;

procedure TForm5.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',edit6.Text)>0
    then abort;
end;

procedure TForm5.Edit6Exit(Sender: TObject);
begin
 if trim(edit6.Text)='' then edit6.Text := '0';
 edit6.Text:=formatfloat('0.0000',strtofloat(edit6.Text));
end;

procedure TForm5.Edit7Click(Sender: TObject);
begin
if edit7.Font.Color=clwindowtext then
 begin
  edit7.SelectAll;
  edit7.Font.Color:=clblue;
 end;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
try
 form_employee:=tform_employee.Create(application);
 form_employee.Edit1.Text:=trim(edit7.Text);
 if form_employee.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit7.SetFocus;
  end
 else
 if form_employee.ShowModal=mrok then
  begin
   edit7.Text:=form_employee.ADOQuery1.FieldValues['empl_code'];
   edit7.Font.Color:=clwindowtext;
   label8.Caption:=form_employee.ADOQuery1employee_name.Value;
   rkey05.Caption:=form_employee.ADOQuery1rkey.AsString;
   bitbtn1.SetFocus;
  end
 else
  edit7.SetFocus;
finally
 form_employee.free;
end;
end;

procedure TForm5.Edit7Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn2')
   and (trim(edit7.Text)<>'') then
 try
  form_employee:=Tform_employee.Create(application);
  form_employee.Edit1.Text := trim(edit7.Text);
  if comparetext(trim(edit7.text),trim(form_employee.ADOQuery1.Fieldbyname('empl_code').AsString))=0 then
   begin
    EDIT7.Text := form_employee.ADOQuery1.fieldbyname('empl_code').AsString;
    edit7.Font.Color := clwindowtext;
    label8.Caption :=form_employee.ADOQuery1.fieldbyname('employee_name').AsString;
    rkey05.Caption:=form_employee.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的清点人员代码!',mterror,[mbcancel],0);
    edit7.SetFocus;
   end;
 finally
  form_employee.free;
 end
else
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn2')
   and (trim(edit7.Text)='') then
 begin
  label8.Caption:='';
  rkey05.Caption:='0';
 end;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
 if strtoint(rkey17.caption)=0 then
  begin
   messagedlg('请选择正确的库存原材料！',mtinformation,[mbok],0);
   bitbtn3.SetFocus;
   exit;
  end;
 if strtoint(rkey05.caption)=0 then
  begin
   messagedlg('请选择正确的清点人员！',mtinformation,[mbok],0);
   edit7.SetFocus;
   exit;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if strtofloat(edit6.Text)<=0 then
 if messagedlg('新增部件盘点数量应该大于零!是否继承?',mtconfirmation,[mbyes,mbno],0)=mrno then
  begin
   edit6.SetFocus;
   exit;
  end;
 for i:=1 to form4.sgrid2.RowCount-2 do
 if strtoint(form4.sgrid2.Cells[1,i])=strtoint(rkey22.Caption) then
  begin
   messagedlg('该批材料已经在盘点清单中!',mtinformation,[mbok],0);
   exit;
  end;

 ModalResult:=mrok;
end;

end.
