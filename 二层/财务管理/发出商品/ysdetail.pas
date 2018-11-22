unit ysdetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin, Grids, DBCtrls,
  Mask, Menus,DateUtils,DB, ADODB;

type
  TForm_ysdetail = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit15: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    Label2: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit5: TEdit;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    Label23: TLabel;
    Edit8: TEdit;
    Label24: TLabel;
    Edit11: TEdit;
    Label27: TLabel;
    Edit13: TEdit;
    Label28: TLabel;
    Edit14: TEdit;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    StringGrid2: TStringGrid;
    Label8: TLabel;
    Edit9: TEdit;
    Label26: TLabel;
    Edit12: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    Label25: TLabel;
    Panel2: TPanel;
    Edit10: TEdit;
    Label9: TLabel;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Edit16: TEdit;
    Label10: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    acc_ptr:integer;
    abbrname:string;

    function get_voucher(invoice_date: tdatetime): string;
    procedure re_calculate;
    function RemoveInvalid(where: string): string;
    function get_col5(row: integer): currency;
    function get_col6(row: integer): currency;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function find_employee(rkey:integer):string;
    procedure open_glcnumber(rkey103,dflt_acctptr:integer);
    function vo_number(number: string): boolean;
    function find_error(var number:string;rkey105:integer): boolean;
    function return_rkey(sgrid:tstringgrid;col:integer):string;
    procedure change_bitbtn(); 
  public
    { Public declarations }
    State:byte;     //1:新增,2:编辑,3:检查
  end;

var
  Form_ysdetail: TForm_ysdetail;

implementation

uses damo,Pick_Item_Single ,ConstVar,common,  misctooliv,
  AcctSearch, curr_search, voucher_dictionary, ASSIGN, voucher_report,
  costdetail;

{$R *.dfm}
function TForm_ysdetail.return_rkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
  if sgrid.RowCount>2 then
   begin
     rkey_list:='(';
     for i:=1 to sgrid.RowCount-2 do
      if i < sgrid.RowCount-2 then
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+','
      else
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+')';
     result:= rkey_list;
   end;
end;

