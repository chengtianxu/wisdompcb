unit ADED_RECE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StrGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Label13: TLabel;
    Edit10: TEdit;
    Label14: TLabel;
    StrGrid2: TStringGrid;
    ComboBox1: TComboBox;
    Edit11: TEdit;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    function received_over(rkey300:string):boolean;
    procedure StrGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Enter(Sender: TObject);
    procedure StrGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StrGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    function location_over():boolean;
    procedure StrGrid1Exit(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure print_ininvt(rkey456:integer);
    function find_soerror(number:string):boolean;
  private
    { Private declarations }

  public    { Public declarations }
   aded_flag,ttype:byte;//1按po新增,2直接新增,3编辑,4检查ttype指按生产物料
   po_ptr,supp_ptr,warehouse_ptr,curr_ptr:integer;
   exch_rate:double;   
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
implementation

uses data_module, main, po_search, invtin_report;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
 strgrid1.Cells[0,0] := '材料编码';
 strgrid1.Cells[1,0] := '材料名称';
 strgrid1.Cells[2,0] := '材料规格';
 strgrid1.Cells[3,0] := '订购数量';
 strgrid1.Cells[4,0] := '转换率';
 strgrid1.Cells[5,0] := '已接收';
 strgrid1.Cells[6,0] := '存货单位';
 strgrid1.Cells[7,0] := '当前接收';
 strgrid1.Cells[8,0] := '位置';
 strgrid1.Cells[9,0] := '备注';
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:word;
begin
if (aded_flag=1) or (aded_flag=2) then //１生产新增 ２杂英收货新增
 begin
  edit11.Text:=formatdatetime('yyyy-mm-dd H:mm:ss',form1.sys_longdate);

  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
   edit6.Text:=dm.ado04SEED_VALUE.Value;
  dm.ado04.Close;


   dm.aq16.Close;
   dm.aq16.Parameters[0].Value:=self.warehouse_ptr;
   dm.aq16.Open;
   while not dm.aq16.Eof do
    begin
     combobox1.Items.Add(dm.aq16LOCATION.Value);
     dm.aq16.Next;
    end;
   dm.aq16.First;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select NOTE_PAD_LINE_1 from data0011');
    sql.Add('where SOURCE_TYPE=70 and');
    sql.Add('FILE_POINTER='+inttostr(self.po_ptr));
    open;
    if not isempty then edit7.Text:=fieldvalues['NOTE_PAD_LINE_1'];
    close;
   end;
 end
else     //编辑检查
 begin
  edit6.Text:=dm.Aqwz456GRN_NUMBER.Value;
  edit1.Text:=dm.Aqwz456DELIVER_NUMBER.Value;
  edit2.Text:=dm.Aqwz456PO_NUMBER.Value;
  edit4.Text:=dm.Aqwz456DEPT_NAME.Value;
  edit5.Text:=dm.Aqwz456ship_BY.Value;
  edit11.Text:=dm.Aqwz456ship_DATE.AsString;
  edit9.Text:=dm.Aqwz456CODE.Value;
  label11.Caption:=dm.Aqwz456SUPPLIER_NAME.Value;
  edit8.Text:=dm.Aqwz456WAREHOUSE_CODE.Value;
  label10.Caption:=dm.Aqwz456WAREHOUSE_NAME.Value;
  edit3.Text:=dm.Aqwz456CURR_CODE.Value;
  label13.Caption:=dm.Aqwz456CURR_NAME.Value;
  edit10.Text:=dm.Aqwz456EXCHANGE_RATE.AsString;
  self.curr_ptr:=dm.Aqwz456CURRENCY_PTR.Value;
  edit7.Text:=dm.Aqwz456REF_NUMBER.Value;

  dm.aq16.Close;
  dm.aq16.Parameters[0].Value:=dm.Aqwz456warehouse_ptr.Value;
  dm.aq16.Open;
  while not dm.aq16.Eof do
   begin
    combobox1.Items.Add(dm.aq16LOCATION.Value);
    dm.aq16.Next;
   end;
  dm.aq16.First;

  dm.Aq22.Open;
  strgrid1.RowCount:=dm.Aq22.RecordCount+1;
  strgrid2.RowCount:=dm.Aq22.RecordCount+1;
  for i:=1 to dm.Aq22.RecordCount do
   begin
    strgrid1.Cells[0,i] := dm.Aq22INV_PART_NUMBER.Value;
    strgrid1.Cells[1,i] := dm.Aq22INV_NAME.Value;
    strgrid1.Cells[2,i] := dm.Aq22INV_DESCRIPTION.Value;
    strgrid1.Cells[3,i] := dm.Aq22QUAN_ORD.AsString;
    strgrid1.Cells[4,i] := dm.Aq22CONVERSION_FACTOR.AsString;
    
    if dm.Aq22CONVERSION_FACTOR.Value>0 then
     begin
      strgrid1.Cells[6,i] := dm.Aq22pr_unitname.Value;
      strgrid1.Cells[5,i] :=floattostr(
      dm.Aq22QUAN_RECD.Value-dm.Aq22QUANTITY.Value/dm.Aq22CONVERSION_FACTOR.Value);
      strgrid2.Cells[2,i] := dm.Aq22WO_PTR.AsString; //单位
      strgrid2.Cells[3,i] :=formatfloat('0.000',
        dm.Aq22PRICE.value/dm.Aq22CONVERSION_FACTOR.Value
                                          );
     end
    else
     begin
      strgrid1.Cells[6,i] := dm.Aq22UNIT_NAME.Value;
      strgrid1.Cells[5,i] :=floattostr(dm.Aq22QUAN_RECD.Value-dm.Aq22QUANTITY.Value);
      strgrid2.Cells[2,i] := dm.Aq22PURCHASE_UNIT_PTR.AsString; //单位
      strgrid2.Cells[3,i] :=dm.Aq22PRICE.AsString;            //价格
     end;

    strgrid1.Cells[7,i] := dm.Aq22QUANTITY.AsString;  //当前接收
    if strgrid1.Cells[7,i]='' then
     strgrid1.Cells[7,i] :='0';

    strgrid1.Cells[8,i] := dm.Aq22LOCATION.Value;   //位置名称
    strgrid1.Cells[9,i] := dm.Aq22BARCODE_ID.Value;   //备注

    strgrid2.Cells[0,i] := dm.Aq22RKEY.AsString;        //71
    strgrid2.Cells[1,i] := dm.Aq22INVT_PTR.AsString;    //17


    strgrid2.Cells[3,i] := dm.Aq22PRICE.AsString;      //价格
    strgrid2.Cells[4,i] := dm.Aq22TAX_2.AsString;
    strgrid2.Cells[5,i] := dm.Aq22LOCATION_PTR.AsString; //位置指针
    strgrid2.Cells[6,i] := dm.Aq22SHELF_LIFE.AsString;
    dm.Aq22.Next;
   end;
  dm.Aq22.Close;
  strgrid1.SetFocus;
  strgrid1.Col:=7;
  if edit1.Enabled then edit1.SetFocus;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
if self.aded_flag=1 then //新增
 begin
 if self.find_soerror(trim(edit6.Text)) then
 begin
  if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado04.Close;
    dm.ado04.Open;
    edit6.Text:=dm.ado04SEED_VALUE.Value;
   end
  else
   begin
    edit6.SetFocus;
    exit;
   end;
 end;

  dm.ADOConnection1.BeginTrans;
  try
  dm.ADO456.Close;
  dm.ADO456.Parameters[0].Value:=null;
  dm.ADO456.Open;
  dm.ADO456.Append;
  dm.ADO456GRN_NUMBER.Value:=edit6.Text;
  dm.ADO456DELIVER_NUMBER.Value:=edit1.Text;
  dm.ADO456ship_BY.Value:=edit5.Text;
  dm.ADO456ship_DATE.Value:=strtodatetime(edit11.Text);
  dm.ADO456CREATE_BY.Value:=form1.empl_ptr;
  dm.ADO456CREATE_DATE.Value:=form1.sys_longdate;
  dm.ADO456warehouse_ptr.Value:=self.warehouse_ptr;
  dm.ADO456SUPP_PTR.Value:=self.supp_ptr;
  dm.ADO456PO_PTR.Value:=self.po_ptr;
  dm.ADO456REF_NUMBER.Value:=edit7.Text;
  dm.ADO456STATUS.Value:=1;
  dm.ADO456TTYPE.Value:=self.ttype;
  dm.ADO456exch_rate.AsString:=edit10.Text;
  dm.ADO456currency_ptr.Value:=self.curr_ptr;
  if checkbox2.Checked then
   dm.ADO456PRINTED.Value:='Y';
  dm.ADO456.Post;
  self.update_04(trim(edit6.Text)); //更新控制码
  dm.ADO22.Close;
  dm.ADO22.Parameters[0].Value:=dm.ADO456rkey.Value;
  dm.ADO22.Open;
  for i:=1 to strgrid1.RowCount-1 do
   if strtofloat(strgrid1.Cells[7,i])>0 then
    begin
     dm.ADO22.Append;
     dm.ADO22GRN_PTR.Value:=dm.ADO456RKEY.Value;     //456.rkey
     dm.ADO22SOURCE_PTR.Value:=strtoint(strgrid2.Cells[0,i]);  //71.rkey
     dm.ADO22INVENTORY_PTR.Value:=strtoint(strgrid2.Cells[1,i]);   //17.rkey
     dm.ADO22LOCATION_PTR.Value:=strtoint(strgrid2.Cells[5,i]);    //16.rkey
     dm.ADO22QUANTITY.AsString:=strgrid1.Cells[7,i];       //接收数量
     dm.ADO22QUAN_ON_HAND.Value:=dm.ADO22QUANTITY.Value;   //当前库存数量
     dm.ADO22LOCATION_PTR_FROM.Value:=strtoint(strgrid2.Cells[2,i]);//单位
     dm.ADO22PRICE.AsString:=strgrid2.Cells[3,i];           //价格
     dm.ADO22TAX_2.AsString:=strgrid2.Cells[4,i];           //税率
     dm.ADO22CURRENCY_PTR.Value:=self.curr_ptr;      //货币
     dm.ADO22EXCHANGE_RATE.AsString:=edit10.Text;    //汇率
     dm.ADO22BARCODE_ID.Value:=strgrid1.Cells[9,i];//备注
     dm.ADO22EXPIRE_DATE.Value:=form1.sys_shortdate+strtoint(strgrid2.Cells[6,i]);
     dm.ADO22.Post;                                       //有效期
    end;

    with dm.ADOQuery1 do         //更新71已收货数量 无转换率
    begin
     close;
     sql.Clear;
     sql.Add('update data0071');
     sql.Add('set QUAN_RECD=QUAN_RECD+data0022.quantity');
     sql.Add('from data0022 inner join data0071');
     sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
     sql.Add('where data0071.CONVERSION_FACTOR=0');
     sql.Add('and data0022.GRN_PTR='+dm.ADO456rkey.AsString);
     ExecSQL;
    end;

    with dm.ADOQuery2 do         //更新71已收货数量 有转换率
    begin
     close;
     sql.Clear;
     sql.Add('update data0071');
     sql.Add('set QUAN_RECD=QUAN_RECD+data0022.quantity/data0071.CONVERSION_FACTOR');
     sql.Add('from data0022 inner join data0071');
     sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
     sql.Add('where data0071.CONVERSION_FACTOR>0');
     sql.Add('and data0022.GRN_PTR='+dm.ADO456rkey.AsString);
     ExecSQL;
    end;

  if (checkbox1.Checked)  then       //更新70
   begin
    with dm.adoquery2 do
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=6');
      sql.Add('where rkey='+dm.ADO456PO_PTR.AsString);
      execsql;
     end;
   end;
   

   dm.ADOConnection1.CommitTrans;
   if checkbox2.Checked then self.print_ininvt(dm.ADO456RKEY.Value);

   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit6.SetFocus;
    end;
  end;
 end
else         //编辑
 begin
  dm.ADOConnection1.BeginTrans;
   try
  dm.ADO456.Close;
  dm.ADO456.Parameters[0].Value:=dm.Aqwz456RKEY.Value;
  dm.ADO456.Open;
  dm.ADO456.Edit;
  dm.ADO456GRN_NUMBER.Value:=edit6.Text;
  dm.ADO456DELIVER_NUMBER.Value:=edit1.Text;
  dm.ADO456ship_DATE.Value:=strtodatetime(edit11.text);
  dm.ADO456ship_BY.Value:=edit5.Text;
  dm.ADO456REF_NUMBER.Value:=edit7.Text;
  dm.ADO456STATUS.Value:=1;
  dm.ADO456.Post;

  for i:=1 to strgrid1.RowCount-1 do
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select data0022.QUANTITY,data0022.LOCATION_PTR,data0022.QUAN_ON_HAND,');
      sql.Add('data0022.BARCODE_ID,data0071.QUAN_RECD,data0071.CONVERSION_FACTOR');
      sql.Add('from data0022 inner join data0071 on');
      sql.Add('data0022.SOURCE_PTR=data0071.rkey');
      sql.Add('where data0022.GRN_PTR='+dm.ADO456RKEY.AsString);
      sql.Add('and data0022.SOURCE_PTR='+strgrid2.Cells[0,i]);
      open;
     end;
    if (not dm.ADOQuery1.IsEmpty) and (strtoint(strgrid1.Cells[7,i])>0) then
     begin
      dm.ADOQuery1.Edit;
      if dm.ADOQuery1.FieldValues['CONVERSION_FACTOR']>0 then
       dm.ADOQuery1.FieldValues['QUAN_RECD']:= dm.ADOQuery1.FieldValues['QUAN_RECD']-
       dm.ADOQuery1.FieldValues['QUANTITY']/dm.ADOQuery1.FieldValues['CONVERSION_FACTOR']+
       strtofloat(strgrid1.Cells[7,i])/dm.ADOQuery1.FieldValues['CONVERSION_FACTOR']
      else
       dm.ADOQuery1.FieldValues['QUAN_RECD']:= dm.ADOQuery1.FieldValues['QUAN_RECD']-
       dm.ADOQuery1.FieldValues['QUANTITY']+strtofloat(strgrid1.Cells[7,i]);
      dm.ADOQuery1.FieldValues['QUANTITY']:= strtofloat(strgrid1.Cells[7,i]);
      dm.ADOQuery1.FieldValues['QUAN_ON_HAND']:= strtofloat(strgrid1.Cells[7,i]);
      dm.ADOQuery1.FieldValues['LOCATION_PTR']:=strtoint(strgrid2.Cells[5,i]);//16.rkey
      dm.ADOQuery1.FieldValues['BARCODE_ID']:=strgrid1.Cells[9,i];
      dm.adoquery1.Post;
     end
    else
     if (not dm.ADOQuery1.IsEmpty) and (strtoint(strgrid1.Cells[7,i])=0) then
      begin
       dm.ADOQuery1.Edit;                             //更新71
       if dm.ADOQuery1.FieldValues['CONVERSION_FACTOR']>0 then
        dm.ADOQuery1.FieldValues['QUAN_RECD']:= dm.ADOQuery1.FieldValues['QUAN_RECD']-
       dm.ADOQuery1.FieldValues['QUANTITY']/dm.ADOQuery1.FieldValues['CONVERSION_FACTOR']
      else
       dm.ADOQuery1.FieldValues['QUAN_RECD']:= dm.ADOQuery1.FieldValues['QUAN_RECD']-
       dm.ADOQuery1.FieldValues['QUANTITY'];
       dm.adoquery1.Post;
       with dm.ADOQuery2 do
        begin                       //删除22
         close;
         sql.Clear;
         sql.Add('delete from data0022');
         sql.Add('where data0022.GRN_PTR='+dm.ADO456RKEY.AsString);
         sql.Add('and data0022.SOURCE_PTR='+strgrid2.Cells[0,i]);
         execsql;
        end;
      end
     else
      if (dm.ADOQuery1.IsEmpty) and (strtoint(strgrid1.Cells[7,i])>0) then
       begin
        dm.ADO22.Close;
        dm.ADO22.Parameters[0].Value:=dm.Ado456RKEY.Value;
        dm.ADO22.Open;
        dm.ADO22.Append;
        dm.ADO22GRN_PTR.Value:=dm.ADO456RKEY.Value;     //
        dm.ADO22SOURCE_PTR.Value:=strtoint(strgrid2.Cells[0,i]);  //71.rkey
        dm.ADO22INVENTORY_PTR.Value:=strtoint(strgrid2.Cells[1,i]);   //17.rkey
        dm.ADO22LOCATION_PTR.Value:=strtoint(strgrid2.Cells[5,i]);    //16.rkey
        dm.ADO22QUANTITY.AsString:=strgrid1.Cells[7,i];       //接收数量
        dm.ADO22QUAN_ON_HAND.Value:=dm.ADO22QUANTITY.Value;   //当前库存数量
        dm.ADO22PRICE.AsString:=strgrid2.Cells[3,i];           //价格
        dm.ADO22TAX_2.AsString:=strgrid2.Cells[4,i];           //税率
        dm.ADO22LOCATION_PTR_FROM.Value:=strtoint(strgrid2.Cells[2,i]);//单位
        dm.ADO22CURRENCY_PTR.Value:=self.curr_ptr;      //货币
        dm.ADO22EXCHANGE_RATE.AsString:=edit10.Text;    //汇率
        dm.ADO22BARCODE_ID.Value:=strgrid1.Cells[9,i];//备注
        dm.ADO22EXPIRE_DATE.Value:=form1.sys_shortdate+strtoint(strgrid2.Cells[6,i]);
        dm.ADO22.Post;

        with dm.ADOQuery1 do         //更新71已收货数量 无转换率
        begin
         close;
         sql.Clear;
         sql.Add('update data0071');
         sql.Add('set QUAN_RECD=QUAN_RECD+data0022.quantity');
         sql.Add('from data0022 inner join data0071');
         sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
         sql.Add('where data0071.CONVERSION_FACTOR=0');
         sql.Add('and data0022.rkey='+dm.ADO22RKEY.AsString);
         ExecSQL;
        end;

        with dm.ADOQuery2 do         //更新71已收货数量 有转换率
        begin
         close;
         sql.Clear;
         sql.Add('update data0071');
         sql.Add('set QUAN_RECD=QUAN_RECD+data0022.quantity/data0071.CONVERSION_FACTOR');
         sql.Add('from data0022 inner join data0071');
         sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
         sql.Add('where data0071.CONVERSION_FACTOR>0');
         sql.Add('and data0022.rkey='+dm.ADO22RKEY.AsString);
         ExecSQL;
        end;

       end;
   end;

   if (checkbox1.Checked)  then
    with dm.adoquery2 do
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=6');
      sql.Add('where rkey='+dm.ADO456PO_PTR.AsString);
      execsql;
     end
   else
    with dm.adoquery2 do
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=5');
      sql.Add('where rkey='+dm.ADO456PO_PTR.AsString);
      execsql;
     end;
     
  dm.ADOConnection1.CommitTrans;
  if (checkbox2.Checked) and (dm.ADO456PRINTED.Value='N') then
   self.print_ininvt(dm.ADO456RKEY.Value);
  self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit6.SetFocus;
    end;
  end;
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
 i:word;
begin
 for i:=1 to strgrid1.RowCount-1 do
  if strtofloat(strgrid1.Cells[4,i])>0 then
  strgrid1.Cells[7,i]:=
  floattostr((strtofloat(strgrid1.Cells[3,i])-strtofloat(strgrid1.Cells[5,i]))*
  strtofloat(strgrid1.Cells[4,i]))
  else
  strgrid1.Cells[7,i]:=
  floattostr(strtofloat(strgrid1.Cells[3,i])-strtofloat(strgrid1.Cells[5,i]));
if not checkbox1.Checked then checkbox1.Checked:=true;
end;

function TForm2.received_over(rkey300:string): boolean;
begin
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from wzdata301');
   sql.Add('where RECEVIED_QTY<>QUANTITY');
   sql.Add('and EPIBOLY_PTR='+rkey300);
   open;
  end;
 if dm.ADOQuery2.IsEmpty then
  received_over:=true
 else
  received_over:=false;
end;

procedure TForm2.StrGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 if acol<7 then canselect:=false;
end;

procedure TForm2.StrGrid1KeyPress(Sender: TObject; var Key: Char);
begin

 if strgrid1.Col=7 then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',strgrid1.Cells[7,strgrid1.Row])>0  then abort;

if (key <> chr(9)) then
 begin
  if (strgrid1.Col=8) and (combobox1.Enabled) then
   begin
    ComboBox1.SetFocus;
    SendMessage(ComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;

end;

procedure TForm2.StrGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if strgrid1.Col=7 then
 begin
  if strgrid1.Cells[7,strgrid1.Row]='' then strgrid1.Cells[7,strgrid1.Row]:='0';
  if form1.stock_flag='N' then   //接收数量不能大于订购数量
  if strtofloat(strgrid1.Cells[4,strgrid1.Row])>0 then//转换率大于0
   begin
    if strtofloat(strgrid1.Cells[7,strgrid1.Row])>
      (strtofloat(strgrid1.Cells[3,strgrid1.Row])-strtofloat(strgrid1.Cells[5,strgrid1.Row]))*
       strtofloat(strgrid1.Cells[4,strgrid1.Row])  then
     strgrid1.Cells[7,strgrid1.Row]:=floattostr(
                                     (strtofloat(strgrid1.Cells[3,strgrid1.Row])-
                                      strtofloat(strgrid1.Cells[5,strgrid1.Row]))*
                                      strtofloat(strgrid1.Cells[4,strgrid1.Row])
                                                );
   end
  else
   begin
    if strtofloat(strgrid1.Cells[7,strgrid1.Row])>
     (strtofloat(strgrid1.Cells[3,strgrid1.Row])-strtofloat(strgrid1.Cells[5,strgrid1.Row])) then
     strgrid1.Cells[7,strgrid1.Row]:=floattostr(
                                      strtofloat(strgrid1.Cells[3,strgrid1.Row])-
                                      strtofloat(strgrid1.Cells[5,strgrid1.Row])
                                                );
   end;
 end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit6.Text)='' then
 begin
  showmessage('入库单号不允许为空!');
  edit6.SetFocus;
  exit;
 end;

if not dm.Ado04.Active then dm.ado04.Open;

if (dm.ado04SEED_FLAG.Value<>1) and
  (not (edit6.Text[length(trim(edit6.Text))] in ['0'..'9'])) then
 begin
  messagedlg('入库编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit6.SetFocus;
  exit;
 end;

if trim(edit8.Text)='' then
 begin
  showmessage('请选择入仓的工厂!');
  edit8.SetFocus;
  exit;
 end;

if trim(edit9.Text)='' then
 begin
  showmessage('请选择供应商!');
  edit9.SetFocus;
  exit;
 end;

if strgrid1.Cells[0,1]='' then
 begin
  showmessage('至少需要一条入仓记录!');
  strgrid1.SetFocus;
  exit;
 end;
if self.location_over then
 begin
  showmessage('至少需要一项入仓记录并输入入仓位置!');
  strgrid1.SetFocus;
  strgrid1.Col:=7;
  exit;
 end;
end;

procedure TForm2.StrGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 8 ) then
   begin
    ComboBox1.Left := Rect.Left;
    ComboBox1.Top := Rect.Top+strgrid1.Top;
    ComboBox1.Width := Rect.Right - Rect.Left+3;
    ComboBox1.Height := Rect.Bottom - Rect.Top;
    ComboBox1.Visible := True;
    if strgrid1.Cells[acol,arow]<>'' then
     combobox1.ItemIndex:=combobox1.Items.IndexOf(strgrid1.Cells[acol,arow])
    else
     combobox1.ItemIndex:=-1;
   end
  else
    ComboBox1.Visible :=false;
 end;

end;

procedure TForm2.StrGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=112) and (combobox1.Visible) then
  begin
   if combobox1.Enabled then
   begin
   combobox1.SetFocus;
   combobox1.DroppedDown:=true;
   end;
  end;
