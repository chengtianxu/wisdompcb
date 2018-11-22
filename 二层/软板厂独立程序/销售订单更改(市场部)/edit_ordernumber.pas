unit edit_ordernumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, ADODB, Grids, DBGridEh,
  Menus;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Edit1: TEdit;
    Label9: TLabel;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    StringGrid3: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid3Exit(Sender: TObject);
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
   set_qty:integer;
   OrigSum: Currency;  //记录修改前的总金额
   function quote_vflag(rkey25, ttype: integer): boolean;
   function checkQty(qty: integer): Boolean;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses damo, quote_price, main;

{$R *.dfm}
function TForm4.quote_vflag(rkey25, ttype: integer): boolean;
begin               //返回产品是否报价单关联
with dm.adoquery1 do
begin
 close;
 sql.Text:='SELECT Data0008.batch_flag, Data0008.former_flag'+#13+
      'FROM Data0008 INNER JOIN'+#13+
      'Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR'+#13+
      'where Data0025.rkey='+inttostr(rkey25);
 open;
 if not isempty then
  if ttype=0 then
   result:=fieldvalues['batch_flag']
  else
   result:=fieldvalues['former_flag']
 else
  result:=false;
end;
end;

procedure TForm4.FormActivate(Sender: TObject);
var tmpAdo:TADOQuery;
    i:Integer;
begin
Label5.Caption := dm.ADO60set_qty.AsString ;
set_qty:=dm.ADO60set_qty.Value;
if dm.ADO60qte_ptr.Value>0 then
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey,TNUMBER from data0085');
  sql.Add('where rkey='+dm.ADO60qte_ptr.AsString);
  open;
  if not isempty then
   begin
    edit2.Text:=fieldvalues['TNUMBER'];
   end;
 end;

 if (quote_vflag(Dm.ADO60CUST_PART_PTR.Value,dm.ADO60ttype.Value)) and
    (dm.ADO60so_style.Value=0) and   //正式订单
    (dm.ADO60so_tp.Value=0) then     //自制
  begin                              //订单已经强制关联
   dbedit2.ReadOnly:=true;
   dbedit5.ReadOnly:=true;
   dbedit2.Color:=cl3dlight;
   dbedit5.Color:=cl3dlight;
  end;
 with DM.aq360 do
 begin
   Close;
   Parameters.ParamByName('rkey60').Value:= dm.ADO60RKEY.Value;
   Open;
 end;
 OrigSum:= (StrtoCurr(DBEdit1.Text)*StrtoCurr(DBEdit2.Text))*(1+StrtoCurr(DBEdit9.Text)/100)*StrtoCurr(DBEdit8.Text);

//2013-11-1tang添价格明细-----------------------------
  StringGrid3.RowCount:=2;
  StringGrid3.Rows[1].Clear;
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=dm.ADOConnection1;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from dbo.data0579';
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        i:=1;
        while not tmpAdo.Eof do
        begin
          StringGrid3.RowCount:=StringGrid3.RowCount+1;
          StringGrid3.Cells[0,i]:=tmpAdo.fieldBYName('PriceName').AsString;
          StringGrid3.Cells[1,i]:='0.0000000';
          StringGrid3.Cells[2,i]:=tmpAdo.fieldBYName('Rkey').AsString;
          i:=i+1;
          tmpAdo.Next;
        end;
      end;
    except

    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
  StringGrid3.RowCount:=StringGrid3.RowCount-1;
  with dm.adoS578 do
  begin
    Close;
    Parameters.ParamByName('rkey').Value:=dm.ADO60RKEY.Value;
    Open;
  end;
  dm.adoS578.First;
  while not dm.adoS578.Eof do
  begin
    for i :=1 to StringGrid3.RowCount-1 do
    begin
     if (StrToInt(StringGrid3.Cells[2,i])=dm.adoS578.FieldByName('d579_Ptr').AsInteger) then
     begin
       StringGrid3.Cells[1,i]:=FormatFloat('0.0000000',dm.adoS578.FieldValues['Price']);
       break;
     end;
    end;
    dm.adoS578.Next;
  end;
//end 2013-11-1tang-----------------------------------
end;

procedure TForm4.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if key='.' then abort;
end;

procedure TForm4.DBEdit4Exit(Sender: TObject);
begin
dm.ADO60PARTS_ORDERED.Value:=dm.ADO60set_ordered.Value*set_qty;
end;

procedure TForm4.DBEdit1Exit(Sender: TObject);
begin
 if (dm.ADO60PARTS_ORDERED.AsInteger mod set_qty)<>0 then
  begin
   if messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mryes then
    dm.ADO60set_ordered.Value:=round(dm.ADO60PARTS_ORDERED.Value/set_qty)
   else
    dbedit1.SetFocus;
  end
 else
  dm.ADO60set_ordered.Value:=
   strtoint(floattostr(dm.ADO60PARTS_ORDERED.AsInteger / set_qty));
