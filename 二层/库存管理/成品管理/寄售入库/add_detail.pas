unit add_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    btnSave: TSpeedButton;
    btnExit: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit9: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Lab_rkey10: TLabel;
    Lab_rkey25: TLabel;
    Lab_rkey01: TLabel;
    Label13: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word;
     Shift: TShiftState);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; //是否正常退出(0非正常退出，1正常退出)
  public
    { Public declarations }
   status:integer; //0:新增1:编辑
  end;

var
  Form2: TForm2;

implementation

uses damo,Pick_Item_Single ,ConstVar,common, DB;

{$R *.dfm}
procedure TForm2.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
  InputVar.Sqlstr:='SELECT data0010.rkey,Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
  'data0010.abbr_name,data0010.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'data0001.BASE_TO_OTHER'+#13+
  'FROM dbo.Data0010 inner join data0001'+#13+
  'on data0010.CURRENCY_PTR=data0001.rkey'+#13+
  'where data0010.DO_SMOOTHING=1'+#13+
  'order by data0010.cust_code';
  inputvar.KeyField:='CUST_CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
    label11.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_NAME').AsString;
    lab_rkey10.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
    edit4.Text:= frmPick_Item_Single.adsPick.Fieldbyname('CURR_CODE').AsString;
    label13.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('CURR_NAME').AsString;
    Lab_rkey01.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CURRENCY_PTR').AsString;
    edit6.Text:= frmPick_Item_Single.adsPick.Fieldbyname('BASE_TO_OTHER').AsString;
    if strtoint(Lab_rkey01.Caption)=1 then
     edit6.ReadOnly:=true
    else
     edit6.ReadOnly:=false;
    edit2.SetFocus;
{    edit2.Text:='';
    label12.Caption:='';
    Lab_rkey25.Caption:='0';
 }       
  end
  else edit1.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var InputVar: PDlgInput ;
   cust_ptr:string;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
      'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
     if strtoint(Lab_rkey10.Caption)>0 then
      cust_ptr :='and Data0025.CUSTOMER_PTR='+Lab_rkey10.Caption
     else
      cust_ptr :='';
    InputVar.Sqlstr :='SELECT Data0025.PROD_CODE_PTR, Data0008.PROD_CODE,'+#13+
      'Data0008.PRODUCT_NAME, Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'+#13+
      'Data0010.ABBR_NAME, Data0025.RKEY AS rkey25,Data0025.CUSTOMER_PTR,'+#13+
      'Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,data0001.BASE_TO_OTHER,'+#13+
      'Data0025.ANALYSIS_CODE_2, Data0025.set_lngth, Data0025.set_width,'+#13+
      'Data0025.set_qty,data0010.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME'+#13+
      'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
      'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN Data0010 '+
      'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'+#13+
      'data0001 on data0010.CURRENCY_PTR=data0001.rkey'+#13+
      'where data0025.PARENT_PTR is null and data0010.DO_SMOOTHING=1'+#13+
      cust_ptr+#13+
      'order by dbo.Data0025.MANU_PART_NUMBER';
  inputvar.KeyField:='MANU_PART_NUMBER';
  inputvar.InPut_value:=edit2.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
    label12.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('MANU_PART_DESC').AsString;
    Lab_rkey25.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('rkey25').AsString;
    if strtoint(Lab_rkey10.Caption)=0 then
    begin
     Lab_rkey10.Caption :=frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_PTR').AsString;
     edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     label11.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_NAME').AsString;
     edit4.Text:= frmPick_Item_Single.adsPick.Fieldbyname('CURR_CODE').AsString;
     label13.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('CURR_NAME').AsString;
     Lab_rkey01.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CURRENCY_PTR').AsString;
     edit6.Text:= frmPick_Item_Single.adsPick.Fieldbyname('BASE_TO_OTHER').AsString;
     if strtoint(Lab_rkey01.Caption)=1 then
      edit6.ReadOnly:=true
     else
      edit6.ReadOnly:=false;
    end;
    edit3.SetFocus;
  end
  else edit2.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TForm2.btnExitClick(Sender: TObject);
