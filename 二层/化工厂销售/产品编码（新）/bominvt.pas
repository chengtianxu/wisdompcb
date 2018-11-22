unit bominvt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,db,Pick_Item_Single;

type
  TForm_bominvt = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn4: TBitBtn;
    Label10: TLabel;
    Edit8: TEdit;
    Label13: TLabel;
    Edit10: TEdit;
    rkey17: TLabel;
    Label11: TLabel;
    ComboBox2: TComboBox;
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    frmPick_Item : TfrmPick_Item_Single;
  public
    { Public declarations }

  end;

var
  Form_bominvt: TForm_bominvt;

implementation

uses DM_u,ConstVar,common;

{$R *.dfm}

procedure TForm_bominvt.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#13,#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit6.Text)>0  then abort;
end;

procedure TForm_bominvt.Edit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as tedit).Text)='' then
 (sender as tedit).Text:='0';
end;

procedure TForm_bominvt.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 if combobox2.ItemIndex=0 then  //标准大料
  try
    frmPick_Item := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'INV_PART_NUMBER/材料编码/110,INV_NAME/材料名称/120,'+
                        'INV_DESCRIPTION/材料规格/120,QUAN_ON_HAND/当前库存/80,'+
                        'unit_name/单位/80';
    InputVar.Sqlstr :=
    'SELECT TOP 100 PERCENT data0017.RKEY,INV_PART_NUMBER,'+#13+
    'INV_NAME, INV_DESCRIPTION, QUAN_ON_HAND,data0002.unit_name'+#13+
    'FROM   dbo.Data0017 inner join data0002 on'+#13+
    'data0017.STOCK_UNIT_PTR=data0002.rkey'+#13+
    'where Data0017.stop_purch = ''N'''+#13+
    'ORDER BY INV_PART_NUMBER';

    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := dm.ADOCon;
    frmPick_Item.InitForm_New(InputVar);
    if frmPick_Item.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item.adsPick.FieldValues['INV_PART_NUMBER']);
      edit4.Text := frmPick_Item.adsPick.Fieldbyname('INV_NAME').AsString;
      edit5.Text := frmPick_Item.adsPick.Fieldbyname('INV_DESCRIPTION').AsString;
      edit8.Text := frmPick_Item.adsPick.Fieldbyname('unit_name').AsString;
      edit10.Text := frmPick_Item.adsPick.Fieldbyname('QUAN_ON_HAND').AsString;
      rkey17.Caption := frmPick_Item.adsPick.Fieldbyname('rkey').AsString;
      combobox2.Enabled:=false;
      edit6.SetFocus;
     end;
  finally
    frmPick_Item.adsPick.Close;
    frmPick_Item.Free ;
  end
 else
  try
    frmPick_Item := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'prod_code/产品代码/110,product_name/产品名称/200,'+
                        'product_desc/产品规格/200,'+
                        'qty_ONHAND/当前库存/80,unit_name/单位/40';
    InputVar.Sqlstr :=
      'SELECT  TOP 100 PERCENT DATA0008.prod_CODE, DATA0008.product_desc,'+#13+
      'DATA0008.qty_ONHAND,DATA0008.product_name, '+#13+
      'DATA0008.RKEY, Data0002.UNIT_NAME'+#13+
      'FROM   DATA0008 INNER JOIN'+#13+
      'Data0002 ON DATA0008.UNIT_PTR = Data0002.RKEY'+#13+
      'where data0008.ttype=0 and data0008.rkey<>'+dm.D08RKEY.AsString+
      ' ORDER BY DATA0008.prod_CODE';

    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='prod_CODE';
    InputVar.AdoConn := dm.ADOCon;
    frmPick_Item.InitForm_New(InputVar);
    if frmPick_Item.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item.adsPick.FieldValues['prod_CODE']);
      edit4.Text := frmPick_Item.adsPick.Fieldbyname('product_name').AsString;
      edit5.Text := frmPick_Item.adsPick.Fieldbyname('product_desc').AsString;
      edit8.Text := frmPick_Item.adsPick.Fieldbyname('unit_name').AsString;
      edit10.Text := frmPick_Item.adsPick.Fieldbyname('qty_ONHAND').AsString;
      rkey17.Caption := frmPick_Item.adsPick.Fieldbyname('rkey').AsString;
      combobox2.Enabled:=false;
      edit6.SetFocus;
     end;
  finally
    frmPick_Item.adsPick.Close;
    frmPick_Item.Free ;
  end;
end;

procedure TForm_bominvt.BitBtn1Click(Sender: TObject);
begin
if (strtofloat(edit6.Text)=0) then
 begin
  showmessage('配额数量不能为零!');
  edit6.SetFocus;
  exit;
 end;

if (trim(edit3.Text)='') then
 begin
  showmessage('材料编码不能为空!');
  edit3.SetFocus;
  exit;
 end;

 self.ModalResult:=mrok ;
end;

procedure TForm_bominvt.ComboBox2Change(Sender: TObject);
begin
if combobox2.ItemIndex=0 then
 begin
  label5.Caption:='材料编码';
  label6.Caption:='材料名称';
  label7.Caption:='材料规格';
 end
else
 begin
  label5.Caption:='产品编码';
  label6.Caption:='产品名称';
  label7.Caption:='产品规格';
 end;
end;

procedure TForm_bominvt.FormActivate(Sender: TObject);
begin
 ComboBox2Change(nil);
end;

end.
