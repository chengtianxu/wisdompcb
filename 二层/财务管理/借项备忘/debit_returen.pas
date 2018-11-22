unit debit_returen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus, ExtCtrls, ToolWin,math,
  DateUtils;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    a_or_e: TLabel;
    Image1: TImage;
    Image2: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    label11: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Edit9: TEdit;
    Edit4: TEdit;
    edit5: TEdit;
    Edit6: TEdit;
    Edit15: TEdit;
    Edit8: TEdit;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit7: TEdit;
    stgd1: TStringGrid;
    BitBtn5: TBitBtn;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    dtpk2: TDateTimePicker;
    Button1: TButton;
    abbr_name: TLabel;
    ToolBar1: TToolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label25: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Edit_ATTACHED: TEdit;
    Edit_date: TEdit;
    Edit_fyear: TEdit;
    Edit_number: TEdit;
    Edit_PERIOD: TEdit;
    report_Check: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Edit_employee: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    sgrid2: TStringGrid;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    stgd2: TStringGrid;
    Label12: TLabel;
    Edit10: TEdit;
    BitBtn2: TBitBtn;
    Label15: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure stgd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    function find_grn(rkey95:integer):boolean;
    function find_error(number:string):boolean;
    procedure update_04(v_seed: string);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit_dateExit(Sender: TObject);
    procedure Edit_dateKeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid1Exit(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure stgd1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure re_calculate;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
  public
    { Public declarations }
   supp_ptr,curr_ptr,accsupp_gl_ptr:integer;
  end;

var
  Form4: TForm4;

implementation

uses datamd, invt_sendback, main, AcctSearch, voucher_dictionary,
  voucher_report, supplier_search, curr_search,common,Pick_Item_Single,ConstVar;

{$R *.dfm}
function TForm4.get_col5(row: integer): currency;
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

function TForm4.get_col6(row: integer): currency;
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

procedure TForm4.re_calculate;
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
statictext1.Caption:=Floattostrf(vdb,ffNumber,10,2);
statictext2.Caption:=Floattostrf(vcr,ffNumber,10,2);
end;

procedure TForm4.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
  v_length := length(v_seed);
  for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adosp04.Edit; //使前缀不变后缀加1
    dm.adosp04SEED_VALUE.Value := new_seed;
    dm.adosp04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adosp04.Edit;
     dm.adosp04SEED_VALUE.Value := new_seed;
     dm.adosp04.Post;
    end;
end;

function tform4.find_error(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0132');
   sql.Add('where MEMO_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function TForm4.find_grn(rkey95: integer): boolean;
var
 i:word;
begin
 result:=false;
 for i:=1 to stgd2.RowCount-1 do
  if strtoint(stgd2.Cells[0,i])=rkey95 then
   begin
    result:=true;
    break;
   end;
end;

procedure TForm4.FormActivate(Sender: TObject);
var
 sql_text:string;
 i:word;
begin
  sgrid1.Cells[0,0]:='科目摘要';
  sgrid1.Cells[1,0]:='科目代码及明称';
  sgrid1.Cells[2,0]:='币种';
  sgrid1.Cells[3,0]:='汇率';
  sgrid1.Cells[4,0]:='原币金额';
  sgrid1.Cells[5,0]:='借方(本币)';
  sgrid1.Cells[6,0]:='贷方(本币)';

  stgd1.Cells[0,0]:='入库单号';
  stgd1.Cells[1,0]:='送货单号';
  stgd1.Cells[2,0]:='物料名称';
  stgd1.Cells[3,0]:='物料规格';
  stgd1.Cells[4,0]:='装运日期';
  stgd1.Cells[5,0]:='退货数量';
  stgd1.Cells[6,0]:='单位';
  stgd1.Cells[7,0]:='单价';
  stgd1.Cells[8,0]:='税率%';
  stgd1.Cells[9,0]:='处理';
  stgd1.Cells[10,0]:='是否已开票';
  stgd1.ColWidths[10]:=-1;
  stgd2.Cells[0,0]:='退货rkey210';

if self.a_or_e.Caption='0' then  //新增
 begin
  dm.ADOsp04.Close;
  dm.ADOsp04.Open;
  if dm.ADOsp04SEED_FLAG.Value <> 1 then
   edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
  if dm.ADOsp04SEED_FLAG.Value = 4 then
   edit1.ReadOnly:=true;
 end
else
 begin
  sql_text:='SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'+#13
     +'Data0017.INV_NAME, Data0017.INV_DESCRIPTION, Data0210.TDATE,'+#13
     +'Data0210.QUANTITY, Data0002.UNIT_NAME, Data0022.tax_PRICE as price,'+#13
     +'Data0022.TAX_2, Data0210.RKEY,data0005.employee_name,dbo.Data0210.GLPTR_STATUS'+#13
     +'FROM dbo.Data0022 INNER JOIN'+#13
     +'dbo.Data0210 ON dbo.Data0022.RKEY = dbo.Data0210.D0022_PTR INNER JOIN'+#13
     +'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13
     +'dbo.Data0005 ON dbo.Data0210.empl_ptr = dbo.Data0005.RKEY INNER JOIN'+#13
     +'dbo.Data0002 ON'+#13
     +'dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'+#13
     +'dbo.Data0017 ON dbo.Data0210.INVT_PTR = dbo.Data0017.RKEY'+#13
     +'where Data0210.DEBIT_MEMO_PTR='+dm.aq132rkey.AsString;
  with dm.ADOQuery1 do
   begin
    close;
    sql.clear;
    sql.Text:=sql_text;
    open;
   end;

   stgd1.RowCount:=dm.ADOQuery1.RecordCount+1;
   stgd2.RowCount:=dm.ADOQuery1.RecordCount+1;

  for i:=1 to dm.ADOQuery1.RecordCount do
   begin
    stgd1.Cells[0,i]:=dm.ADOQuery1.FieldValues['GRN_NUMBER'];           //'入库单号';
    stgd1.Cells[1,i]:=dm.ADOQuery1.fieldbyname('DELIVER_NUMBER').AsString; //'送货单号';
    stgd1.Cells[2,i]:=dm.ADOQuery1.FieldValues['INV_NAME'];             //'物料名称';
    stgd1.Cells[3,i]:=dm.ADOQuery1.FieldValues['INV_DESCRIPTION'];      //'物料规格';
    stgd1.Cells[4,i]:=dm.ADOQuery1.fieldbyname('TDATE').AsString;        //'装运日期';
    stgd1.Cells[5,i]:=dm.ADOQuery1.fieldbyname('QUANTITY').AsString;    //'退货数量';
    stgd1.Cells[6,i]:=dm.ADOQuery1.FieldValues['UNIT_NAME'];            //'单位';
    stgd1.Cells[7,i]:=dm.ADOQuery1.fieldbyname('PRICE').AsString;       //'单价';
    stgd1.Cells[8,i]:=dm.ADOQuery1.fieldbyname('TAX_2').AsString;     //'税率';
    stgd1.Cells[9,i]:='1';
    if dm.ADOQuery1.fieldbyname('GLPTR_STATUS').AsBoolean then
      stgd1.Cells[10,i]:='1'
    else
      stgd1.Cells[10,i]:='0';
    stgd2.Cells[0,i]:=dm.ADOQuery1.fieldbyname('RKEY').AsString;    //'rkey210';
    dm.ADOQuery1.Next;
   end;

  sql_text:='SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'+#13
     +'Data0235.goods_name, Data0235.goods_guige, Data0210.TDATE,'+#13
     +'dbo.Data0210.QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0235.unit_price,'+#13
     +'dbo.Data0235.state_tax, dbo.Data0210.RKEY,data0005.employee_name,dbo.Data0210.GLPTR_STATUS'+#13
     +'FROM dbo.Data0210 INNER JOIN'+#13
     +'dbo.Data0005 ON dbo.Data0210.empl_ptr = dbo.Data0005.RKEY INNER JOIN'+#13
     +'dbo.Data0235 ON dbo.Data0210.D0235_PTR = dbo.Data0235.RKEY INNER JOIN'+#13
     +'dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13
     +'dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'+#13
     +'where Data0210.DEBIT_MEMO_PTR='+dm.aq132rkey.AsString;
  with dm.ADOQuery1 do
   begin
    close;
    sql.clear;
    sql.Text:=sql_text;
    open;
   end;

  for i:=1 to dm.ADOQuery1.RecordCount do
   begin
    stgd1.RowCount:=stgd1.RowCount+1;
    stgd2.RowCount:=stgd2.RowCount+1;
    stgd1.Cells[0,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['GRN_NUMBER'];           //'入库单号';
    stgd1.Cells[1,stgd1.RowCount-1]:=dm.ADOQuery1.fieldbyname('DELIVER_NUMBER').AsString; //'送货单号';
    stgd1.Cells[2,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['goods_name'];             //'物料名称';
    stgd1.Cells[3,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['goods_guige'];      //'物料规格';
    stgd1.Cells[4,stgd1.RowCount-1]:=dm.ADOQuery1.fieldbyname('TDATE').AsString;        //'装运日期';
    stgd1.Cells[5,stgd1.RowCount-1]:=dm.ADOQuery1.fieldbyname('QUANTITY').AsString;    //'退货数量';
    stgd1.Cells[6,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['UNIT_NAME'];            //'单位';
    stgd1.Cells[7,stgd1.RowCount-1]:=dm.ADOQuery1.fieldbyname('unit_price').AsString;       //'单价';
    stgd1.Cells[8,stgd1.RowCount-1]:=dm.ADOQuery1.fieldbyname('state_tax').AsString;     //'税率';
    stgd1.Cells[9,stgd1.RowCount-1]:='1';
    if dm.ADOQuery1.fieldbyname('GLPTR_STATUS').AsBoolean then
      stgd1.Cells[10,i]:='1'
    else
      stgd1.Cells[10,i]:='0';    
    stgd2.Cells[0,stgd1.RowCount-1]:=dm.ADOQuery1.fieldbyname('RKEY').AsString;    //'rkey210';
    dm.ADOQuery1.Next;
   end;

  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.AQ132rkey105.Value;
  dm.Aqd105.Open;
  if not dm.Aqd105.IsEmpty then
  begin
    self.Edit_number.Text:=dm.Aqd105VOUCHER.Value;
    self.Edit_date.Text:=dm.Aqd105ENTERED_DT.AsString;
    self.Edit_fyear.Text:=dm.Aqd105FYEAR.AsString;
    self.Edit_PERIOD.Text:=dm.Aqd105PERIOD.AsString;
    updown1.Position:=dm.Aqd105ATTACHED.Value;
    self.Edit_employee.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
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
      sgrid1.Cells[4,i]:=dm.Aqd106PRICE.AsString;
      if dm.Aqd106EXCH_RATE.Value>0 then
       sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value)
      else
       sgrid1.Cells[3,i]:='0.00';
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
  end;

  dm.ADOsp04.Close;
  dm.ADOsp04.Open;
  if dm.ADOsp04SEED_FLAG.Value = 4 then
   edit1.ReadOnly:=true;

 end;    //结束编辑或者检查
 if sgrid1.RowCount=2 then
  begin
    speedbutton3.Enabled:=false;
    speedbutton4.Enabled:=false;
    speedbutton5.Enabled:=false;
    speedbutton6.Enabled:=false;
    speedbutton7.Enabled:=false;
    speedbutton8.Enabled:=false;
  end
 else
  self.re_calculate();//重新计算借货金额
 PageControl1.ActivePageIndex:=0;

end;

procedure TForm4.stgd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  stgd1.MouseToCell(x,y,column,row);
  if row<>0 then stgd1.Row:=row;
  stgd1.Col:=column;
 end
else
 if (button=mbleft) and (bitbtn1.Enabled) and (stgd1.Col=9) then
 begin
  IF strtoint(stgd1.Cells[stgd1.col,stgd1.row])=0 THEN //选中
   begin
    stgd1.Cells[stgd1.col,stgd1.row]:='1';
    edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                            strtocurr(stgd1.Cells[5,stgd1.row])*
                            strtocurr(stgd1.Cells[7,stgd1.row])/
                            (1+strtocurr(stgd1.Cells[8,stgd1.row])*0.01));

    edit7.Text:=formatfloat('0.00',strtocurr(edit7.Text)+
                            strtocurr(stgd1.Cells[5,stgd1.row])*
                            strtocurr(stgd1.Cells[7,stgd1.row])*
                            strtocurr(stgd1.Cells[8,stgd1.row])*0.01/
                            (1+strtocurr(stgd1.Cells[8,stgd1.row])*0.01)
                             );

    edit8.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit2.Text)
                            );
   end
  else        //放弃
   begin
    stgd1.Cells[stgd1.col,stgd1.row]:='0';
    edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)-       //净值
                           strtocurr(stgd1.Cells[5,stgd1.row])*
                           strtocurr(stgd1.Cells[7,stgd1.row])/
                           (1+strtocurr(stgd1.Cells[8,stgd1.row])*0.01));

    edit7.Text:=formatfloat('0.00',strtocurr(edit7.Text)-           //税金
                            strtocurr(stgd1.Cells[5,stgd1.row])*
                            strtocurr(stgd1.Cells[7,stgd1.row])*
                            strtocurr(stgd1.Cells[8,stgd1.row])*0.01/
                            (1+strtocurr(stgd1.Cells[8,stgd1.row])*0.01)
                            );
    edit8.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit2.Text)
                            );
   end;
 end;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
 if stgd1.Row=0 then
  begin
   n2.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
  end;