begin
if trim(edit2.Text)<>'' then
if messagedlg('你确定不保存退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  v_close:=1; //正常退出
  self.ModalResult:=mrcancel;
 end
else
else
 begin
  v_close:=1; //正常退出
  self.ModalResult:=mrcancel;
 end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CURR_CODE/货币代码/110,CURR_NAME/货币名称/251,BASE_TO_OTHER/汇率/125';
  InputVar.Sqlstr:='SELECT data0001.rkey,Data0001.CURR_CODE, Data0001.CURR_NAME,'+#13+
  'data0001.BASE_TO_OTHER'+#13+
  'FROM  data0001'+#13+
  'order by data0001.CURR_CODE';
  inputvar.KeyField:='CURR_CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit4.Text:= frmPick_Item_Single.adsPick.Fieldbyname('CURR_CODE').AsString;
    label13.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('CURR_NAME').AsString;
    Lab_rkey01.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
    edit6.Text:= frmPick_Item_Single.adsPick.Fieldbyname('BASE_TO_OTHER').AsString;
    if strtoint(Lab_rkey01.Caption)=1 then
     edit6.ReadOnly:=true
    else
     edit6.ReadOnly:=false;
    edit5.SetFocus;
  end
  else edit4.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  label11.Caption:='';
  lab_rkey10.Caption:='0';
  edit2.Text:='';
  label12.Caption:='';
  Lab_rkey25.Caption:='0';
  edit4.Text:='';
  label13.Caption:='';
  Lab_rkey01.Caption:='0';
  edit6.Text:='0';
 end
else
if ActiveControl.Name<>'BitBtn1' then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
  'SELECT data0010.rkey,Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
  'data0010.abbr_name,data0010.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'data0001.BASE_TO_OTHER'+#13+
  'FROM dbo.Data0010 inner join data0001'+#13+
  'on data0010.CURRENCY_PTR=data0001.rkey'+#13+
  'where data0010.DO_SMOOTHING=1'+#13+
  'and Data0010.CUST_CODE='+quotedstr(trim(edit1.Text))+#13;
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('客户代码不正确',1);
    edit1.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>strtoint(Lab_rkey10.Caption) then
    begin
    edit1.Text:=trim(dm.ADOQuery1.FieldValues['CUST_CODE']);
    label11.Caption:= dm.ADOQuery1.Fieldbyname('CUSTOMER_NAME').AsString;
    lab_rkey10.Caption:=dm.ADOQuery1.Fieldbyname('rkey').AsString;
    edit4.Text:= dm.ADOQuery1.Fieldbyname('CURR_CODE').AsString;
    label13.Caption:= dm.ADOQuery1.Fieldbyname('CURR_NAME').AsString;
    Lab_rkey01.Caption:=dm.ADOQuery1.Fieldbyname('CURRENCY_PTR').AsString;
    edit6.Text:= dm.ADOQuery1.Fieldbyname('BASE_TO_OTHER').AsString;
    if strtoint(Lab_rkey01.Caption)=1 then
     edit6.ReadOnly :=true
    else
     edit6.ReadOnly:=false;    
{    edit2.Text:='';
    label12.Caption:='';
    Lab_rkey25.Caption:='0';
 }   
    end;
 end;
end;

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as Tedit).Text)>0  then abort;
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
if trim(edit6.Text)='' then
 begin
  showmessage('汇率数据输入有误!');
  edit6.SetFocus;
 end
else
 if strtofloat(edit6.Text)<=0 then
  begin
   showmessage('汇率数据输入有误!');
   edit6.SetFocus;
  end
 else
  begin
   edit6.Text:=formatfloat('0.00000000',strtofloat(edit6.Text));
  end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
var
 cust_ptr:string;
begin
if trim(edit2.Text)='' then
 begin
  label12.Caption:='';
  Lab_rkey25.Caption:='0';
 end
else
if ActiveControl.Name<>'BitBtn2' then
 begin
  if strtoint(Lab_rkey10.Caption)>0 then
   cust_ptr :='and Data0025.CUSTOMER_PTR='+Lab_rkey10.Caption
  else
   cust_ptr :='';
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
     'SELECT Data0025.PROD_CODE_PTR, Data0008.PROD_CODE,'+#13+
      'Data0008.PRODUCT_NAME, Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'+#13+
      'Data0010.ABBR_NAME, Data0025.RKEY AS rkey25,Data0025.CUSTOMER_PTR,'+#13+
      'Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,data0001.BASE_TO_OTHER,'+#13+
      'Data0025.ANALYSIS_CODE_2, Data0025.set_lngth, Data0025.set_width,'+#13+
      'Data0025.set_qty,data0010.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME'+#13+
      'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
      'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN Data0010 '+
      'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'+#13+
      'data0001 on data0010.CURRENCY_PTR=data0001.rkey'+#13+
      'where data0025.PARENT_PTR is null and data0010.DO_SMOOTHING=1'+#13+
