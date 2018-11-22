//备注：1、按类型过滤，比如退货重检出仓只能选择53表中的类型为退货入仓的库存,
//由于入仓可能无法保证类型一一对应，此方案暂时失效;
//2、编辑状态下删除出仓明细后无法重新找到此库存，必须保存后重新进入才能搜索到。

unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, Mask,Math, DB, ADODB;

type
  Tfm_detail = class(TForm)
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    SG1: TStringGrid;
    Label5: TLabel;
    btsave: TBitBtn;
    btcancel: TBitBtn;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Edit7: TEdit;
    Label10: TLabel;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure SG1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure PM1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SG1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btsaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btsaveEnter(Sender: TObject);
    procedure SG1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure re_count; //统计总出仓数量
    procedure del_old_data;
    procedure save_new_data;
    procedure update_04(v_seed: string;ttype:byte);  //更新控制变量
    function find_449(rkey53:Integer):Boolean;
  public
    { Public declarations }
    ttype,v_modal:byte;  //ttype为新增类型，v_modal模式:1新加/2编辑/3检查
    rkey10,rkey25:integer;
  end;

var
  fm_detail: Tfm_detail;

implementation
uses constvar,pick_item_single, damo,common, rma_search, stock_search;

{$R *.dfm}

procedure tfm_detail.re_count; //统计总出仓数量
var sum:integer;
    i:Integer;
begin
 sum:=0;
 for i:=1 to sg1.RowCount-2 do
  if trim(sg1.Cells[5,i])<>'' then
   sum:=sum+strtoint(sg1.Cells[5,i]);
 edit6.Text:=inttostr(sum);
end;

procedure Tfm_detail.del_old_data;
begin
 with dm.aqtmp do
 begin
  close;
  sql.Text:='update data0053 set qty_alloc=qty_alloc-data0465.quantity '+
    'from data0053 inner join data0465 on data0053.rkey=data0465.d0053_ptr '+
    'where data0465.heard_ptr='+dm.AQ415rkey.AsString;
  execsql; //恢复库存分配数
  sql.Text:='delete data0465 where heard_ptr='+dm.AQ415rkey.AsString;
  execsql;  //删除所有旧的分配子表记录
 end;
end;

function Tfm_detail.find_449(rkey53: Integer): Boolean;
begin
with dm.aqtmp1 do
 begin
   close;
   sql.Text:='select top 1 rkey from data0449 where d0053_ptr='+inttostr(rkey53);
   open;
   if IsEmpty then
    Result:=false
   else
    Result:=True;
 end;
end;

procedure Tfm_detail.save_new_data;
var i:Integer;
begin
 with dm.aqtmp do
 begin
  for i:=1 to sg1.RowCount-2 do
  begin
   close;
   if self.find_449(StrToInt(sg1.Cells[7,i])) then                       //库存已有截数记录
    sql.Text:='insert data0465(d0053_ptr,quantity,ttype,reference,heard_ptr) '+
     'values('+sg1.Cells[7,i]+','+sg1.Cells[5,i]+','+'1,'+
     quotedstr(sg1.Cells[6,i])+','+dm.AQ415rkey.AsString+')'
   else
    sql.Text:='insert data0465(d0053_ptr,quantity,ttype,reference,heard_ptr) '+
     'values('+sg1.Cells[7,i]+','+sg1.Cells[5,i]+','+'0,'+     //库存没有成本截数记录
     quotedstr(sg1.Cells[6,i])+','+dm.AQ415rkey.AsString+')';
   execsql;
  end;

  sql.Text:='update data0053 set qty_alloc=qty_alloc+data0465.quantity '+
    'from data0053 inner join data0465 on data0053.rkey=data0465.d0053_ptr '+
    'where data0465.heard_ptr='+dm.AQ415rkey.AsString;
  execsql;
 end;
end;

