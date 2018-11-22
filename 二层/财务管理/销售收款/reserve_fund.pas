unit reserve_fund;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, Grids, ExtCtrls, ComCtrls,
  ToolWin,DateUtils, Menus, DB, ADODB, DBGridEh, DBClient, Provider;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    edit1: TEdit;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    edit2: TEdit;
    BitBtn5: TBitBtn;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Edit5: TEdit;
    Label11: TLabel;
    Edit6: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label25: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit16: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    abbr_name: TLabel;
    SText3: TStaticText;
    Label10: TLabel;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N1: TMenuItem;
    Label17: TLabel;
    Edit10: TEdit;
    DBGrd: TDBGridEh;
    DS152: TDataSource;
    CDS152: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    CDS152srce_ptr: TIntegerField;
    CDS152po_number: TStringField;
    CDS152manu_part_number: TStringField;
    CDS152all_shipqty: TIntegerField;
    ADO152: TADODataSet;
    ADO152srce_ptr: TIntegerField;
    ADO152po_number: TStringField;
    ADO152manu_part_number: TStringField;
    ADO152all_shipqty: TIntegerField;
    ADO152amount: TFloatField;
    CDS152amount: TFloatField;
    Label12: TLabel;
    Edit9: TEdit;
    BitBtn2: TBitBtn;
    Label13: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    DBCheckBox1: TDBCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    function get_vouchernumber(inv_date: tdatetime): string;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function invo_number_error(number: string): boolean;
    function vo_number(number: string): boolean;
    function memo_number_error(number: string): boolean;
    function get_bankcheck(bank_ptr:integer): string;
    procedure re_calculate;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure update_128(v_seed: string);
    procedure update_04(v_seed: string);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12Exit(Sender: TObject);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure DBGrdEditButtonClick(Sender: TObject);
    procedure DBGrdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrdExit(Sender: TObject);
    procedure DBGrdKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrdColExit(Sender: TObject);
    procedure ADO152AfterOpen(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
   accbank_gl_ptr,acc_gl_ptr:integer;
//   status:Integer;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
   function find_bank_acct(rkey103: integer): boolean;
  public
    { Public declarations }
    tag:Integer;
  end;

var
  Form3: TForm3;
  function RemoveInvalid(where: string): string;
  function Power(x, y : extended) : extended;

implementation

uses DAMO, BankSearch, customer_search, AcctSearch, curr_search, main,
  voucher_report, voucher_dictionary,Pick_Item_Single ,ConstVar,common,
 manuaprt;

{$R *.dfm}
function TForm3.get_col5(row: integer): currency;
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

function TForm3.get_col6(row: integer): currency;
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

function Power(x, y : extended) : extended;
begin
  result := exp(y*ln(x));
end;

procedure TForm3.update_128(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  dm.ado128.Close;
  dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
  dm.ado128.Open;
  dm.ADO128.Edit;
  dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+dm.ADO114AMOUNT.Value-
                            dm.ado114DEBIT_AMOUNT.Value;
  v_length := length(v_seed);
  for i := v_length downto 1 do
    if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
    begin
      v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
      dm.ADO128bank_current_check.Value:=new_seed;
      break;
    end
    else
      if i=1 then //如果第一位仍然是数字
      begin
        v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
        new_seed := copy(v_last,2,v_length);
        dm.ADO128bank_current_check.Value:=new_seed;
      end;
  dm.ADO128.Post;
end;

procedure TForm3.update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  v_length := length(v_seed);
  for i := v_length downto 1 do
    if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
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

function RemoveInvalid(where: string): string;
var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
          copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

function TForm3.get_vouchernumber(inv_date: tdatetime): string;
var
  voucher:string;
  pr_req:integer;
begin
  if dm.ado114bank_ptr.value>0 then
  begin
    voucher:='RA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
    label25.Caption:='收款凭证';
  end
  else
  begin
    voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
    label25.Caption:='转帐凭证';
  end;

  if length(inttostr(monthof(inv_date))) < 2 then
    voucher := voucher+'0'+inttostr(monthof(inv_date))
  else
    voucher := voucher+inttostr(monthof(inv_date));      //月份
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
  result:=voucher;
end;

procedure TForm3.re_calculate;
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

function TForm3.get_gltp(rkey103: string): integer;
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

function TForm3.get_glcurr_ptr(rkey103: string): integer;
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

function TForm3.invo_number_error(number: string): boolean;
begin
  result:=false;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0114');
    sql.Add('where REFERENCE_NO='''+number+'''');
    open;
    if not IsEmpty then  result:=true;
  end;
end;

function TForm3.vo_number(number: string): boolean;
begin
  result:=false;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0105');
    sql.Add('where VOUCHER='''+number+'''');
    open;
    if not IsEmpty then  result:=true;
  end;
end;

function TForm3.memo_number_error(number: string): boolean;
begin
  result:=false;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0116');
    sql.Add('where MEMO_NUMBER='''+number+'''');
    open;
    if not IsEmpty then  result:=true;
  end;
end;

function TForm3.get_bankcheck(bank_ptr:integer): string;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select bank_current_check from data0128');
    sql.Add('where rkey='+inttostr(bank_ptr));
    open;
    if fieldvalues['bank_current_check']<>null then
      result:= fieldvalues['bank_current_check']
    else
      result:='';
  end;
end;

procedure TForm3.BitBtn6Click(Sender: TObject);
begin
  form_bank:=tform_bank.Create(application);

  if form_bank.ShowModal=mrok then
  if dm.ado114BANK_PTR.Value<>form_bank.Adodata0128rkey.Value then
  begin
    dm.ado114BANK_PTR.Value:=form_bank.Adodata0128rkey.Value;
    edit3.Text:=form_bank.Adodata0128bank_name.Value;
    stext3.Caption:=form_bank.Adodata0128bal_amount.AsString;
    dm.ado114CURRECY_PTR.Value:=form_bank.Adodata0128currency_ptr.Value;
    edit2.Text:=form_bank.Adodata0128curr_code.Value;
    label15.Caption:=form_bank.Adodata0128curr_name.Value;
    edit5.Text:=form_bank.Adodata0128base_to_other.AsString;
    edit4.Text:=trim(form_bank.Adodata0128bank_current_check.Value);
    self.accbank_gl_ptr:=form_bank.Adodata0128gl_acct_ptr.Value;
    if dm.ado114CURRECY_PTR.Value=1 then
      edit5.Enabled:=false
    else
      edit5.Enabled:=true;
  end;
  form_bank.Free;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
  if (bitbtn6.Enabled) and (trim(edit3.Text)='') then
  begin
    messagedlg('请首先确定现金银行帐户',mterror,[mbcancel],0);
    bitbtn6.SetFocus;
  end
  else
    try
      form_customer:=tform_customer.Create(application);
      if form_customer.ShowModal=mrok then
      begin
        dm.ado114SRCE_PTR.Value:=form_customer.ADOQuery1rkey.Value;
        edit1.Text:=form_customer.ADOQuery1CUST_CODE.Value;
        label14.Caption:=form_customer.ADOQuery1CUSTOMER_NAME.Value;
        self.acc_gl_ptr:=form_customer.ADOQuery1ACC_REC_PTR.Value;
        abbr_name.Caption:=form_customer.ADOQuery1abbr_name.Value;
        label18.Caption:=form_customer.ADOQuery1FED_TAX_ID_NO.Value; //付款方式
        if trim(edit2.Text)='' then
        begin
          edit2.Text:=form_customer.ADOQuery1CURR_CODE.Value;
          label15.Caption:=form_customer.ADOQuery1CURR_NAME.Value;
          dm.ado114CURRECY_PTR.Value:=form_customer.ADOQuery1CURRENCY_PTR.Value;
          edit5.Text:=form_customer.ADOQuery1base_to_other.AsString;
          if dm.ado114CURRECY_PTR.Value = 1 then
            edit5.Enabled:=false
          else
            edit5.Enabled:=true;
        end;
      end;
    finally
      form_customer.Free;
    end;
end;

procedure TForm3.Edit5Exit(Sender: TObject);
begin
  if trim(edit5.Text)='' then
  begin
    showmessage('汇率数据输入有误!');
    edit5.SetFocus;
  end
  else
    if strtofloat(edit5.Text)<=0 then
    begin
      showmessage('汇率数据输入有误!');
      edit5.SetFocus;
    end
    else
    begin
      edit5.Text:=formatfloat('0.00000000',strtofloat(edit5.Text));
    end;
end;

procedure TForm3.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm3.Edit6Exit(Sender: TObject);
begin
  if trim(edit6.Text)='' then edit6.Text:='0.00';
  edit6.Text:=formatfloat('0.00',strtocurr(edit6.Text));
  if strtocurr(edit10.Text) > strtocurr(edit6.Text) then
  begin
    messagedlg('银行手续费不能大于票据金额!',mterror,[mbcancel],0);
    edit6.SetFocus;
  end;
end;

procedure TForm3.PageControl1Change(Sender: TObject);
var
  i:word;
  VoucherExisted,mt_error:boolean;
  debit_amout:currency;
begin
  if not DM.ado114IF_VOUCHER.AsBoolean then exit;
  if (dm.ado114SRCE_PTR.Value>0)  then
    debit_amout:=strtocurr(formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text)))
  else
    debit_amout:=0;
           //在编辑时编码为空可能是先前没有金额发生编辑时发生金额,所以需要重做凭证
  VoucherExisted:=DM.rkey105Exists(DM.ado114.fieldbyName('rkey').AsInteger);
  if (dm.ADO114.State=dsinsert) or (edit11.Text='') or (VoucherExisted=false) then //凭证尚未生成
//  if (dm.ADO114.State in dseditModes) or (edit11.Text='') then  //jacky zhong 2016-3-28
  if (dm.ado114SRCE_PTR.Value>0) and (debit_amout<>strtocurr(RemoveInvalid(statictext1.Caption))) then
  begin
    edit11.Text:=self.get_vouchernumber(dm.ADO114TDATE.Value);
    edit12.Text:=dm.GetServerDate;//dm.ADO114TDATE.AsString;
    Edit14.Text:=inttostr(yearof(dm.ADO114TDATE.Value));   //会计年度
    Edit15.Text:=inttostr(monthof(dm.ADO114TDATE.Value));  //会计期间
    edit16.Text:=form1.empl_name.Caption;
    for i:=1 to sgrid1.RowCount-2 do
    begin
      sgrid1.Rows[i].Clear;
      sgrid2.Rows[i].Clear;
    end;
    sgrid1.RowCount:=2;
    sgrid2.RowCount:=2;
    dm.ADO104.Close;
    dm.ADO104.Open;           //打开会计分录定义
    mt_error:=true;
    if strtocurr(edit6.Text)-strtocurr(edit10.Text) > 0 then      //借票据到帐金额
      with dm.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
        sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
        sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
        sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
        if accbank_gl_ptr>0 then
          sql.Add('where Data0103.rkey='+inttostr(accbank_gl_ptr))
        else
        begin
          if VoucherExisted=false then //凭证未生成
          begin
            accbank_gl_ptr:=DM.Get_Bank_gl_acct_ptr_by_rkey(dm.ado114.fieldbyName('BANK_PTR').AsString);
            if accbank_gl_ptr>0 then
              sql.Add('where Data0103.rkey='+inttostr(accbank_gl_ptr))
            else
              sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString)
          end
          else
            sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
        end;
        open;

        case fieldbyname('curr_tp').AsInteger of
          0:                 //不核算外币
          begin
            sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
            sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
            sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                                               Formatfloat('0.00',(strtocurr(edit6.Text)-strtocurr(edit10.Text))*strtofloat(edit5.Text));
            sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
          end;
          2:             //核算单一外币
          begin
            if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
            begin
              sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币
              sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率
              sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                                     formatfloat('0.00',strtocurr(edit6.Text)-strtocurr(edit10.Text));
              sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
            end
            else
            begin
              messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
              mt_error:=false;
            end;
          end;
        end;
        if mt_error then
        begin
          sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                                             edit4.Text+ '['+edit1.Text+ABBR_NAME.Caption+']';
          sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                             trim(FieldValues['gl_acc_number'])+'-'+trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+trim(FieldValues['DESCRIPTION']);
          sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                  formatfloat('0.00',(strtocurr(edit6.Text)-strtocurr(edit10.Text))*strtofloat(edit5.Text));
          if accbank_gl_ptr>0 then
            sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(accbank_gl_ptr)
          else
            sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;
        end;
       end;
    //====================借银行手续费===============================
    if strtocurr(edit10.Text) > 0 then      //借票据手续费金额
      with dm.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
        sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
        sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
        sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
        sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_04.AsString);
        open;
        case fieldbyname('curr_tp').AsInteger of
          0:                 //不核算外币
          begin
            sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
            sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
            sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                                               Formatfloat('0.00',strtocurr(edit10.Text)*strtofloat(edit5.Text));
            sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
          end;
          2:             //核算单一外币
          begin
            if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
            begin
              sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;       //货币
              sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率
              sgrid1.Cells[4,sgrid1.RowCount-1]:=                  //原币金额
                                 formatfloat('0.00',strtocurr(edit10.Text));
              sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
            end
            else
            begin
              messagedlg('对不起会计分录中定义的价格折让帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
              mt_error:=false;
            end;
          end;
        end;
        if mt_error then
        begin
          sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                             edit4.Text+ '['+
                             edit1.Text+
                             ABBR_NAME.Caption+']';
          sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                             trim(FieldValues['gl_acc_number'])+'-'+
                             trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                             trim(FieldValues['DESCRIPTION']);
          sgrid1.Cells[5,sgrid1.RowCount-1]:=          //借方本位币金额
                  formatfloat('0.00',strtocurr(edit10.Text)*strtofloat(edit5.Text)
                              );
          sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_04.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;
        end;
      end;
    //====================以上为借方====以下为贷方================================

    mt_error:=true;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      if self.acc_gl_ptr>0 then
        sql.Add('where Data0103.rkey='+inttostr(acc_gl_ptr))
      else
      begin
        if VoucherExisted=false then //凭证未生成
        begin
          self.acc_gl_ptr:=DM.Get_Cust_acc_gl_ptr_by_rkey(dm.ado114.fieldbyName('SRCE_PTR').AsString);
          if self.acc_gl_ptr>0 then
            sql.Add('where Data0103.rkey='+inttostr(acc_gl_ptr))
          else
            sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
        end
        else
         sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
      end;
      open;
      case fieldbyname('curr_tp').AsInteger of
        0:                 //不核算外币
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
           Formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
        end;
        2:             //核算单一外币
        begin
          if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
          begin
            sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币
            sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;    //汇率
            sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                                    formatfloat('0.00',strtocurr(edit6.Text));
            sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
          end
          else
          begin
            messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
            mt_error:=false;
          end;
        end;
      end;
      if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                           edit4.Text+ '['+edit1.Text+ABBR_NAME.Caption+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(FieldValues['gl_acc_number'])+'-'+trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+trim(FieldValues['DESCRIPTION']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //货方本币金额
                           formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
        if self.acc_gl_ptr>0 then
          sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(acc_gl_ptr)
        else
          sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;
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

procedure TForm3.N4Click(Sender: TObject);
begin
  try
   form_acct:=tform_acct.Create(application);
   if form_acct.ShowModal=mrok then
     try
       form_curr:=tform_curr.Create(application);
       if form_curr.ShowModal=mrok then
       begin
         if (dm.ado114BANK_PTR.Value=0) and (find_bank_acct(form_acct.ADOQuery1RKEY.Value)) then
         begin
           messagedlg('科目连接有现金银行帐户,不能添加!',mterror,[mbcancel],0);
           exit;
         end;

         if (form_acct.ADOQuery1curr_tp.Value=0) and (form_curr.ADOQuery1rkey.Value>1) then
           messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
         else
           if (form_acct.ADOQuery1curr_tp.Value=2) and (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
            messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
           else
           begin
             sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                      sgrid1.Cells[0,sgrid1.RowCount-2];

             sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                             trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                             trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                             trim(form_acct.ADOQuery1description_2.Value);

             sgrid1.Cells[2,sgrid1.RowCount-1]:=form_curr.ADOQuery1curr_code.Value;
             if dm.ado114CURRECY_PTR.Value= form_curr.ADOQuery1rkey.Value then
               sgrid1.Cells[3,sgrid1.RowCount-1]:= edit5.Text
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

procedure TForm3.N5Click(Sender: TObject);
begin
  try
    form_acct:=tform_acct.Create(application);
    if form_acct.ShowModal=mrok then
    begin
      if (form_acct.ADOQuery1curr_tp.Value=0) and (strtoint(sgrid2.Cells[1,sgrid1.Row])>1) then
        messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
      else
        if (form_acct.ADOQuery1curr_tp.Value=2) and (form_acct.ADOQuery1curr_ptr.Value<>strtoint(sgrid2.Cells[1,sgrid1.Row])) then
          messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
        else
        begin
          sgrid1.Cells[1,sgrid1.Row]:=              //科目
                            trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                            trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                            trim(form_acct.ADOQuery1description_2.Value);
          sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
        end;
    end;
  finally
   form_acct.Free;
  end;
end;

procedure TForm3.N11Click(Sender: TObject);
begin
  try
    form_curr:=tform_curr.Create(application);
    if form_curr.ShowModal=mrok then
    begin
      if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and (form_curr.ADOQuery1rkey.Value>1) then
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
          if dm.ado114CURRECY_PTR.Value= form_curr.ADOQuery1rkey.Value then
            sgrid1.Cells[3,sgrid1.Row]:= edit5.Text
          else
            sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1base_to_other.AsString;
          sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;
          if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
            sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])/
                                                       strtofloat(sgrid1.Cells[3,sgrid1.row]))
          else
            sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])/
                                                       strtofloat(sgrid1.Cells[3,sgrid1.row]));
          self.re_calculate;
        end;
    end;
  finally
   form_curr.Free;
  end;
end;

procedure TForm3.N7Click(Sender: TObject);
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

procedure TForm3.N9Click(Sender: TObject);
begin
  if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
    sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1];
end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
  if dm.ADO114.State=dsinsert then
  begin
    edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
    Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
    Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
  end
  else
    messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm3.Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (acol>3) then
    Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                   -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm3.Sgrid1Exit(Sender: TObject);
begin
if (sgrid1.col > 3) and (sgrid1.row<>sgrid1.RowCount-1) then
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

procedure TForm3.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if sgrid1.Col<>0 then
    if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
      abort
    else
      if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm3.Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

procedure TForm3.Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
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

procedure TForm3.FormActivate(Sender: TObject);
var
 i:word;
begin
  sgrid1.Cells[0,0]:='科目摘要';
  sgrid1.Cells[1,0]:='科目代码及明称';
  sgrid1.Cells[2,0]:='币种';
  sgrid1.Cells[3,0]:='汇率';
  sgrid1.Cells[4,0]:='原币金额';
  sgrid1.Cells[5,0]:='借方(本币)';
  sgrid1.Cells[6,0]:='贷方(本币)';

  if dm.ADo114.State=dsinsert then     //新增
  begin

  end
  else           //编辑
  begin
    Label18.Caption:=dm.aqd114FED_TAX_ID_NO.Value;
    dm.Aqd105.Close;
    dm.Aqd105.Parameters[0].Value:=dm.ADO114RKEY.Value;
    dm.Aqd105.Open;
    edit11.Text:=dm.Aqd105VOUCHER.Value;
    edit12.Text:=dm.Aqd105ENTERED_DT.AsString;
    edit14.Text:=dm.Aqd105FYEAR.AsString;
    edit15.Text:=dm.Aqd105PERIOD.AsString;
    updown1.Position:=dm.Aqd105ATTACHED.Value;
    edit16.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
    dm.Aqd106.Close;
    dm.Aqd106.Parameters[0].Value:=dm.Aqd105rkey.Value;
    dm.Aqd106.Open;
    sgrid1.RowCount:=dm.Aqd106.RecordCount+2;
    sgrid2.RowCount:=sgrid1.RowCount;
    for i:=1 to dm.Aqd106.RecordCount do
    begin
      sgrid1.Cells[0,i]:=dm.Aqd106DESCRIPTION.Value;
      sgrid1.Cells[1,i]:=dm.Aqd106gl_desc.Value;
      sgrid1.Cells[2,i]:=dm.aqd106curr_code.value;

      if dm.Aqd106EXCH_RATE.Value>0 then
       sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value)
      else
       sgrid1.Cells[3,i]:='0.00';
      sgrid1.Cells[4,i]:=dm.Aqd106PRICE.AsString;

      sgrid2.Cells[0,i]:=dm.Aqd106GL_ACCT_NO_PTR.AsString;
      sgrid2.Cells[1,i]:=dm.Aqd106CURR_PTR.AsString;
      if dm.Aqd106D_C.Value='D' then
        sgrid1.Cells[5,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.Value)
      else
        sgrid1.Cells[6,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.Value);
      dm.Aqd106.Next;
    end;
    dm.Aqd105.Close;
    dm.Aqd106.Close;

    dm.ado116.close;
    dm.ado116.Parameters[0].Value:=dm.ado114RKEY.Value;
    dm.ado116.Open;
    edit7.Text:=trim(dm.ado116MEMO_NUMBER.Value);
    edit8.Text:=dm.ado116DESCRIPTION.Value;
    Edit9.Text:=dm.aqd114warehouse_code.Value;
    label13.Caption:=dm.aqd114abbrname15.Value;
    dm.ado116.Close;
  end;
  self.re_calculate();//重新计算借货金额
  self.PageControl1.ActivePageIndex:=0;
end;

procedure TForm3.BitBtn1Enter(Sender: TObject);
var
  amount:Double;
begin
  if trim(edit4.Text)='' then
  begin
    messagedlg('支票号码不能为空!',mtinformation,[mbcancel],0);
    pagecontrol1.ActivePageIndex:=0;
    edit4.SetFocus;
    exit;
  end;

  if (bitbtn6.Enabled) and (trim(edit3.Text)='') then
  begin
    messagedlg('现金银行帐户不能为空!',mtinformation,[mbcancel],0);
    pagecontrol1.ActivePageIndex:=0;
    edit3.SetFocus;
    exit;
  end;

  if trim(edit1.Text)='' then
  begin
    messagedlg('客户不能为空!',mtinformation,[mbcancel],0);
    pagecontrol1.ActivePageIndex:=0;
    edit1.SetFocus;
    exit;
  end;

  if trim(edit7.Text)='' then
  begin
    messagedlg('贷项备忘不能为空!',mtinformation,[mbcancel],0);
    pagecontrol1.ActivePageIndex:=0;
    edit7.SetFocus;
    exit;
  end;

  if trim(edit9.Text)='' then
  begin
    messagedlg('工厂代码不能为空!',mtinformation,[mbcancel],0);
    pagecontrol1.ActivePageIndex:=0;
    edit9.SetFocus;
    exit;
  end;

  if (dm.ado114BANK_PTR.Value>0) and (dm.ado114.State=dsinsert) then
    if not (edit4.Text[length(trim(edit4.Text))] in ['0'..'9']) then
    begin
      messagedlg('票据编号最后一位必需是一个整数!',mtinformation,[mbok],0);
      self.PageControl1.ActivePageIndex:=0;
      edit4.SetFocus;
      exit;
    end;

   dm.ADO04.Close;
   dm.ADO04.Open;
   if (dm.ADO04SEED_FLAG.Value<>1) and (dm.ado114.State=dsinsert) then
   if not (edit7.Text[length(trim(edit7.Text))] in ['0'..'9']) then
   begin
     messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
     self.PageControl1.ActivePageIndex:=0;
     edit7.SetFocus;
     exit;
   end;

   if strtocurr(edit6.Text)<=0 then
   begin
     messagedlg('无法新增实收金额为零的现金收据!',mtinformation,[mbcancel],0);
     self.PageControl1.ActivePageIndex:=0;
     edit6.SetFocus;
     exit;
   end;

   if DM.ado114IF_VOUCHER.AsBoolean then    //jacky zhong 2016-3-28
   begin
     self.PageControl1Change(sender);
     if strtocurr(RemoveInvalid(statictext1.Caption))<> strtocurr(RemoveInvalid(statictext2.Caption)) then
     begin
       messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
       self.PageControl1.ActivePageIndex:=1;
       sgrid1.SetFocus;
       exit;
     end;

     {if strtocurr(formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text)
                                 ))<>   //借方合计
        strtocurr(RemoveInvalid(statictext1.Caption)) then
      begin
       messagedlg('业务发生额与凭证发生额不一致!',mterror,[mbcancel],0);
       self.PageControl1.ActivePageIndex:=1;
       sgrid1.SetFocus;
       exit;
      end;}

      if not dm.Aqd508.Active then dm.Aqd508.Open;
      if (strtoint(Edit14.Text) < dm.Aqd508CURR_FYEAR.Value) or
         ((strtoint(Edit14.Text) <= dm.Aqd508CURR_FYEAR.Value) and
         (strtoint(Edit15.Text) < dm.Aqd508CURR_PERIOD.Value)) then
      begin
        messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
        self.PageControl1.ActivePageIndex:=1;
        edit12.SetFocus;
        exit;
      end;
      if (strtoint(Edit15.Text) <> monthof(strtodate(edit12.text))) then
      begin
        messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
        self.PageControl1.ActivePageIndex:=1;
        edit12.SetFocus;
        exit;
      end;
   end;

  amount:=0;
  if not CDS152.IsEmpty then
  begin
    CDS152.First;
    while not CDS152.Eof do
    begin
      amount:=amount+CDS152amount.Value;
      CDS152.Next;
    end;
    if StrToCurr(FormatFloat('0.00',amount))<>StrToCurr(Edit6.Text) then
    begin
      ShowMessage('预收明细金额之和不等于票据金额');
      DBGrd.SetFocus;
      Abort;
    end;
  end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
  if dm.ado114.State=dsInsert then //新增
  begin
    if self.invo_number_error(trim(edit4.Text)) then     //发票号码是否存在
    begin
      if dm.ado114BANK_PTR.Value > 0 then
      begin
        Edit4.Text:=self.get_bankcheck(dm.ado114BANK_PTR.Value);
        messagedlg('票据编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
      end
      else
      begin
        messagedlg('票据编号重复!请手工重新输入',mterror,[mbok],0);
        self.PageControl1.ActivePageIndex:=0;
        edit4.SetFocus;
        exit;
      end;
    end;

    if self.vo_number(trim(edit11.Text)) then
    begin
      edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
      messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
    end;

    if self.memo_number_error(trim(edit7.Text)) then
     begin
      dm.ADO04.Close;
      dm.ADO04.Open;
      if dm.ADO04SEED_FLAG.Value<>1 then
      begin
        Edit7.Text:=dm.ADO04SEED_VALUE.Value;
        messagedlg('备忘编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
      end
      else
      begin
        messagedlg('备忘编号重复!请手工重新输入',mterror,[mbok],0);
        self.PageControl1.ActivePageIndex:=0;
        edit7.SetFocus;
        exit;
      end;
     end;

    dm.ADOConnection1.BeginTrans;
    try
      dm.ado114REFERENCE_NO.Value:=edit4.Text;
      dm.ado114AMOUNT.AsString:=edit6.Text;
      dm.ado114DEBIT_AMOUNT.AsString:=edit10.Text;   //银行手续费
      
      dm.ado114EXCHANGE_RATE.AsString:=edit5.Text;

      dm.ado114.Post;

      if dm.ado114BANK_PTR.Value>0 then
        self.update_128(trim(edit4.Text)); //更新票据编号及金额
      if not CDS152.IsEmpty then
      begin
        CDS152.First;
        while not CDS152.Eof do
        begin
          with DM.ADOQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='insert into data0152 values (:srce_ptr,:po_number,:manu_part_number,:all_shipqty,:amount)';
            Parameters[0].Value:=DM.ado114RKEY.Value;
            Parameters[1].Value:=CDS152po_number.Value;
            Parameters[2].Value:=CDS152manu_part_number.Value;
            Parameters[3].Value:=CDS152all_shipqty.Value;
            Parameters[4].Value:=CDS152amount.Value;
            Prepared;
            ExecSQL;
            CDS152.Next;
          end;
        end;
      end;

      dm.ado116.close;
      dm.ado116.Parameters[0].Value:=dm.ado114RKEY.Value;
      dm.ado116.Open;
      dm.ado116.Append;
      dm.ado116MEMO_NUMBER.Value:=edit7.Text;
      dm.ado116DESCRIPTION.Value:=edit8.Text;
      dm.ado116CUST_PTR.Value:=dm.ado114SRCE_PTR.Value;
      dm.ado116SRCE_PTR.Value:=dm.ado114RKEY.Value;
      dm.ado116MEMO_TP.Value:=1;
      dm.ado116EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value;
      dm.ado116MEMO_DATE.Value:=dm.ado114TDATE.Value;
      dm.ado116RMA_DATE.Value:=dm.ado116MEMO_DATE.Value;
      dm.ado116AMOUNT.Value:=dm.ado114AMOUNT.Value;
      dm.ado116AVL_AMT.Value:=dm.ado114AMOUNT.Value;
      dm.ado116GOODS_AMT.Value:=dm.ado114AMOUNT.Value;
      dm.ado116CURRENCY_PTR.Value:=dm.ado114CURRECY_PTR.Value;
      dm.ado116EX_RATE.Value:=dm.ado114EXCHANGE_RATE.Value;
      dm.ado116REF_NUMBER.Value:=dm.ado114REFERENCE_NO.Value+'预收';
      dm.ado116GLPTR_STATUS.Value:=true;
      dm.ado116warehouse_ptr.Value:=dm.ado114warehouse_ptr.Value;
      dm.ado116.Post;

      dm.ADO04.Close;
      dm.ADO04.Open;
      if dm.ADO04SEED_FLAG.Value<>1 then
        update_04(trim(dm.ADO04SEED_VALUE.Value));

     if DM.ado114IF_VOUCHER.AsBoolean then  //jacky zhong 2016-3-28
     begin
      if sgrid1.RowCount>2 then
      begin
        with dm.ado105 do                                        //增加会计凭证总表
        begin
          close;
          dm.ado105.Parameters[0].Value:=dm.ADO114RKEY.Value;
          open;
          append;
          dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
          dm.ado105BATCH_NUMBER.Value:=DM.ado114REFERENCE_NO.Value;  //参考发票号
          dm.ado105TRANS_TYPE.Value:=6;                                //类型
          if dm.ado114BANK_PTR.Value>0 then
            dm.ado105VOU_TYPE.Value:=2
          else
            dm.ado105VOU_TYPE.Value:=0;
          dm.ado105SOURCE_PTR.Value:=dm.ADO114RKEY.Value;              //发票指针
          dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value; //输入人员
          dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);      //输入日期
          dm.ado105ATTACHED.Value := strtoint(edit13.text);                 //附件张数
          dm.ado105FYEAR.Value := strtoint(edit14.Text);                //会计年度
          dm.ado105PERIOD.Value := strtoint(edit15.Text);               //会计期间
          dm.ado105CUSTOMER_PTR.Value:=dm.ado114SRCE_PTR.value;       //客户
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
          dm.ado106REF_NUMBER.Value:=dm.ADO105BATCH_NUMBER.Value;
          dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
          dm.ADO106PRICE.AsString := sgrid1.Cells[4,i]; //原币
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
      end;     //完成凭证处理
     end;
      dm.ado116.Edit;
      dm.ado116GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
      dm.ado116.Post;

      dm.ADOConnection1.CommitTrans;
      if (self.CheckBox1.Checked) and (not dm.ADO105.IsEmpty) then
      begin
        Form_voucherreport:=TForm_voucherreport.Create(application);
        form_voucherreport.ppReport1.Reset;
        form_voucherreport.ppReport1.Template.FileName :=
         stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
        form_voucherreport.ppReport1.Template.LoadFromFile;
        Form_voucherreport.AQD105.Close;
        Form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
        Form_voucherreport.AQD105.Open;
        Form_voucherreport.AQD106.Open;
        Form_voucherreport.AQD493.Open;
        Form_voucherreport.ppReport1.Print;
        Form_voucherreport.Free;
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
    dm.ADOConnection1.BeginTrans;
    try
      if dm.ado114BANK_PTR.Value>0 then
      begin
        dm.ado128.Close;
        dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
        dm.ado128.Open;
        dm.ADO128.Edit;
        dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-
                                  (dm.ADO114AMOUNT.Value-dm.ado114DEBIT_AMOUNT.Value)+
                                  (strtocurr(edit6.Text)-strtocurr(edit10.Text));
        dm.ADO128.Post;
      end;
      dm.ado114REFERENCE_NO.Value:=edit4.Text;
      dm.ado114AMOUNT.AsString:=edit6.Text;
      dm.ado114EXCHANGE_RATE.AsString:=edit5.Text;
      dm.ado114DEBIT_AMOUNT.AsString:=edit10.Text;  //银行手续费
      dm.ado114.Post;

      //删除子表152中的记录再重新添加
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='delete data0152 where srce_ptr='+inttostr(DM.ado114RKEY.Value);
        Prepared;
        ExecSQL;
      end;
      if not CDS152.IsEmpty then
      begin
        CDS152.First;
        while not CDS152.Eof do
        begin
          with DM.ADOQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='insert into data0152 values (:srce_ptr,:po_number,:manu_part_number,:all_shipqty,:amount)';
            Parameters[0].Value:=DM.ado114RKEY.Value;
            Parameters[1].Value:=CDS152po_number.Value;
            Parameters[2].Value:=CDS152manu_part_number.Value;
            Parameters[3].Value:=CDS152all_shipqty.Value;
            Parameters[4].Value:=CDS152amount.Value;
            Prepared;
            ExecSQL;
            CDS152.Next;
          end;
        end;
      end;

      dm.ado116.close;
      dm.ado116.Parameters[0].Value:=dm.ado114RKEY.Value;
      dm.ado116.Open;
      dm.ado116.Edit;
      dm.ado116MEMO_NUMBER.Value:=edit7.Text;
      dm.ado116DESCRIPTION.Value:=edit8.Text;
      dm.ado116AMOUNT.Value:=dm.ado114AMOUNT.Value;
      dm.ado116AVL_AMT.Value:=dm.ado114AMOUNT.Value;
      dm.ado116GOODS_AMT.Value:=dm.ado116AMOUNT.Value;
      dm.ado116warehouse_ptr.Value:=dm.ado114warehouse_ptr.Value;
      dm.ado116CUST_PTR.Value:=dm.ado114SRCE_PTR.Value;

     if DM.ado114IF_VOUCHER.AsBoolean then  //jacky zhong 2016-3-28
     begin
      with dm.ado105 do                                        //增加会计凭证总表
      begin
        close;
        dm.ado105.Parameters[0].Value:=dm.ADO114RKEY.Value;
        open;
      end;
      if not dm.ado105.isempty then dm.ado105.Delete;
      dm.ADO106.Close;
      dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
      dm.ADO106.Open;

      if sgrid1.RowCount>2 then
      begin
        dm.ado105.append;
        dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
        dm.ado105BATCH_NUMBER.Value:=DM.ado114REFERENCE_NO.Value;   //参考发票号
        dm.ado105TRANS_TYPE.Value:=6;                                //类型
        if dm.ado114BANK_PTR.Value>0 then
          dm.ado105VOU_TYPE.Value:=2
        else
          dm.ado105VOU_TYPE.Value:=0;
        dm.ado105SOURCE_PTR.Value:=dm.ADO114RKEY.Value;              //发票指针
        dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value; //输入人员
        dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);      //输入日期
        dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
        dm.ado105FYEAR.Value := strtoint(edit14.Text);                //会计年度
        dm.ado105PERIOD.Value := strtoint(edit15.Text);               //会计期间
        dm.ado105CUSTOMER_PTR.Value:=dm.ado114SRCE_PTR.value;       //客户
        dm.ado105.post;
        for i:=1 to SGrid2.RowCount-2 do
        begin
          dm.ado106.Append;
          dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
          dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
          dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
          dm.ADO106EXCH_RATE.AsString:=
          Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
          dm.ado106REF_NUMBER.Value:=dm.ADO105BATCH_NUMBER.Value;
          dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
          dm.ADO106PRICE.AsString := sgrid1.Cells[4,i]; //原币          
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
      end;
     end;
      dm.ado116GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
      dm.ado116.Post;
      dm.ADOConnection1.CommitTrans;
      if (self.CheckBox1.Checked) and (not dm.ADO105.IsEmpty) then
      begin
        Form_voucherreport:=TForm_voucherreport.Create(application);
        form_voucherreport.ppReport1.Reset;
        form_voucherreport.ppReport1.Template.FileName :=
         stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
        form_voucherreport.ppReport1.Template.LoadFromFile;
        Form_voucherreport.AQD105.Close;
        Form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
        Form_voucherreport.AQD105.Open;
        Form_voucherreport.AQD106.Open;
        Form_voucherreport.AQD493.Open;
        Form_voucherreport.ppReport1.Print;
        Form_voucherreport.Free;
      end;
      self.ModalResult:=mrok;
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
       dm.ado114.Edit;
      end;
    end;
  end;
end;

procedure TForm3.PopupMenu3Popup(Sender: TObject);
begin
  if sgrid1.Row=sgrid1.RowCount-1  then
  begin
    n1.Enabled:=false;
    n5.Enabled:=false;
    n7.Enabled:=false;
    n8.Enabled:=false;
    n9.Enabled:=false;
    n11.Enabled:=false;
  end
  else
  begin
    n1.Enabled:=true;
    n5.Enabled:=true;
    n7.Enabled:=true;
    n8.Enabled:=true;
    n9.Enabled:=true;
    n11.Enabled:=true;
  end;
end;

procedure TForm3.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
    abort
end;

procedure TForm3.Edit12Exit(Sender: TObject);
begin
  try
    strtodate(edit12.Text);
  except
    messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
    edit12.SetFocus;
    exit;
  end;

  if dm.ADO114.State=dsinsert then
  begin
    edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
    Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
    Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
  end;

end;

procedure TForm3.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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
procedure TForm3.BitBtn5Click(Sender: TObject);
begin
  form_curr:=tform_curr.Create(application);
  if form_curr.ShowModal=mrok then
  begin
    edit2.Text:=form_curr.ADOQuery1CURR_CODE.Value;
    label15.Caption:=form_curr.ADOQuery1CURR_NAME.Value;
    dm.ado114CURRECY_PTR.Value:=form_curr.ADOQuery1rkey.Value;
    edit5.Text:=form_curr.ADOQuery1base_to_other.AsString;
    if dm.ado114CURRECY_PTR.Value=1 then
      edit5.Enabled:=false
    else
      edit5.Enabled:=true;
  end;
  form_curr.Free;
end;

procedure TForm3.N8Click(Sender: TObject);
begin
  try
    form_dictionary:=Tform_dictionary.Create(application);
  if form_dictionary.ShowModal=mrok then
    sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
  finally
    form_dictionary.Free;
  end;
end;

procedure TForm3.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
   abort
end;

function TForm3.find_bank_acct(rkey103: integer): boolean;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0128');
    sql.Add('where GL_ACCT_PTR='+inttostr(rkey103));
    open;
    if IsEmpty then
      result:=false
    else
      result:=true;
  end;
end;

procedure TForm3.N1Click(Sender: TObject);
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
        if (dm.ado114BANK_PTR.Value=0) and (find_bank_acct(form_acct.ADOQuery1RKEY.Value)) then
        begin
          messagedlg('科目连接有现金银行帐户,不能添加!',mterror,[mbcancel],0);
          exit;
        end;
        if (form_acct.ADOQuery1curr_tp.Value=0) and (form_curr.ADOQuery1rkey.Value>1) then
          messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
        else
        if (form_acct.ADOQuery1curr_tp.Value=2) and (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
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
                           trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                           trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
          sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;
          if dm.ado114CURRECY_PTR.Value=form_curr.ADOQuery1rkey.Value then
            sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
          else
            sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1base_to_other.AsString;
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

procedure TForm3.Edit10Exit(Sender: TObject);
begin
  if trim(edit10.Text)='' then edit10.Text:='0.00';
  edit10.Text:=formatfloat('0.00',strtocurr(edit10.Text));
  if strtocurr(edit10.Text) > strtocurr(edit6.Text) then
  begin
    messagedlg('银行手续费不能大于票据金额!',mterror,[mbcancel],0);
    edit10.SetFocus;
  end;
end;

procedure TForm3.DBGrdEditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  if DBGrd.Col=1 then
    begin
      if edit1.Text='' then
        showmsg('请先选择客户代码',1)
      else
      begin
        frmPick_Item_Single := TfrmPick_Item_Single.Create(Application) ;
        InputVar.Fields := 'PO_NUMBER/客户订单号/100,PO_DATE/订单日期/100,'+
                            'MANU_PART_NUMBER/本厂编号/150,MANU_PART_DESC/客户型号/200,'+
                            'qty/数量/100,amount/本币含税金额/100';
        InputVar.Sqlstr :=
          'SELECT  dbo.Data0097.PO_NUMBER, dbo.Data0097.PO_DATE,'+#13+
          'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,sum(Data0060.PARTS_ORDERED) as qty,'+#13+
          'round(sum((Data0060.PARTS_ORDERED*Data0060.PARTS_ALLOC+Data0060.TOTAL_ADD_L_PRICE)*'+#13+
          '(1+Data0060.RUSH_CHARGE*0.01)/Data0060.EXCH_RATE),2) as amount'+#13+
          'FROM  dbo.Data0060 INNER JOIN'+#13+
          '      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
          '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY'+#13+
          'WHERE data0060.CUSTOMER_PTR='+dm.ado114SRCE_PTR.AsString+#13+
          'GROUP BY dbo.Data0097.PO_NUMBER, dbo.Data0097.PO_DATE,'+#13+
          'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC';

        InputVar.AdoConn := DM.ADOConnection1;
        frmPick_Item_Single.InitForm_New(InputVar);
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          CDS152.Edit;
          CDS152po_number.Value:=trim(frmPick_Item_Single.adsPick.FieldValues['PO_NUMBER']);
          CDS152manu_part_number.Value:= trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
        end;
      end;
    end
  else
  begin
    if edit1.Text='' then
      showmsg('请先选择客户代码',1)
    else
    begin
      if CDS152po_number.Value='' then
      begin
        ShowMessage('请先选择客户订单号');
        Abort;
      end;
      Frm_manuaprt:=TFrm_manuaprt.Create(Application);
      Frm_manuaprt.custCode:=Trim(edit1.Text);
      if Frm_manuaprt.ShowModal=mrok then
      begin
        CDS152.Edit;
        CDS152manu_part_number.Value:= Frm_manuaprt.ADO25MANU_PART_NUMBER.Value;
        CDS152.Post;
      end;
    end;
  end;
end;

procedure TForm3.DBGrdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
  begin
//    if (key=45) or (key=40) then
 //     status:=1;
    if tag<>1 then      //编辑
    begin
      if (key=46) and (ssCtrl in shift) then
      begin
        CDS152.Delete;
      end;
      if (key=46) and (ssCtrl in shift) then Abort;
    end;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  if DBGrd.ReadOnly=True then
  begin
    DBGrd.Columns[0].ButtonStyle:=cbsAuto;
    DBGrd.Columns[1].ButtonStyle:=cbsAuto;
  end;
  if not CDS152.IsEmpty then
    BitBtn4.Enabled:=False
  else
    BitBtn4.Enabled:=True;
//  status:=0;
 // CDS152.Last;
end;

procedure TForm3.DBGrdExit(Sender: TObject);
begin
  if not CDS152.IsEmpty then
  begin
    CDS152.First;
    while not CDS152.Eof do
    begin
      if CDS152po_number.Value='' then
      begin
        ShowMessage('客户订单号不能有为空的');
        DBGrd.SetFocus;
        Abort;
      end;
      if CDS152manu_part_number.Value='' then
      begin
        ShowMessage('本厂编号不能有为空的');
        DBGrd.SetFocus;
        Abort;
      end;
      if FloatToStr(CDS152amount.Value)='' then
      begin
        ShowMessage('金额不能有为空的');
        DBGrd.SetFocus;
        Abort;
      end;
      if IntToStr(CDS152all_shipqty.Value)='' then
      begin
        ShowMessage('允许出货数量不能有为空的');
        DBGrd.SetFocus;
        Abort;
      end
      else
      begin
        if CDS152all_shipqty.Value<0 then
        begin
          ShowMessage('允许出货数量不能为负数');
          DBGrd.SetFocus;
          Abort;
        end;     
      end;
      CDS152.Next;
    end;
  end;
end;

procedure TForm3.DBGrdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
{  with DBGrd do
  begin
    if UpperCase(SelectedField.FieldName) = UpperCase('po_number') then
      Key := #0;
    if UpperCase(SelectedField.FieldName) = UpperCase('manu_part_number') then
      Key := #0;
  end;
 } 
end;

procedure TForm3.DBGrdColExit(Sender: TObject);
begin
  if not CDS152.IsEmpty then
    BitBtn4.Enabled:=False
  else
    BitBtn4.Enabled:=True;
end;

procedure TForm3.ADO152AfterOpen(DataSet: TDataSet);
begin
 CDS152.Data:=DataSetProvider1.Data;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
    InputVar.Sqlstr := 'select rkey,warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Label13.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit9.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      dm.ado114warehouse_ptr.Value:= frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