//      cust_ptr+#13+
      'and data0025.MANU_PART_NUMBER='+quotedstr(trim(edit2.Text));
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('本厂编号不正确',1);
    edit2.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey25').AsInteger<>strtoint(Lab_rkey25.Caption) then
    begin
      label12.Caption:= dm.ADOQuery1.Fieldbyname('MANU_PART_DESC').AsString;
      Lab_rkey25.Caption:=dm.ADOQuery1.Fieldbyname('rkey25').AsString;
      if strtoint(Lab_rkey10.Caption)=0 then
      begin
       Lab_rkey10.Caption :=dm.ADOQuery1.Fieldbyname('CUSTOMER_PTR').AsString;
       edit1.Text:=trim(dm.ADOQuery1.FieldValues['CUST_CODE']);
       label11.Caption:= dm.ADOQuery1.Fieldbyname('CUSTOMER_NAME').AsString;
       edit4.Text:= dm.ADOQuery1.Fieldbyname('CURR_CODE').AsString;
       label13.Caption:= dm.ADOQuery1.Fieldbyname('CURR_NAME').AsString;
       Lab_rkey01.Caption:=dm.ADOQuery1.Fieldbyname('CURRENCY_PTR').AsString;
       edit6.Text:= dm.ADOQuery1.Fieldbyname('BASE_TO_OTHER').AsString;
        if strtoint(Lab_rkey01.Caption)=1 then
         edit6.ReadOnly:=true
        else
         edit6.ReadOnly:=false;
      end;
    end;
 end;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if trim(edit4.Text)='' then
 begin
  label13.Caption:='';
  Lab_rkey01.Caption:='0';
  edit6.Text:='0';
 end
else
if ActiveControl.Name<>'BitBtn3' then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
'SELECT data0001.rkey,Data0001.CURR_CODE, Data0001.CURR_NAME,'+#13+
  'data0001.BASE_TO_OTHER'+#13+
  'FROM  data0001'+#13+
  'where data0001.CURR_CODE='+quotedstr(trim(edit4.Text))+#13;
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('货币代码不正确',1);
    edit4.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>strtoint(Lab_rkey01.Caption) then
    begin
    label13.Caption:= dm.ADOQuery1.Fieldbyname('CURR_NAME').AsString;
    Lab_rkey01.Caption:=dm.ADOQuery1.Fieldbyname('rkey').AsString;
    edit6.Text:= dm.ADOQuery1.Fieldbyname('BASE_TO_OTHER').AsString;
    if strtoint(Lab_rkey01.Caption)=1 then
     edit6.ReadOnly:=true
    else
     edit6.ReadOnly:=false;
    end;
 end;
end;