procedure Tfm_detail.update_04(v_seed: string;ttype:byte);
var  //ttype为0代表更新04表控制码，1代表从04获取控制掩码
  i,v_length:integer;
  v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
 begin
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   if ttype=0 then
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.aq04.Edit; //使前缀不变后缀加1
    dm.aq04SEED_VALUE.Value := new_seed;
    dm.aq04.Post;
    exit;
   end
   else
    begin//ttype=1从04里取员工代码设置掩码
     maskedit1.editmask:=copy(v_seed,1,i)+'!'+copy('999999999',i+1,v_length-i)+';1;_';
     maskedit1.Text:=copy(v_seed,1,i)+copy(v_seed,i+1,v_length-i);
     exit;
    end;

   if (i=1) and (ttype=0) then //如果第一位仍然是数字
   begin
    v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
    new_seed := copy(v_last,2,v_length);
    dm.aq04.Edit;
    dm.aq04SEED_VALUE.Value := new_seed;
    dm.aq04.Post;
   end;
 end;
end;

procedure Tfm_detail.BitBtn1Click(Sender: TObject);
var
 inputvar: PDlgInput; //搜索
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    case (sender as Tbitbtn).Tag of
      1:
      begin
        inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240,abbr_name/客户简称/130';
        inputvar.Sqlstr:='select rkey,cust_code,customer_name,abbr_name from data0010 order by cust_code';
        inputvar.KeyField:='cust_code';
        inputvar.InPut_value:=edit3.Text;
      end;
      2:
      begin
        inputvar.Fields:='manu_part_number/本厂编号/130,manu_part_desc/客户型号/240';
        if rkey10=0 then
         inputvar.Sqlstr:='select d25.rkey,d25.manu_part_number,d25.manu_part_desc,'+
           'd10.rkey as rkey10,d10.cust_code,d10.customer_name '+
           'from data0025 d25 inner join data0010 d10 on d25.customer_ptr=d10.rkey '+
           'where parent_ptr is null order by manu_part_number'
        else inputvar.Sqlstr:='select rkey,manu_part_number,manu_part_desc from data0025 '+
          'where parent_ptr is null and customer_ptr='+inttostr(rkey10)+' order by manu_part_number';
        inputvar.KeyField:='manu_part_number';
        inputvar.InPut_value:=edit4.Text;
      end;
    end;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
     case (sender as Tbitbtn).Tag of
      1:
       begin
        edit3.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
        label4.Caption:=trim(frmpick_item_single.adsPick.FieldValues['customer_name']);
        //rkey10:=frmpick_item_single.adsPick.FieldValues['rkey'];
        rkey10:= frmpick_item_single.adsPick.fieldbyName('rkey').Value;
        edit3.font.color:=clwindowtext;
       end;
      2:
       begin
        edit4.Text:=trim(frmpick_item_single.adsPick.FieldValues['manu_part_number']);
        label5.Caption:=trim(frmpick_item_single.adsPick.FieldValues['manu_part_desc']);
        rkey25:=frmpick_item_single.adsPick.FieldValues['rkey'];
        edit4.font.color:=clwindowtext;
        if rkey10=0 then
        begin
         edit3.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
         label4.Caption:=trim(frmpick_item_single.adsPick.FieldValues['customer_name']);
         rkey10:=frmpick_item_single.adsPick.FieldValues['rkey10'];
         edit3.font.color:=clwindowtext;
        end;
       end;
     end; //end case
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure Tfm_detail.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color = clwindowtext then
 begin
  edit3.SelectAll;
  edit3.Font.Color := clblue;
 end;
end;

procedure Tfm_detail.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key=13 then edit4.SetFocus;
end;

