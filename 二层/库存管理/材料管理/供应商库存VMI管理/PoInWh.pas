unit PoInWh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TForm_PoIn = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    LBSale: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    EdtCurr: TEdit;
    EdtPO: TEdit;
    EdtFac: TEdit;
    EdtVend: TEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    EdtRate: TEdit;
    Edit4: TEdit;
    CheckBox3: TCheckBox;
    Panel3: TPanel;
    StrGrid1: TStringGrid;
    CBloc: TComboBox;
    dtpk1: TDateTimePicker;
    StrGrid2: TStringGrid;
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure dtpk1Change(Sender: TObject);
    procedure CBLocChange(Sender: TObject);
    procedure StrGrid1TopLeftChanged(Sender: TObject);
    procedure StrGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure data0134_post(rkey133:integer);
    procedure get_location();
    function find_soerror(number:string):boolean;
    procedure FormActivate(Sender: TObject);
    procedure StrGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSaveEnter(Sender: TObject);
    procedure StrGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBLocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure dtpk1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function find_quan_error(rkey133:integer): boolean;
    function recevied_over(rkey70:Integer):Boolean;
    function Iqc_avlflag(var row:integer):boolean;
    function location_over():boolean;
  public
   aded_flag:byte;
   po_ptr,supp_ptr,warehouse_ptr,curr_ptr:integer;
   exch_rate:double;
   po_type:string;
  end;

var
  Form_PoIn: TForm_PoIn;
  function Power(x, y : extended) : extended;
implementation

uses PoSearch,common, Main, form_main_in,demo;

{$R *.dfm}


procedure TForm_PoIn.BitBtn9Click(Sender: TObject);
begin
close;
end;

procedure TForm_PoIn.Button1Click(Sender: TObject);
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

end;

procedure TForm_PoIn.BtnSaveClick(Sender: TObject);
{var
  i,iRkey14:integer;
  isInf:boolean;
  smsstring1,smsstring2:string;}