end;

procedure TForm4.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm4.Edit2Exit(Sender: TObject);
begin
 edit2.Text := formatfloat('0.00',strtofloat(edit2.Text));
end;

procedure TForm4.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key<>9 then
 begin
  if trim(edit2.Text) = '' then edit2.Text := '0';
  edit8.Text:=formatfloat('0.00',strtofloat(edit2.Text)+
                                 strtofloat(edit3.Text)+
                                 strtofloat(edit7.Text));
 end;
end;

procedure TForm4.N2Click(Sender: TObject);
var
 i:word;
begin
if stgd1.Cells[10,stgd1.Row]='1' then
begin
  messagedlg('已开票不能删除!',mtinformation,[mbok],0);
  abort;
end;
if strtoint(stgd1.Cells[9,stgd1.Row])=1 then
 begin
   edit8.Text:=formatfloat('0.00',strtofloat(edit8.text)-
                           strtofloat(stgd1.Cells[5,stgd1.Row])*
                           strtofloat(stgd1.Cells[7,stgd1.Row]));

   if strtofloat(stgd1.Cells[8,stgd1.Row])>0 then
   edit7.Text:=formatfloat('0.00',strtofloat(edit7.text)-
   strtofloat(stgd1.Cells[5,stgd1.Row])*strtofloat(stgd1.Cells[7,stgd1.Row])*
   strtofloat(stgd1.Cells[8,stgd1.Row])*0.01 /
   (1+strtofloat(stgd1.Cells[8,stgd1.Row])*0.01)
                           );

   edit3.Text := formatfloat('0.00',strtofloat(edit8.Text)-
                             strtofloat(edit2.Text)-
                             strtofloat(edit7.Text));
 end;

 for i:=stgd1.Row to stgd1.RowCount-2 do
 begin
  stgd1.Rows[i].Text:=stgd1.Rows[i+1].Text;
  stgd2.Rows[i].Text:=stgd2.Rows[i+1].Text;

 end;

 stgd1.RowCount:=stgd1.RowCount-1;
 stgd2.RowCount:=stgd2.RowCount-1;

 if stgd1.RowCount=1 then
  begin
   bitbtn2.Enabled:=true;
   bitbtn3.Enabled:=true;
   bitbtn5.Enabled:=true;
  end;

