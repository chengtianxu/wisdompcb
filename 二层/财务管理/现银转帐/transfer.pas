unit transfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Menus, Grids, ExtCtrls, ToolWin,
  DateUtils,math;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    Edit1: TEdit;
    Edit2: TEdit;
    dtpk1: TDateTimePicker;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn3: TBitBtn;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    BitBtn5: TBitBtn;
    a_or_e: TLabel;
    Edit12: TEdit;
    Label15: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    Label11: TLabel;
    Label16: TLabel;
    Edit9: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label21: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Edit17: TEdit;
    BitBtn6: TBitBtn;
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrid1Exit(Sender: TObject);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit_dateExit(Sender: TObject);
    procedure Edit_dateKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Edit_ATTACHEDKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit9Enter(Sender: TObject);
    procedure Edit15Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
   empl_ptr,bank_from_ptr,bank_tobe_ptr,currency_ptr,curr_toptr:integer;
   gl_bankfrom_ptr,gl_banktobe_ptr:integer;
   function get_vouchernumber(inv_date: tdatetime): string;
   function get_gltp(rkey103: string): integer;
   function get_glcurr_ptr(rkey103: string): integer;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
   procedure re_calculate;
   function RemoveInvalid(where: string): string;
   function find_error(number:string):boolean;
   function vo_number(number: string): boolean;
   function find_bankerror(number:string):boolean;
   function find_114error(number:string):boolean;
   procedure update_128(v_seed: string; bank_ptr,flag:integer);
   procedure update_04();
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo, main, AcctSearch, BankSearch, curr_search, employee_search,
  voucher_dictionary, voucher_report,common,Pick_Item_Single ,ConstVar;

{$R *.dfm}
procedure TForm2.update_04();
var
 i,v_length:integer;
 v_last,new_seed,v_seed:string;
begin
 dm.adosp04.Close;
 dm.adosp04.Open;
 v_seed:=dm.ADOsp04SEED_VALUE.Value;
 if dm.adosp04SEED_FLAG.Value<>1 then
 begin
  v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+
        strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
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
end;

procedure TForm2.update_128(v_seed: string;bank_ptr,flag:integer);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin

 dm.ado128.Close;
 dm.ADO128.Parameters[0].Value:=bank_ptr;
 dm.ado128.Open;

 dm.ADO128.Edit;
 if flag=0 then
  dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-dm.ADO129AMOUNT.Value
 else
  dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+dm.ado114AMOUNT.Value;

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