begin
if aded_flag=1 then //新增
begin
  maskedit1.SetFocus;
  if trim(MaskEdit1.Text)='' then
  begin
    showmessage('入库号不能为空...');
    exit;
  end;
  if trim(Edit2.Text)='' then
  begin
    showmessage('送货单号不能为空...');
    exit;
  end;
  if self.find_soerror(trim(maskedit1.Text)) then
  if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',
     mtConfirmation,[mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado04.Close;
    dm.ado04.Parameters[0].Value:='data0133';
    dm.ado04.Open;
    maskedit1.Text:=dm.ado04SEED_VALUE.Value;
   end
  else
   begin
    maskedit1.SetFocus;
    exit;
   end;
  dm.ADOConnection1.BeginTrans;
  try
  dm.ADO133.Close;
  dm.ADO133.Parameters[0].Value:=null;
  dm.ADO133.Open;
  dm.ADO133.Append;
  dm.ADO133GRN_NUMBER.Value:=maskedit1.Text;                //入库单号
  dm.ADO133DELIVER_NUMBER.Value:=edit2.Text;            //送货单号
  dm.ADO133ship_BY.Value:=edit1.Text;                   //送货人员

  dm.ADO133ship_DATE.Value:=
     strtodatetime(edit4.Text); //送货日期

  dm.ADO133CREATE_BY.Value:=form_main.rkey05;           //收货员工
  dm.ADO133CREATE_DATE.Value:=form_main.sys_longdate;     //收货日期
  dm.ADO133warehouse_ptr.Value:=self.warehouse_ptr;   //工厂
  dm.ADO133SUPP_PTR.Value:=self.supp_ptr;             //供应商
  dm.ADO133PO_PTR.Value:=self.po_ptr;                 //采购订单
  dm.ADO133REF_NUMBER.Value:=edit3.Text;              //备注
  dm.ADO133CURRENCY_PTR.Value:=self.curr_ptr;         //货币
  dm.ADO133EXCH_RATE.AsString:=EdtRate.Text;           //汇率
  dm.ADO133TTYPE.Value:=1;                   //类型
  dm.ADO133.Post;
 dm.update04('data0133');            //更新控制码
 self.data0134_post(dm.ADO133RKEY.Value);
 with dm.ADOQuery1 do
     begin
       close;
       sql.Text:=
        'SELECT  rkey '+
        'FROM  Data0071 '+
        'WHERE (QUAN_IN_INSP > 0) AND (QUAN_RECD > QUAN_IN_INSP) '+
        'and (PO_PTR='+dm.ADO133PO_PTR.AsString+')';
       open;
      if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('新增操作失败,入库数大于了检查通过数!',mterror,[mbcancel],0);
       maskedit1.SetFocus;
       Exit;
      end;
     end;

    if self.recevied_over(dm.ADO133PO_PTR.Value) then
       with dm.adoquery1 do
        begin
         close;
         sql.clear;
         sql.Add('update data0070');
         sql.Add('set status=6');
         sql.Add('where rkey='+dm.ADO133PO_PTR.AsString);
         execsql;
        end;
 dm.ADOConnection1.CommitTrans;
 dm.ADS133.Close;
 dm.ADS133.Open;
 self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     maskedit1.SetFocus;
    end;
  end

 end
else         //编辑
 begin
  if find_quan_error(dm.ADS133RKEY.Value) then
  begin
   showmsg('入库记录发生变发,不能再编辑!',1);
   exit;
  end;

  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO133.Close;
   dm.ADO133.Parameters[0].Value:=dm.ADS133RKEY.Value;
   dm.ADO133.Open;
   dm.ADO133.Edit;
   dm.ADO133GRN_NUMBER.Value:=maskedit1.Text;
   dm.ADO133DELIVER_NUMBER.Value:=edit2.Text;
   dm.ADO133ship_DATE.Value:=strtodatetime(edit4.text);
   dm.ADO133ship_BY.Value:=edit1.Text;
   dm.ADO133REF_NUMBER.Value:=edit3.Text;
   dm.ADO133.Post;
    with dm.ADOQuery1 do         //更新71已收货数量,最后收货日期
    begin
     close;
     sql.Clear;
     sql.Add('update data0071');
     sql.Add('set QUAN_RECD=QUAN_RECD-data0134.quantity/data0071.CONVERSION_FACTOR');
     sql.Add('from data0134 inner join data0071');
     sql.Add('on data0134.SOURCE_PTR=data0071.rkey');
     sql.Add('where data0134.GRN_PTR='+dm.ADO133rkey.AsString);
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('delete from data0134');
     sql.Add('where data0134.GRN_PTR='+dm.ADO133rkey.AsString);
     ExecSQL;
    end;
    self.data0134_post(dm.ADO133RKEY.Value);

    with dm.ADOQuery1 do
     begin
       close;
       sql.Text:=
        'SELECT  rkey '+
        'FROM  Data0071 '+
        'WHERE (QUAN_IN_INSP > 0) AND (QUAN_RECD > QUAN_IN_INSP) '+
        'and (PO_PTR='+dm.ADO133PO_PTR.AsString+')';
       open;
      if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('编辑操作失败,入库数大于了检查通过数!',mterror,[mbcancel],0);
       maskedit1.SetFocus;
       Exit;
      end;
     end;
   if self.recevied_over(dm.ADO133PO_PTR.Value) then
    with dm.adoquery1 do
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=6');
      sql.Add('where rkey='+dm.ADO133PO_PTR.AsString);
      execsql;
     end
   else
    with dm.adoquery1 do
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=5');
      sql.Add('where rkey='+dm.ADO133PO_PTR.AsString);
      execsql;
     end;
     
  dm.ADOConnection1.CommitTrans;
  dm.ADS133.Close;
  dm.ADS133.Open;
  self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     maskedit1.SetFocus;
    end;
  end; //except_end
 end;//编辑_enc
end;

procedure TForm_PoIn.dtpk1Change(Sender: TObject);
begin
strgrid1.Cells[13,strgrid1.Row]:=datetostr(dtpk1.Date);
end;


procedure TForm_PoIn.CBLocChange(Sender: TObject);
begin
 dm.aq16.MoveBy(CBLoc.ItemIndex+1-dm.aq16.RecNo);
 strgrid1.Cells[8,strgrid1.Row]:=CBLoc.Text;
 strgrid2.Cells[5,strgrid1.Row]:=dm.aq16rkey.AsString;
end;

procedure TForm_PoIn.StrGrid1TopLeftChanged(Sender: TObject);
begin
 CBLoc.Visible:=false;
end;

procedure TForm_PoIn.StrGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if self.aded_flag=4 then
 strgrid1.Options:=strgrid1.Options-[goEditing]
else
 if acol<7 then
  strgrid1.Options:=strgrid1.Options-[goEditing]
 else
  strgrid1.Options:=strgrid1.Options+[goEditing];
end;

procedure TForm_PoIn.StrGrid1KeyPress(Sender: TObject; var Key: Char);
begin

 if strgrid1.Col=7 then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',strgrid1.Cells[7,strgrid1.Row])>0  then abort;

if (key <> chr(9)) then    //没有按tab键
 begin
  if (strgrid1.Col=8) and (CBLoc.Enabled) then
   begin
    CBLoc.SetFocus;
    SendMessage(CBLoc.Handle,WM_Char,word(Key),0);
   end;
 end;

end;


procedure TForm_PoIn.StrGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 8 ) then
   begin
    CBLoc.Left := Rect.Left;
    CBLoc.Top := Rect.Top;
    CBLoc.Width := Rect.Right - Rect.Left+3;
    CBLoc.Height := Rect.Bottom - Rect.Top;
    CBLoc.Visible := True;
    if strgrid1.Cells[acol,arow]<>'' then
     CBLoc.ItemIndex:=CBLoc.Items.IndexOf(strgrid1.Cells[acol,arow])
    else
     CBLoc.ItemIndex:=-1;
   end
  else
    CBLoc.Visible :=false;

  if (ACol = 13 ) then
   begin
    dtpk1.Left := Rect.Left;
    dtpk1.Top := Rect.Top;
    dtpk1.Width := Rect.Right - Rect.Left+3;
    dtpk1.Height := Rect.Bottom - Rect.Top;
    dtpk1.Visible := True;
    if trim(strgrid1.Cells[acol,arow])<>'' then
    dtpk1.Date:=strtodate(strgrid1.Cells[acol,arow]);
   end
  else
    dtpk1.Visible :=false;

 end;
