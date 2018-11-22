unit direct_ware;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Menus,DateUtils;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit11: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit3: TEdit;
    Edit10: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StrGrid1: TStringGrid;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    stgrid2: TStringGrid;
    Label2: TLabel;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    N3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure StrGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure print_ininvt(rkey456: integer);
    function find_soerror(number:string):boolean;
    procedure Edit11Exit(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    supp_ptr,curr_ptr:integer;
    function find_quan_error(rkey456: integer): boolean;
  public
    { Public declarations }
   aded_flag:byte;//aded_fag:1新增2编辑3检查
   warehouse_ptr:integer;
  end;

var
  Form4: TForm4;
  function Power(x, y : extended) : extended;
implementation

uses data_module, supplier_search, warehouse_search, diretc_intlist,
  curr_search, main, invtin_report,common;

{$R *.dfm}

function TForm4.find_quan_error(rkey456: integer): boolean;
begin
result:=false;

with dm.adoquery1 do
 begin
  close;
  sql.Text:='select rkey from data0022'+#13+
            'where quantity<>quan_on_hand'+#13+
            'and grn_ptr='+inttostr(rkey456);
  open;
  if not IsEmpty then result:=true;
 end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
 strgrid1.Cells[0,0] := '材料编码';
 strgrid1.Cells[1,0] := '材料名称';
 strgrid1.Cells[2,0] := '材料规格';
 strgrid1.Cells[3,0] := '位置';
 strgrid1.Cells[4,0] := '单位';
 strgrid1.Cells[5,0] := '数量';
 strgrid1.Cells[6,0] := '价格';
 strgrid1.Cells[7,0] := '税率';
 strgrid1.Cells[8,0] := '备注';
 strgrid1.Cells[9,0] := '环保标识';
 strgrid1.Cells[10,0] := '制造日期';
end;

procedure TForm4.FormActivate(Sender: TObject);
var
 i:word;
begin
  if self.aded_flag=1 then  //新增
  begin
    edit11.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',common.getsystem_date(dm.ADOQuery1,0));
    dm.ado04.Open;
    if dm.ado04SEED_FLAG.Value<>1 then
      edit6.Text:=dm.ado04SEED_VALUE.Value;
    if dm.ado04SEED_FLAG.Value=4 then
      edit6.ReadOnly:=true;
    dm.ado04.Close;
  end
  else
  begin
    dm.ado04.Close;
    dm.ado04.Open;
    if dm.ado04SEED_FLAG.Value=4 then
      edit6.ReadOnly:=true;
    edit6.Text:=dm.Aqwz456GRN_NUMBER.Value;
    edit1.Text:=dm.Aqwz456DELIVER_NUMBER.Value;
    edit5.Text:=dm.Aqwz456ship_BY.Value;
    edit11.Text:=
    formatdatetime('yyyy-mm-dd HH:mm:ss',dm.Aqwz456ship_DATE.Value);

    edit8.Text:=dm.Aqwz456WAREHOUSE_CODE.Value;
    label10.Caption:=dm.Aqwz456WAREHOUSE_NAME.Value;
    edit9.Text:=dm.Aqwz456CODE.Value;
    label11.Caption:=dm.Aqwz456SUPPLIER_NAME.Value;
    edit2.Text:=dm.Aqwz456REF_NUMBER.Value;
    self.warehouse_ptr:=dm.Aqwz456warehouse_ptr.Value;
    self.supp_ptr:=dm.Aqwz456SUPP_PTR.Value;
    self.curr_ptr:=dm.Aqwz456CURRENCY_PTR.Value;
    edit3.Text:=dm.Aqwz456CURR_CODE.Value;
    label13.Caption:=dm.Aqwz456CURR_NAME.Value;
    edit10.Text:=dm.Aqwz456EXCH_RATE.AsString;

    dm.Aqwz22.First;
    dm.Aqwz22.DisableControls;
    strgrid1.RowCount:=dm.Aqwz22.RecordCount+2;
    stgrid2.RowCount:= dm.Aqwz22.RecordCount+2;
    for i:=1 to dm.Aqwz22.RecordCount do
    begin
      strgrid1.Cells[0,i] := dm.Aqwz22INV_PART_NUMBER.Value;
      strgrid1.Cells[1,i] := dm.Aqwz22INV_NAME.Value; //'材料名称';
      strgrid1.Cells[2,i] := dm.Aqwz22INV_DESCRIPTION.Value; //'材料规格';
      strgrid1.Cells[3,i] := dm.Aqwz22LOCATION.Value;// '位置';
      strgrid1.Cells[4,i] := dm.Aqwz22UNIT_NAME.Value;// '单位';
      strgrid1.Cells[5,i] := dm.Aqwz22QUANTITY.AsString;// '数量';
      strgrid1.Cells[6,i] := dm.Aqwz22PRICE.AsString;// '价格';
      strgrid1.Cells[7,i] := dm.Aqwz22TAX_2.AsString;// '税率';
      strgrid1.Cells[8,i] := dm.Aqwz22BARCODE_ID.Value;// '备注';
      strgrid1.Cells[9,i] := dm.Aqwz22rohs.Value;// '环保标识';
      strgrid1.Cells[10,i] := FormatDateTime('yyyy-mm-dd',dm.Aqwz22Tdate.Value);    //制造日期
      stgrid2.Cells[0,i] := dm.Aqwz22INVENTORY_PTR.AsString;      //17.rkey
      stgrid2.Cells[1,i] := dm.Aqwz22LOCATION_PTR_FROM.AsString; //单位
      stgrid2.Cells[2,i] := dm.Aqwz22LOCATION_PTR.AsString;    //16.rkey
      stgrid2.Cells[3,i] := dm.Aqwz22SHELF_LIFE.AsString;
      stgrid2.Cells[4,i] := dm.Aqwz22STOCK_BASE.AsString;
      dm.Aqwz22.Next;
    end;
    dm.Aqwz22.First;
    dm.Aqwz22.EnableControls;
  end;
end;

procedure TForm4.N1Click(Sender: TObject);
begin
if self.warehouse_ptr>0 then
begin
 form5 := tform5.Create(application);
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
 while not dm.aq16.Eof do
  begin
   form5.combobox1.Items.Add(dm.aq16LOCATION.Value);
   dm.aq16.Next;
  end;
 dm.aq16.First;
 form5.dtpk1.Date:=getsystem_date(dm.ADOQuery1,1);
 form5.Label5.Caption:=label13.Caption+'含税价格:';
if form5.ShowModal=mrok then
 begin

 end;
form5.Free;
end
else
 showmessage('请首先确定工厂!');
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
form_wh:=tform_wh.Create(application);
if form_wh.ShowModal=mrok then
 begin
  edit8.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
  label10.Caption:=form_wh.ADOQuery1WAREHOUSE_NAME.Value;
  self.warehouse_ptr:=form_wh.ADOQuery1RKEY.Value;
 end;
form_wh.Free;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
form_supp:=tform_supp.Create(application);
if form_supp.ShowModal=mrok then
 begin
  edit9.Text:=form_supp.ADOQuery1CODE.Value;
  label11.Caption:=form_supp.ADOQuery1SUPPLIER_NAME.Value;
  self.supp_ptr:=form_supp.ADOQuery1RKEY.Value;
  self.curr_ptr:=form_supp.ADOQuery1CURRENCY_PTR.Value;
  edit3.Text:=form_supp.ADOQuery1curr_code.Value;
  label13.Caption:=form_supp.ADOQuery1curr_name.Value;
  edit10.Text:=form_supp.ADOQuery1BASE_TO_OTHER.AsString;
 end;
form_supp.Free;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
  edit3.Text:=form_curr.ADOQuery1CURR_CODE.Value;
  label13.Caption:=form_curr.ADOQuery1CURR_NAME.Value;
  self.curr_ptr:=form_curr.ADOQuery1RKEY.Value;
  edit10.Text:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
 end;
form_curr.Free;
end;

procedure TForm4.BitBtn1Enter(Sender: TObject);
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

if trim(strgrid1.Cells[0,1])='' then
 begin
  showmessage('至少需要一条入仓记录!');
  strgrid1.SetFocus;
  exit;
 end;

if strtodatetime(edit11.Text) < dm.find_maxdate then
 begin
  messagedlg('送货日期必须大于财务库存截数最大日期!',mterror,[mbok],0);
  edit11.SetFocus;
  exit;
 end;
 
end;

procedure TForm4.StrGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  strgrid1.MouseToCell(x,y,column,row);
  if row<>0 then strgrid1.Row:=row;
 end;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
  if self.aded_flag=1 then //新增
  begin
    if self.find_soerror(trim(edit6.Text)) then
    begin
      if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,[mbYes,mbNo],0)=mrYes  then
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
      dm.ADO456CREATE_BY.Value:=strtoint(user_ptr);
      dm.ADO456CREATE_DATE.Value:=common.getsystem_date(dm.ADOQuery1,0);
      dm.ADO456warehouse_ptr.Value:=self.warehouse_ptr;
      dm.ADO456SUPP_PTR.Value:=self.supp_ptr;
      dm.ADO456REF_NUMBER.Value:=edit2.Text;
      dm.ADO456CURRENCY_PTR.Value:=self.curr_ptr;      //货币
      dm.ADO456EXCH_RATE.AsString:=edit10.Text;

      dm.ADO456STATUS.Value:=1;
      dm.ADO456TTYPE.Value:=3;
      if checkbox2.Checked then
        dm.ADO456PRINTED.Value:='Y'
      else
        dm.ADO456PRINTED.Value:='N';
      dm.ADO456.Post;

      dm.ado04.Close;
      dm.ado04.Open;
      self.update_04(trim(dm.ado04SEED_VALUE.Value)); //更新控制码

      dm.ADO22.Close;
      dm.ADO22.Parameters[0].Value:=dm.ADO456rkey.Value;
      dm.ADO22.Open;
     for i:=1 to strgrid1.RowCount-2 do
      begin
        dm.ADO22.Append;
        dm.ADO22GRN_PTR.Value:=dm.ADO456RKEY.Value;                 //456.rkey
        dm.ADO22INVENTORY_PTR.Value:=strtoint(stgrid2.Cells[0,i]);   //17.rkey
        dm.ADO22LOCATION_PTR_FROM.Value:=strtoint(stgrid2.Cells[1,i]);//02rkey
        dm.ADO22LOCATION_PTR.Value:=strtoint(stgrid2.Cells[2,i]);     //16.rkey
        dm.ADO22QUANTITY.AsString:=strgrid1.Cells[5,i];       //接收数量
        dm.ADO22QUAN_ON_HAND.Value:=dm.ADO22QUANTITY.Value;   //当前库存数量

        dm.ADO22tax_PRICE.AsString:=strgrid1.Cells[6,i];           //含税价
        dm.ADO22TAX_2.AsString:=strgrid1.Cells[7,i];           //税率
        dm.ADO22PRICE.Value:=dm.ADO22tax_price.Value/(1+dm.ADO22TAX_2.Value*0.01);//不含税价

        dm.ADO22BARCODE_ID.Value:=strgrid1.Cells[8,i];       //备注
        dm.ADO22rohs.Value:=strgrid1.Cells[9,i];             //环保标识
        dm.ADO22TDATE.Value:=StrToDate(strgrid1.Cells[10,i]); //制造日期

        dm.ADO22SUPPLIER2.Value:='';

        dm.ADO22TTYPE.Value:=3;
        dm.ADO22STOCK_BASE.Value:=strtocurr(stgrid2.Cells[4,i]);
        with dm.tmp do
        begin
          close;
          sql.Text:='select qte_price2 from data0028 where inventory_ptr='+#13+
                   stgrid2.Cells[0,i]+'and supplier_ptr='+inttostr(self.supp_ptr);
          Open;
        end;
        if dm.tmp.RecordCount>0 then
        begin
          if (dm.tmp.FieldByName('qte_price2').AsInteger<>0) then
          dm.ADO22EXPIRE_DATE.Value:=StrToDate(strgrid1.Cells[10,i])+dm.tmp.FieldValues['qte_price2'];
        end
        else
         begin
          with dm.tmp do
          begin
            close;
            sql.Text:='select shelf_life from data0017 where rkey='+stgrid2.Cells[0,i];
            open;
            if (dm.tmp.FieldByName('shelf_life').AsInteger<>0) then
            dm.ADO22EXPIRE_DATE.Value:=StrToDate(strgrid1.Cells[10,i])+dm.tmp.FieldValues['shelf_life'];
          end;
         end;
        dm.ADO22.Post;
      end;

      with dm.ADOQuery2 do         //更新17当前库存总数据
      begin
        close;
        sql.Clear;
        sql.Add('update data0017');
        sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND+d1.qty');
        sql.Add('from data0017 inner join');
        sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
        sql.Add('from data0022');
        sql.Add('where data0022.GRN_PTR='+dm.ADO456RKEY.AsString);
        sql.Add('group by inventory_ptr) d1');
        sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
        ExecSQL;
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
    if find_quan_error(dm.Aqwz456RKEY.Value) then
    begin
      showmsg('入库记录发生变发,不能再编辑!',1);
      exit;
    end;
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
      dm.ADO456REF_NUMBER.Value:=edit2.Text;
      dm.ADO456SUPP_PTR.Value:=self.supp_ptr;
      dm.ADO456STATUS.Value:=1;
      dm.ADO456.Post;

      with dm.ADOQuery2 do         //更新17当前库存总数据
      begin
        close;
        sql.Clear;
        sql.Add('update data0017');
        sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
        sql.Add('from data0017 inner join');
        sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
        sql.Add('from data0022');
        sql.Add('where data0022.GRN_PTR='+dm.ADO456RKEY.AsString);
        sql.Add('group by inventory_ptr) d1');
        sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
        ExecSQL;
      end;

      dm.ADO22.Close;
      dm.ADO22.Parameters[0].Value:=dm.ADO456rkey.Value;
      dm.ADO22.Open;
      while not dm.ADO22.Eof do dm.ADO22.Delete;
      for i:=1 to strgrid1.RowCount-2 do
      begin
        dm.ADO22.Append;
        dm.ADO22GRN_PTR.Value:=dm.ADO456RKEY.Value;     //456.rkey
        dm.ADO22INVENTORY_PTR.Value:=strtoint(stgrid2.Cells[0,i]);   //17.rkey
        dm.ADO22LOCATION_PTR_FROM.Value:=strtoint(stgrid2.Cells[1,i]);//单位02rkey
        dm.ADO22LOCATION_PTR.Value:=strtoint(stgrid2.Cells[2,i]);    //16.rkey

        dm.ADO22QUANTITY.AsString:=strgrid1.Cells[5,i];       //接收数量
        dm.ADO22QUAN_ON_HAND.Value:=dm.ADO22QUANTITY.Value;   //当前库存数量

        dm.ADO22tax_PRICE.AsString:=strgrid1.Cells[6,i];      //含税价
        dm.ADO22TAX_2.AsString:=strgrid1.Cells[7,i];          //税率
        dm.ADO22PRICE.Value:=dm.ADO22tax_price.Value/(1+dm.ADO22TAX_2.Value*0.01);//不含税价

        dm.ADO22BARCODE_ID.Value:=strgrid1.Cells[8,i];//备注
        dm.ADO22rohs.Value:=strgrid1.Cells[9,i];        //环保标识
        dm.ADO22TDATE.Value:=StrToDate(strgrid1.Cells[10,i]); //制造日期

        dm.ADO22SUPPLIER2.Value:='';

        dm.ADO22TTYPE.Value:=3;
        dm.ADO22STOCK_BASE.Value:=strtocurr(stgrid2.Cells[4,i]);//材料单重
        with dm.tmp do
        begin
          close;
          sql.Text:='select qte_price2 from data0028 where inventory_ptr='+#13+
                   stgrid2.Cells[0,i]+'and supplier_ptr='+inttostr(self.supp_ptr);
          Open;
        end;
        if dm.tmp.RecordCount>0 then
        begin
         dm.ADO22EXPIRE_DATE.Value:=StrToDate(strgrid1.Cells[10,i])+dm.tmp.FieldValues['qte_price2'];
        end
        else
        begin
          with dm.tmp do
          begin
           close;
           sql.Text:='select shelf_life from data0017 where rkey='+stgrid2.Cells[0,i];
           open;
           dm.ADO22EXPIRE_DATE.Value:=StrToDate(strgrid1.Cells[10,i])+
                           dm.tmp.Fieldbyname('shelf_life').AsInteger;
          end;
        end;
        dm.ADO22.Post;
      end;

      with dm.ADOQuery2 do         //更新17当前库存总数据
      begin
        close;
        sql.Clear;
        sql.Add('update data0017');
        sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND+d1.qty');
        sql.Add('from data0017 inner join');
        sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
        sql.Add('from data0022');
        sql.Add('where data0022.GRN_PTR='+dm.ADO456RKEY.AsString);
        sql.Add('group by inventory_ptr) d1');
        sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
        ExecSQL;
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