end;

procedure TForm4.N1Click(Sender: TObject);

begin
if (trim(edit4.Text)='')  then
 messagedlg('请首先确定供应商及货币!',mterror,[mbcancel],0)
else if (trim(edit10.Text)='')  then
 messagedlg('请首先确定退货工厂!',mterror,[mbcancel],0)
else
begin
 form_sendback:=tform_sendback.Create(application);
 dm.aq210.Close;
 dm.aq210.Parameters.ParamValues['@supp_ptr']:=self.supp_ptr;
 dm.aq210.Parameters.ParamValues['@currency_ptr']:=self.curr_ptr;
 dm.aq210.Parameters.ParamValues['@warehouse_ptr']:=Edit10.Tag;
 dm.aq210.Open;
 if not dm.aq210.IsEmpty then
 if form_sendback.ShowModal=mrok then
  begin
   if self.find_grn(dm.aq210rkey.Value) then
    showmessage('该退装运已经在备忘中,不能重复增加')
   else
    begin
      stgd1.RowCount:=stgd1.RowCount+1;
      stgd2.RowCount:=stgd2.RowCount+1;
      stgd1.Cells[0,stgd1.RowCount-1]:=dm.aq210GRN_NUMBER.Value; //'入库单号';
      stgd1.Cells[1,stgd1.RowCount-1]:=dm.aq210DELIVER_NUMBER.Value; //'送货单号';
      stgd1.Cells[2,stgd1.RowCount-1]:=dm.aq210INV_NAME.Value; //'物料名称';
      stgd1.Cells[3,stgd1.RowCount-1]:=dm.aq210INV_DESCRIPTION.Value; //'物料规格';
      stgd1.Cells[4,stgd1.RowCount-1]:=dm.aq210TDATE.AsString; //'装运日期';
      stgd1.Cells[5,stgd1.RowCount-1]:=dm.aq210QUANTITY.AsString; //'退货数量';
      stgd1.Cells[6,stgd1.RowCount-1]:=dm.aq210UNIT_NAME.Value; //'单位';
      stgd1.Cells[7,stgd1.RowCount-1]:=dm.aq210PRICE.AsString;  //'单价';
      stgd1.Cells[8,stgd1.RowCount-1]:=dm.aq210TAX_2.AsString; //'税率';
      stgd1.Cells[9,stgd1.RowCount-1]:='1'; //'rkey95';
      stgd2.Cells[0,stgd2.RowCount-1]:=dm.aq210RKEY.AsString;

      edit8.Text:=formatfloat('0.00',strtofloat(edit8.Text)+
                  dm.aq210QUANTITY.Value*
                  dm.aq210PRICE.Value);   //合计金额

      edit7.Text:=formatfloat('0.00',strtofloat(edit7.Text)+//税金
                              dm.aq210QUANTITY.Value*
                              dm.aq210PRICE.Value*
                              dm.aq210TAX_2.Value*0.01/
                              (1+dm.aq210TAX_2.Value*0.01)
                             );

      edit3.Text := formatfloat('0.00',strtofloat(edit8.Text)- //不含税金额
                           strtofloat(edit2.Text)-
                           strtofloat(edit7.Text));
     if stgd1.RowCount>1 then
      begin
       bitbtn2.Enabled:=false;
       bitbtn3.Enabled:=false;
       bitbtn5.Enabled:=false;
      end;
    end;
  end
 else
 else
  showmessage('没有找到退货装运记录了!');
 dm.aq210.Close;
