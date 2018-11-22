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
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
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
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    Label11: TLabel;
    Label13: TLabel;
    Edit10: TEdit;
    rkey17: TLabel;
    Label12: TLabel;
    rg1: TRadioGroup;
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    frmPick_Item : TfrmPick_Item_Single;
  public
    { Public declarations }
   cutno_part:Tstringlist; 
  end;

var
  Form_bominvt: TForm_bominvt;

implementation

uses damo,ConstVar,common;

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

procedure TForm_bominvt.FormCreate(Sender: TObject);
begin
cutno_part:=tstringlist.Create;
end;

procedure TForm_bominvt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
cutno_part.Free;
end;

procedure TForm_bominvt.ComboBox1Change(Sender: TObject);
begin
edit1.Text:=copy(cutno_part.Strings[combobox1.itemindex],1,
                 pos(';',cutno_part.Strings[combobox1.itemindex])-1);
label12.Caption:=copy(cutno_part.Strings[combobox1.itemindex],
                 pos(';',cutno_part.Strings[combobox1.itemindex])+1,
                 length(cutno_part.Strings[combobox1.itemindex])-
                 pos(';',cutno_part.Strings[combobox1.itemindex])
                     );
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
    'SELECT  data0017.RKEY,INV_PART_NUMBER,'+#13+
    'INV_NAME, INV_DESCRIPTION, QUAN_ON_HAND,data0002.unit_name'+#13+
    'FROM   dbo.Data0017 inner join data0002 on'+#13+
    'data0017.STOCK_UNIT_PTR=data0002.rkey'+#13+
    'where Data0017.stop_purch = ''N'''+#13+
    'ORDER BY INV_PART_NUMBER';

    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := dm.ADOConnection1;
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
    if rg1.ItemIndex = 0 then
    begin
     InputVar.Fields := 'prod_code/产品代码/100,product_desc/产品规格/100,part_name/BOM名称/100,'+
                        'qty_ONHAND/当前库存/80,unit_name/单位/40,product_name/产品名称/100,'+
                       'production_teamname/生产班组/80,VENDOR/备注/80';
     InputVar.Sqlstr :=
       ' SELECT Data0008_1.rkey,Data0008_1.PROD_CODE, dbo.wzcp0494.part_name,Data0008_1.PRODUCT_NAME, Data0008_1.PRODUCT_DESC, Data0008_1.qty_onhand,'
               +'dbo.wzcp0495.production_teamname, dbo.wzcp0495.VENDOR, dbo.Data0002.UNIT_NAME'
               +' FROM    dbo.wzcp0495 INNER JOIN'
               +' dbo.wzcp0494 ON dbo.wzcp0495.PARTBOM_PTR = dbo.wzcp0494.rkey INNER JOIN'
               +' dbo.Data0008 ON dbo.wzcp0494.part_ptr = dbo.Data0008.RKEY INNER JOIN'
               +' dbo.Data0008 AS Data0008_1 ON dbo.wzcp0495.INVENT_PTR = Data0008_1.RKEY INNER JOIN'
               +' dbo.Data0002 ON Data0008_1.unit_ptr = dbo.Data0002.RKEY'
               +' WHERE ( not (Data0008_1.rkey in ('+Hint+' )))  AND (dbo.wzcp0494.status = 1) and (data0008.prod_code= ' + QuotedStr(Trim(Edit1.Text))+')';
            //   ShowMessage(inputvar.sqlstr);    //and (dbo.wzcp0495.Invent_or = 1)
    end
    else
      begin
        InputVar.Fields := 'prod_code/产品代码/110,product_name/产品名称/200,'+
                        'product_desc/产品规格/200,'+
                        'qty_ONHAND/当前库存/80,unit_name/单位/40';
        InputVar.Sqlstr :=
         'SELECT  dbo.Data0008.rkey,dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Data0002.UNIT_NAME, dbo.Data0008.qty_onhand '
              +' FROM   dbo.Data0008 INNER JOIN '
              +' dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY'
              +' WHERE ( not (Data0008.rkey in ('+Hint+' ))) and (dbo.Data0008.TTYPE = 0) AND (dbo.Data0008.qty_onhand > 0)';
          //    ShowMessage(inputvar.sqlstr);
      end;
//    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='prod_CODE';
    InputVar.AdoConn := dm.ADOConnection1;
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
if (trim(combobox1.Text)='') then
 begin
  showmessage('生产单号不能为空!');
  combobox1.SetFocus;
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