procedure Tfm_detail.Edit3Exit(Sender: TObject);
begin
  //  (activecontrol.Name<>'bitbtn1') and 
  if (trim(edit3.Text)<>'') then
  begin
    dm.aqtmp.Close;
    dm.aqtmp.SQL.Text:='select rkey,customer_name from data0010 where cust_code='''+edit3.Text+'''';
    dm.aqtmp.Open;
    if not dm.aqtmp.IsEmpty then
    begin
      if rkey10<>dm.aqtmp.FieldValues['rkey'] then
      begin
        label4.Caption:=dm.aqtmp.FieldValues['customer_name'];
        rkey10:=dm.aqtmp.FieldValues['rkey'];
       // edit4.Text:=''; //彭华注释掉于2013-2-21
       //rkey25:=0;
        label5.Caption:='';
        
      end;
      edit3.Font.Color:=clwindowtext;
    end
    else
    begin
      showmessage('您输入的客户代码不存在，请重新输入！');
      edit3.SetFocus;
    end;
  end      //彭华注释掉于2013-2-21
  else
  begin
    label4.Caption:='';
    rkey10:=0;
    edit4.Text:='';
    label5.Caption:='';
    rkey25:=0;
  end;
end;

procedure Tfm_detail.Edit4Click(Sender: TObject);
begin
  if edit4.Font.Color=clwindowtext then
  begin
    edit4.SelectAll;
    edit4.Font.Color:=clblue;
  end;
end;

procedure Tfm_detail.Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key=13 then edit5.SetFocus;
end;

procedure Tfm_detail.Edit4Exit(Sender: TObject);
begin
//  ADOQuery1.Close;
//  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Text:=' select * from data0025 where MANU_PART_NUMBER='+QuotedStr(trim(Edit4.Text));
//  ADOQuery1.Open;
//  if ADOQuery1.IsEmpty then
//  begin
//    ShowMessage('您输入的本厂编号不存在，请重新输入！');
//    Abort;
//  end;

 // if (activecontrol.Name<>'bitbtn2') and (trim(edit4.Text)<>'') then    \
  if Trim(Edit4.Text)<>'' then
  begin
    dm.aqtmp.Close;

    if rkey10=0 then
   // if Edit3.Text='' then
      dm.aqtmp.SQL.Text:='select d25.rkey,d25.manu_part_number,d25.manu_part_desc,'+
       'd10.rkey as rkey10,d10.cust_code,d10.customer_name '+
       'from data0025 d25 inner join data0010 d10 on d25.customer_ptr=d10.rkey '+
       'where parent_ptr is null  and manu_part_number='''+edit4.Text+''''
    else dm.aqtmp.SQL.Text:='select rkey,manu_part_desc from data0025 '+
      'where parent_ptr is null and customer_ptr='+inttostr(rkey10)+
      ' and manu_part_number='''+edit4.Text+'''';
    dm.aqtmp.Open;
    if not dm.aqtmp.IsEmpty then
    begin
      if rkey25<>dm.aqtmp.FieldValues['rkey'] then
      begin
        label5.Caption:=dm.aqtmp.FieldValues['manu_part_desc'];
        rkey25:=dm.aqtmp.FieldValues['rkey'];
      end;
      if rkey10=0 then
      begin
        edit3.Text:=trim(dm.aqtmp.FieldValues['cust_code']);
        label4.Caption:=trim(dm.aqtmp.FieldValues['customer_name']);
        rkey10:=dm.aqtmp.FieldValues['rkey10'];
      end;
      edit3.Font.Color:=clwindowtext;
      edit4.Font.Color:=clwindowtext;
    end
    else
    begin
     showmessage('您输入的本厂编号不存在，请重新输入！');
     label5.Caption:='';
     rkey25:=0;
     edit4.SetFocus;
     Abort;
    end;
  end
  else
  begin
//    edit4.Text:='';
    label5.Caption:='';
    rkey25:=0;
  end;
end;

procedure Tfm_detail.N1Click(Sender: TObject);
var //inputvar: PDlgInput; //搜索
    s1:string;  //s1为要排除的库存，s2为删除了的要显示的库存
    i:Integer;
begin
  s1:='';
  if sg1.RowCount>2 then
  begin
    for i:=1 to sg1.RowCount-2 do
     s1:=s1+sg1.Cells[7,i]+',';
    delete(s1,length(s1),1); //删除最后一位','
    s1:=' and d53.rkey not in ('+s1+') ';
  end;
   Form_Stock:=TForm_Stock.Create(Application);
   try
   Form_Stock.aqInvent.Close;
   Form_Stock.aqInvent.SQL.Clear;
   Form_Stock.aqInvent.SQL.Text:='SELECT Cast(0 as tinyint) as IsSelected,d53.RKEY,D15.ABBR_NAME as whouse,d16.location,'+
    'D06.WORK_ORDER_NUMBER as wo_number,D53.REFERENCE_NUMBER as place,D53.MFG_DATE,d53.RMA_PTR,'+
    'D53.QTY_ON_HAND-D53.QTY_ALLOC as QTY_AVAIL,D06.RKEY as D06RKEY,d53.NPAD_PTR,D23.ABBR_NAME AS abbr23, '+
    'case d53.rma_ptr when 0 then ''正常过数''  when 1 then ''退货重检'' '+
    'when 2 then ''返修重检'' when 3 then ''直接入仓'' '+
    'when 4 then ''委外加工''  when 5 then ''委外退货'' when 6 then ''销售退货'' '+
    'when 7 then ''转换入仓'' when 8 then ''盘点入仓'' '+
    'end as tttype,d53.spec_place '+
    'FROM Data0053 d53 inner join Data0015 d15 on D53.WHSE_PTR=D15.RKEY '+
    'inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '+
    'left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '+
    'inner join Data0025 d25 on D53.CUST_PART_PTR=D25.rkey '+
    'inner join Data0416 D416 on D53.NPAD_PTR=D416.rkey '+
    'left outer join Data0060 D60 on D416.so_ptr=D60.rkey '+
    'left outer join Data0023 D23 on D60.supplier_ptr=D23.rkey '+
    'WHERE (D53.QTY_ON_HAND - D53.QTY_ALLOC > 0) and d16.allow_putout=1'+
    ' and D53.CUST_PART_PTR='+inttostr(rkey25)+s1+
    ' Order by D53.MFG_DATE ';
    Form_Stock.aqInvent.Open;  //打开时已将数据转移到clientdataset之后可关闭
    Form_Stock.aqInvent.Close;

   if (Form_Stock.ShowModal=mrok) and (not Form_Stock.cdsInvent.IsEmpty) then
    begin
     with Form_Stock do
     begin
       cdsInvent.First;
      while not cdsInvent.Eof do
      begin
       if cdsInventIsSelected.Value=1 then
       begin
       if ttype=4 then  //正常重检不允许对未完成的作业单或没有作业单的库存操作。
       begin
        if (cdsInventRMA_PTR.Value=1) or (cdsInventRMA_PTR.Value=2) then
         begin
          if not find_449(cdsInventRKEY.Value) then   //没有进行过成品库存截数,没有进行过成本核算
           begin
            messagedlg('正常重检时,退货及返修的库存不能是当月入库的!',mterror,[mbcancel],0);
            exit;
           end;
         end;

        dm.aqtmp.close;
        dm.aqtmp.sql.Text:='select rkey,type from data0416 '+
        'where type=5 and data0416.rkey='+cdsinventNPAD_ptr.AsString;
        dm.aqtmp.open;
        if not dm.aqtmp.isempty then
         begin
          messagedlg('正常重检出仓不允许选择转换入库的库存,请走退货重检!',mterror,[mbcancel],0);
          exit;
         end;
        if cdsInventwo_number.Value='' then
        begin
          messagedlg('正常重检出仓必须选择带作业单的库存,请走退货重检!',mterror,[mbcancel],0);
          exit;
        end;
       end;

       sg1.Cells[0,sg1.RowCount-1]:=cdsInventwo_number.AsString;
       sg1.Cells[1,sg1.RowCount-1]:=cdsInventwhouse.AsString;
       sg1.Cells[2,sg1.RowCount-1]:=cdsInventlocation.AsString;
       sg1.Cells[3,sg1.RowCount-1]:=cdsInventplace.AsString;     //库存备注
       sg1.Cells[4,sg1.RowCount-1]:=cdsInventQTY_AVAIL.AsString;
       sg1.Cells[5,sg1.RowCount-1]:=cdsInventQTY_AVAIL.AsString;
       sg1.Cells[6,sg1.RowCount-1]:=cdsInventspec_place.AsString;  //库存具体位置
       sg1.Cells[7,sg1.RowCount-1]:=cdsInventRKEY.AsString; //库存rkey53
       sg1.Cells[8,sg1.RowCount-1]:='0';
       sg1.RowCount:=sg1.RowCount+1;
       re_count; //重新计算出仓总数
       end;
       cdsInvent.Next;
      end;
     end;
      edit3.Enabled:=false;
      edit4.Enabled:=false;
      bitbtn1.Enabled:=false;
      bitbtn2.Enabled:=false;
    end;
  finally
    Form_Stock.cdsInvent.Close;
    Form_Stock.Free;
  end;
end;
  


procedure Tfm_detail.N2Click(Sender: TObject);
var i,j:Integer;
begin
 for i:=sg1.Row to sg1.RowCount-3 do
  for j:=0 to 7 do
   sg1.Cells[j,i]:=sg1.Cells[j,i+1];
 sg1.Rows[sg1.RowCount-2].Clear;
 sg1.RowCount:=sg1.RowCount-1;
 re_count;
 if sg1.RowCount=2 then
 begin
  edit3.Enabled:=true;
  edit4.Enabled:=true;
  bitbtn1.Enabled:=true;
  bitbtn2.Enabled:=true;
 end;
end;

procedure Tfm_detail.PM1Popup(Sender: TObject);
begin
  if (sg1.Row=0) or (sg1.Row=sg1.RowCount-1) then
    n2.Enabled:=false
  else
    n2.Enabled:=true;

//  n1.Enabled:=false ;
//  if (edit4.Text<>'' )and(ADOQuery1.IsEmpty=False) then
//  begin
//    n1.Enabled:=true;
//  end;
  if rkey25<=0 then
    n1.Enabled:=false
  else
    n1.Enabled:=true;
end;

procedure Tfm_detail.FormActivate(Sender: TObject);
begin
 sg1.Cells[0,0]:='工单号码';
 sg1.Cells[1,0]:='工厂';
 sg1.Cells[2,0]:='仓库';
 sg1.Cells[3,0]:='备注';
 sg1.Cells[4,0]:='库存数量';
 sg1.Cells[5,0]:='出仓数量';
 sg1.Cells[6,0]:='备注信息';
 sg1.Cells[7,0]:='库存53指针';
 sg1.Cells[8,0]:='原始出仓数量';
 sg1.ColWidths[7]:=-1;   //隐藏此指针列
 sg1.ColWidths[8]:=-1;   //隐藏此指针列
end;

procedure Tfm_detail.SG1KeyPress(Sender: TObject; var Key: Char);
begin //只有出仓数量和备注列允许输入，数量只允许输入数字
 if ((sg1.Col<>5) and (sg1.Col<>6)) or (sg1.RowCount<=2) or (sg1.Row>=sg1.RowCount-1) then abort;
 if (sg1.col=5) and (not (key in ['0'..'9',#8])) then abort;
end;

procedure Tfm_detail.SG1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (sg1.Row<=sg1.RowCount-2) and (sg1.Cells[5,sg1.row]='') then sg1.Cells[5,sg1.row]:='0';
 if (sg1.Row<=sg1.RowCount-2) and (strtoint(sg1.Cells[5,sg1.row])>strtoint(sg1.Cells[4,sg1.row])) then
  sg1.Cells[5,sg1.row]:=sg1.Cells[4,sg1.row];

 re_count; //计算出仓总数量
end;

procedure Tfm_detail.SG1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var row,col:longint;
begin
 if button=mbright then
 begin
  sg1.MouseToCell(x,y,col,row);
  if row<>0 then sg1.Row:=row;
 end;
end;

procedure Tfm_detail.btsaveClick(Sender: TObject);
begin
  if v_modal=1 then  //新增才检查编号是否重复
  with dm.aqtmp do
  begin
    close;
    sql.Text:='select number from data0415 where number='''+uppercase(trim(maskedit1.Text))+'''';
    open;
    if not isempty then  //编号重复
    begin
      dm.AQ04.Close;
      dm.AQ04.Open;
      if dm.AQ04SEED_FLAG.Value<>1 then
      begin
        if messagedlg('出仓单号重复可能多人同时新增,是否自动更新编号为:'+
        dm.AQ04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
          maskEdit1.Text:=dm.AQ04SEED_VALUE.Value
        else
        begin
          if maskedit1.Enabled then
            maskedit1.SetFocus
          else
            btcancel.SetFocus;
          exit;
        end;
      end
      else
      begin
        messagedlg('出仓单号!请手工重新输入',mterror,[mbok],0);
        if maskedit1.Enabled then
          maskedit1.SetFocus
        else
          btcancel.SetFocus;
        exit;
      end;
    end;
  end;

  dm.ADOConnection1.BeginTrans;
  if v_modal=1 then //新增
  begin
    dm.AQ415.close;
    dm.AQ415.parameters[0].Value:=null;
    dm.AQ415.open;
    dm.AQ415.Append;
    dm.aq415number.Value:=uppercase(trim(maskedit1.Text));
    dm.aq415type.Value:=ttype;
    dm.AQ415status.Value:=1;
    dm.aq415empl_ptr.Value:=strtoint(user_ptr);
    dm.AQ415custpart_ptr.Value:=rkey25;
    //ShowMessage(IntToStr(rkey25));
    dm.AQ415sys_date.Value:=getsystem_date(dm.aqtmp,0);
    dm.AQ415quantity.Value:=strtoint(edit6.Text);
    dm.AQ415reference.Value:=edit5.Text;
    dm.AQ415customer_ptr.value:= rkey10;//彭华添加于2013-2-21
    if edit7.Tag>0 then
    dm.aq415rma_ptr.Value:=edit7.Tag;
    try
      dm.AQ415.Post;
      if dm.AQ04SEED_FLAG.Value<>1 then
       update_04(trim(dm.AQ04SEED_VALUE.Value),0); //更新控制码
      save_new_data;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
        if maskedit1.Enabled then
          maskedit1.SetFocus
        else
          btcancel.SetFocus;
        exit;
      end;
    end;
  end
  else
  begin  //编辑
    del_old_data;  //删除旧数据

    dm.AQ415.Edit;
    dm.AQ415status.Value:=1;
    dm.aq415number.Value:=uppercase(trim(maskedit1.Text));
    dm.aq415empl_ptr.Value:=strtoint(user_ptr);
    dm.AQ415sys_date.Value:=getsystem_date(dm.aqtmp,0);
    dm.AQ415quantity.Value:=strtoint(edit6.Text);
    dm.AQ415reference.Value:=edit5.Text;
   // dm.AQ415customer_ptr.value:= rkey10;//彭华添加于2013-2-21
    try
      dm.AQ415.Post;
      save_new_data;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
        if maskedit1.Enabled then
          maskedit1.SetFocus
        else
          btcancel.SetFocus;
        exit;
      end;
    end;
  end;

  dm.ADOConnection1.CommitTrans;
  self.ModalResult:=mrok;
end;

procedure Tfm_detail.FormShow(Sender: TObject);
begin
{ with dm.aq04 do
 begin
  Open;
  if v_modal=1 then     //新增
   if FieldValues['seed_flag']<>1 then  //从04中读取控制码
    begin
     //if FieldValues['seed_flag']=2  then self.update_04(trim(maskedit1.text),1); //如果固定字首则设置掩码
    // if FieldValues['seed_flag']=4 then maskedit1.Enabled := false;
    end
   else
    begin
    // maskedit1.Text := '';
    // maskedit1.SetFocus;
    end;  //seed_flag=1完全手工输入编号
 end;
}
end;

procedure Tfm_detail.btsaveEnter(Sender: TObject);  //检查数据的准确性
var
    i:Integer;
begin
 if (trim(maskedit1.Text)='') then
 begin
  showmessage('不能保存！出仓单号不能为空。');
  maskedit1.SetFocus;
  exit;
 end;

 if (dm.AQ04SEED_FLAG.Value<>1) and (not (maskedit1.Text[length(trim(maskedit1.Text))] in ['0'..'9'])) then
 begin
  messagedlg('不能保存！出仓单号最后一位必须为整数。',mtinformation,[mbok],0);
  maskedit1.SetFocus;
  exit;
 end;

 if strtoint(edit6.Text)=0 then
 begin
  messagedlg('不能保存！出仓数量不允许为零。',mtinformation,[mbok],0);
  sg1.SetFocus;
  exit;
 end;

 for i:=1 to sg1.RowCount-2 do
  if (trim(sg1.Cells[5,i])='') or (strtoint(sg1.Cells[5,i])=0) then
  begin
   messagedlg('不能保存！出仓明细数量不允许为零。',mtinformation,[mbok],0);
   sg1.SetFocus;
   exit;
  end;

  for i:=1 to sg1.RowCount-2 do //--保存前检查库存数据是否发生变化。
   with dm.aqtmp do
   begin
    close;
    sql.Text:='select qty_on_hand-qty_alloc as qty_aval from data0053 where rkey='+sg1.Cells[7,i];
    open;
    if (fieldvalues['qty_aval']+strtoint(sg1.Cells[8,i]))<strtoint(sg1.Cells[5,i]) then
    begin
     messagedlg('不能保存!第'+inttostr(i)+'条出仓明细的库存数量发生变化，已不够本次出仓。',mtwarning,[mbok],0);
     sg1.SetFocus;
     exit;
    end;
   end;

 if v_modal=2 then  //编辑
  with dm.aqtmp do  //保存前检查出仓单出表数据是否发生变化。
  begin
   close;
   sql.Text:='select * from data0415 where rkey='+dm.AQ415.fieldbyname('rkey').AsString;
   open;
   for i:=0 to 11 do
    if fields[i].Value<>dm.AQ415.Fields[i].Value then
    begin
     messagedlg('不能保存！出仓单可能已被其它用户同步修改。',mtwarning,[mbok],0);
     sg1.SetFocus;
     break;
     exit;
    end;
  end;
end;

procedure Tfm_detail.BitBtn3Click(Sender: TObject);
var
 i:integer;
begin
  Frm_rmasearch:=tFrm_rmasearch.Create(application);
  if Frm_rmasearch.ADOQuery1.IsEmpty then
    showmessage('没有退货单!')
  else
  if Frm_rmasearch.ShowModal=mrok then
  begin
    edit7.Text:= Frm_rmasearch.ADOQuery1rma_number.Value;
    edit7.Tag:=Frm_rmasearch.ADOQuery1rkey.Value;
    edit3.Text:=Frm_rmasearch.ADOQuery1cust_code.Value;
    label4.Caption:=Frm_rmasearch.ADOQuery1customer_name.Value;
    edit4.Text:=Frm_rmasearch.ADOQuery1MANU_PART_NUMBER.Value;
    label5.Caption:=Frm_rmasearch.ADOQuery1MANU_PART_DESC.Value;
    self.rkey10:=Frm_rmasearch.ADOQuery1customer_ptr.Value;
    self.rkey25:=Frm_rmasearch.ADOQuery1customer_part_ptr.Value;
    edit3.font.color:=clwindowtext;
    edit4.font.color:=clwindowtext;
    edit3.Enabled:=false;
    edit4.Enabled:=false;
    bitbtn1.Enabled:=false;
    bitbtn2.Enabled:=false;
    for i:=1 to sg1.RowCount-2 do
     sg1.Rows[i].Clear;
    sg1.RowCount:=2;
    sg1.PopupMenu:=nil;
    with dm.aqtmp do
    begin
      close;
      sql.Text:=
      'SELECT    data0053.rkey, dbo.Data0053.REFERENCE_NUMBER, dbo.Data0015.ABBR_NAME,'+#13+
      'dbo.Data0016.LOCATION,dbo.Data0053.QTY_ON_HAND - dbo.Data0053.QTY_ALLOC AS QTY_AVAIL'+#13+
      'FROM         dbo.Data0053 INNER JOIN'+#13+
      '  dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data0416.rkey INNER JOIN'+#13+
      '  dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN'+#13+
      '  dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY'+#13+
      'WHERE     (dbo.Data0053.QTY_ON_HAND - dbo.Data0053.QTY_ALLOC > 0)'+#13+
      'and  dbo.data0416.rma_ptr='+inttostr(edit7.Tag);
      open;
    end;

    sg1.Cells[0,sg1.RowCount-1]:='';
    sg1.Cells[1,sg1.RowCount-1]:=dm.aqtmp.FieldValues['ABBR_NAME'];
    sg1.Cells[2,sg1.RowCount-1]:=dm.aqtmp.FieldValues['location'];
    sg1.Cells[3,sg1.RowCount-1]:=dm.aqtmp.FieldValues['REFERENCE_NUMBER'];
    sg1.Cells[4,sg1.RowCount-1]:=dm.aqtmp.Fieldbyname('QTY_AVAIL').AsString;
    sg1.Cells[5,sg1.RowCount-1]:=dm.aqtmp.Fieldbyname('QTY_AVAIL').AsString;
    sg1.Cells[7,sg1.RowCount-1]:=dm.aqtmp.Fieldbyname('RKEY').AsString; //库存rkey53
    sg1.Cells[8,sg1.RowCount-1]:='0';
    sg1.RowCount:=sg1.RowCount+1;
    re_count; //重新计算出仓总数

  end;
  Frm_rmasearch.Free;
end;


end.
