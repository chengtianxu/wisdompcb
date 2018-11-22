unit uCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Menus, Grids;

type
  TfrmCondition = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    ListBox3: TListBox;
    StaticText4: TStaticText;
    Button3: TButton;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    DTPk5: TDateTimePicker;
    Label9: TLabel;
    Label7: TLabel;
    DTPk6: TDateTimePicker;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    _SearchStr:string;
  end;

var
  frmCondition: TfrmCondition;

implementation

uses uCostom, uEmployee, uProduct;

{$R *.dfm}

procedure TfrmCondition.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmCondition.FormShow(Sender: TObject);
begin
 ListBox3.ItemIndex :=0;
 ListBox3Click(nil);
end;
//输入条件
procedure TfrmCondition.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;

bitbtn6.Visible:=true;

case listbox3.ItemIndex of
 0,1:begin
    bitbtn6.Visible:=false;
   end;
 2:begin
    bitbtn6.Visible:=true;

   end;
 3:begin
    bitbtn6.Visible:=true;

   end;
 4:begin
    bitbtn6.Visible:=true;
   end;
 5:bitbtn6.Visible:=false;
end;
end;
// 客户,业务代表,产品类型
procedure TfrmCondition.BitBtn6Click(Sender: TObject);
begin
 case listbox3.ItemIndex of
2:     //客户
 begin
  frmCostom:=TfrmCostom.Create(application);
  if frmCostom.ShowModal=mrok then
   begin
    edit3.Text:=trim(frmCostom.Query1CUST_CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  frmCostom.free;
 end;
3:           //业务员
 begin
  frmEmployee:=TfrmEmployee.Create(application);
  if frmEmployee.ShowModal=mrok then
   begin
    edit3.Text:=trim(frmEmployee.Query1EMPL_CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  frmEmployee.free;
 end;
4:           //产品类型
 begin
  frmProduct:=TfrmProduct.Create(application);
  if frmProduct.ShowModal=mrok then
   begin
    edit3.Text:=trim(frmProduct.Query1PROD_CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  frmProduct.free;
 end;
end;
end;
 //增加条件
procedure TfrmCondition.Button3Click(Sender: TObject);
var
 i:integer;
begin
 for i:=0 to sgrid1.RowCount-1 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;

case listbox3.ItemIndex of
 0:                                                               //本厂编号
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0085.REF_PART_NO LIKE '''+edit3.Text+'%''';
 1:                                                              //客户型号
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0085.cust_PART_NO LIKE '''+edit3.Text+'%''';
 2:                                                              //客户代码
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0010.cust_code LIKE '''+edit3.Text+'%''';
 3:                                                              //业务代表
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0005_1.empl_code LIKE '''+edit3.Text+'%''';
 4:                                                             //产品型号
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0008.prod_code LIKE '''+edit3.Text+'%''';
 5:                                                             //产品型号
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0085.TNUMBER LIKE ''%'+edit3.Text+'%''';

 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;
//开始查询
procedure TfrmCondition.BitBtn1Click(Sender: TObject);
var
 i:integer;
 vstr:string;
begin

 vstr:=' WHERE ';
 //日期
 vstr:=vstr+' data0085.qte_DATE>='''+datetostr(dtpk5.date)+'''';
 vstr:=vstr+' and data0085.qte_DATE <= '''+datetostr(dtpk6.date)+'''';

 // 审核状态
 case RadioGroup1.ItemIndex of
  0: vstr:=vstr+' and data0085.AUDITED_STATUS<>3';
  1: vstr:=vstr+' and data0085.AUDITED_STATUS=3';
 end;
 for i:=0 to sgrid1.RowCount-2 do
  begin
   vstr:=vstr+' and ';
   vstr:=vstr+sgrid1.Cells[2,i];
  end;
 _SearchStr:=vstr;
 ModalResult:=mrOK;
end;
//清除条件
procedure TfrmCondition.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=0 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=1;
end;
//删除条件
procedure TfrmCondition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;

end;

procedure TfrmCondition.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

end.