end;

form_sendback.Free;
end;

procedure TForm4.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('备忘编号不允许为空!');
  pagecontrol1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if not dm.ADOsp04.Active then dm.ADOsp04.Open;
if dm.ADOsp04SEED_FLAG.Value<>1 then
if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  pagecontrol1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if stgd1.RowCount=1 then
 begin
  messagedlg('至少需要一个退货装运记录',mtinformation,[mbok],0);
  pagecontrol1.ActivePageIndex:=0;
  stgd1.SetFocus;
  exit;
 end;

if strtofloat(edit8.Text)-strtofloat(edit9.Text) < 0 then
 begin
  edit8.SetFocus;
  showmessage('该借项备忘已被使用,借项金额不能少于'+edit9.Text);
  pagecontrol1.ActivePageIndex:=0;
  exit;
 end;

if trim(edit4.Text)='' then
 begin
  messagedlg('供应商不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;

 self.PageControl1Change(sender);
if sgrid1.RowCount>2 then
 begin
  if strtocurr(form1.RemoveInvalid(statictext1.Caption))<>
     strtocurr(form1.RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;

{  if strtocurr(formatfloat('0.00',strtocurr(edit8.Text)*
                                  strtocurr(edit6.Text)
                          ))<>
     strtocurr(form1.RemoveInvalid(statictext1.Caption)) then
   begin
    messagedlg('科目贷方金额与发票发生额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;
}

  if not dm.Aqd508.Active then dm.Aqd508.Open;
  if (strtoint(Edit_fyear.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit_fyear.Text) <= dm.Aqd508CURR_FYEAR.Value) and
     (strtoint(Edit_PERIOD.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    self.Edit_date.SetFocus;
    exit;
   end;

  if (strtoint(self.Edit_PERIOD.Text) <> monthof(strtodate(edit_date.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit_date.SetFocus;
    exit;
   end;
 end;
 
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
if self.a_or_e.Caption='0' then    //新增
begin
if self.find_error(trim(edit1.Text)) then
 begin
  dm.adosp04.close;
  dm.adosp04.Open;
  if dm.ADOsp04SEED_FLAG.Value<>1 then
  if messagedlg('备忘编号重复可能有多台计算机同时新增,是否自动更新编号为:'+
   dm.ADOsp04SEED_VALUE.Value,mtConfirmation,[mbYes,mbNo],0)=mrYes  then
   edit1.Text:=dm.ADOsp04SEED_VALUE.Value
  else
   begin
    pagecontrol1.ActivePageIndex:=0;
    edit1.SetFocus;
    exit;
   end
  else
   begin
    messagedlg('备忘编号重复请手工重新输入',mtinformation,[mbok],0);
    pagecontrol1.ActivePageIndex:=0;
    edit1.SetFocus;
    exit;
   end;
 end;

 if (sgrid1.RowCount>2) and
    (form1.vo_number(trim(self.Edit_number.Text))) then
  begin
   Edit_number.Text:=form1.get_vouchernumber(strtodate(self.Edit_date.Text));
   messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!'+edit_number.Text,mterror,[mbcancel],0);
  end;

 dm.ACt.BeginTrans;
 try
 dm.ADO132.Close;
 dm.ADO132.Parameters[0].Value:=null;
 dm.ADO132.Open;
 dm.ADO132.Append;
 dm.ADO132MEMO_NUMBER.Value:=trim(edit1.Text);
 dm.ADO132SUPP_PTR.Value:=self.supp_ptr;
 dm.ADO132SRCE_PTR.Value:=self.supp_ptr;
 dm.ADO132CURRENCY_PTR.Value:=self.curr_ptr;
 dm.ADO132warehouse_PTR.Value:=Edit10.tag;
 dm.ADO132EX_RATE.Value:=strtofloat(edit6.Text);

 dm.ADO132MEMO_TP.Value:=3;   //退货备忘
 dm.ADO132EMPL_PTR.Value:=strtoint(user_ptr);
 dm.ADO132MEMO_DATE.Value:=self.dtpk1.Date;
 dm.ADO132ENT_DATE.Value:=self.dtpk2.date;
 dm.ADO132AMOUNT.Value:=strtofloat(edit8.Text);
 dm.ADO132AVL_AMT.Value:=dm.ADO132AMOUNT.Value;
 dm.ADO132MATL_TOT.Value:=strtofloat(edit3.Text);   //货款净值
 dm.ADO132MISC_TOT.Value:=strtofloat(edit2.Text);   //杂项费用
 dm.ADO132FED_TAX.Value:=strtofloat(edit7.Text);    //税金
 dm.ADO132REF_NUMBER.Value:=edit15.Text;
 dm.ADO132.Post;
 dm.adosp04.Close;
 dm.adosp04.Open;
 if dm.adosp04SEED_FLAG.Value<>1 then
 self.update_04(dm.ADOsp04SEED_VALUE.Value);

 for i:=1 to stgd1.RowCount-1 do
 if strtoint(stgd1.Cells[9,i])=1 then  //处理
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0210');
    sql.Add('set DEBIT_MEMO_PTR='+dm.ADO132RKEY.AsString);
    sql.Add('where rkey='+stgd2.Cells[0,i]);
    ExecSQL
   end;

  if sgrid1.RowCount>2 then
   begin
    dm.ADO104.Close;
    dm.ADO104.Open;

    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=null;
     open;
     append;
     dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO132MEMO_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=dm.ADO104RKEY.Value;            //业务类型
     dm.ado105VOU_TYPE.Value:=0;                              //转帐凭证
     dm.ado105SOURCE_PTR.Value:=dm.ADO132RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO132EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);   //输入日期
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
     dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);    //会计期间
     dm.ADO105SUPP_PTR.Value:=dm.ADO132SUPP_PTR.Value;          //供应商
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
     { TODO -owilliam -c注意事项 : 在保存凭证时汇率要是 1的倒数 }
    dm.ado106REF_NUMBER.Value:=dm.ADO132MEMO_NUMBER.Value;
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
   //============================保存凭证===================

  dm.ACt.CommitTrans;

  if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty) then
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
    dm.ACt.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
    edit1.SetFocus;
   end;
 end;
end
else //编辑
 begin
  dm.ADO132.Close;
  dm.ADO132.Parameters[0].Value:=dm.aq132rkey.Value;
  dm.ADO132.Open;
   if (dm.ADO132AMOUNT.Value<>dm.ADO132AVL_AMT.Value)  then
   begin
    messagedlg('借项备忘被使用不能编辑!',mtinformation,[mbok],0);
    dm.ADO132.Close;
    exit;
   end;
  try
  dm.ACt.BeginTrans;
  dm.ADO132.Edit;
  dm.ADO132MEMO_NUMBER.Value:=trim(edit1.Text);
  dm.ADO132MEMO_DATE.Value:=self.dtpk1.Date;
  dm.ADO132ENT_DATE.Value:=self.dtpk2.Date;
  dm.ADO132AMOUNT.Value:=strtofloat(edit8.Text);
  dm.ADO132AVL_AMT.Value:=dm.ADO132AMOUNT.Value-strtofloat(edit9.Text);
  dm.ADO132MATL_TOT.Value:=strtofloat(edit3.Text);
  dm.ADO132MISC_TOT.Value:=strtofloat(edit2.Text);
  dm.ADO132FED_TAX.Value:=strtofloat(edit7.Text);
  dm.ADO132REF_NUMBER.Value:=edit15.Text;
  dm.ADO132.Post;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0210');
    sql.Add('set DEBIT_MEMO_PTR = null');
    sql.Add('where DEBIT_MEMO_PTR = '+dm.ADO132RKEY.AsString);
    ExecSQL
   end;

 for i:=1 to stgd1.RowCount-1 do
 if strtoint(stgd1.Cells[9,i])=1 then  //处理
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0210');
    sql.Add('set DEBIT_MEMO_PTR='+dm.ADO132RKEY.AsString);
    sql.Add('where rkey='+stgd2.Cells[0,i]);
    ExecSQL
   end;

   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.Aq132rkey105.Value;
     open;
    end;
    if not dm.ado105.isempty then dm.ado105.Delete;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;

   if sgrid1.RowCount>2 then
   begin
    dm.ADO104.Close;
    dm.ADO104.Open;

    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO132MEMO_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=dm.ADO104RKEY.Value;            //业务类型
     dm.ado105VOU_TYPE.Value:=0;             //付款凭证
     dm.ado105SOURCE_PTR.Value:=dm.ADO132RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO132EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);   //输入日期
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
     dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);    //会计期间
     dm.ADO105SUPP_PTR.Value:=dm.ADO132SUPP_PTR.Value;          //供应商
     post;
    end;
    for i:=1 to SGrid2.RowCount-2 do
    begin
    dm.ado106.Append;
    dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
    dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
    dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
    dm.ADO106EXCH_RATE.AsString:=
    Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
     { TODO -owilliam -c注意事项 : 在保存凭证时汇率要是 1的倒数 }
    dm.ado106REF_NUMBER.Value:=dm.ADO132MEMO_NUMBER.Value;
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
   end;//=============保存凭证

  dm.ACt.CommitTrans;

  if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty) then
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
    dm.ACt.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
    edit1.SetFocus;
   end;
 end;

 end;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
try
form_supp:=tform_supp.Create(application);
form_supp.Edit1.Text:=edit4.Text;
if form_supp.ShowModal=mrok then
 begin
 if supp_ptr<>form_supp.ADOdata0023RKEY.Value then
  begin
   edit4.Text:=form_supp.ADOdata0023CODE.Value;
   label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
   self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
   edit5.Text:=form_supp.ADOData0023curr_code.Value;
   label11.Caption:=form_supp.ADOData0023curr_name.Value;
   self.curr_ptr:=form_supp.ADOData0023currency_ptr.Value;
   edit6.Text:=form_supp.ADOData0023BASE_TO_OTHER.AsString;
   abbr_name.Caption:=form_supp.ADOData0023abbr_name.Value;
   accsupp_gl_ptr:=form_supp.ADOData0023ACC_PAYABLE_PTR.Value;   
   edit8.SetFocus;
   if self.curr_ptr=1 then
    edit6.Enabled:=false
   else
    edit6.Enabled:=true;
  end;
 end;
finally
form_supp.Free;
end;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
  if curr_ptr<>form_curr.ADOQuery1RKEY.Value then
   begin
     edit5.Text:=form_curr.ADOQuery1curr_code.Value;
     label11.Caption:=form_curr.ADOQuery1curr_name.Value;
     self.curr_ptr:=form_curr.ADOQuery1rkey.Value;
     edit6.Text:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
     if self.curr_ptr=1 then
      edit6.Enabled:=false
     else
      edit6.Enabled:=true;
   end;
 end;
form_curr.Free;
end;

procedure TForm4.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  if (form1.find_accterror(form_acct.ADOQuery1RKEY.Value)) then
   messagedlg('该科目连接有现金帐户,不能在转帐凭证中选取!',mtinformation,[mbok],0)
  else
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
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=form_curr.ADOQuery1curr_code.Value;
        if self.curr_ptr= form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:= edit6.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1]:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
        sgrid2.Cells[0,sgrid2.RowCount-1]:=form_acct.ADOQuery1rkey.AsString;
        sgrid2.Cells[1,sgrid2.RowCount-1]:=form_curr.ADOQuery1rkey.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
        if sgrid1.RowCount=3 then
         begin
          speedbutton3.Enabled:=true;
          speedbutton4.Enabled:=true;
          speedbutton5.Enabled:=true;
          speedbutton6.Enabled:=true;
          speedbutton7.Enabled:=true;
          speedbutton8.Enabled:=true;
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

procedure TForm4.N5Click(Sender: TObject);
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
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
      sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
     end;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm4.N11Click(Sender: TObject);
begin
try
 form_curr:=tform_curr.Create(application);
 if form_curr.ShowModal=mrok then
  begin
   if (form1.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and
      (form_curr.ADOQuery1rkey.Value>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (form1.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=2) and   //单一外货
       (form1.get_glcurr_ptr(trim(sgrid2.Cells[0,sgrid1.row]))<>
       form_curr.ADOQuery1rkey.Value) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;   //货币
      if self.curr_ptr= form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit6.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
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

procedure TForm4.N7Click(Sender: TObject);
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
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
  speedbutton7.Enabled:=false;
  speedbutton8.Enabled:=false;
 end;
self.re_calculate;
end;

procedure TForm4.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm4.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm4.SpeedButton9Click(Sender: TObject);
begin
if self.a_or_e.Caption='0' then  //新增
 begin
  edit_number.Text:=form1.get_vouchernumber(strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm4.Edit_dateExit(Sender: TObject);
begin
try
 strtodate(Edit_date.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 Edit_date.SetFocus;
 exit;
end;
if self.a_or_e.Caption='0' then  //新增
 begin
  edit_number.Text:=form1.get_vouchernumber(strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end;
end;

procedure TForm4.Edit_dateKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm4.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if arow=sgrid1.RowCount-1 then
 begin
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
  speedbutton7.Enabled:=false;
  speedbutton8.Enabled:=false;
 end
else
 begin
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
  speedbutton7.Enabled:=true;
  speedbutton8.Enabled:=true;
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

procedure TForm4.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm4.SGrid1KeyDown(Sender: TObject; var Key: Word;
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
    v_c:=strtocurr(form1.RemoveInvalid(statictext2.Caption))-get_col5(sgrid1.Row);
    if v_c <> 0 then
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(form1.RemoveInvalid(statictext1.Caption))-get_col6(sgrid1.Row);
    if v_c <> 0 then
    sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   self.re_calculate;
  end;
 end;
end;

procedure TForm4.SGrid1Exit(Sender: TObject);
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

procedure TForm4.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm4.Button1Click(Sender: TObject);
var
 i:integer;
begin
if (trim(edit4.Text)='')  then
 messagedlg('请首先确定供应商及货币!',mterror,[mbcancel],0)
else if (trim(edit10.Text)='')  then
 messagedlg('请首先确定退货工厂!',mterror,[mbcancel],0)
else
 begin
  dm.aq210.Close;
  dm.aq210.Parameters.ParamValues['@supp_ptr']:=self.supp_ptr;
  dm.aq210.Parameters.ParamValues['@currency_ptr']:=self.curr_ptr;
  dm.aq210.Parameters.ParamValues['@warehouse_ptr']:=Edit10.Tag;
  dm.aq210.Open;
  stgd1.RowCount:=dm.aq210.RecordCount+1;
  stgd2.RowCount:=dm.aq210.RecordCount+1;
  for i:=1 to dm.aq210.RecordCount do
   begin
    stgd1.Cells[0,i]:=dm.aq210GRN_NUMBER.Value;
    stgd1.Cells[1,i]:=dm.aq210DELIVER_NUMBER.Value;
    stgd1.Cells[2,i]:=DM.aq210INV_NAME.Value;
    STGD1.Cells[3,I]:=DM.aq210INV_DESCRIPTION.Value;
    stgd1.Cells[4,i]:=dm.aq210TDATE.AsString;
    stgd1.Cells[5,i]:=dm.aq210QUANTITY.AsString;
    stgd1.Cells[6,i]:=dm.aq210UNIT_NAME.Value;
    stgd1.Cells[7,i]:=dm.aq210PRICE.AsString;
    stgd1.Cells[8,i]:=dm.aq210TAX_2.AsString;
    stgd1.Cells[9,i]:='0';
    stgd2.Cells[0,i]:=dm.aq210RKEY.AsString;
    dm.aq210.Next;
   end;

  dm.aq210.Close;

  if stgd1.RowCount>1 then
   begin
    stgd1.FixedRows:=1;
    bitbtn2.Enabled:=false;
    bitbtn3.Enabled:=false;
    bitbtn5.Enabled:=false;
    edit2.Text:='0.00';
    edit3.Text:='0.00';
    edit7.Text:='0.00';
    edit8.Text:='0.00';
   end;

  if stgd1.RowCount>13 then
   stgd1.ColWidths[0]:=74
  else
   stgd1.ColWidths[0]:=90;


 end;
end;

procedure TForm4.stgd1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if acol<9 then
   begin
    stgd1.Canvas.Brush.Color:= clscrollbar;
    stgd1.Canvas.FillRect(rect);
    stgd1.Canvas.TextRect(rect,rect.left,rect.Top, stgd1.Cells[acol,aRow]);
   end;

if (acol=5) or (acol=7) or (acol=8) then
 stgd1.Canvas.TextRect(rect,
        rect.right-stgd1.Canvas.TextWidth(stgd1.Cells[acol,arow])-2,
        rect.Top+2,
        stgd1.Cells[acol,aRow]);

if (acol=9) then
 stgd1.Canvas.TextRect(rect,
        rect.Left+10,
        rect.Top+2,
        stgd1.Cells[acol,aRow]);

if (acol=9) and (arow>0) then
 IF strtoint(stgd1.Cells[acol,arow])=0 THEN
  stgd1.Canvas.Draw(rect.Left+8,rect.Top,image1.Picture.Graphic)
 else
  stgd1.Canvas.Draw(rect.Left+8,rect.Top,image2.Picture.Graphic);
end;

procedure TForm4.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
begin
if (a_or_e.Caption='0') or (trim(edit_number.Text)='') then
if (self.supp_ptr>0) and (sgrid1.RowCount<=2) then
{   (strtocurr(edit8.Text)*strtocurr(edit6.Text)<>
    strtocurr(form1.RemoveInvalid(statictext1.Caption))) then
}
begin
 edit_date.Text:=datetostr(dtpk1.Date);
 edit_number.Text:=form1.get_vouchernumber(dtpk1.Date);
 Edit_fyear.Text:=inttostr(yearof(dtpk1.Date));   //会计年度
 Edit_PERIOD.Text:=inttostr(monthof(dtpk1.Date));  //会计期间
 Edit_employee.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  dm.ADO104.Close;
  dm.ADO104.Open;
  mt_error:=true;
  if strtocurr(edit8.Text)>0 then    //借方借项备忘总计金额
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if self.accsupp_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(self.accsupp_gl_ptr))
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;

    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;         //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=self.curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
        end
        else
         begin
          messagedlg('支出类别中会计帐目定义了核算单一外币,且与支出货币不一致',mterror,[mbcancel],0);
          mt_error:=false;
         end;
       end;
    end; //end case
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+
                         edit4.Text+
                         ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
            formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit6.Text));
       if self.accsupp_gl_ptr>0 then
        sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(self.accsupp_gl_ptr)
       else
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;

       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;//==============================借方总计金额

  mt_error:=true;
  if strtocurr(edit3.Text)>0 then    //贷方不含税金额
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_02.AsString);
    open;

    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit3.Text;         //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=self.curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit3.text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
        end
        else
         begin
          messagedlg('支出类别中会计帐目定义了核算单一外币,且与支出货币不一致',mterror,[mbcancel],0);
          mt_error:=false;
         end;
       end;
    end; //end case
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+
                         edit4.Text+
                         ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
            formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;

       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;//==============================贷材料净值

  mt_error:=true;
  if strtocurr(edit7.Text)>0 then    //贷方增值税金
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_03.AsString);
    open;

    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit7.Text;         //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=self.curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit7.text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
        end
        else
         begin
          messagedlg('支出类别中会计帐目定义了核算单一外币,且与支出货币不一致',mterror,[mbcancel],0);
          mt_error:=false;
         end;
       end;
    end; //end case
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+
                         edit4.Text+
                         ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
            formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;

       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;//==============================贷材料税金

  mt_error:=true;
  if strtocurr(edit2.Text)>0 then    //贷方杂项金额
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
    open;

    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit2.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit2.Text;         //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=self.curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit2.text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_ptr);
        end
        else
         begin
          messagedlg('支出类别中会计帐目定义了核算单一外币,且与支出货币不一致',mterror,[mbcancel],0);
          mt_error:=false;
         end;
       end;
    end; //end case
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+
                         edit4.Text+
                         ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
            formatfloat('0.00',strtocurr(edit2.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;

       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;//==============================贷杂项费用

 self.re_calculate;
if sgrid1.RowCount=2 then
 begin
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
  speedbutton7.Enabled:=false;
  speedbutton8.Enabled:=false;
 end
else
 begin
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
  speedbutton7.Enabled:=true;
  speedbutton8.Enabled:=true;
 end;

end;
end;

procedure TForm4.PopupMenu3Popup(Sender: TObject);
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

procedure TForm4.Edit6Exit(Sender: TObject);
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
   edit6.Text:=formatfloat('0.0000',strtofloat(edit6.Text));
  end;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
    InputVar.Sqlstr := 'select rkey,warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    InputVar.AdoConn := dm.ACt;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Label15.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit10.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      Edit10.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

end.