function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;


procedure TForm4.update_04(v_seed: string);
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

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
if strgrid1.Row=strgrid1.RowCount-1 then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
 end;
end;

procedure TForm4.N2Click(Sender: TObject);
var
 j:word;
begin
 for j:=strgrid1.Row to strgrid1.RowCount-2 do
  begin
   strgrid1.Rows[j].Text:=strgrid1.Rows[j+1].Text;
   stgrid2.Rows[j].Text:=stgrid2.Rows[j+1].Text;
  end;
 strgrid1.RowCount:=strgrid1.RowCount-1;
 stgrid2.RowCount:=stgrid2.RowCount-1;
end;

procedure TForm4.print_ininvt(rkey456: integer);
begin
 form_report := tform_report.Create(application);
 form_report.Aqwz456.close;
 form_report.Aqwz456.Parameters[0].Value:=rkey456;
 form_report.Aqwz456.open;
 form_report.Aqwz22.Open;
 form_report.Aq493.Open;
 form_report.ppReport1.Print;
 form_report.free;
end;


function tform4.find_soerror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0456');
   sql.Add('where GRN_NUMBER='''+number+'''');
   open;
   if not IsEmpty then  result := true;
  end;
end;

procedure TForm4.Edit11Exit(Sender: TObject);
begin
 try
  strtodatetime(edit11.Text);
 except
  messagedlg('送货日期格式错误!',mterror,[mbok],0);
  edit11.SetFocus;
 end;
end;

procedure TForm4.N3Click(Sender: TObject);
begin
  form5 := tform5.Create(application);
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
  while not dm.aq16.Eof do
  begin
    form5.combobox1.Items.Add(dm.aq16LOCATION.Value);
    dm.aq16.Next;
  end;
  dm.aq16.First;
  with form5 do
  begin
    Edit1.Text:= strgrid1.Cells[0,strgrid1.Row] ;
    edit7.Text:= strgrid1.Cells[1,strgrid1.Row] ;
    edit8.Text:= strgrid1.Cells[2,strgrid1.Row] ;
    combobox1.ItemIndex:= combobox1.Items.IndexOf(strgrid1.Cells[3,strgrid1.row]);
    label9.Caption:= strgrid1.Cells[4,strgrid1.Row] ;
    edit3.Text:= strgrid1.Cells[5,strgrid1.Row] ;
    edit4.Text:= strgrid1.Cells[6,strgrid1.Row] ;
    edit5.Text:= strgrid1.Cells[7,strgrid1.Row] ;
    edit6.Text:= strgrid1.Cells[8,strgrid1.Row] ;
    combobox2.Text:= strgrid1.Cells[9,strgrid1.Row] ;
    dtpk1.Date:= strtodate(strgrid1.Cells[10,strgrid1.Row]) ;  // strtodate(FormatDateTime('yyyy-mm-dd',strtodate(strgrid1.Cells[10,strgrid1.Row])))

    rkey17.Caption:= stgrid2.Cells[0,strgrid1.Row] ;
    rkey02.Caption:= stgrid2.Cells[1,strgrid1.Row];
    rkey16.Caption:= stgrid2.Cells[2,strgrid1.Row] ;
    SHELF_LIFE.Caption:= stgrid2.Cells[3,strgrid1.Row] ;

  //  dtpk1.Date:= getsystem_date(dm.ADOQuery1,1);
    Label5.Caption:= self.Label13.Caption+'含税价格:';
    status:=1;  //代表编辑
  end;
  if form5.ShowModal=mrok then
  begin
    strgrid1.Cells[0,strgrid1.Row] := form5.Edit1.Text;
    strgrid1.Cells[1,strgrid1.Row] := form5.edit7.Text;
    strgrid1.Cells[2,strgrid1.Row] := form5.edit8.Text;
    strgrid1.Cells[3,strgrid1.Row] := form5.combobox1.Text;
    strgrid1.Cells[4,strgrid1.Row] := form5.label9.Caption;
    strgrid1.Cells[5,strgrid1.Row] := form5.edit3.Text;
    strgrid1.Cells[6,strgrid1.Row] := form5.edit4.Text;
    strgrid1.Cells[7,strgrid1.Row] := form5.edit5.Text;
    strgrid1.Cells[8,strgrid1.Row] := form5.edit6.Text;
    strgrid1.Cells[9,strgrid1.Row] := form5.combobox2.Text;
    strgrid1.Cells[10,strgrid1.Row] := datetostr(form5.dtpk1.Date);

    stgrid2.Cells[0,strgrid1.Row] :=form5.rkey17.Caption;
    stgrid2.Cells[1,strgrid1.Row] :=form5.rkey02.Caption;
    stgrid2.Cells[2,strgrid1.Row] :=form5.rkey16.Caption;
    stgrid2.Cells[3,strgrid1.Row] :=form5.SHELF_LIFE.Caption;
  end;
  form5.Free;
end;

end.