procedure TForm2.btnSaveClick(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('请输入客户代码!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;
if trim(edit2.Text)='' then
 begin
  messagedlg('请输入本厂编号!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;
if trim(edit4.Text)='' then
 begin
  messagedlg('请输入货币代码!',mtinformation,[mbok],0);
  edit4.SetFocus;
  exit;
 end;
if strtoint(trim(edit5.Text))=0 then
 begin
  messagedlg('请输入入库数量!',mtinformation,[mbok],0);
  edit5.SetFocus;
  exit;
 end;

if self.status=0 then
begin
dm.ADOConnection1.BeginTrans;
try
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select * from data0153 where rkey is null';
  open;
  append;
  fieldvalues['CUSTPART_PTR']:=self.Lab_rkey25.Caption;
  fieldvalues['CUSTOMER_PTR']:=self.Lab_rkey10.Caption;
  FieldValues['CURRENCY_PTR']:=self.Lab_rkey01.Caption;
  fieldvalues['EMPL_PTR']:=user_ptr;
  fieldvalues['QUANTITY']:=strtoint(edit5.Text);
  FieldValues['QTY_ON_HAND']:=strtoint(edit5.Text);
  FieldValues['PO_NUMBER']:=edit3.Text;
  FieldValues['MFG_DATE']:=datetimepicker1.Date;
  FieldValues['REMARK']:=edit9.Text;
  FieldValues['PRICE']:=edit7.Text;
  FieldValues['TAX_RATE']:=edit8.Text;
  FieldValues['EXCH_RATE']:=edit6.Text;
  post;
 end;
 dm.ADOConnection1.CommitTrans;
except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
end;

if checkbox1.Checked then
begin
 dm.ADS153.Close;
 dm.ADS153.Open;
 dm.ADS153.Locate('rkey',dm.ADOQuery1.FieldValues['rkey'],[]);
 edit1.Text:='';
 Edit1Exit(nil);
 edit5.Text:='0';
 edit7.Text:='0';
 edit8.Text:='0';
 edit1.SetFocus;
end
else
 begin
  self.v_close:=1;
  self.ModalResult:=mrok;
 end;

end
else //编辑
 begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select * from data0153 where rkey ='+dm.ADS153rkey.AsString;
  open;
  IF strtoint(edit5.Text) < fieldvalues['QUANTITY']-fieldvalues['QTY_ON_HAND'] then
   begin
    messagedlg('数量必须大于等于'+
    inttostr(fieldvalues['QUANTITY']-fieldvalues['QTY_ON_HAND']),mtinformation,[mbok],0);
    edit5.SetFocus;
    exit;
   end;
 end;
 dm.ADOConnection1.BeginTrans;
 try
 with dm.ADOQuery1 do
 begin
  edit;
  fieldvalues['CUSTPART_PTR']:=self.Lab_rkey25.Caption;
  fieldvalues['CUSTOMER_PTR']:=self.Lab_rkey10.Caption;
  FieldValues['CURRENCY_PTR']:=self.Lab_rkey01.Caption;
  fieldvalues['EMPL_PTR']:=user_ptr;

  fieldvalues['QTY_ON_HAND'] :=fieldvalues['QTY_ON_HAND']+strtoint(Edit5.Text)-
    fieldvalues['QUANTITY'];

  fieldvalues['QUANTITY']:=strtoint(edit5.Text);
  FieldValues['PO_NUMBER']:=edit3.Text;
  FieldValues['MFG_DATE']:=datetimepicker1.Date;
  FieldValues['REMARK']:=edit9.Text;
  FieldValues['PRICE']:=edit7.Text;
  FieldValues['TAX_RATE']:=edit8.Text;
  FieldValues['EXCH_RATE']:=edit6.Text;
  post;
 end;
  dm.ADOConnection1.CommitTrans;
  self.v_close:=1;
  ModalResult:=mrok;
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
 end;
end;

procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (trim(edit2.Text)<>'') and (v_close<>1) then
 if (messagedlg('你确定不保存退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
   self.ModalResult:=mrcancel;
  end
 else
  CanClose:=false;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if self.status=1 then
 begin
  edit1.Text:=dm.ADS153CUST_CODE.Value;
  label11.Caption:=dm.ADS153CUSTOMER_NAME.Value;
  Lab_rkey10.Caption:=dm.ADS153CUSTOMER_PTR.AsString;
  edit2.Text:=dm.ADS153MANU_PART_NUMBER.Value;
  label12.Caption:=dm.ADS153MANU_PART_DESC.Value;
  Lab_rkey25.Caption:=dm.ADS153CUSTPART_PTR.AsString;
  edit4.Text:=dm.ADS153CURR_CODE.Value;
  label13.Caption:=dm.ADS153CURR_NAME.Value;
  Lab_rkey01.Caption:=dm.ADS153CURRENCY_PTR.AsString;
  edit6.Text:=dm.ADS153EXCH_RATE.AsString;
  edit3.Text:=dm.ADS153PO_NUMBER.Value;
  edit5.Text:=dm.ADS153QUANTITY.AsString;
  edit7.Text:=dm.ADS153price.AsString;
  edit8.Text:=dm.ADS153TAX_RATE.AsString;
  self.DateTimePicker1.Date:=dm.ADS153MFG_DATE.Value;
  edit9.Text:=dm.ADS153REMARK.Value;
  checkbox1.Visible:=false;
  self.Caption:=self.Caption+':编辑';
 end
else
 begin
 self.Caption:=self.Caption+':新增';
 self.DateTimePicker1.Date:=getsystem_date(dm.adoquery1,1);
 end;
end;

end.