function tform2.find_bankerror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do                //转出票据号重复
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0129');
   sql.Add('where CHECK_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function tform2.find_114error(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do                //转出票据号重复
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0114');
   sql.Add('where REFERENCE_NO='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function TForm2.vo_number(number: string): boolean;
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

function tform2.find_error(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0522');
   sql.Add('where REF_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function TForm2.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

 voucher:='PA'+copy(inttostr(yearof(inv_date)),3,2);  //年度

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

function TForm2.get_gltp(rkey103: string): integer;
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

function TForm2.get_glcurr_ptr(rkey103: string): integer;
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

function TForm2.get_col5(row: integer): currency;
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

function TForm2.get_col6(row: integer): currency;
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

procedure TForm2.re_calculate;
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

function TForm2.RemoveInvalid(where: string): string;
 var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
       copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

procedure TForm2.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm2.SGrid1Exit(Sender: TObject);
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

procedure TForm2.SGrid1KeyDown(Sender: TObject; var Key: Word;
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
 
procedure TForm2.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm2.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm2.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TForm2.N4Click(Sender: TObject);
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
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=form_curr.ADOQuery1curr_code.Value;
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

procedure TForm2.N5Click(Sender: TObject);
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

procedure TForm2.N11Click(Sender: TObject);
begin
try
 form_curr:=tform_curr.Create(application);
 if form_curr.ShowModal=mrok then
  begin
   if (get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and
      (form_curr.ADOQuery1rkey.Value>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=2) and   //单一外货
       (get_glcurr_ptr(trim(sgrid2.Cells[0,sgrid1.row]))<>
       form_curr.ADOQuery1rkey.Value) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;   //货币
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

procedure TForm2.N7Click(Sender: TObject);
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

procedure TForm2.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm2.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
if self.a_or_e.Caption='0' then  //新增
 begin
  edit_number.Text:=get_vouchernumber(strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm2.Edit_dateExit(Sender: TObject);
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
  edit_number.Text:=get_vouchernumber(strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end;
end;

procedure TForm2.Edit_dateKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:integer;
begin
sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';
if self.a_or_e.Caption='0' then
 begin

 end
else       //编辑
 begin
  self.empl_ptr:=dm.aqd522empl_ptr.value;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select data0114.EXCHANGE_RATE,data0001.curr_code,'+#13+
             'data0001.curr_name,data0114.CURRECY_PTR'+#13+
             'from data0114 inner join data0001'+#13+
             'on data0114.CURRECY_PTR=data0001.rkey'+#13+
             'where data0114.rkey='+dm.aqd522check_114ptr.AsString;
   open;
   edit14.Text:=fieldbyname('curr_code').AsString;       
   label19.Caption:=fieldbyname('curr_name').AsString;
   edit15.Text:=fieldbyname('EXCHANGE_RATE').AsString;   //转入汇率
   Self.curr_toptr:=fieldbyname('CURRECY_PTR').AsInteger;  //转入货币指针
  end;

  self.gl_bankfrom_ptr:=dm.aqd522gl_bankfrom_ptr.Value;   //转出银行会计科目
  self.gl_banktobe_ptr:=dm.aqd522gl_banktobe_ptr.Value;   //转入银行会计科目
  Self.currency_ptr:=dm.aqd522currency_ptr.Value;      //转出货币指针

  Edit17.Text:=dm.aqd522WAREHOUSE_CODE.Value;
  label30.Caption:=dm.aqd522abbrname15.Value;
  Edit17.Tag:=dm.aqd522warehouse_ptr.Value;
  edit13exit(sender);
  
  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.aqd522rkey105.Value;
  dm.Aqd105.Open;
  if not dm.Aqd105.IsEmpty then
  begin
  self.Edit_number.Text:=dm.Aqd105VOUCHER.Value;
  self.Edit_date.Text:=dm.Aqd105ENTERED_DT.AsString;
  self.Edit_fyear.Text:=dm.Aqd105FYEAR.AsString;
  self.Edit_PERIOD.Text:=dm.Aqd105PERIOD.AsString;
  self.Edit_ATTACHED.Text:=dm.Aqd105ATTACHED.AsString;
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
  end; 
 end;

 if sgrid1.RowCount=2 then
  begin
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

procedure TForm2.PopupMenu3Popup(Sender: TObject);
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

procedure TForm2.Edit_ATTACHEDKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
try
form_employee:=tform_employee.Create(application);
form_employee.maskEdit1.Text:=edit12.Text;
if form_employee.ShowModal=mrok then
 begin
  edit12.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
  label5.Caption:=form_employee.ADOQuery1EMPLOYEE_NAME.Value;
  self.empl_ptr:=form_employee.ADOQuery1RKEY.Value;
 end;
finally
form_employee.Free;
end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
try
 frmbanksearch:=Tfrmbanksearch.Create(application);
 if frmbanksearch.ShowModal=mrok then
  begin
   edit4.Text:=frmbanksearch.Adodata0128bank_name.Value;
   edit6.Text:=frmbanksearch.Adodata0128bal_amount.AsString;
   edit7.Text:=trim(frmbanksearch.Adodata0128bank_current_check.Value);
   self.bank_from_ptr:=frmbanksearch.Adodata0128rkey.Value;
   self.gl_bankfrom_ptr:=frmbanksearch.Adodata0128gl_acct_ptr.Value;
   if self.currency_ptr<>frmbanksearch.Adodata0128currency_ptr.Value then
   begin
    self.currency_ptr:=frmbanksearch.Adodata0128currency_ptr.Value;
    edit5.Text:=frmbanksearch.Adodata0128curr_code.Value;
    label11.Caption:=frmbanksearch.Adodata0128curr_name.Value;
    edit9.Text:=frmbanksearch.Adodata0128BASE_TO_OTHER.AsString;
    edit8.Text:='';
    edit10.Text:='';
    edit11.Text:='';
    edit13.Text:='';
    edit14.Text:='';
    edit15.Text:='';
    label19.Caption:='';
   end;
  end;
finally
 frmbanksearch.Free;
end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
if trim(edit4.Text)='' then
 messagedlg('对不起请先选择转出帐户!',mterror,[mbcancel],0)
else
try
 frmbanksearch:=Tfrmbanksearch.Create(application);
 if frmbanksearch.ShowModal=mrok then
  begin
   if frmbanksearch.Adodata0128rkey.Value<>self.bank_from_ptr then
    begin
     edit8.Text:=frmbanksearch.Adodata0128bank_name.Value;
     edit10.Text:=frmbanksearch.Adodata0128bal_amount.AsString;
     edit11.Text:=trim(frmbanksearch.Adodata0128bank_current_check.Value);
     self.bank_tobe_ptr:=frmbanksearch.Adodata0128rkey.Value;
     self.gl_banktobe_ptr:=frmbanksearch.Adodata0128gl_acct_ptr.Value;
     self.curr_toptr :=frmbanksearch.Adodata0128currency_ptr.Value;
     edit14.Text:=frmbanksearch.Adodata0128curr_code.Value;
     label19.Caption:=frmbanksearch.Adodata0128curr_name.Value;
     edit15.Text:=frmbanksearch.Adodata0128BASE_TO_OTHER.AsString;
     if self.curr_toptr=self.currency_ptr then
      edit13.Text:=edit2.Text         //转入金额＝转出金额
     else
      edit13.Text:=formatfloat('0.00',strtocurr(edit2.text)*strtofloat(edit9.Text)
                    /strtofloat(edit15.Text));
    end
   else
    messagedlg('对不起转入帐户与转出帐户不能是同一帐户!',mterror,[mbcancel],0);
  end;
finally
 frmbanksearch.Free;
end;
end;

procedure TForm2.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
 exchange_lose,exchange_win:currency;
begin
if (trim(edit8.Text)='') or (a_or_e.Caption='2') then exit;
                     //   a_or_e.Caption:='2';//检查
 exchange_lose:=0;
 exchange_win:=0;
if strtocurr(edit16.Text)<0 then
 exchange_lose:=abs(strtocurr(edit16.Text)) //汇兑损失 (记借方)
else
 if strtocurr(edit16.Text)>0 then //汇兑收益     (记贷方)
  exchange_win:=strtocurr(edit16.Text);


if (edit8.Text<>'') and (sgrid1.RowCount<=2) then
begin
 if (a_or_e.Caption='0') or (trim(edit_number.Text)='') then
 begin
  edit_date.Text:=datetostr(dtpk1.Date);
  edit_number.Text:=get_vouchernumber(dtpk1.Date);
  Edit_fyear.Text:=inttostr(yearof(dtpk1.Date));   //会计年度
  Edit_PERIOD.Text:=inttostr(monthof(dtpk1.Date)); //会计期间
 end;
 Edit_employee.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
 sgrid1.RowCount:=2;
 sgrid2.RowCount:=2;
 dm.ado104.Close;
 dm.ado104.Open;
 
 mt_error:=true;
 if strtocurr(edit13.Text)>0 then    //借方借项备忘总计金额
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+inttostr(self.gl_banktobe_ptr));
    open;
    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit13.Text)*strtofloat(edit15.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit14.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit15.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit13.Text;         //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_toptr);
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=self.curr_toptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit14.Text;          //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit15.Text;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit13.Text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.curr_toptr);
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
                         edit12.Text+
                         label5.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
            formatfloat('0.00',strtocurr(edit13.Text)*strtofloat(edit15.Text));

        sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(self.gl_banktobe_ptr);

       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;//==============================


   mt_error:=true;
  if exchange_lose > 0 then   //借汇兑损失
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           currtostr(exchange_lose);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end
     else
      mt_error:=false;
    end;
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+
                         edit12.Text+
                         label5.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                         currtostr(exchange_lose);
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end
  else
  if exchange_win > 0 then   //贷汇兑收益
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
       sgrid1.Cells[4,sgrid1.RowCount-1]:=currtostr(exchange_win);      //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end
     else
      mt_error:=false;
     end;
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+
                         edit12.Text+
                         label5.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                         currtostr(exchange_win);
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

   mt_error:=true;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+inttostr(self.gl_bankfrom_ptr));
    open;
    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit2.Text)*strtofloat(edit9.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit9.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit2.Text;         //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.currency_ptr);
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=self.currency_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;          //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit9.Text;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit2.Text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.currency_ptr);
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
                         edit12.Text+
                         label5.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //货方本币金额
            formatfloat('0.00',strtocurr(edit2.Text)*strtofloat(edit9.Text));

       sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(self.gl_bankfrom_ptr);

       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;//==============================

  end;

 self.re_calculate;
if sgrid1.RowCount=2 then
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
end;
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;  
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('转帐编号不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if not dm.ADOsp04.Active then dm.ADOsp04.Open;
if dm.ADOsp04SEED_FLAG.Value<>1 then
if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('转帐编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;
  
if trim(edit12.Text)='' then
 begin
  showmessage('经办人不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  edit12.SetFocus;
  exit;
 end;

if strtofloat(edit2.Text)=0 then
 begin
  showmessage('转帐金额必需大于零');
  self.PageControl1.ActivePageIndex:=0;
  edit2.SetFocus;
  exit;
 end;

if trim(edit8.Text)='' then
 begin
  showmessage('转入帐户不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  edit8.SetFocus;
  exit;
 end;
if trim(Edit17.Text)='' then
 begin
  showmessage('工厂不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  Edit17.SetFocus;
  exit;
 end;

if not (edit7.Text[length(trim(edit7.Text))] in ['0'..'9']) then
 begin
  messagedlg('转出票据号最后一位必需是一个整数!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit7.SetFocus;
  exit;
 end;

if not (edit11.Text[length(trim(edit11.Text))] in ['0'..'9']) then
 begin
  messagedlg('转入票据号最后一位必需是一个整数!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit11.SetFocus;
  exit;
 end;

 self.PageControl1Change(sender);
if sgrid1.RowCount>2 then
 begin
  if strtocurr(RemoveInvalid(statictext1.Caption))<>
     strtocurr(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;

{  if strtocurr(formatfloat('0.00',strtocurr(edit2.Text)*
                                  strtocurr(edit9.Text)
                          ))<>
     strtocurr(RemoveInvalid(statictext1.Caption)) then
   begin
    messagedlg('科目贷方金额与转帐金额不一致!',mterror,[mbcancel],0);
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

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if self.a_or_e.Caption='0' then
begin //开始新增
 if self.find_error(trim(edit1.Text)) then
 begin
  dm.adosp04.close;
  dm.adosp04.Open;
  if dm.ADOsp04SEED_FLAG.Value<>1 then
   if messagedlg('转帐编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
    begin
     edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
    end
   else
    begin
     self.PageControl1.ActivePageIndex:=0;
     edit1.SetFocus;
     exit;
    end
  else
   begin
    messagedlg('转帐编号重复可能多人同时新增!请手工修改',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit1.SetFocus;
    exit;
   end;
 end;

 if self.find_bankerror(trim(edit7.Text)) then
 begin
  if messagedlg('转出票据号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado128.close;
    dm.ADO128.Parameters[0].Value:=self.bank_from_ptr;
    dm.ADO128.Open;
    edit7.Text:=dm.ADO128bank_current_check.Value;
   end
  else
   begin
    self.PageControl1.ActivePageIndex:=0;
    edit7.SetFocus;
    exit;
   end;
 end;

 if self.find_114error(trim(edit11.Text)) then
  begin
   if messagedlg('转入票据号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado128.close;
    dm.ADO128.Parameters[0].Value:=self.bank_tobe_ptr;
    dm.ADO128.Open;
    edit11.Text:=dm.ADO128bank_current_check.Value;
   end
   else
   begin
    self.PageControl1.ActivePageIndex:=0;
    edit11.SetFocus;
    exit;
   end;
  end;

 if sgrid1.RowCount>2 then
 if vo_number(trim(self.Edit_number.Text)) then
  begin
   Edit_number.Text:=get_vouchernumber(strtodate(Edit_date.Text));
   messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!'+edit_number.Text,mterror,[mbok],0);
  end;

dm.ADOConnection1.BeginTrans;
try
 dm.ado522.Close;
 dm.ado522.Parameters[0].Value:=null;
 dm.ado522.Open;
 dm.ado522.Append;
 dm.ado522REF_NUMBER.Value:=trim(edit1.Text);
 dm.ado522TDATE.Value:=self.dtpk1.Date;
 dm.ado522EMPL_PTR.Value:=self.empl_ptr;
 dm.ado522REMARK.Value:=edit3.Text;
 dm.ado522sys_ptr.Value:=strtoint(user_ptr);
 dm.ado522amount.AsString:=edit2.Text;
 dm.ado522currency_ptr.Value:=self.currency_ptr; //转出帐户货币
 dm.ado522exch_rate.AsString:=edit9.Text;      //转出账户汇率

 dm.ado522warehouse_ptr.Value:=Edit17.Tag;
 dm.ado522.Post;

 dm.ADO129.Close;
 dm.ADO129.Parameters[0].Value:=null;
 dm.ADO129.Open;                           //付款记录
 dm.ADO129.Append;
 dm.ADO129CHECK_NUMBER.Value:=edit7.Text;
 dm.ADO129AMOUNT.AsString:=edit2.Text;
 dm.ADO129BANK_PTR.Value:=self.bank_from_ptr;
 dm.ADO129TDATE.Value:=self.dtpk1.Date;
 dm.ADO129STATUS.Value:=1;
 dm.ADO129TTYPE.Value:=4;   //银行转出
 dm.ADO129SRCE_PTR.Value:=dm.ado522RKEY.Value;  //指向转出记录
 dm.ADO129EMPL_PTR.Value:=strtoint(user_ptr);
 dm.ADO129CURR_PTR.Value:=self.currency_ptr;
 dm.ADO129EX_RATE.AsString:=self.Edit9.Text;
 dm.ado129warehouse_ptr.Value:=dm.ado522warehouse_ptr.Value;
 dm.ADO129.Post;
 self.update_128(trim(edit7.Text),self.bank_from_ptr,0);

 dm.ado114.Close;
 dm.ado114.Parameters[0].Value:=null;
 dm.ado114.Open;                         //收款记录
 dm.ado114.Append;
 dm.ado114TTYPE.Value := 4;
 dm.ado114STATUS.Value := 1;
 dm.ado114SRCE_PTR.Value := dm.ado522RKEY.Value;
 dm.ado114REFERENCE_NO.Value := edit11.Text;
 dm.ado114TDATE.Value := self.dtpk1.Date;
 dm.ado114EMPL_PTR.Value := strtoint(user_ptr);
 dm.ado114AMOUNT.AsString := edit13.Text;
 dm.ado114EXCHANGE_RATE.AsString := edit15.Text;
 dm.ado114ENTER_DATE.Value:=form1.sys_shortdate;
 dm.ado114CURRECY_PTR.Value:=self.curr_toptr;
 dm.ado114BANK_PTR.Value:=self.bank_tobe_ptr;
 dm.ado114warehouse_ptr.Value:=dm.ado522warehouse_ptr.Value;
 dm.ado114.Post;
 self.update_128(trim(edit11.Text),self.bank_tobe_ptr,1);

 dm.ado522.Edit;
 dm.ado522check_129ptr.Value:=dm.ado129RKEY.Value;
 dm.ado522check_114ptr.Value:=dm.ado114RKEY.Value;
 dm.ado522.Post;

 self.update_04();

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=null;
     open;
     append;
     dm.ado105VOUCHER.Value:=self.Edit_number.Text;           //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO522ref_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=10;                           //业务类型
     dm.ado105VOU_TYPE.Value:=3;                              //转帐凭证
     dm.ado105SOURCE_PTR.Value:=dm.ADO522RKEY.Value;               //转帐指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado522sys_ptr.Value;   //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);    //输入日期
     dm.ado105ATTACHED.Value := strtoint(self.Edit_ATTACHED.Text); //附件张数
     dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);       //会计年度
     dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);     //会计期间
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
    Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),fffixed,12,8);
     { DONE -owilliam -c注意事项 : 在保存凭证时汇率要是 1的倒数 }
    dm.ado106REF_NUMBER.Value:=dm.ado522REF_NUMBER.Value;
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

 dm.ADOConnection1.CommitTrans;
  if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty)  then
  begin  //打印凭证
   form_voucherreport:=Tform_voucherreport.Create(application);
    form_voucherreport.ppReport1.Reset;
    form_voucherreport.ppReport1.Template.FileName :=
     stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
    form_voucherreport.ppReport1.Template.LoadFromFile;
    form_voucherreport.ppReport1.SaveAsTemplate:=false;
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
   self.PageControl1.ActivePageIndex:=0;
   edit1.SetFocus;
  end;
end;
end    //结束新增
else
 begin           //开始编辑
 dm.ADOConnection1.BeginTrans;
 try
 dm.ado522.Close;
 dm.ado522.Parameters[0].Value:=dm.aqd522RKEY.Value;
 dm.ado522.Open;

 dm.ADO129.Close;
 dm.ADO129.Parameters[0].Value:=dm.aqd522RKEY.Value;
 dm.ADO129.Open;
 dm.ado129.Edit;
 dm.ado129CHECK_NUMBER.Value:=edit7.Text;
 dm.ado129TDATE.Value:=dtpk1.Date;
 dm.ado129AMOUNT.AsString:=edit2.Text;
 dm.ado129warehouse_ptr.Value:=Edit17.Tag;
 dm.ado129.Post;
 dm.ADO128.Close;
 dm.ADO128.Parameters[0].Value:=dm.ado129BANK_PTR.Value;
 dm.ADO128.Open;
 dm.ADO128.Edit;
 dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+
                            dm.ado522amount.Value-
                            strtocurr(edit2.Text);
 dm.ADO128.Post;

 dm.ado114.Close;
 dm.ado114.Parameters[0].Value:=dm.aqd522RKEY.Value;
 dm.ado114.Open;
 dm.ado114.Edit;
 dm.ado114REFERENCE_NO.Value:=edit11.Text;
 dm.ado114TDATE.Value:=dtpk1.Date;
 dm.ado114AMOUNT.AsString:=edit13.Text;
 dm.ado114warehouse_ptr.Value:=Edit17.Tag;
 dm.ado114.Post;
 dm.ADO128.Close;
 dm.ADO128.Parameters[0].Value:=dm.ado114BANK_PTR.Value;
 dm.ADO128.Open;
 dm.ADO128.Edit;
 dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-
                            dm.aqd522amount.Value+
                            strtocurr(edit13.Text);
 dm.ADO128.Post;

 dm.ado522.edit;
 dm.ado522REF_NUMBER.Value:=edit1.Text;
 dm.ado522TDATE.Value:=self.dtpk1.Date;
 dm.ado522EMPL_PTR.Value:=self.empl_ptr;
 dm.ado522amount.AsString:=edit2.Text;
 dm.ado522REMARK.Value:=edit3.Text;
 dm.ado522warehouse_ptr.Value:=Edit17.Tag;
 dm.ado522.Post;

   with dm.ado105 do                    //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.aqd522rkey105.Value;
     open;
    end;
   if not dm.ado105.isempty then dm.ado105.Delete;
   dm.ADO106.Close;
   dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
   dm.ADO106.Open;

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO522ref_NUMBER.Value;    //参考发票号
     dm.ado105TRANS_TYPE.Value:=10;            //业务类型
     dm.ado105VOU_TYPE.Value:=3;                                 //转帐凭证
     dm.ado105SOURCE_PTR.Value:=dm.ADO522RKEY.Value;             //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado522sys_ptr.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);   //输入日期
     dm.ado105ATTACHED.Value := strtoint(self.Edit_ATTACHED.Text);    //附件张数
     dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
     dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);    //会计期间
     post;
    end;

    for i:=1 to SGrid2.RowCount-2 do
    begin
    dm.ado106.Append;
    dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
    dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
    dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
    dm.ADO106EXCH_RATE.AsString:=
    Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffNumber,12,8);
     { DONE -owilliam -c注意事项 : 在保存凭证时汇率要是 1的倒数 }
    dm.ado106REF_NUMBER.Value:=dm.ado522REF_NUMBER.Value;
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

 dm.ADOConnection1.CommitTrans;
  if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty)  then
  begin  //打印凭证
   form_voucherreport:=Tform_voucherreport.Create(application);
    form_voucherreport.ppReport1.Reset;
    form_voucherreport.ppReport1.Template.FileName :=
     stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
    form_voucherreport.ppReport1.Template.LoadFromFile;
    form_voucherreport.ppReport1.SaveAsTemplate:=false;
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
 end;         //结束编辑
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then edit2.Text:='0.00';
edit2.text := formatfloat('0.00',strtocurr(edit2.Text));
if trim(edit8.Text)<>'' then edit13exit(sender);
end;

procedure TForm2.Edit13Exit(Sender: TObject);
begin
if trim(edit13.Text)='' then edit13.Text:='0.00';
edit13.text := formatfloat('0.00',strtocurr(edit13.Text));
if trim(edit14.Text)<>'' then
edit16.Text := formatfloat('0.00',strtocurr(edit13.Text)*strtofloat(edit15.Text)-
               strtocurr(edit2.Text)*strtofloat(edit9.Text));
end;

procedure TForm2.Edit9Exit(Sender: TObject);
begin
if trim((sender as tedit).Text)='' then
 begin
  showmessage('汇率数据输入有误!');
  (sender as tedit).SetFocus;
 end
else
 if strtofloat((sender as tedit).Text)<=0 then
  begin
   showmessage('汇率数据输入有误!');
   (sender as tedit).SetFocus;
  end
 else
 begin
  (sender as tedit).Text:=
   formatfloat('0.00000000',strtofloat((sender as tedit).Text));

   if trim(edit8.Text)<>'' then edit13exit(sender);
 end;
end;

procedure TForm2.Edit9Enter(Sender: TObject);
begin
if trim(edit4.Text)='' then
begin
 ShowMsg('请首先选择转出帐户','提示',1);
 edit4.SetFocus;
end;
end;

procedure TForm2.Edit15Enter(Sender: TObject);
begin
if trim(edit8.Text)='' then
begin
 ShowMsg('请首先选择转入帐户','提示',1);
 edit8.SetFocus;
end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
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
      Label30.Caption := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit17.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      Edit17.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