end;

procedure TForm4.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit5.SetFocus;
end;

procedure TForm4.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit5.SetFocus;
end;

procedure TForm4.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit3.SetFocus;
end;

procedure TForm4.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit6.SetFocus;
end;

procedure TForm4.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit3.SetFocus;
end;

procedure TForm4.DBEdit5Exit(Sender: TObject);
begin
if trim(dbedit5.Text)='' then dbedit5.Field.Value := 0;
 dbedit2.Field.Value := strtofloat(formatfloat('0.00000',dbedit5.Field.Value / set_qty));
end;

procedure TForm4.DBEdit2Exit(Sender: TObject);
begin
if trim(dbedit2.Text)='' then dbedit2.Field.Value := 0;
 dbedit5.field.Value:= strtofloat(formatfloat('0.00000',dbedit2.Field.Value * set_qty));
end;

procedure TForm4.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit4.SetFocus;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
edit2.Text:='';
dm.ADO60qte_ptr.AsVariant:=null;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
form12:=tform12.Create(application);
form12.Aq85.Close;
form12.Aq85.Parameters[0].Value:=dm.ADO60MANU_PART_DESC.Value;
form12.Aq85.Open;
if form12.ShowModal=mrok then
 begin
  if dm.ado60CURRENCY_PTR.Value <> form12.aq85CURR_PTR.Value then
  begin
   messagedlg('报价单中定义的货币与销售订单中定义的货币不一致!',mterror,[mbcancel],0);
   exit;
  end;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0253.RKEY');
   sql.Add('FROM Data0028 INNER JOIN');
   sql.Add('Data0253 ON Data0028.RKEY = Data0253.d0028_ptr ');
   sql.Add('where Data0028.qte_price - Data0253.d0028_price > 0.01');
   sql.Add('and data0253.quote_ptr='+form12.Aq85RKEY.AsString);
   open;
  end;
  if not dm.ADOQuery1.IsEmpty then
   showmessage('报价单价格有变动，请重新选择或是重新报价后输入！')
  else
   begin
   if ((form12.aq85Quote_type.Value=1) and (dm.ADO60COMMISION_ON_TOOLING.Value='N')) or
      ((form12.aq85Quote_type.Value=0) and (dm.ADO60COMMISION_ON_TOOLING.Value='Y')) then
    showmessage('报价单与客户信息中定义的是否转厂数据不一致不能继续')
   else
    begin
     //20170209tang添报价价格包括手工输入data008501里的单价之和
      if dm.ADO60tax_in_price.Value = 'N' then  //不含税
      begin

        if (Trim(Form12.aq85V_tax.AsString)='') then
          dm.ADO60part_price.AsString:=formatfloat('0.0000000',form12.aq85quote_price.Value)
        else
          dm.ADO60part_price.AsString:=formatfloat('0.0000000',Form12.aq85V_tax.Value);
      end else
      begin
        if (Trim(Form12.aq85V_tax.AsString)='') then
          dm.ADO60part_price.AsString:=formatfloat('0.0000000',form12.aq85quote_taxprice.Value)
        else
          dm.ADO60part_price.AsString:=formatfloat('0.0000000',Form12.aq85V_tax.Value);
      end;
     //end 20170209tang-----------

//     if dm.ADO60tax_in_price.Value = 'N' then  //不含税
//      if form12.aq85QTE_UNIT_PTR.Value=1 then   //以PCS报价
//       dm.ADO60part_price.Value := form12.aq85quote_price.Value
//      else                                       //以SET报价
//       dm.ADO60part_price.AsString :=
//                formatfloat('0.0000000',form12.aq85quote_price.Value/
//                                             form12.aq85TUNITS.Value)
//     else                                     //价格含税
//      if form12.aq85QTE_UNIT_PTR.Value=1 then
//       dm.ADO60part_price.Value := form12.aq85quote_taxprice.Value
//      else
//       dm.ADO60part_price.AsString :=
//              formatfloat('0.0000000',form12.aq85quote_taxprice.Value/
//                                             form12.Aq85TUNITS.Value);

    dbedit2exit(sender);
    edit2.Text:=form12.Aq85TNUMBER.Value;
    dm.ADO60qte_ptr.Value:=form12.Aq85RKEY.Value;

    end;
   end;
 end;
form12.Free;
end;

procedure TForm4.Button1Click(Sender: TObject);
//var
//  pcs_qty: Integer;
var dSum:Double;
    i:Integer;
