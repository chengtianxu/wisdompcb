unit ADED_RECE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, DB, ADODB, ExtCtrls;

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
    Panel1: TPanel;
    StrGrid3: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    function received_over(rkey300:string):boolean;
    procedure StrGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

uses data_module, main, po_search;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
 strgrid1.Cells[0,0] := '材料编码';
 strgrid1.Cells[1,0] := '材料名称';
 strgrid1.Cells[2,0] := '材料规格';
 strgrid1.Cells[3,0] := '价格';
 strgrid1.Cells[4,0] := '转换率';
 strgrid1.Cells[5,0] := '税率%';
 strgrid1.Cells[6,0] := '存货单位';
 strgrid1.Cells[7,0] := '接收数量';
 strgrid1.Cells[8,0] := '位置';
 strgrid1.Cells[9,0] := '原制造商';
 strgrid1.Cells[10,0] := '环保标识';
 strgrid1.Cells[11,0] := '备注';

 strgrid3.Cells[0,0] := '物品名称';
 strgrid3.Cells[1,0] := '物品规格';
 strgrid3.Cells[2,0] := '物品类别';
 strgrid3.Cells[3,0] := '订购数量';
 strgrid3.Cells[4,0] := '接收数量';
 strgrid3.Cells[5,0] := '采购单位';
 strgrid3.Cells[6,0] := '含税价';
 strgrid3.Cells[7,0] := '税率%';
 strgrid3.Cells[8,0] := '位置';
 strgrid3.Cells[9,0] := '环保标识';
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:word;
begin
if (aded_flag=1) or (aded_flag=2) then //新增
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
  edit10.Text:=dm.Aqwz456EXCH_RATE.AsString;
  self.curr_ptr:=dm.Aqwz456CURRENCY_PTR.Value;
  edit7.Text:=dm.Aqwz456REF_NUMBER.Value;

  if dm.Aqwz456TTYPE.Value=1 then
  begin
  dm.Aqwz22.First;
  strgrid1.BringToFront;
  strgrid1.RowCount:=dm.aqwz22.RecordCount+1;
  strgrid2.RowCount:=dm.aqwz22.RecordCount+1;
  for i:=1 to dm.aqwz22.RecordCount do
   begin
    strgrid1.Cells[0,i] := dm.aqwz22INV_PART_NUMBER.Value;
    strgrid1.Cells[1,i] := dm.aqwz22INV_NAME.Value;
    strgrid1.Cells[2,i] := dm.aqwz22INV_DESCRIPTION.Value;
    strgrid1.Cells[3,i] := dm.aqwz22PRICE.AsString;
    strgrid1.Cells[4,i] := dm.aqwz22CONVERSION_FACTOR.AsString;
    

    strgrid1.Cells[6,i] := dm.aqwz22unit_name.Value;
    strgrid1.Cells[5,i] :=dm.aqwz22TAX_2.AsString;
    strgrid2.Cells[2,i] := dm.aqwz22LOCATION_PTR_FROM.AsString; //单位
    strgrid2.Cells[3,i] :=formatfloat('0.000',dm.aqwz22PRICE.value);


    strgrid1.Cells[7,i] := dm.aqwz22QUANTITY.AsString;  //当前接收

    strgrid1.Cells[8,i] := dm.aqwz22LOCATION.Value;   //位置名称

    strgrid1.Cells[9,i] := dm.aqwz22SUPPLIER2.Value;   //原制造商
    strgrid1.Cells[10,i] := dm.aqwz22rohs.Value;   //环保标识
    strgrid1.Cells[11,i] := dm.aqwz22BARCODE_ID.Value;   //备注

    strgrid2.Cells[0,i] := dm.aqwz22RKEY.AsString;        //71
    strgrid2.Cells[1,i] := dm.aqwz22INVENTORY_PTR.AsString;    //17


    strgrid2.Cells[3,i] := dm.aqwz22PRICE.AsString;      //价格
    strgrid2.Cells[4,i] := dm.aqwz22TAX_2.AsString;
    strgrid2.Cells[5,i] := dm.aqwz22LOCATION_PTR.AsString; //位置指针
    strgrid2.Cells[6,i] := dm.aqwz22SHELF_LIFE.AsString;
    dm.aqwz22.Next;
   end;
  dm.aqwz22.First;
  end
  else
  begin
   strgrid3.BringToFront;
   dm.Aqwz235.First;
   strgrid3.RowCount:=dm.Aqwz235.RecordCount+1;
   for i:=1 to dm.aqwz235.RecordCount do
   begin

   strgrid3.Cells[0,i] := dm.Aqwz235DESCRIPTION.Value; //'物品名称';
   strgrid3.Cells[1,i] := dm.Aqwz235GUI_GE.Value; //'物品规格';
   strgrid3.Cells[2,i] := dm.Aqwz235DESCRIPTION2.Value;  //'物品类别';
   strgrid3.Cells[3,i] := dm.Aqwz235QUAN_ORD.AsString; //'订购数量';
   strgrid3.Cells[4,i] := dm.Aqwz235QUAN_RECD.AsString; //'接收数量';
   strgrid3.Cells[5,i] := dm.Aqwz235UNIT_NAME.Value;  //'采购单位';
   strgrid3.Cells[6,i] := dm.Aqwz235unit_price.AsString; //'含税价';
   strgrid3.Cells[7,i] := dm.Aqwz235state_tax.AsString; //'税率%';
   strgrid3.Cells[8,i] := dm.Aqwz235LOCATION.Value; //'位置';
   strgrid3.Cells[9,i] := dm.Aqwz235rohs.Value; //'环保标识';
   dm.Aqwz235.Next;
   end;
   dm.Aqwz235.First;
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

procedure TForm2.StrGrid1KeyPress(Sender: TObject; var Key: Char);
begin

 if strgrid1.Col=7 then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;

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

procedure TForm2.StrGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
{if (gdSelected  in State) then
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
 }
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
   begin
    location_over:=true;
    break;
   end
  else
   if (strtofloat(strgrid1.Cells[7,i])=0) and (i=strgrid1.RowCount-1) then
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


end.