end;

procedure TForm2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox1.DroppedDown:=true;
if key=13 then strgrid1.SetFocus;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 dm.aq16.MoveBy(combobox1.ItemIndex+1-dm.aq16.RecNo);
 strgrid1.Cells[8,strgrid1.Row]:=combobox1.Text;
 strgrid2.Cells[5,strgrid1.Row]:=dm.aq16rkey.AsString;
end;

function TForm2.location_over: boolean;
var
 i:word;
begin
 location_over:=false;
 for i:=1 to strgrid1.RowCount-1 do
  if (strgrid1.Cells[8,i]='') and (strtofloat(strgrid1.Cells[7,i])>0) then
   begin                    //必需输入入仓位置
    location_over:=true;
    break;
   end;

 for i:=1 to strgrid1.RowCount-1 do
  if (strtofloat(strgrid1.Cells[7,i])>0) then
   begin                    //必需有一个入仓数量
    break;
   end
  else
   if (i=strgrid1.RowCount-1) then
    location_over:=true;

end;

procedure TForm2.StrGrid1Exit(Sender: TObject);
var
 i:word;
 over:boolean;
begin
 over:=true;     //默认收货完成
for i:=1 to strgrid1.RowCount-1 do
 begin
  if strtofloat(strgrid1.Cells[4,strgrid1.Row])>0 then//转换率大于0
   begin
    if strtofloat(strgrid1.Cells[7,i])<
      (strtofloat(strgrid1.Cells[3,i])-strtofloat(strgrid1.Cells[5,i]))*
       strtofloat(strgrid1.Cells[4,i])  then
     begin
      over:=false;//没有收货完成
      break;
     end;
   end
  else
   begin
    if strtofloat(strgrid1.Cells[7,i])<
     (strtofloat(strgrid1.Cells[3,i])-strtofloat(strgrid1.Cells[5,i])) then
     begin
      over:=false;//没有收货完成
      break;
     end;
   end;
 end;
 checkbox1.Checked:=over;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;


procedure TForm2.update_04(v_seed: string);
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


procedure TForm2.print_ininvt(rkey456: integer);
begin
 form_report:=tform_report.Create(application);
 form_report.Aqwz456.close;
 form_report.Aqwz456.Parameters[0].Value:=rkey456;
 form_report.Aqwz456.open;
 form_report.ppReport1.Print;
 form_report.free;
end;

function tform2.find_soerror(number:string):boolean;

begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0456');
   sql.Add('where GRN_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;

end;

end.