end;

procedure TForm_PoIn.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if self.aded_flag in [1,2] then
  CanClose:=(modalresult=mrok) or (Application.MessageBox('确认不保存退出吗?', PChar('提示'),MB_YESNO)=6);
end;

function tform_poin.find_soerror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0133');
   sql.Add('where GRN_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function TForm_PoIn.find_quan_error(rkey133: integer): boolean;
begin
result:=false;
with dm.adoquery1 do
begin
  close;
  sql.Text:='select rkey from data0134'+#13+
            'where quantity<>quan_on_hand'+#13+
            'and grn_ptr='+inttostr(rkey133);
  open;
  if not IsEmpty then result:=true;
end;
end;

procedure TForm_PoIn.data0134_post(rkey133:integer);
VAR
i:integer;
BEGIN
  dm.ADO134.Close;
  dm.ADO134.Parameters[0].Value:=rkey133;
  dm.ADO134.Open;
  for i:=1 to strgrid1.RowCount-1 do
   if strtofloat(strgrid1.Cells[7,i])>0 then
    begin
     dm.ADO134.Append;
     dm.ADO134GRN_PTR.Value:=rkey133;     //133.rkey
     dm.ADO134SOURCE_PTR.Value:=strtoint(strgrid2.Cells[0,i]);  //71.rkey
     dm.ADO134INVENTORY_PTR.Value:=strtoint(strgrid2.Cells[1,i]);   //17.rkey
     dm.ADO134LOCATION_PTR.Value:=strtoint(strgrid2.Cells[5,i]);    //16.rkey
     dm.ADO134UNIT_PTR.Value:=strtoint(strgrid2.Cells[2,i]);//存货单位
     dm.ADO134tax_PRICE.AsString:=strgrid2.Cells[3,i];           //含税价格
     dm.ADO134TAX_2.AsString:=strgrid2.Cells[4,i];               //税率
     dm.ADO134PRICE.Value:=dm.ADO134tax_price.Value/(1+dm.ADO134TAX_2.Value*0.01);//不含税价

     dm.ADO134QUANTITY.AsString:=strgrid1.Cells[7,i];       //接收数量
     dm.ADO134QUAN_ON_HAND.Value:=dm.ADO134QUANTITY.Value;   //当前库存数量
     dm.ADO134SUPPLIER2.Value:=strgrid1.Cells[9,i];         //原制造商
     dm.ADO134rohs.Value:=strgrid1.Cells[14,i];            //环保标识
     dm.ADO134BARCODE_ID.Value:=strgrid1.Cells[11,i];      //备注
     dm.ADO134EXPIRE_DATE.Value:=strtodate(strgrid1.Cells[13,i]);//有效期
     dm.ADO134.Post;
    end;
    with dm.ADOQuery1 do         //更新71已收货数量,最后收货日期
    begin
     close;
     sql.Clear;
     sql.Add('update data0071');
     sql.Add('set QUAN_RECD=QUAN_RECD+data0134.quantity/data0071.CONVERSION_FACTOR,');
     sql.Add('recd_DATE='''+edit4.Text+'''');
     sql.Add('from data0134 inner join data0071');
     sql.Add('on data0134.SOURCE_PTR=data0071.rkey');
     sql.Add('where data0134.GRN_PTR='+inttostr(rkey133));
     ExecSQL;
    end;
END;

function TForm_PoIn.recevied_over(rkey70: Integer): Boolean;
begin
 with dm.ADOQuery1 do
 begin
   close;
   sql.Text:=
    'SELECT rkey '+
    'FROM  dbo.Data0071 '+
    'WHERE (QUAN_RECD < QUAN_ORD) '+
    'and (PO_PTR='+inttostr(rkey70)+')';
   open;
   if IsEmpty then   //没有待入库记录，所有订单数量已入库
    Result:=True
   else
    result:=False;
 end;
end;
function TForm_PoIn.Iqc_avlflag(var row:integer): boolean;
var
 i:integer;
begin
result := false;
for i:=1 to strgrid1.RowCount-1 do
 if (strtofloat(strgrid1.Cells[7,i])>0) and  //接收数量大于零
    (strgrid1.Cells[12,i]<>'N') then         //材料没有通过IQC检查
  begin                                      //等于N代表已检查，或者不需要检查
   row:=i;
   result := true;
   break;
  end;
end;
procedure TForm_PoIn.get_location();
begin
  dm.aq16.Close;
  if checkbox3.Checked then
  dm.aq16.SQL.Text:='select rkey,LOCATION from data0016 '+
    'where LOCATION_TYPE = 0 and '+
    'whouse_ptr='+inttostr(self.warehouse_ptr)+
    ' order by rkey'
  else
  dm.aq16.SQL.Text:='select rkey,LOCATION from data0016 '+
    'where LOCATION_TYPE=0 order by rkey';
  dm.aq16.Open;
  cbloc.Items.Clear;
  while not dm.aq16.Eof do
   begin
    cbloc.Items.Add(dm.aq16LOCATION.Value);
    dm.aq16.Next;
   end;
  dm.aq16.First;
end;

procedure TForm_PoIn.FormActivate(Sender: TObject);
var
 i:word;
begin
if aded_flag=1 then //新增
 begin
  edit4.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',form_main.sys_longdate);
  dm.ado04.Close;
  dm.ado04.Parameters[0].Value:='data0133';
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
   maskedit1.Text:=dm.ado04SEED_VALUE.Value;
  if dm.ado04SEED_FLAG.Value=4 then
   maskedit1.ReadOnly:=true;
  dm.ado04.Close;
  self.get_location;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select NOTE_PAD_LINE_1 from data0011');
    sql.Add('where SOURCE_TYPE=70 and');
    sql.Add('FILE_POINTER='+inttostr(self.po_ptr));
    open;
    if not isempty then edit3.Text:=fieldvalues['NOTE_PAD_LINE_1'];
    close;
   end;
 end
else     //编辑检查
 begin
   dm.ado04.Close;
   dm.ado04.Parameters[0].Value:='data0133';
   dm.ado04.Open;
   if dm.ado04SEED_FLAG.Value=4 then
   maskedit1.ReadOnly:=true;

  maskedit1.Text:=dm.ADS133GRN_NUMBER.Value;
  edit2.Text:=dm.ADS133DELIVER_NUMBER.Value;
  EdtPO.Text:=dm.ADS133po_number.Value;
  edit1.Text:=dm.ADS133ship_BY.Value;
  edit4.Text:=
  formatdatetime('yyyy-mm-dd HH:mm:ss',dm.ADS133ship_DATE.Value);

  EdtVend.Text:=dm.ADS133code.Value;
  label8.Caption:=dm.ADS133supplier_name.Value;
  EdtFac.Text:=dm.ADS133warehouse_code.Value;
  label6.Caption:=dm.ADS133warehouse_name.Value;
  EdtCurr.Text:=dm.ADS133curr_code.Value;
  label4.Caption:=dm.ADS133curr_name.Value;
  EdtRate.Text:=dm.ADS133exch_rate.AsString;
  curr_ptr:=dm.ADS133currency_ptr.Value;
  warehouse_ptr := dm.ADS133warehouse_ptr.Value; //工厂15.rkey
  po_ptr := dm.ADS133PO_PTR.Value;                  //采购70.rkey
  supp_ptr := dm.ADS133SUPP_PTR.value;    //供应商23.rkey
  edit3.Text:=dm.ADS133REF_NUMBER.Value;

  self.get_location;   //得到入仓位置
  dm.Aq134.Open;
  strgrid1.RowCount:=dm.Aq134.RecordCount+1;
  strgrid2.RowCount:=dm.Aq134.RecordCount+1;
  for i:=1 to dm.Aq134.RecordCount do
   begin
    strgrid1.Cells[0,i] := dm.Aq134INV_PART_NUMBER.Value;
    strgrid1.Cells[1,i] := dm.Aq134INV_NAME.Value;
    strgrid1.Cells[2,i] := dm.Aq134INV_DESCRIPTION.Value;
    strgrid1.Cells[3,i] := dm.Aq134QUAN_ORD.AsString;
    strgrid1.Cells[4,i] := dm.Aq134CONVERSION_FACTOR.AsString;

    strgrid1.Cells[6,i] := dm.Aq134pr_unitname.Value;
    strgrid1.Cells[5,i] := floattostr(
                           dm.Aq134QUAN_RECD.Value-
                           dm.Aq134QUANTITY.Value/dm.Aq134CONVERSION_FACTOR.Value);

    strgrid2.Cells[2,i] := dm.Aq134WO_PTR.AsString; //存货单位
    strgrid2.Cells[3,i] :=formatfloat('0.000',
                           dm.Aq134tax_PRICE.value/dm.Aq134CONVERSION_FACTOR.Value
                                          );

    strgrid1.Cells[7,i] := dm.Aq134QUANTITY.AsString;  //当前接收
    if strgrid1.Cells[7,i]='' then
     strgrid1.Cells[7,i] :='0';

    strgrid1.Cells[8,i] := dm.Aq134LOCATION.Value;    //位置名称
    strgrid1.Cells[9,i] := dm.Aq134SUPPLIER2.Value;   //原制造商
    strgrid1.Cells[10,i] :='';       //详细位置
    strgrid1.Cells[14,i] := dm.Aq134rohs.Value;       //环保标识
    strgrid1.Cells[11,i] := dm.Aq134BARCODE_ID.Value; //备注
    strgrid1.Cells[12,i] := dm.Aq134avl_flag.Value;   //是否需要检查
    strgrid1.Cells[13,i] := dm.Aq134EXPIRE_DATE.AsString;//有效期

    strgrid2.Cells[0,i] := dm.Aq134RKEY.AsString;     //71
    strgrid2.Cells[1,i] := dm.Aq134INVT_PTR.AsString; //17

    strgrid2.Cells[3,i] := dm.Aq134tax_PRICE.AsString;   //价格
    strgrid2.Cells[4,i] := dm.Aq134TAX_2.AsString;       //税率%
    strgrid2.Cells[5,i] := dm.Aq134LOCATION_PTR.AsString;//位置指针
    strgrid2.Cells[6,i] := dm.Aq134SHELF_LIFE.AsString;  //有效期
    strgrid2.Cells[7,i] := dm.Aq134STOCK_BASE.AsString;  //单位重量KG

    dm.Aq134.Next;
   end;
   dm.Aq134.Close;
   strgrid1.SetFocus;
   strgrid1.Col:=7;
   if maskedit1.Enabled then maskedit1.SetFocus;
 end;
end;

function TForm_PoIn.location_over: boolean;
var
 i:word;
begin
 location_over:=false;
if self.aded_flag=1 then
begin
 for i:=1 to strgrid1.RowCount-1 do
  if (strgrid1.Cells[8,i]='') and (strtofloat(strgrid1.Cells[7,i])>0) then
  begin                    //必需输入入仓位置
   location_over:=true;
   break;
  end;

 for i:=1 to strgrid1.RowCount-1 do
  if (strtofloat(strgrid1.Cells[7,i])>0) then
   begin                   //必需有一个入仓数量
    break;
   end
  else
   if (i=strgrid1.RowCount-1) then
    location_over:=true;
end;
end;


procedure TForm_PoIn.StrGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if strgrid1.Col=7 then
 begin
  if strgrid1.Cells[7,strgrid1.Row]='' then strgrid1.Cells[7,strgrid1.Row]:='0';
  if form_mainin.stock_flag='N' then   //接收数量不能大于订购数量
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

procedure TForm_PoIn.BtnSaveEnter(Sender: TObject);
var
 row:integer;
begin
if trim(maskedit1.Text)='' then
 begin
  showmessage('入库单号不允许为空!');
  maskedit1.SetFocus;
  exit;
 end;
if trim(edit2.Text)='' then
begin
showmessage('送货单号不能为空!');
edit2.SetFocus;
exit;
end;
if not dm.Ado04.Active then
begin
dm.ado04.Parameters[0].Value:='data0133';
dm.ado04.Open;
end;
if (dm.ado04SEED_FLAG.Value<>1) and
  (not (maskedit1.Text[length(trim(maskedit1.Text))] in ['0'..'9'])) then
 begin
  messagedlg('入库编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  maskedit1.SetFocus;
  exit;
 end;

if self.location_over then
 begin
  showmsg('至少需要一项入仓记录并输入入仓位置!',1);
  strgrid1.SetFocus;
  strgrid1.Col:=7;
  exit;
 end;

if (strgrid1.Visible) and (self.Iqc_avlflag(row)) then
 begin
  showmsg('材料没有通过IQC检查不能入库!',1);
  strgrid1.SetFocus;
  strgrid1.Row:=row;
  exit;
 end;
{if strtodatetime(edit4.Text) < dm.find_maxdate then
 begin
  messagedlg('送货日期必须大于财务库存截数最大日期!',mterror,[mbok],0);
  edit11.SetFocus;
  exit;
 end;}
end;

procedure TForm_PoIn.StrGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=112) and (CBLoc.Visible) then
  begin
   if CBLoc.Enabled then
   begin
   CBLoc.SetFocus;
   CBLoc.DroppedDown:=true;
   end;
  end;
end;

procedure TForm_PoIn.CBLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then CBLoc.DroppedDown:=true;    //f2
if key=13 then strgrid1.SetFocus;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm_PoIn.Edit4Exit(Sender: TObject);
begin
 try
  strtodatetime(edit4.Text);
 except
  messagedlg('送货日期格式错误!',mterror,[mbok],0);
  edit4.SetFocus;
 end;
end;

procedure TForm_PoIn.dtpk1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then strgrid1.SetFocus;
end;

procedure TForm_PoIn.CheckBox3Click(Sender: TObject);
begin
self.get_location;
end;

procedure TForm_PoIn.FormShow(Sender: TObject);
begin
 strgrid1.Cells[0,0] := '材料编码';
 strgrid1.Cells[1,0] := '材料名称';
 strgrid1.Cells[2,0] := '材料规格';
 strgrid1.Cells[3,0] := '订购数量';
 strgrid1.Cells[4,0] := '转换率';
 strgrid1.Cells[5,0] := '已接收';
 strgrid1.Cells[6,0] := '存货单位';
 strgrid1.Cells[7,0] := '当前接收';
 strgrid1.Cells[8,0] := '仓库位置';
 strgrid1.Cells[9,0] := '制造商生产批号';
 strgrid1.Cells[10,0] := '详细位置';
 strgrid1.Cells[11,0] := '备注';
 strgrid1.Cells[12,0] := 'IF检查';
 strgrid1.ColWidths[12] := -1;
 strgrid1.Cells[13,0] := '有效期';
 strgrid1.Cells[14,0] := '环保标识';

 strgrid2.Cells[0,0] := '71rkey/72rkey';
 strgrid2.Cells[1,0] := '17rkey';
 strgrid2.Cells[2,0] := '存货单位02';
 strgrid2.Cells[3,0] := '含税价';
 strgrid2.Cells[4,0] := '税率';
 strgrid2.Cells[5,0] := '16rkey';
 strgrid2.Cells[6,0] := '材料有效期';
 strgrid2.Cells[7,0] := '材料单重KG';
end;

end.
