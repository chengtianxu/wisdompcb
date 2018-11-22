unit bominvt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,db;

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
    BitBtn3: TBitBtn;
    Label4: TLabel;
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
    Edit9: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Edit10: TEdit;
    rkey34: TLabel;
    rkey17: TLabel;
    Panel2: TPanel;
    Edit11: TEdit;
    Edit12: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    rkey25: TLabel;
    RadioGroup1: TRadioGroup;
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form_bominvt: TForm_bominvt;

implementation

uses dmunit1,Pick_Item_Single ,ConstVar,common;

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

procedure TForm_bominvt.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'DEPT_CODE/工序代码/110,DEPT_NAME/工序名称/251,'+
                        'STEP_NUMBER/步骤/80';
    InputVar.Sqlstr :=
    'SELECT TOP 100 PERCENT Data0034.DEPT_CODE, Data0034.DEPT_NAME,'+#13+
    'Data0038.STEP_NUMBER, Data0034.RKEY'+#13+
    'FROM         dbo.Data0038 INNER JOIN'+#13+
    ' dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
    'WHERE  (dbo.Data0034.IS_COST_DEPT = 1) and'+#13+
    '(dbo.Data0038.SOURCE_PTR ='+rkey25.caption+')'+#13+
    'ORDER BY dbo.Data0038.STEP_NUMBER';

    inputvar.InPut_value:=edit2.Text;
    inputvar.KeyField:='DEPT_CODE';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit2.Text := trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
      label4.Caption := frmPick_Item_Single.adsPick.Fieldbyname('DEPT_NAME').AsString;
      rkey34.Caption := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      edit9.Text:=frmPick_Item_Single.adsPick.Fieldbyname('STEP_NUMBER').AsString;
      combobox1.Enabled:=false;
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TForm_bominvt.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 if combobox2.ItemIndex=0 then  //标准大料
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    if RadioGroup1.ItemIndex=0 then
    begin
    InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/100,'+
                        'INV_DESCRIPTION/材料规格/120,QUAN_ON_HAND/当前库存/60,'+
                        'unit_name/单位/40,ABBR_NAME/供应商/80,LOCATION/仓库/80';
    InputVar.Sqlstr :=
      'SELECT TOP (100) PERCENT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,'+#13+
      ' Data0017.INV_NAME,data0017.INV_DESCRIPTION,'+#13+
      'SUM(dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_TO_BE_STOCKED) AS QUAN_ON_HAND,'+#13+
      'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.Data0016.LOCATION'+#13+
      'FROM         dbo.Data0017 INNER JOIN'+#13+
      '    dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN'+#13+
      '    dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
      '    dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'+#13+
      '    dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+#13+
      '    dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY'+#13+
      'WHERE   (dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_TO_BE_STOCKED >= 0)'+#13+
      'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
      ' dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.Data0016.LOCATION,data0017.INV_DESCRIPTION'+#13+
      'ORDER BY dbo.Data0017.INV_PART_NUMBER';
    end
     else
      begin
       InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/100,'+
                          'INV_DESCRIPTION/材料规格/120,QUAN_ON_HAND/当前库存/60,'+
                          'unit_name/单位/40,MANUFACTURER_NAME/特别要求/80';
       InputVar.Sqlstr :=
        'SELECT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
        'dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME,'+#13+
        'dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.QUAN_ASSIGN AS QUAN_ON_HAND,'+#13+
        'dbo.Data0017.MANUFACTURER_NAME, '''' as ABBR_NAME'+#13+
        'FROM         dbo.Data0017 INNER JOIN'+#13+
        'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'+#13+
        'WHERE     (dbo.Data0017.STOP_PURCH <> ''Y'')'+#13+
        'ORDER BY dbo.Data0017.INV_PART_NUMBER';
      end;
      
    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER']);
      edit4.Text := frmPick_Item_Single.adsPick.Fieldbyname('INV_NAME').AsString;
      edit5.Text := frmPick_Item_Single.adsPick.Fieldbyname('INV_DESCRIPTION').AsString;
      edit8.Text := frmPick_Item_Single.adsPick.Fieldbyname('unit_name').AsString;
      edit10.Text := frmPick_Item_Single.adsPick.Fieldbyname('QUAN_ON_HAND').AsString;
      rkey17.Caption := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      Edit7.Text := frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').AsString;
      combobox2.Enabled:=false;
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end
 else
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'MAT_CODE/余料编码/110,mat_desc/余料名称/200,'+
                        'QUAN_ON_HAND/当前库存/80,unit_name/单位/40,'+
                        'LEN_SIZE/余料长/60,WEI_SIZE/余料宽/60';
    InputVar.Sqlstr :=
      'SELECT  TOP 100 PERCENT DATA0556.MAT_CODE, DATA0556.mat_desc,'+#13+
      'DATA0556.QUAN_ON_HAND, dbo.DATA0556.LEN_SIZE,'+#13+
      'DATA0556.WEI_SIZE, DATA0556.RKEY, Data0002.UNIT_NAME'+#13+
      'FROM   DATA0556 INNER JOIN'+#13+
      'Data0017 ON DATA0556.RKEY17 = Data0017.RKEY INNER JOIN'+#13+
      'Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY'+#13+
      'ORDER BY DATA0556.MAT_CODE';

    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='MAT_CODE';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['MAT_CODE']);
      edit5.Text := frmPick_Item_Single.adsPick.Fieldbyname('mat_desc').AsString;
      edit8.Text := frmPick_Item_Single.adsPick.Fieldbyname('unit_name').AsString;
      edit10.Text := frmPick_Item_Single.adsPick.Fieldbyname('QUAN_ON_HAND').AsString;
      rkey17.Caption := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      edit11.Text := frmPick_Item_Single.adsPick.Fieldbyname('LEN_SIZE').AsString;
      edit12.Text := frmPick_Item_Single.adsPick.Fieldbyname('WEI_SIZE').AsString;

      combobox2.Enabled:=false;
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
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
if (trim(edit2.Text)='') then
 begin
  showmessage('工序代码不能为空!');
  edit2.SetFocus;
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
 panel2.Visible:=combobox2.ItemIndex=1;
end;

procedure TForm_bominvt.FormActivate(Sender: TObject);
var
 sql_str:string;
begin
 sql_str:='select Data0034.DEPT_CODE, Data0034.DEPT_NAME from data0034 '+
          'where rkey='+rkey34.Caption;
 openquery(dm.TemADOQuery1,sql_str);
 if not dm.TemADOQuery1.IsEmpty then
 begin
  edit2.Text:=dm.TemADOQuery1.fieldbyname('DEPT_CODE').AsString;
  label4.Caption:=dm.TemADOQuery1.fieldbyname('DEPT_NAME').AsString;
 end;

if combobox2.ItemIndex=1 then
 begin
  sql_str:='select  dbo.DATA0556.LEN_SIZE,DATA0556.WEI_SIZE'+#13+
           'from data0556'+#13+
           'where rkey='+rkey17.Caption;
  openquery(dm.TemADOQuery1,sql_str);
  panel2.Visible:=true;
  edit11.Text := dm.TemADOQuery1.Fieldbyname('LEN_SIZE').AsString;
  edit12.Text := dm.TemADOQuery1.Fieldbyname('WEI_SIZE').AsString;
 end;
dm.TemADOQuery1.Close;
end;

end.
