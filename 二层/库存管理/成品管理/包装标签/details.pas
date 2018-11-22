unit details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls,math,DateUtils, Menus;

type
  Tdetails_Form = class(TForm)
    btnExit: TSpeedButton;
    btnSave: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    StringGrid1: TStringGrid;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Edit10: TEdit;
    Label10: TLabel;
    Edit11: TEdit;
    Label11: TLabel;
    Edit12: TEdit;
    Label12: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    BitBtn4: TBitBtn;
    Label15: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit3: TEdit;
    Label16: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn5: TBitBtn;
    Edit13: TEdit;
    Label17: TLabel;
    N2: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnExitClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit10Enter(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Exit(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    v_close:byte; //是否正常退出(0非正常退出，1正常退出)
    onenter_text:string;
    dtpk1,dtpk2:tdatetime;
    procedure control_enable();
    function find_numbererror(number:string):boolean;
    function isnum(str:string):boolean; 
    procedure update_04(v_seed: string);
    function find_pack_no(rkey60:integer):integer;
  public
    { Public declarations }
    aded_flag:byte;   //1新增2编辑3检查
  end;

var
  details_Form: Tdetails_Form;

implementation

uses DAMO,Pick_Item_Single ,ConstVar,common, searchso, ComCtrls, DB, ADODB;

{$R *.dfm}
procedure Tdetails_Form.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure Tdetails_Form.control_enable;
begin
edit12.Enabled := stringgrid1.RowCount=2;
bitbtn1.Enabled := stringgrid1.RowCount=2;
edit10.Enabled := stringgrid1.RowCount=2;
bitbtn2.Enabled := stringgrid1.RowCount=2;
edit11.Enabled := stringgrid1.RowCount=2;
bitbtn3.Enabled := stringgrid1.RowCount=2;
combobox1.Enabled:=stringgrid1.RowCount=2;
combobox2.Enabled:=stringgrid1.RowCount=2;
edit5.Enabled:=stringgrid1.RowCount=2;
edit4.Enabled:=stringgrid1.RowCount=2;
edit7.Enabled:=stringgrid1.RowCount=2;
end;

function Tdetails_Form.find_numbererror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0698');
   sql.Add('where PACK_NUMBER='''+number+'''');
   open;
   if not IsEmpty then  result := true;
  end;
end;

function Tdetails_Form.isnum(str:string):boolean;
var 
  i:integer;
begin
  for i:=1 to length(str) do
   if not (str[i] in ['0'..'9']) then
    begin
      result:=false;
      exit;
    end;
  result:=true;
end;


procedure Tdetails_Form.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Open;
 if dm.ado04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
 end;
end;

procedure Tdetails_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if self.btnSave.Enabled then
if (self.StringGrid1.RowCount > 2) and (v_close<>1) then
 if (messagedlg('你确定不保存退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
   self.ModalResult:=mrcancel;
  end
 else
  CanClose:=false;
end;

procedure Tdetails_Form.btnExitClick(Sender: TObject);
begin
if btnSave.Enabled then
if self.StringGrid1.RowCount > 2 then
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
 end
else
 begin
  v_close:=1; //正常退出
  self.ModalResult:=mrcancel;
 end;

end;

procedure Tdetails_Form.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
  InputVar.Sqlstr:='SELECT data0010.rkey,Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
  'data0010.abbr_name FROM dbo.Data0010';
  if edit12.Text<>'' then
   InputVar.Sqlstr:=InputVar.Sqlstr+' where CUST_CODE like '+quotedstr('%'+edit12.Text+'%');
  InputVar.Sqlstr:=InputVar.Sqlstr+#13+
                   'order by data0010.cust_code';
  inputvar.KeyField:='CUST_CODE';
  inputvar.InPut_value:=edit12.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit12.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CUST_CODE').AsString;
   label13.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').AsString;
   edit10.SetFocus;
   edit12.Font.Color:=clwindowtext;
  end
  else
   begin
    edit12.SetFocus;
    self.onenter_text:='';
   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure Tdetails_Form.Edit12Exit(Sender: TObject);
begin
if trim(edit12.Text)='' then
 begin
  label13.Caption:='';
  (sender as tedit).Font.Color:=clwindowtext;
 end
else
if ActiveControl.Name<>'BitBtn1' then
 if comparetext(onenter_text,edit12.Text) <> 0 then
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
    'SELECT data0010.rkey,Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
    'data0010.abbr_name FROM dbo.Data0010'+#13+
    'where Data0010.CUST_CODE='+quotedstr(trim(edit12.Text))+#13;
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('客户代码不正确',1);
    edit12.SetFocus;
    self.onenter_text:='';
   end
   else
    begin
     edit12.Text:=trim(dm.ADOQuery1.FieldValues['CUST_CODE']);
     label13.Caption:= dm.ADOQuery1.Fieldbyname('abbr_name').AsString;
     (sender as tedit).Font.Color:=clwindowtext;
    end;
  end
 else
  (sender as tedit).Font.Color:=clwindowtext;
end;

procedure Tdetails_Form.BitBtn2Click(Sender: TObject);
var
 InputVar: PDlgInput ;
 cust_ptr: string;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
    'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
   if edit12.Text<>'' then
    cust_ptr :='and Data0010.CUST_CODE='+quotedstr(edit12.Text)
   else
    cust_ptr :='';
   if edit10.Text<>'' then
    cust_ptr :=cust_ptr+#13+'and Data0025.MANU_PART_NUMBER like '+quotedstr('%'+edit10.Text+'%')
   else
    cust_ptr :=cust_ptr+#13+'';
  InputVar.Sqlstr :='SELECT '+#13+
    'Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'+#13+
    'Data0010.ABBR_NAME, '+#13+
    'Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'+#13+
    'Data0025.ANALYSIS_CODE_2'+#13+
    'FROM dbo.Data0025 INNER JOIN dbo.Data0010 '+
    'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
    'where data0025.PARENT_PTR is null '+#13+
    cust_ptr+#13+
    'order by dbo.Data0025.MANU_PART_NUMBER';
  inputvar.KeyField:='MANU_PART_NUMBER';
  inputvar.InPut_value:=edit10.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit10.Text:=frmPick_Item_Single.adsPick.Fieldbyname('MANU_PART_NUMBER').AsString;
   edit10.Font.Color:=clwindowtext;
   label14.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('MANU_PART_DESC').AsString;
   edit2.Text:=frmPick_Item_Single.adsPick.Fieldbyname('ANALYSIS_CODE_2').AsString;

   if edit12.Text='' then
   begin
     edit12.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CUST_CODE').AsString;
     label13.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').AsString;
   end;
   edit11.SetFocus;
  end
  else
   begin
    edit10.SetFocus;
    self.onenter_text:='';
   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure Tdetails_Form.Edit10Enter(Sender: TObject);
begin
if (sender as tedit).Font.Color=clwindowtext then
  begin
   (sender as tedit).SelectAll;
   (sender as tedit).Font.Color:=clblue;
  end;
onenter_text:=(sender as tedit).Text;
end;

procedure Tdetails_Form.Edit10Exit(Sender: TObject);
var
 cust_ptr: string;
begin
if trim(edit10.Text)='' then
 begin
  label14.Caption:='';
  edit2.Text:='';
  (sender as tedit).Font.Color:=clwindowtext;
 end
else
if ActiveControl.Name<>'BitBtn2' then
 if comparetext(onenter_text,edit10.Text) <> 0 then  //不区分大小写比较字符串
  begin
    if edit12.Text<>'' then
     cust_ptr :='and Data0010.CUST_CODE='+quotedstr(edit12.Text)
    else
     cust_ptr :='';
     
    cust_ptr :=cust_ptr+#13+'and Data0025.MANU_PART_NUMBER = '+quotedstr(edit10.Text);

   with dm.ADOQuery1 do
   begin
    close;
    sql.Text := 'SELECT '+#13+
    'Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'+#13+
    'Data0010.ABBR_NAME, '+#13+
    'Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'+#13+
    'Data0025.ANALYSIS_CODE_2'+#13+
    'FROM dbo.Data0025 INNER JOIN dbo.Data0010 '+
    'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
    'where data0025.PARENT_PTR is null '+#13+
    cust_ptr;
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('本厂编号不正确',1);
    edit10.SetFocus;
    self.onenter_text:='';
   end
   else
    begin
     edit10.Text:=dm.ADOQuery1.Fieldbyname('MANU_PART_NUMBER').AsString;
     label14.Caption:=dm.ADOQuery1.Fieldbyname('MANU_PART_DESC').AsString;
     edit2.Text:=dm.ADOQuery1.Fieldbyname('ANALYSIS_CODE_2').AsString;
    
     if edit12.Text='' then
     begin
       edit12.Text:=trim(dm.ADOQuery1.FieldValues['CUST_CODE']);
       label13.Caption:= dm.ADOQuery1.Fieldbyname('abbr_name').AsString;
     end;
     (sender as tedit).Font.Color:=clwindowtext;
    end;
  end
 else
  (sender as tedit).Font.Color:=clwindowtext;
end;

function Tdetails_Form.find_pack_no(rkey60: integer): integer;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0698');
   sql.Add('where so_ptr='+inttostr(rkey60));
   open;
   result := dm.ADOQuery1.RecordCount;
  end;
end;

procedure Tdetails_Form.BitBtn3Click(Sender: TObject);
var
 cust_ptr:string;
 pack_no:integer;
begin
try
 searchso_Form:= Tsearchso_Form.Create(application);
 if edit12.Text<>'' then
  cust_ptr :='and Data0010.CUST_CODE='+quotedstr(edit12.Text)
 else
  cust_ptr :='';
 if edit10.Text<>'' then
  cust_ptr :=cust_ptr+#13+'and Data0025.MANU_PART_NUMBER = '+quotedstr(edit10.Text)
 else
  cust_ptr :=cust_ptr+#13+'';
 if edit11.Text<>'' then
  cust_ptr :=cust_ptr+#13+'and Data0060.sales_order like '+quotedstr('%'+edit11.Text+'%')
 else
  cust_ptr :=cust_ptr+#13+'';
 with searchso_Form do
 begin
   dtpk1.Date:=self.dtpk1;
   dtpk2.Date:=self.dtpk2;
   ADS60.Close;
   ads60.CommandText:= ads60.CommandText+#13+cust_ptr;
   ads60.Parameters[0].Value:=dtpk1.Date;
   ads60.Parameters[1].Value:=dtpk2.Date+1;
   ADS60.Open;
 end;
 if searchso_Form.ShowModal=mrok then
 begin
  pack_no:=self.find_pack_no(searchso_Form.ADS60RKEY.Value);
  if pack_no > 0 then
   showmsg('销售订单:'+searchso_Form.ADS60SALES_ORDER.Value+
   '之前已经打印包装标签'+inttostr(pack_no)+'次',1);

  edit11.Text:=searchso_Form.ADS60SALES_ORDER.Value;
  edit11.Font.Color:=clwindowtext;
  edit8.Text:=searchso_Form.ADS60PO_NUMBER.Value;
  edit11.Tag:=searchso_Form.ADS60RKEY.Value;
   if edit12.Text='' then
    begin
     edit12.Text:=searchso_Form.ADS60CUST_CODE.Value;
     label13.Caption:=searchso_Form.ADS60ABBR_NAME.Value;
    end;
   if edit10.Text='' then
    begin
     edit10.Text:=searchso_Form.ADS60MANU_PART_NUMBER.Value;
     label14.Caption:=searchso_Form.ADS60MANU_PART_DESC.Value;
     edit2.Text:=searchso_Form.ADS60ANALYSIS_CODE_2.Value;
    end;
  dtpk1:=searchso_Form.dtpk1.Date;
  dtpk2:=searchso_Form.dtpk2.Date;
  edit6.SetFocus;
 end
 else
  begin
   edit11.SetFocus;
   self.onenter_text:='';
  end;
finally
 searchso_Form.Free;
end;
end;

procedure Tdetails_Form.FormActivate(Sender: TObject);
var
 i:integer;
begin
 dtpk2:=getsystem_date(dm.ADOQuery1,1);
 dtpk1:=dtpk2-30;
 stringgrid1.Cells[0,0]:='序号';
 stringgrid1.Cells[1,0]:='本厂编号';
 stringgrid1.Cells[2,0]:='客户型号';
 stringgrid1.Cells[3,0]:='客户物料号';
 stringgrid1.Cells[4,0]:='客户订单号';
 stringgrid1.Cells[5,0]:='数量';
 stringgrid1.Cells[6,0]:='代码';
 stringgrid1.Cells[7,0]:='批次';
 stringgrid1.Cells[8,0]:='条形码';
 stringgrid1.Cells[9,0]:='描述';
 stringgrid1.Cells[10,0]:='备注';

if self.aded_flag=1 then    //新增
 begin
  edit3.Text:=
   formatdatetime('yyyy-mm-dd hh:nn:ss',getsystem_date(dm.ADOQuery1,0));
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
   edit1.Text:=dm.ado04SEED_VALUE.Value;
  dm.ado04.Close;
  edit5.OnChange:=nil;   //生产周期,批次
  edit5.Text:=copy(inttostr(YearOf(dtpk2)),3,2)+
              inttostr(weekof(dtpk2));
  edit5.OnChange:= Edit4Change;           
 end          //编辑或者检查
 else
  begin
   edit13.Text:=dm.ADS698type.Value;
   edit1.Text:=dm.ADS698pack_number.Value;
   edit12.Text:=dm.ADS698CUST_CODE.Value;
   label13.Caption:=dm.ADS698ABBR_NAME.Value;
   edit10.Text:=dm.ADS698MANU_PART_NUMBER.Value;
   label14.Caption:=dm.ADS698MANU_PART_DESC.Value;
   edit11.Text:=dm.ADS698SALES_ORDER.Value;
   edit11.Tag:=dm.ADS698so_ptr.Value;
   edit8.Text:=dm.ADS698PO_NUMBER.Value;
   edit2.Text:=dm.ADS698ANALYSIS_CODE_2.Value;
   edit6.Text:=dm.ADS698notes.Value;
   edit3.Text:=dm.ADS698v_date.AsString;
   combobox1.Text:=dm.ADS698code.Value;
   combobox2.Text:=dm.ADS698description.Value;
   edit5.Text:=dm.ADS698lotno.Value;
   edit4.Text:=dm.ADS698qty.AsString;
   edit7.Text:=dm.ADS698pack_item.AsString;

   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select order_no,MANU_PART_NUMBER,MANU_PART_DESC,ANALYSIS_CODE_2, '+
            'PO_NUMBER,qty,code,lotno,barcode_id,description,notes from data0699 where pack_ptr ='+
             dm.ADS698rkey.AsString+' order by order_no';
    open;
   stringgrid1.RowCount:=dm.ADOQuery1.RecordCount+2;
   for i:=1 to dm.ADOQuery1.RecordCount do
   begin
    stringgrid1.Cells[0,i]:=fieldbyname('order_no').AsString;
    stringgrid1.Cells[1,i]:=fieldbyname('MANU_PART_NUMBER').AsString;
    stringgrid1.Cells[2,i]:=fieldbyname('MANU_PART_DESC').AsString;
    stringgrid1.Cells[3,i]:=fieldbyname('ANALYSIS_CODE_2').AsString;
    stringgrid1.Cells[4,i]:=fieldbyname('PO_NUMBER').AsString;
    stringgrid1.Cells[5,i]:=fieldbyname('qty').AsString;
    stringgrid1.Cells[6,i]:=fieldbyname('code').AsString;
    stringgrid1.Cells[7,i]:=fieldbyname('lotno').AsString;
    stringgrid1.Cells[8,i]:=fieldbyname('barcode_id').AsString;
    stringgrid1.Cells[9,i]:=fieldbyname('description').AsString;
    stringgrid1.Cells[10,i]:=fieldbyname('notes').AsString;
    dm.ADOQuery1.Next;
   end;
   end;
   self.control_enable;
  end;
end;

procedure Tdetails_Form.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure Tdetails_Form.Edit11Exit(Sender: TObject);
var
 cust_ptr: string;
begin
if trim(edit11.Text)='' then
 begin
  edit11.Tag:=0;
  edit8.Text:='';
  (sender as tedit).Font.Color:=clwindowtext;
 end
else
if ActiveControl.Name<>'BitBtn3' then
 if comparetext(onenter_text,edit11.Text) <> 0 then  //不区分大小写比较字符串
  begin
    if edit12.Text<>'' then
     cust_ptr :='and Data0010.CUST_CODE='+quotedstr(edit12.Text)
    else
     cust_ptr :='';
    if edit10.Text<>'' then
     cust_ptr :=cust_ptr+#13+'and Data0025.MANU_PART_NUMBER = '+quotedstr(edit10.Text)
    else
     cust_ptr :=cust_ptr+#13+'';

   cust_ptr :=cust_ptr+#13+'and Data0060.sales_order = '+quotedstr(edit11.Text);

   with dm.ADOQuery1 do
   begin
    close;
    sql.Text :=
     'SELECT dbo.Data0060.RKEY, dbo.Data0060.SALES_ORDER,dbo.Data0097.PO_NUMBER,'+#13+
     'dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME,'+#13+
     'dbo.Data0025.MANU_PART_DESC, dbo.Data0025.MANU_PART_NUMBER,'+#13+
     'dbo.Data0025.ANALYSIS_CODE_2'+#13+
     'FROM dbo.Data0060 INNER JOIN'+#13+
     '   dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'+#13+
     '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
     '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY'+#13+
     'WHERE     (dbo.Data0060.PROD_REL <> ''1'')'+#13+
    cust_ptr;
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('销售订单号不正确',1);
    edit11.SetFocus;
    onenter_text:='';
   end
   else
    begin
      edit11.Text:= dm.ADOQuery1.fieldbyname('SALES_ORDER').AsString;
      edit11.Font.Color:=clwindowtext;
      edit8.Text:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString;
      edit11.Tag:=dm.ADOQuery1.fieldbyname('RKEY').AsInteger;
       if edit12.Text='' then
       begin
        edit12.Text:=dm.ADOQuery1.fieldbyname('CUST_CODE').AsString;
        label13.Caption:=dm.ADOQuery1.fieldbyname('ABBR_NAME').AsString;
       end;
       if edit10.Text='' then
       begin
         edit10.Text:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString;
         label14.Caption:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString;
         edit2.Text:=dm.ADOQuery1.fieldbyname('ANALYSIS_CODE_2').AsString;
       end;
     (sender as tedit).Font.Color:=clwindowtext;
    end;
  end
 else
  (sender as tedit).Font.Color:=clwindowtext;
end;

procedure Tdetails_Form.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if acol=8 then    //条形码不允许修改
 stringgrid1.Options:= stringgrid1.Options-[goediting]
else
if arow=stringgrid1.RowCount-1 then
 stringgrid1.Options:= stringgrid1.Options-[goediting]
else
 stringgrid1.Options:= stringgrid1.Options+[goediting];
end;

procedure Tdetails_Form.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  StringGrid1.MouseToCell(x,y,column,row);
  if row<>0 then StringGrid1.Row:=row;
 end;
end;

procedure Tdetails_Form.PopupMenu1Popup(Sender: TObject);
begin
if StringGrid1.Row<>StringGrid1.RowCount-1 then
 begin
  n1.Enabled:=true;
  n2.Enabled:=true;
 end
else
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
 end;
end;

procedure Tdetails_Form.BitBtn4Click(Sender: TObject);
var
 i:integer;
begin
if strtoint(edit7.Text)>=1 then
begin
 if stringgrid1.RowCount>2 then
 if not Msg_Dlg_Ask('已有打印条目,原数据将丢失,是否继续?','提交窗口',1) then
  exit;
 if edit11.Text<>'' then
 begin
  stringgrid1.RowCount:=strtoint(edit7.Text)+2;
  stringgrid1.Rows[stringgrid1.RowCount-1].Text:='';
  stringgrid1.Cells[0,1]:='1'; //'序号';
  stringgrid1.Cells[1,1]:=edit10.Text;     //'本厂编号';
  stringgrid1.Cells[2,1]:=label14.Caption; //'客户型号';
  stringgrid1.Cells[3,1]:=edit2.Text;      //'客户物料号';
  stringgrid1.Cells[4,1]:=edit8.Text;      //'客户订单号';
  stringgrid1.Cells[5,1]:=edit4.Text;      //'数量';
  stringgrid1.Cells[6,1]:=combobox1.Text;  //'代码';
  stringgrid1.Cells[7,1]:=edit5.Text;      //'批次';
  stringgrid1.Cells[8,1]:=edit9.Text;     //'条形码';
  stringgrid1.Cells[9,1]:=combobox2.Text;  //'描述';
  stringgrid1.Cells[10,1]:=edit6.Text;      //'备注';

  for i:=2 to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i] := stringgrid1.Rows[i-1];
   stringgrid1.Cells[0,i] := inttostr(i);
   if trim(edit6.Text) <> '' then
   if self.isnum(copy(edit6.Text,length(edit6.Text)-1,2)) then       //最后两位是数字
    stringgrid1.Cells[10,i]:=copy(edit6.Text,1,length(edit6.Text)-2)+
                             copy(inttostr(100+
                                        strtoint(copy(edit6.Text,length(edit6.Text)-1,2))+i-1),2,2)
   else
    if self.isnum(copy(edit6.Text,length(edit6.Text),1)) then       //最后一位是数字
     stringgrid1.Cells[10,i]:=copy(edit6.Text,1,length(edit6.Text)-1)+
                              inttostr(strtoint(copy(edit6.Text,length(edit6.Text),1))+i-1);
  end;
  self.control_enable;
 end
 else
  showmsg('请先确认销售订单',1);
end
else
 begin
  showmsg('打印条目必须大于1',1);
  edit7.SetFocus;
 end;
end;

procedure Tdetails_Form.N1Click(Sender: TObject);
var
 i:integer;
begin
  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
   stringgrid1.Cells[0,i]:=inttostr(i);
  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  stringgrid1.Cells[0,stringgrid1.RowCount-1]:='';
  edit7.Text:=inttostr(stringgrid1.RowCount-2);
  if  stringgrid1.RowCount=2 then
  self.control_enable;
end;

procedure Tdetails_Form.Edit4Change(Sender: TObject);
begin
if edit13.Text='内箱' then
 edit9.Text:=trim(edit2.Text)+'-'+edit5.Text+'-'+edit4.Text
else
 edit9.Text:=trim(edit2.Text)+'-'+edit5.Text+'-'+edit4.Text+'-01';
end;



procedure Tdetails_Form.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
if stringgrid1.Col=5 then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure Tdetails_Form.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if stringgrid1.Row<>stringgrid1.RowCount-1 then
if (stringgrid1.Col=5) or (stringgrid1.Col=7)then
if edit13.Text='内箱' then
 stringgrid1.Cells[8,stringgrid1.row]:=edit2.Text+'-'+
      stringgrid1.Cells[7,stringgrid1.row]+'-'+
      stringgrid1.Cells[5,stringgrid1.row]
else
 stringgrid1.Cells[8,stringgrid1.row]:=edit2.Text+'-'+
      stringgrid1.Cells[7,stringgrid1.row]+'-'+
      stringgrid1.Cells[5,stringgrid1.row]+'-01';
end;

procedure Tdetails_Form.btnSaveClick(Sender: TObject);
var
 i,rkey:integer;
begin
if stringgrid1.RowCount<=2 then
 begin
  showmsg('打印条目必须大于1',1);
  edit7.SetFocus;
  exit;
 end;

if trim(edit1.Text)='' then
 begin
  showmsg('标签代码不允许为空',1);
  edit1.SetFocus;
  exit;
 end;

if self.aded_flag=1 then //新增
 begin
  if self.find_numbererror(trim(edit1.Text)) then
  begin
   if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
    begin
    dm.ado04.Close;
    dm.ado04.Open;
    edit1.Text:=dm.ado04SEED_VALUE.Value;
    end
   else
    begin
     edit1.SetFocus;
     exit;
    end;
  end;

  dm.ADOConnection1.BeginTrans;
  try
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select rkey,pack_number,so_ptr,description,code,qty,lotno,notes,v_date, '+
            'empl_ptr,pack_item,type from data0698 where rkey is null';
    open;
   end;
  dm.ADOQuery1.Append;
  dm.ADOQuery1.FieldByName('pack_number').Value:=edit1.Text;
  dm.ADOQuery1.FieldByName('so_ptr').Value:=edit11.Tag;
  dm.ADOQuery1.FieldByName('description').Value:=combobox2.Text;
  dm.ADOQuery1.FieldByName('code').Value:=combobox1.Text;
  dm.ADOQuery1.FieldByName('qty').Value:=edit4.Text;
  dm.ADOQuery1.FieldByName('lotno').Value:=edit5.Text;
  dm.ADOQuery1.FieldByName('notes').Value:=edit6.Text;
  dm.ADOQuery1.FieldByName('pack_item').Value:=edit7.Text;
  dm.ADOQuery1.FieldByName('empl_ptr').Value:=user_ptr;
  dm.ADOQuery1.FieldByName('v_date').Value:=edit3.Text;
  dm.ADOQuery1.FieldByName('type').Value:=edit13.Text;
  dm.ADOQuery1.Post;
  rkey:=dm.ADOQuery1.FieldValues['rkey'];
  self.update_04(trim(edit1.Text)); //更新控制码
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select pack_ptr,order_no,MANU_PART_NUMBER,MANU_PART_DESC,ANALYSIS_CODE_2, '+
            'PO_NUMBER,qty,code,lotno,barcode_id,description,notes from data0699 where pack_ptr is null';
    open;
   end;
   for i:=1 to stringgrid1.RowCount-2 do
   dm.ADOQuery1.AppendRecord([rkey,
                              stringgrid1.Cells[0,i],
                              stringgrid1.Cells[1,i],
                              stringgrid1.Cells[2,i],
                              stringgrid1.Cells[3,i],
                              stringgrid1.Cells[4,i],
                              stringgrid1.Cells[5,i],
                              stringgrid1.Cells[6,i],
                              stringgrid1.Cells[7,i],
                              stringgrid1.Cells[8,i],
                              stringgrid1.Cells[9,i],
                              stringgrid1.Cells[10,i]]);

   dm.ADOConnection1.CommitTrans;
   v_close:=1; //正常退出
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit1.SetFocus;
    end;
  end;

 end
else //编辑
 begin
  dm.ADOConnection1.BeginTrans;
  try
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select rkey,pack_number,so_ptr,description,code,qty,lotno,notes,v_date, '+
            'empl_ptr,pack_item from data0698 where rkey ='+dm.ADS698rkey.AsString;
    open;
   end;
  dm.ADOQuery1.Edit;
  dm.ADOQuery1.FieldByName('pack_number').Value:=edit1.Text;
  dm.ADOQuery1.FieldByName('so_ptr').Value:=edit11.Tag;
  dm.ADOQuery1.FieldByName('description').Value:=combobox2.Text;
  dm.ADOQuery1.FieldByName('code').Value:=combobox1.Text;
  dm.ADOQuery1.FieldByName('qty').Value:=edit4.Text;
  dm.ADOQuery1.FieldByName('lotno').Value:=edit5.Text;
  dm.ADOQuery1.FieldByName('notes').Value:=edit6.Text;
  dm.ADOQuery1.FieldByName('pack_item').Value:=edit7.Text;
  dm.ADOQuery1.FieldByName('empl_ptr').Value:=user_ptr;
  dm.ADOQuery1.FieldByName('v_date').Value:=edit3.Text;
  dm.ADOQuery1.Post;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='delete data0699 '+
            'where pack_ptr ='+dm.ADS698rkey.AsString;
    ExecSQL;
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select pack_ptr,order_no,MANU_PART_NUMBER,MANU_PART_DESC,ANALYSIS_CODE_2, '+
            'PO_NUMBER,qty,code,lotno,barcode_id,description,notes from data0699 where pack_ptr is null';
    open;
   end;
   for i:=1 to stringgrid1.RowCount-2 do
   dm.ADOQuery1.AppendRecord([dm.ADS698rkey.Value,
                              stringgrid1.Cells[0,i],
                              stringgrid1.Cells[1,i],
                              stringgrid1.Cells[2,i],
                              stringgrid1.Cells[3,i],
                              stringgrid1.Cells[4,i],
                              stringgrid1.Cells[5,i],
                              stringgrid1.Cells[6,i],
                              stringgrid1.Cells[7,i],
                              stringgrid1.Cells[8,i],
                              stringgrid1.Cells[9,i],
                              stringgrid1.Cells[10,i]]);

   dm.ADOConnection1.CommitTrans;
   v_close:=1; //正常退出
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit1.SetFocus;
    end;
  end;
 end;
end;

procedure Tdetails_Form.BitBtn5Click(Sender: TObject);
begin
if stringgrid1.RowCount>2 then
Export_Grid_to_Excel(stringgrid1,edit8.Text,true);
end;

procedure Tdetails_Form.N2Click(Sender: TObject);
var
 i:integer;
begin
  for i:=1 to stringgrid1.RowCount-2 do
   stringgrid1.Rows[i].Clear;

  stringgrid1.RowCount:=2;
  self.control_enable;
end;

end.