begin
//==========================================================================================
  with DM.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('select * from dbo.Data0010 where rkey = %s ',[dm.ADO60.FieldByName('rkey10').asstring]));
    Open;
  end;
  if DM.ADOQuery2.fieldbyname('credit_rating').AsInteger = 3 then
  begin
    messagedlg('信用等级太差,订单无法继续!',mtwarning,[mbok],0);
    exit;
  end
  else if DM.ADOQuery2.fieldbyname('credit_rating').AsInteger = 1 then //信用等级为优，超过限额出现提示后仍然可以
  begin                               //开出订单
    if form1.cacl_deficiency(DM.ADOQuery2.fieldbyname('rkey').AsInteger,
                       StrToCurr(DBEdit1.Text)*StrToCurr(DBEdit2.Text)*(1+StrToCurr(DBEdit9.Text)/100)/StrtoCurr(DBEdit8.Text)-OrigSum)
                > DM.ADOQuery2.fieldbyname('credit_limit').AsCurrency+1 then
    if messagedlg('未付款金额超出信用限额是否继续?',
     mtconfirmation,[mbyes,mbno],0)=mrno then exit;
  end
  else //信用等级为良，只能在限额以内开出销售订单
  begin
    if form1.cacl_deficiency(DM.ADOQuery2.fieldbyname('rkey').AsInteger,
                       StrToCurr(DBEdit1.Text)*StrToCurr(DBEdit2.Text)*(1+StrToCurr(DBEdit9.Text)/100)/StrtoCurr(DBEdit8.Text)-OrigSum)
                > DM.ADOQuery2.fieldbyname('credit_limit').AsCurrency+1 then
    begin
      messagedlg('未付款金额超出信用限额无法继续!',mtwarning,[mbok],0);
      exit;
    end;
  end;

//==========================================================================================
//tang2013-11-1 修改添加订单价格明细-----
  dSum:=0;
  for i :=1  to StringGrid3.RowCount-1 do
  begin
    dSum:=dSum+StrToFloat(formatfloat('0.0000000',StrToFloat(StringGrid3.Cells[1,i])));
  end;
  if (dSum<>0) then
  begin
    if (formatfloat('0.0000000',DM.ADO60PART_PRICE.Value)<>formatfloat('0.0000000',dSum)) then
    begin
      messagedlg('订单明细价格之和不等于订单总价格,无法继续!',mtwarning,[mbok],0);
      ModalResult:=mrcancel;
      exit;
    end;
  end else
  begin
    if messagedlg('不设置订单价格明细，将无法计算业务员提成,是否继续?',
     mtconfirmation,[mbyes,mbno],0)=mrno then
    begin
      ModalResult:=mrcancel;
      exit;
    end;
  end;
//end tang2013-11-1 ----------------------

 if (dbedit2.ReadOnly) and (trim(edit2.Text)='') then
 begin
  showmessage('订单已经与报价单强制关联,请选择一个报价单号');
  edit2.SetFocus;
 end
 else if checkQty(StrToInt(DBEdit1.Text)) then
 begin
  showmessage('订单数量与完工数量不一致');
  DBGridEh1.SetFocus;
 end
 else
  self.ModalResult:=mrok;
end;

procedure TForm4.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Sender as TDBGridEh).DataSource.DataSet.Active then Abort;
  if key = 45 then Abort;  //Insert
  if Key = 46 then Abort;
  if ((key = 40) and ((Sender as TDBGridEh).DataSource.DataSet.RecNo =
                      (Sender as TDBGridEh).DataSource.DataSet.RecordCount)) then
    Abort;  //↓
  if ((key = 46) and (ssCtrl in shift)) then Abort;  //Ctrl+Delete
end;

function TForm4.checkQty(qty: integer): Boolean;
var
  n:Integer;
begin
  n:= 0;
  if ((dm.aq360.Active) and (dm.aq360.RecordCount > 0)) then
  with dm.aq360 do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        n:= n + FieldByName('quantity').AsInteger;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  if qty <> n then Result:= True
  else Result:= False;
end;

procedure TForm4.DBGridEh1Exit(Sender: TObject);
begin
  if dm.aq360.State in[dsInsert, dsEdit] then dm.aq360.Post;
end;

procedure TForm4.N1Click(Sender: TObject);
begin
  dm.aq360.Delete;
end;

procedure TForm4.StringGrid3Exit(Sender: TObject);
var i:Integer;
begin
  for i :=1  to StringGrid3.RowCount-1 do
  begin
    if (Trim(StringGrid3.Cells[1,i])='') then
    StringGrid3.Cells[1,i]:='0.0000000';
  end;
end;

procedure TForm4.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if (pos('.',stringgrid3.Cells[stringgrid3.col,stringgrid3.row])>0)  then    //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
//tang2013-11-1添加订单价格明细
  StringGrid3.Cells[0,0]:='订单价格类型定义';
  StringGrid3.Cells[1,0]:='价格';
  StringGrid3.ColWidths[2]:=-1;
//end tang2013-11-1----
end;

procedure TForm4.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  {文字居中}
  with Sender as TStringGrid do
  begin
    Canvas.FillRect(Rect);
    Canvas.Font.Size:=10;
    DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), Length(Cells[ACol, ARow]), Rect, DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;
  {文字居中结束}
end;

end.