function TForm_ysdetail.vo_number(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0105');
  sql.Add('where VOUCHER='''+number+'''');
  open;
  if not IsEmpty then result:=true;
 end;
end;

function TForm_ysdetail.find_error(var number:string;rkey105:integer): boolean;
var
 rkey_list:string;
begin
  result:=false;

  rkey_list:=return_rkey(stringgrid2,9);
  if rkey_list<> '' then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0060.SALES_ORDER,data0064.SHIPMENT_NO from data0064 inner join data0060');
    sql.Add('ON Data0064.SO_PTR = Data0060.RKEY');
    sql.Add('where data0064.GLPTR_STAUTS2 = 1');
    if rkey105 > 0 then
    sql.Add('and data0064.GL_HEADER_PTR2<>'+inttostr(rkey105));    
    sql.Add('and data0064.rkey in'+rkey_list);
    open;
    if not IsEmpty then
     begin
      number:=fieldbyname('SALES_ORDER').AsString+':'+
              fieldbyname('SHIPMENT_NO').AsString;
      result:=true;
     end;
   end;

end;

procedure TForm_ysdetail.FormActivate(Sender: TObject);
var
 i:integer;
 ship_amout:Single;
begin
stringgrid2.Cells[0,0]:='销售订单';
stringgrid2.Cells[1,0]:='本厂编号';
stringgrid2.Cells[2,0]:='客户型号';
stringgrid2.Cells[3,0]:='客户订单号';
stringgrid2.Cells[4,0]:='装箱单号';
stringgrid2.Cells[5,0]:='出货日期';
stringgrid2.Cells[6,0]:='装运数量';
stringgrid2.Cells[7,0]:='成本';
stringgrid2.Cells[8,0]:='税率%';
stringgrid2.ColWidths[8]:=-1;
StringGrid2.Cells[9,0]:='rkey64';
stringgrid2.ColWidths[9]:=-1;
StringGrid2.Cells[10,0]:='批次';
StringGrid2.Cells[11,0]:='报关单号';

sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';
self.PageControl1.ActivePageIndex:=0;

if self.State=1 then  //新增
begin
 edit11.Text:=datetostr(common.getsystem_date(dm.ADOQuery1,1));
 edit11exit(sender);
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select rkey,curr_code,curr_name from data0001 where rkey=1';
   open;
   edit5.Text:=fieldbyname('curr_code').AsString;
   edit5.Tag:=1;
   label20.Caption:=fieldbyname('curr_name').AsString;
  end;

end
else    //编辑或者检查
 begin
  if self.State=3 then  //检查
   begin
    edit10.ReadOnly:=true;
    edit11.ReadOnly:=true;
    bitbtn1.Enabled:=false;
    n3.Visible:=false;
    n12.Visible:=false;
    n13.Visible:=false;
    toolbar1.Enabled:=false;
    sgrid1.PopupMenu:=nil;
    sgrid1.Options:=sgrid1.Options+[goRowselect];
   end;
  edit8.Text:=dm.ADS105VOUCHER.Value;
  edit10.Text:=dm.ADS105BATCH_NUMBER.Value;
  edit11.Text:=dm.ADS105ENTERED_DT.AsString;
  edit13.Text:=dm.ADS105FYEAR.AsString;
  edit14.Text:=dm.ADS105PERIOD.AsString;
  edit1.Text:=dm.ADS105CUST_CODE.Value;
  label19.Caption:=dm.ADS105CUSTOMER_NAME.Value;
  edit5.Text:=dm.ads105curr_code.Value;
  label20.Caption:=dm.ADS105CURR_NAME.Value;
  edit1.Tag:=dm.ADS105CUSTOMER_PTR.Value;
  edit5.Tag:=dm.ADS105CURRENCY_PTR.Value;
  if edit5.Tag=1 then
   edit2.ReadOnly:=true
  else
   edit2.ReadOnly:=false;
  edit2.Text:=dm.ADS105EXCHANGE_RATE.AsString;
  
  updown1.Position:=dm.ADS105ATTACHED.Value;
  edit15.Text:=dm.Ads105EMPLOYEE_NAME.Value;

  bitbtn6.Enabled:=false;
  bitbtn4.Enabled:=false;

    ship_amout:=0;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'SELECT  Data0064.RKEY, Data0060.SALES_ORDER,data0064.SHIPMENT_NO,'+#13+
     'Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0097.PO_NUMBER,'+#13+
     'data0439.delivery_no, data0439.date_sailing,data0064.cust_decl,'+#13+
     'Data0064.QUAN_SHIPPED,derivedtbl_1.cost_2'+#13+
     'FROM   Data0064 INNER JOIN'+#13+
     ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
     '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
     '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
     '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey inner join'+#13+
     '(SELECT     dbo.Data0052.SO_SHP_PTR,'+#13+
     'SUM(dbo.Data0052.QUAN_SHP * ISNULL(dbo.Data0006.MATL_COST + dbo.Data0006.OVHD_COST, 0)) AS cost_2'+#13+
     'FROM         dbo.Data0052 INNER JOIN'+#13+
      'dbo.Data0053 ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.RKEY INNER JOIN'+#13+
      'dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'+#13+
      'dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY LEFT OUTER JOIN'+#13+
      'dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY'+#13+
    'WHERE   (data0060.customer_ptr='+inttostr(edit1.Tag)+')'+#13+
    'GROUP BY dbo.Data0052.SO_SHP_PTR) AS derivedtbl_1 ON dbo.Data0064.RKEY = derivedtbl_1.SO_SHP_PTR'+#13+
     'where data0064.GL_HEADER_PTR2='+dm.ADS105RKEY.AsString+#13+
      ' order by Data0060.SALES_ORDER,data0064.SHIPMENT_NO';
     Prepared;
     open;
     while not eof do
      begin
        stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('SALES_ORDER').AsString; //'销售订单';
        stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
        stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
        stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('PO_NUMBER').AsString; //'客户订单号';
        stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('delivery_no').AsString; //'装箱单号';
        stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('date_sailing').AsString; //'出货日期';
        stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('QUAN_SHIPPED').AsString; //'装运数量';
        stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('cost_2').AsString; //'成本';

        stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;
        stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('SHIPMENT_NO').AsString;
        stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('cust_decl').AsString;
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        ship_amout:=ship_amout+fieldbyname('cost_2').AsFloat;

        next;
      end;

      edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2));
    end;
  dm.ads106.First;
  dm.ads106.DisableControls;
  sgrid1.RowCount:=dm.Ads106.RecordCount+2;
  sgrid2.RowCount:=sgrid1.RowCount;
  for i:=1 to dm.ads106.RecordCount do
   begin
    sgrid1.Cells[0,i]:=dm.ads106DESCRIPTION.Value;
    sgrid1.Cells[1,i]:=dm.ads106GL_ACC_NUMBER.Value+'-'+
                          dm.ads106description_2.Value;
    sgrid1.Cells[2,i]:=dm.ads106CURR_CODE.value;
    sgrid1.Cells[3,i]:=dm.ads106EXCH_RATE.AsString;

    sgrid1.Cells[4,i]:=dm.ads106price.AsString;

    sgrid2.Cells[0,i]:=dm.ads106GL_ACCT_NO_PTR.AsString;
    sgrid2.Cells[1,i]:=dm.ads106CURR_PTR.AsString;
    if dm.ads106D_C.Value='D' then
     sgrid1.Cells[5,i]:=formatfloat('0.00',dm.ads106AMOUNT.Value)
    else
     sgrid1.Cells[6,i]:=formatfloat('0.00',dm.ads106AMOUNT.Value);
    dm.ads106.Next;
   end;
    dm.ads106.First;
   dm.ads106.EnableControls;
  self.re_calculate();//重新计算借货金额
 end;

end;

procedure TForm_ysdetail.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
  InputVar.Sqlstr:='SELECT data0010.rkey,Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
  'data0010.ACC_REC_PTR,data0010.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'case data0010.EDI_FLAG_FOR_SOACK when 1 then ''转厂'' else ''内销'' end as sa_type,'+#13+
  'data0001.base_to_other,data0010.abbr_name'+#13+
  'FROM dbo.Data0010 inner join data0001 on'+#13+
  'data0010.CURRENCY_PTR=data0001.rkey'+#13+
  'order by data0010.cust_code';

  inputvar.KeyField:='CUST_CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit1.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CUST_CODE').AsString;
   label19.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_NAME').AsString;
   edit1.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   self.acc_ptr:= frmPick_Item_Single.adsPick.Fieldbyname('ACC_REC_PTR').AsInteger;
   self.abbrname:=frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').AsString;
   edit16.Text:= frmPick_Item_Single.adsPick.Fieldbyname('sa_type').AsString;
  end
  else
   begin
    edit1.SetFocus;
   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;


procedure TForm_ysdetail.open_glcnumber(rkey103,dflt_acctptr:integer);
begin
with dm.ADOQuery1 do     //处理应收帐款净价格发票总价格不能为零
 begin
  close;
  sql.Clear;
  sql.Add(' SELECT   dbo.Data0103.RKEY,dbo.Data0103.GL_ACC_NUMBER, ');
  sql.Add('CASE WHEN data0103_3.GL_DESCRIPTION IS NOT NULL');
  sql.Add('THEN data0103_3.GL_DESCRIPTION + ''-'' + data0103_2.GL_DESCRIPTION + ''-'' +');
  sql.Add('data0103_1.GL_DESCRIPTION + ''-'' + data0103.GL_DESCRIPTION ');
  sql.Add('ELSE CASE WHEN data0103_2.GL_DESCRIPTION IS NOT NULL ');
  sql.Add('THEN data0103_2.GL_DESCRIPTION + ''-'' + data0103_1.GL_DESCRIPTION + ''-'' + data0103.GL_DESCRIPTION');
  sql.Add('ELSE CASE WHEN data0103_1.GL_DESCRIPTION IS NOT NULL ');
  sql.Add('THEN data0103_1.GL_DESCRIPTION + ''-'' + data0103.GL_DESCRIPTION');
  sql.Add('ELSE data0103.GL_DESCRIPTION ');
  sql.Add('END END  END AS description_2,dbo.Data0103.CURR_TP, dbo.Data0103.CURR_PTR');
  sql.Add('FROM    dbo.Data0103 AS Data0103_2 LEFT OUTER JOIN');
  sql.Add('dbo.Data0103 AS data0103_3 ON Data0103_2.PARENT_PTR = data0103_3.RKEY RIGHT OUTER JOIN');
  sql.Add('dbo.Data0103 AS Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN');
  sql.Add('dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR');
  if rkey103 > 0  then
   sql.Add('where Data0103.rkey='+inttostr(rkey103))
  else
   sql.Add('where Data0103.rkey='+inttostr(dflt_acctptr));
  open;
 end;
end;

function TForm_ysdetail.find_employee(rkey: integer): string;
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0005.employee_name');
    sql.Add('from data0005');
    sql.Add('where data0005.rkey='+user_ptr);
    open;
    if not eof then
      result:=fieldbyname('employee_name').AsString
    else
     result:=''
   end;
end;

function TForm_ysdetail.get_voucher(invoice_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

 voucher:='TA'+copy(Edit13.Text,3,2);  //年度
 if length(Edit14.Text) < 2 then
  voucher := voucher+'0'+Edit14.Text
 else
  voucher := voucher+Edit14.Text;      //月份
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
  end;
 if dm.ADOQuery1.IsEmpty then
  begin
   voucher:= voucher+'00001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
  end;
  result:= voucher;  //凭证编号
end;

procedure TForm_ysdetail.Edit11Exit(Sender: TObject);
begin
try
 strtodate(edit11.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit11.SetFocus;
 exit;
end;
if State=1 then  //新增
 if  (Edit13.Text<>inttostr(yearof(strtodate(edit11.Text)))) or
     (Edit14.Text<>inttostr(monthof(strtodate(edit11.Text))))  then
  begin
   Edit13.Text:=inttostr(yearof(strtodate(edit11.Text)));
   Edit14.Text:=inttostr(monthof(strtodate(edit11.Text)));
   edit8.Text:=self.get_voucher(strtodate(edit11.Text));
  end;
end;

procedure TForm_ysdetail.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm_ysdetail.Edit2Exit(Sender: TObject);
begin
if edit2.Text = '' then edit2.Text := '0';
 edit2.Text := formatfloat('0.00000000',strtofloat(edit2.Text));
end;

procedure TForm_ysdetail.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit2.Text)>0  then abort;
end;

procedure TForm_ysdetail.re_calculate;
var
 i:word;
 vdb,vcr:currency;
begin
vdb:=0;
vcr:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if trim(sgrid1.cells[5,i])<>'' then
    vdb:=vdb+strtocurr(trim(sgrid1.cells[5,i]));
   if trim(sgrid1.cells[6,i])<>'' then
    vcr:=vcr+strtocurr(trim(sgrid1.cells[6,i]));
  end;
statictext1.Caption:=Formatfloat('#,##0.00',vdb);
statictext2.Caption:=Formatfloat('#,##0.00',vcr);
end;

function TForm_ysdetail.RemoveInvalid(where: string): string;
 var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
       copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

function TForm_ysdetail.get_col5(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[5,i])<>'') and (i<>row) then
   result:=result+strtocurr(sgrid1.Cells[5,i]);
  end;
end;

function TForm_ysdetail.get_col6(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[6,i])<>'') and (i<>row) then
   result:=result+strtocurr(sgrid1.Cells[6,i]);
  end;
end;

function TForm_ysdetail.get_gltp(rkey103: string): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_tp from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_tp').AsInteger;
 end;
end;

function TForm_ysdetail.get_glcurr_ptr(rkey103: string): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_ptr from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_ptr').AsInteger;
 end;
end;

procedure TForm_ysdetail.Sgrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if arow=sgrid1.RowCount-1 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;

if (acol=1) or (acol=2) or (acol=3) or (arow=sgrid1.RowCount-1) then
 sgrid1.Options:=sgrid1.Options-[goEditing]
else
 sgrid1.Options:=sgrid1.Options+[goEditing];

if (sgrid1.col>3) and (sgrid1.row<>sgrid1.RowCount-1) then
begin
  if trim(sgrid1.Cells[4,sgrid1.row])='' then
   sgrid1.Cells[4,sgrid1.row]:='0';
  if sgrid1.col=5 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[5,sgrid1.row]:='0';
  if sgrid1.col=6 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[6,sgrid1.row]:='0';
   
if trim(sgrid1.Cells[sgrid1.col,sgrid1.row])<>'' then
 begin
  sgrid1.Cells[sgrid1.col,sgrid1.row]:=formatfloat('0.00',
  strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row]));

  case sgrid1.Col of
  5:      //借方
   begin
    sgrid1.Cells[6,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  6:       //贷方
   begin
    sgrid1.Cells[5,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  4:   //原币
   begin
    if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
     sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
    else
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
   end;
  end;
    self.re_calculate;
 end;
end;
end;

procedure TForm_ysdetail.Sgrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if row<>0 then sgrid1.Row:=row;
   sgrid1.Col:=column;
 end;
end;

procedure TForm_ysdetail.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm_ysdetail.Sgrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 v_c:currency;
begin
if key=13 then    //用户按下回车键,左右对调
 begin
  if sgrid1.Row<> sgrid1.RowCount-1 then
  begin
   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[5,sgrid1.Row]:=sgrid1.Cells[6,sgrid1.Row];
    sgrid1.Cells[6,sgrid1.Row]:='';
    end;
   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[6,sgrid1.Row]:=sgrid1.Cells[5,sgrid1.Row];
    sgrid1.Cells[5,sgrid1.Row]:='';
    end;

   self.re_calculate;
  end;
 end;

if key=187 then    //用户按下=键,自动计算
 begin
  if sgrid1.Row <> sgrid1.RowCount-1 then
  begin

   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(RemoveInvalid(statictext2.Caption))-get_col5(sgrid1.Row);
    if v_c <> 0 then
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(RemoveInvalid(statictext1.Caption))-get_col6(sgrid1.Row);
    if v_c <> 0 then
    sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   self.re_calculate;
  end;
 end;
end;

procedure TForm_ysdetail.Sgrid1Exit(Sender: TObject);
begin
if (sgrid1.col>3) and (sgrid1.row<>sgrid1.RowCount-1) then
 begin
  if trim(sgrid1.Cells[4,sgrid1.row])='' then
   sgrid1.Cells[4,sgrid1.row]:='0';
  if sgrid1.col=5 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[5,sgrid1.row]:='0';

  if sgrid1.col=6 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[6,sgrid1.row]:='0';
if trim(sgrid1.Cells[sgrid1.col,sgrid1.row])<>'' then
 begin
  sgrid1.Cells[sgrid1.col,sgrid1.row]:=formatfloat('0.00',
  strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row]));
  case sgrid1.Col of
  5:      //借方
   begin
    sgrid1.Cells[6,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  6:       //贷方
   begin
    sgrid1.Cells[5,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  4:   //原币
   begin
    if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
     sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
    else
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
   end;
  end;
  self.re_calculate;
 end;
 end;
     SGrid1.Col:=0;
end;

procedure TForm_ysdetail.Sgrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm_ysdetail.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  try
   form_curr:=tform_curr.Create(application);
   if form_curr.ShowModal=mrok then
    begin
     if (form_acct.ADOQuery1curr_tp.Value=0) and
        (form_curr.ADOQuery1rkey.Value>1) then
      messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
     else
      if (form_acct.ADOQuery1curr_tp.Value=2) and
         (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
       messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
      else
       begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                  sgrid1.Cells[0,sgrid1.RowCount-2];
                  
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1curr_code.Value;

        if edit5.Tag=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1]:=form_curr.ADOQuery1base_to_other.AsString;

        sgrid2.Cells[0,sgrid2.RowCount-1]:=form_acct.ADOQuery1rkey.AsString;
        sgrid2.Cells[1,sgrid2.RowCount-1]:=form_curr.ADOQuery1rkey.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
        if sgrid1.RowCount=3 then
         begin
         speedbutton2.Enabled:=true;
         speedbutton3.Enabled:=true;
         speedbutton4.Enabled:=true;
         speedbutton5.Enabled:=true;
         speedbutton6.Enabled:=true;
         end;
       end;
    end;
  finally
   form_curr.Free;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm_ysdetail.N5Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  begin
   if (form_acct.ADOQuery1curr_tp.Value=0) and
      (strtoint(sgrid2.Cells[1,sgrid1.Row])>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (form_acct.ADOQuery1curr_tp.Value=2) and
       (form_acct.ADOQuery1curr_ptr.Value<>strtoint(sgrid2.Cells[1,sgrid1.Row])) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[1,sgrid1.Row]:=              //科目
                         trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
      sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
     end;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm_ysdetail.N11Click(Sender: TObject);
begin
try
 form_curr:=tform_curr.Create(application);
 if form_curr.ShowModal=mrok then
  begin
   if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and
      (form_curr.ADOQuery1rkey.Value>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=2) and   //单一外货
       (self.get_glcurr_ptr(trim(sgrid2.Cells[0,sgrid1.row]))<>
       form_curr.ADOQuery1rkey.Value) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[2,sgrid1.Row]:=              //货币
               form_curr.ADOQuery1curr_code.Value;

      if edit5.Tag= form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit2.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1base_to_other.AsString;
       
      sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;

     if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
      sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
     else
      sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
      self.re_calculate;
     end;
  end;
finally
 form_curr.Free;
end;
end;

procedure TForm_ysdetail.N6Click(Sender: TObject);
var
  i:integer;
begin
  try
   form_acct:=tform_acct.Create(application);
   if form_acct.ShowModal=mrok then
    try
     form_curr:=tform_curr.Create(application);
     if form_curr.ShowModal=mrok then
      begin
       if (form_acct.ADOQuery1curr_tp.Value=0) and (form_curr.ADOQuery1rkey.Value>1) then
        messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
       else
        if (form_acct.ADOQuery1curr_tp.Value=2) and
           (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
         messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
        else
         begin

          for i:=sgrid1.RowCount-1 downto sgrid1.Row+1 do
          begin
           sgrid1.Rows[i]:=sgrid1.Rows[i-1];
           sgrid2.Rows[i]:=sgrid2.Rows[i-1];
          end;

          if (sgrid1.Rowcount>3) and (sgrid1.Row>1) then       //摘要
           sgrid1.Cells[0,sgrid1.Row]:=trim(sgrid1.Cells[0,sgrid1.Row-1])
          else
           sgrid1.Cells[0,sgrid1.Row]:='';

          sgrid1.Cells[1,sgrid1.Row]:=              //科目
                           trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                           trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
          sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;

          if edit5.Tag=form_curr.ADOQuery1rkey.Value then
           sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
          else
           sgrid1.Cells[3,sgrid1.Row]:=
                            form_curr.ADOQuery1BASE_TO_OTHER.AsString;

           sgrid1.Cells[4,sgrid1.Row]:='';
           sgrid1.Cells[5,sgrid1.Row]:='';
           sgrid1.Cells[6,sgrid1.Row]:='';

          sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
          sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;

          if sgrid1.RowCount=3 then
           begin
           speedbutton2.Enabled:=true;
           speedbutton3.Enabled:=true;
           speedbutton4.Enabled:=true;
           speedbutton5.Enabled:=true;
           speedbutton6.Enabled:=true;
           end;
         end;
      end;
    finally
     form_curr.Free;
    end;
  finally
   form_acct.Free;
  end;
end;

procedure TForm_ysdetail.N7Click(Sender: TObject);
var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i]:=sgrid1.Rows[i+1];
   sgrid2.Rows[i]:=sgrid2.Rows[i+1];
  end;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 sgrid2.RowCount:=sgrid2.RowCount-1;
if sgrid1.Row=sgrid1.RowCount-1 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end;
self.re_calculate;
end;

procedure TForm_ysdetail.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm_ysdetail.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm_ysdetail.SpeedButton7Click(Sender: TObject);
begin
if State=1 then  //新增
 edit8.Text:=self.get_voucher(strtodate(edit11.Text))
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm_ysdetail.PopupMenu3Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1  then
 begin
  n5.Enabled:=false;
  n7.Enabled:=false;
  n8.Enabled:=false;
  n9.Enabled:=false;
  n11.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  n7.Enabled:=true;
  n8.Enabled:=true;
  n9.Enabled:=true;
  n11.Enabled:=true;
 end;
end;

procedure TForm_ysdetail.PageControl1Change(Sender: TObject);
var
 ys_total:single;
 mt_error:boolean;
 i,rkey103:integer;
begin

if (self.State=1)  then
if (strtocurr(formatfloat('0.00',strtocurr(edit9.text)))<>
    strtocurr(RemoveInvalid(statictext1.Caption))) then
begin

 Edit15.Text := find_employee(strtoint(user_ptr));  //制作人员
 for i:=1 to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i].Clear;
   sgrid2.Rows[i].Clear;
  end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  mt_error:=true;
  dm.ADO104.Close;
  dm.ADO104.Open;           //打开会计分录定义

  if strtocurr(edit9.Text) > 0 then       //借方,处理总价款
   begin
     if edit16.Text='内销' then
      rkey103:=dm.ADO104DFLT_ACCT_01.Value
     else
      rkey103:=dm.ADO104DFLT_ACCT_03.Value;
     self.open_glcnumber(0,rkey103);
     case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
       0:                 //不核算外币
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';  //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
           Formatfloat('0.00',strtocurr(edit9.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
        end;
       2:             //核算单一外币
        begin
         if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
          begin
           sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.text;      //货币
           sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;        //汇率
           sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                             formatfloat('0.00',strtocurr(edit9.Text));
           sgrid2.Cells[1,sgrid2.RowCount-1]:=INtTOSTR(EDIT5.Tag);
          end
         else
          begin
           messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
           mt_error:=false;
          end;
        end;
     end;  // end case

     if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:='销售开票'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                          formatfloat('0.00',strtocurr(edit9.Text));
        sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(rkey103);
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
   //==========以上为借方==================================
   mt_error:=true;
     if edit16.Text='内销' then
      rkey103:=dm.ADO104DFLT_ACCT_02.Value
     else
      rkey103:=dm.ADO104DFLT_ACCT_04.Value;

 //============================= 处理不含税工具费用=================================

//=============================处理贷方税金======================================
   if strtocurr(edit9.Text) > 0 then
    begin
     self.open_glcnumber(0,rkey103);

      case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',strtocurr(edit9.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
      begin
       if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= edit5.text;     //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;       //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',strtocurr(edit9.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:=INtTOSTR(EDIT5.Tag);
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end;

      if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:='销售开票'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                          formatfloat('0.00',strtocurr(edit9.Text));
        sgrid2.Cells[0,sgrid2.RowCount-1]:= inttostr(rkey103);
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
    end;
   self.re_calculate;
end;

  if sgrid1.RowCount=2 then
   begin
    speedbutton2.Enabled:=false;
    speedbutton3.Enabled:=false;
    speedbutton4.Enabled:=false;
    speedbutton5.Enabled:=false;
    speedbutton6.Enabled:=false;
   end
  else
   begin
    speedbutton2.Enabled:=true;
    speedbutton3.Enabled:=true;
    speedbutton4.Enabled:=true;
    speedbutton5.Enabled:=true;
    speedbutton6.Enabled:=true;
   end;
   
end;

procedure TForm_ysdetail.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid2.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid2.Row:=row;
 end;
end;

procedure TForm_ysdetail.N3Click(Sender: TObject);
var
 i:integer;
 rkey_list:string;
 ship_amout:Single;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
try
 form_misctooliv:= tform_misctooliv.Create(application);
 form_misctooliv.Caption:='标准发票搜索';
 with  form_misctooliv.ads112 do
  begin
    close;
    CommandText:=CommandText+'and (CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+#13+
    'and rkey in '+
    '(SELECT   dbo.data0439.invoice_ptr'+
    ' FROM     dbo.Data0064 INNER JOIN'+
    '       dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+
    ' WHERE     (dbo.Data0064.GLPTR_STAUTS2 = 0) AND (dbo.data0439.invoice_ptr IS NOT NULL)'+
    ' and (data0439.CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+#13+
    ' GROUP BY dbo.data0439.invoice_ptr)';
    Prepared;
    open;
  end;

 if form_misctooliv.ShowModal=mrok then
  begin
    rkey_list:=return_rkey(stringgrid2,9);
    ship_amout:=0;

   for i:=1 to form_misctooliv.DBGrid1.SelectedRows.Count do
    begin
     form_misctooliv.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_misctooliv.dbgrid1.SelectedRows.Items[i-1];
     with dm.ADOQuery1 do
      begin
       close;
       sql.Text:=
       'SELECT  Data0064.RKEY, Data0060.SALES_ORDER,data0064.SHIPMENT_NO,'+#13+
       'Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0097.PO_NUMBER,'+#13+
       'data0439.delivery_no, data0439.date_sailing,data0064.cust_decl,'+#13+
       'Data0064.QUAN_SHIPPED,derivedtbl_1.cost_2'+#13+
       'FROM   Data0064 INNER JOIN'+#13+
       ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
       '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey inner join'+#13+
   '(SELECT     dbo.Data0052.SO_SHP_PTR,'+#13+
   'SUM(dbo.Data0052.QUAN_SHP * ISNULL(dbo.Data0006.MATL_COST + dbo.Data0006.OVHD_COST, 0)) AS cost_2'+#13+
   'FROM         dbo.Data0052 INNER JOIN'+#13+
    'dbo.Data0053 ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.RKEY INNER JOIN'+#13+
    'dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'+#13+
    'dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY LEFT OUTER JOIN'+#13+
    'dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY'+#13+
  'WHERE     (dbo.Data0064.GLPTR_STAUTS2 = 0) and (data0060.customer_ptr='+inttostr(edit1.Tag)+')'+#13+
  'GROUP BY dbo.Data0052.SO_SHP_PTR) AS derivedtbl_1 ON dbo.Data0064.RKEY = derivedtbl_1.SO_SHP_PTR'+#13+

       'where data0064.GLPTR_STAUTS2=0 and data0439.invoice_ptr='+form_misctooliv.ads112rkey.AsString+#13;
       if rkey_list<>'' then
        sql.Text:=sql.Text+'and data0064.rkey not in'+rkey_list+#13+
         'order by Data0060.SALES_ORDER'
       else
        sql.Text:=sql.Text+' order by Data0060.SALES_ORDER';
       Prepared;
       open;
       while not eof do
        begin
          stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('SALES_ORDER').AsString; //'销售订单';
          stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
          stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
          stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('PO_NUMBER').AsString; //'客户订单号';
          stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('delivery_no').AsString; //'装箱单号';
          stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('date_sailing').AsString; //'出货日期';
          stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('QUAN_SHIPPED').AsString; //'装运数量';
          stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('cost_2').AsString; //'价格';

          stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;
          stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('SHIPMENT_NO').AsString;
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('cust_decl').AsString;
          stringgrid2.RowCount:=stringgrid2.RowCount+1;
          ship_amout:=ship_amout+fieldbyname('cost_2').AsFloat;
          next;
        end;
      end;
    end;

    edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2));
    change_bitbtn;
  end;
finally
 form_misctooliv.Free;
end;
end;

procedure TForm_ysdetail.N13Click(Sender: TObject);
var
 i:integer;
 ship_amout:single;
begin
  ship_amout:=strtofloat(stringgrid2.Cells[7,stringgrid2.Row]);


  edit9.Text:=formatfloat('0.00',strtocurr(edit9.Text)-ship_amout);

 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 change_bitbtn;
end;

procedure TForm_ysdetail.N12Click(Sender: TObject);
var
 i:integer;
 ship_amout:Single;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
try
  form_assign:= tform_assign.Create(application);
  with  form_assign.ads64 do
   begin
    close;
    Parameters[0].Value:=edit1.Tag;
    Parameters[1].Value:=edit1.Tag;
    if stringgrid2.RowCount>2 then
     begin
      CommandText:=CommandText+'and data0064.rkey not in'+return_rkey(stringgrid2,9);
     end;
    Prepared;
    open;
   end;

  if form_assign.ShowModal=mrok then
  begin
    ship_amout:=0;

   for i:=1 to form_assign.DBGrid1.SelectedRows.Count do
    begin
     form_assign.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_assign.dbgrid1.SelectedRows.Items[i-1];
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('SALES_ORDER').AsString; //'销售订单';
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('PO_NUMBER').AsString; //'客户订单号';
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('delivery_no').AsString; //'装箱单号';
     stringgrid2.Cells[5,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('date_sailing').AsString; //'出货日期';
     stringgrid2.Cells[6,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('QUAN_SHIPPED').AsString; //'装运数量';
     stringgrid2.Cells[7,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('cost_2').AsString; //'价格';
//     stringgrid2.Cells[8,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('TAX_2').AsString; //'税率%';
     stringgrid2.Cells[9,stringgrid2.RowCount-1]:=form_assign.ads64RKEY.AsString;
     stringgrid2.Cells[10,stringgrid2.RowCount-1]:=form_assign.ads64SHIPMENT_NO.AsString;
     stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_assign.ads64cust_decl.Value;
     ship_amout:=ship_amout+form_assign.ads64.fieldbyname('cost_2').AsFloat;

     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;

    edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2));
    change_bitbtn;
  end;
finally
 form_assign.Free;
end;
end;

procedure TForm_ysdetail.BitBtn1Enter(Sender: TObject);
begin
 if sgrid1.RowCount<=2 then
  begin
    messagedlg('科目没有借贷明细!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    PageControl1Change(sender);
    sgrid1.SetFocus;
    exit;
  end;

  if strtocurr(RemoveInvalid(statictext1.Caption))<>
     strtocurr(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;

  if not dm.Aqd508.Active then dm.Aqd508.Open;

  if (strtoint(Edit13.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit13.Text) <= dm.Aqd508CURR_FYEAR.Value) and
      (strtoint(Edit14.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit11.SetFocus;
    exit;
   end;

  if (strtoint(Edit14.Text) <> monthof(strtodate(edit11.text))) or
     (strtoint(Edit13.Text) <> yearof(strtodate(edit11.text))) then
   begin
    messagedlg('凭证年度不等于凭证日期限的会计年度请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit11.SetFocus;
    exit;
   end;

 
end;

procedure TForm_ysdetail.BitBtn1Click(Sender: TObject);
var
 i:integer;
 number:string;
begin
 if (strtocurr(formatfloat('0.00',strtocurr(edit9.text)))<>
    strtocurr(RemoveInvalid(statictext1.Caption))) then
  if messagedlg('科目借方金额与发票发生额不一致是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
   begin
    exit;
   end;

if self.State=1 then
 begin
  if self.vo_number(trim(edit8.Text)) then
   begin
    edit8.Text:=self.get_voucher(strtodate(edit11.text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;
  if self.find_error(number,0) then
   begin
    messagedlg('保存时遇到错误,多人操作了同一数据标识号:'+number,mterror,[mbcancel],0);
    exit;
   end;
  try
   dm.ADOConnection1.BeginTrans;
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=0;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit8.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=edit10.Text;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=8;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);              //附件张数
     dm.ado105FYEAR.Value := strtoint(edit13.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit14.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=edit1.Tag;                      //客户
     dm.ADO105CURRENCY_PTR.Value:=edit5.Tag;
     dm.ADO105EXCHANGE_RATE.AsString:=edit2.Text;
     post;
    end;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;
    for i:=1 to SGrid2.RowCount-2 do
    begin
    dm.ado106.Append;
    dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
    dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
    dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
    dm.ADO106EXCH_RATE.AsString:=
      Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
    dm.ado106REF_NUMBER.Value:=edit10.Text;
    dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
    dm.ADO106price.AsString:=sgrid1.Cells[4,i];
    if (trim(sgrid1.Cells[5,i])<>'') then
     begin
      dm.ado106AMOUNT.AsString:=sgrid1.Cells[5,i];
      dm.ado106D_C.Value:='D';               //借方
     end
    else
     begin
      dm.ado106AMOUNT.AsString:=sgrid1.Cells[6,i];
      dm.ado106D_C.Value:='C';               //贷方
     end;
    dm.ado106.Post;
   end;

   number:=return_rkey(stringgrid2,9);
   if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set GLPTR_STAUTS2=1 , GL_HEADER_PTR2='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

   end;
   dm.ADOConnection1.CommitTrans;
   if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
    begin
     form_voucherreport:=Tform_voucherreport.Create(application);
     form_voucherreport.ppReport1.Reset;
     form_voucherreport.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
     form_voucherreport.ppReport1.Template.LoadFromFile;

     form_voucherreport.AQD105.Close;
     form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
     form_voucherreport.AQD105.open;
     form_voucherreport.AQD106.Open;
     form_voucherreport.AQD493.Open;
     form_voucherreport.ppReport1.Print;
     form_voucherreport.Free;
    end;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

 end
else
 begin
  if self.find_error(number,dm.ADS105RKEY.Value) then
   begin
    messagedlg('保存时遇到错误,多人操作了同一数据标识号:'+number,mterror,[mbcancel],0);
    exit;
   end;
  with dm.ado105 do                                        //增加会计凭证总表
   begin
    close;
    dm.ado105.Parameters[0].Value:=dm.ADS105RKEY.Value;
    open;
   end;
  if (dm.ADO105STATUS.Value<>0) or (dm.ADO105.IsEmpty) then
   begin
    messagedlg('保存时遇到错误,凭证状态已发生变化!',mterror,[mbcancel],0);
    exit;
   end;

  try
   dm.ADOConnection1.BeginTrans;
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     edit;
     dm.ado105BATCH_NUMBER.Value:=edit10.Text;  //参考发票号
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);              //附件张数
     dm.ADO105EXCHANGE_RATE.AsString:=edit2.Text;
     post;
    end;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;
    while not dm.ADO106.Eof do  dm.ADO106.Delete;
    for i:=1 to SGrid2.RowCount-2 do
    begin
      dm.ado106.Append;
      dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
      dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
      dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
      dm.ADO106EXCH_RATE.AsString:=
      Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
      dm.ado106REF_NUMBER.Value:=edit10.Text;
      dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
      dm.ADO106price.AsString:=sgrid1.Cells[4,i];
      if (trim(sgrid1.Cells[5,i])<>'') then
       begin
        dm.ado106AMOUNT.AsString:=sgrid1.Cells[5,i];
        dm.ado106D_C.Value:='D';               //借方
       end
      else
       begin
        dm.ado106AMOUNT.AsString:=sgrid1.Cells[6,i];
        dm.ado106D_C.Value:='C';               //贷方
       end;
      dm.ado106.Post;
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set glptr_stauts2=0 , GL_HEADER_PTR2=null'+#13+
              'where GL_HEADER_PTR2='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;

   number:=return_rkey(stringgrid2,9);
   if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set glptr_stauts2=1 , GL_HEADER_PTR2='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

   end;
   dm.ADOConnection1.CommitTrans;
   if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
    begin
     form_voucherreport:=Tform_voucherreport.Create(application);
     form_voucherreport.ppReport1.Reset;
     form_voucherreport.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
     form_voucherreport.ppReport1.Template.LoadFromFile;

     form_voucherreport.AQD105.Close;
     form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
     form_voucherreport.AQD105.open;
     form_voucherreport.AQD106.Open;
     form_voucherreport.AQD493.Open;
     form_voucherreport.ppReport1.Print;
     form_voucherreport.Free;
    end;   
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;
end;

procedure TForm_ysdetail.change_bitbtn;
begin
if (stringgrid2.RowCount > 2) then
 begin
  bitbtn6.Enabled:=false;
  bitbtn4.Enabled:=false;
 end;

 if (stringgrid2.RowCount = 2) then
 begin
  bitbtn6.Enabled:=true;
  bitbtn4.Enabled:=true;
 end;
end;

procedure TForm_ysdetail.PopupMenu2Popup(Sender: TObject);
begin
if stringgrid2.Row= stringgrid2.RowCount-1 then
 begin
  n13.Enabled:=false;
  n2.Enabled:=false;
 end
else
 begin
  n13.Enabled:=true;
  n2.Enabled:=true;
 end;
end;

procedure TForm_ysdetail.N2Click(Sender: TObject);
begin
form_costdetail:=tform_costdetail.Create(application);
with form_costdetail do
 begin
  ads52.Close;
  ads52.Parameters[0].Value:=stringgrid2.Cells[9,stringgrid2.Row];
  ads52.Prepared;
  ads52.Open;
 end;
form_costdetail.ShowModal;
form_costdetail.Free;
end;

end.
