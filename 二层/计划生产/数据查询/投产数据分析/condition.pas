unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons,dateutils;

type
  Tcondition_form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup2: TRadioGroup;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DT1: TDateTimePicker;
    DT2: TDateTimePicker;
    BitBtn3: TBitBtn;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox5: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    ComboBox2: TComboBox;
    rg1: TRadioGroup;
    cbb1: TComboBox;
    cbb2: TComboBox;
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    { Private declarations }
    v_field_list,v_operator,v_prod_kind:variant;  //v_operator为运算符
    warehouse_ptr:integer;
    procedure update_sgrid(sgrid_row:byte);  //更新条件限制
  public
    { Public declarations }
  end;

var
  condition_form: Tcondition_form;

implementation
uses pick_item_single,constvar,damo,detail,common, UTogather;

{$R *.dfm}

procedure Tcondition_form.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;

//  user_ptr:='4';
//  vprev:='4';
end;

procedure Tcondition_form.update_sgrid(sgrid_row:byte);
var s,s1:string;  //更新条件限制
begin
  sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.ItemIndex];
  case listbox1.ItemIndex of
  0,1:   //客户、产品类型
    begin
      sgrid1.Cells[1,sgrid_row]:=edit1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+'='+''''+trim(edit1.text)+'''';
    end;
  2,3:  //厂编、客户型号
    begin
      sgrid1.Cells[1,sgrid_row]:=edit1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+' like '+'''%'+edit1.text+'%''';
    end;
  4:   //产品性质(量产或样板)
    begin
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+'='+inttostr(combobox1.itemindex);
    end;
  5:  //产品属性(外层或内层)
    begin
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+v_prod_kind[combobox1.itemindex];
    end;
  6:  //层数
    begin
      sgrid1.Cells[1,sgrid_row]:=v_operator[radiogroup1.itemindex]+edit1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+v_operator[radiogroup1.itemindex]+edit1.Text;
    end;
  7:  //投产类型
    begin
      s:=''; s1:='';
      if checkbox1.Checked then
      begin
        s1:=checkbox1.Caption+';';
        s:='0';
      end;
      if checkbox2.Checked then
      begin
        s1:=s1+checkbox2.Caption+';';
        if s='' then s:='1'
        else s:=s+',1';
      end;
      if checkbox3.Checked then
      begin
        s1:=s1+checkbox3.Caption+';';
        if s='' then s:='2'
        else s:=s+',2';
      end;
      if checkbox4.Checked then
      begin
        s1:=s1+checkbox4.Caption+';';
        if s='' then s:='3'
        else s:=s+',3';
      end;
      if checkbox5.Checked then
      begin
        s1:=s1+checkbox5.Caption+';';
        if s='' then s:='4'
        else s:=s+',4';
      end;
      s:='('+s+')';
      sgrid1.Cells[1,sgrid_row]:=s1;
      sgrid1.Cells[2,sgrid_row]:=' and d492.ttype in '+s;
    end;
  8:  //审核状态
    begin
      s:=''; s1:='';
      if checkbox6.Checked then
      begin
        s1:=checkbox6.Caption+';';
        s:='0';
      end;
      if checkbox7.Checked then
      begin
        s1:=s1+checkbox7.Caption+';';
        if s='' then s:='1'
        else s:=s+',1';
      end;
      if checkbox8.Checked then
      begin
        s1:=s1+checkbox8.Caption+';';
        if s='' then s:='2'
        else s:=s+',2';
      end;
      if checkbox9.Checked then
      begin
        s1:=s1+checkbox9.Caption+';';
        if s='' then s:='3'
        else s:=s+',3';
      end;
      s:='('+s+')';
      sgrid1.Cells[1,sgrid_row]:=s1;
      sgrid1.Cells[2,sgrid_row]:=' and d492.tstatus in '+s;
    end;
  9:
    begin
      sgrid1.Cells[1,sgrid_row]:=edit1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+'='+inttostr(warehouse_ptr);
    end;
  10:
   begin
   sgrid1.Cells[2,sgrid_row]:='and data0060.so_tp='+inttostr(combobox2.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
   end;
  end;
end;

procedure Tcondition_form.FormShow(Sender: TObject);
begin
  rg1.ItemIndex:=0;
  cbb2.Visible:=false;
  
  v_Field_List:=VarArrayOf(['d10.cust_code','d08.prod_code','d25.manu_part_number','d25.manu_part_desc',
    'd25.ttype','d25.parent_ptr','d25.layers','d492.ttype','d492.status','d492.whouse_ptr']);
  v_operator:=varArrayof(['=','>=','<=','<>']);  //层数条件操作符
  v_prod_kind:=vararrayof([' is null','>0']);    //内外层条件限制符号
  dt1.Date:=now-dayof(now)+1; //起始日期黑默认为当前月的第一天
  dt2.Date:=now; //结束期黑默认为今天
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  self.ListBox1click(sender);
end;

procedure Tcondition_form.ListBox1Click(Sender: TObject);
begin   //选定条件项目
  edit1.Visible:=listbox1.ItemIndex in [0,1,2,3,6,9];
  ComboBox2.Visible:=ListBox1.ItemIndex in[10];
  combobox1.Visible:=listbox1.ItemIndex in [4,5];
  bitbtn4.Visible:=listbox1.ItemIndex in [0,1,2,3,9];
  radiogroup1.Visible:=listbox1.ItemIndex=6;
  groupbox4.Visible:=listbox1.ItemIndex=7;
  groupbox5.Visible:=listbox1.ItemIndex=8;
  label1.Caption:=listbox1.Items[listbox1.itemindex]+'：';
  edit1.Text:='';
  case listbox1.ItemIndex of
  4:
    begin
      combobox1.Items.Clear;
      combobox1.Items.Add('量产');
      combobox1.Items.Add('样板');
      combobox1.ItemIndex:=0;
    end;
  5:
    begin
      combobox1.Items.Clear;
      combobox1.Items.Add('外层');
      combobox1.Items.Add('内层');
      combobox1.ItemIndex:=0;
    end;
  end;
end;

procedure Tcondition_form.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    case listbox1.ItemIndex of
    0:
     begin
      inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
      inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
     end;
    1:
     begin
      inputvar.Fields:='prod_code/产品类别代码/130,product_name/产品类别名称/240';
      inputvar.Sqlstr:='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
     end;
    2:
     begin
      inputvar.Fields:='manu_part_number/本厂编号/130,manu_part_desc/客户型号/240';
      inputvar.Sqlstr:='select rkey,manu_part_number,manu_part_desc from data0025 order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
     end;
    3:
     begin
      inputvar.Fields:='manu_part_desc/客户型号/240,manu_part_number/本厂编号/130';
      inputvar.Sqlstr:='select rkey,manu_part_desc,manu_part_number from data0025 order by manu_part_desc';
      inputvar.KeyField:='manu_part_desc';
     end;
    9:
     begin
      inputvar.Fields:='warehouse_code/工厂代码/130,warehouse_name/工厂名称/240';
      inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name from data0015 order by warehouse_code';
      inputvar.KeyField:='warehouse_code';
     end;
    end;
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    begin
     case listbox1.ItemIndex of
      0:edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
      1:edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['prod_code']);
      2:edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['manu_part_number']);
      3:edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['manu_part_desc']);
      9:
       begin
         edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
         warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
       end;
     end;
     button1.SetFocus;
    end
    else edit1.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure Tcondition_form.Button1Click(Sender: TObject);
var i:byte;  //增加条件
begin
  if ((listbox1.ItemIndex in [0,1,2,3,6,9]) and (trim(edit1.Text)=''))
    or ((listbox1.ItemIndex=7) and (not checkbox1.Checked) and (not checkbox2.Checked)
    and (not checkbox3.Checked) and (not checkbox4.Checked) and (not checkbox5.Checked))
    or ((listbox1.ItemIndex=8) and (not checkbox6.Checked) and (not checkbox7.Checked)
    and (not checkbox8.Checked) and (not checkbox9.Checked)) then
    exit; //输入为空或无一选择项时不增加条件
  for i:=1 to sgrid1.RowCount-1 do
    if sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
      begin
        update_sgrid(i);
        exit;
      end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tcondition_form.N1Click(Sender: TObject);
var i:byte;  //删除条件
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure Tcondition_form.BitBtn1Click(Sender: TObject); //查找
var select,where,group,order:string;
    i:byte;
    Lsql,Lstr1,Lstr11,Lstr2,Lstr22,S,Lsum:string;
begin

  where:='WHERE 1=1 '; //sql条件变量
  for i:=1 to sgrid1.RowCount-2 do
    where:=where+sgrid1.Cells[2,i]+' ';
  if dt1.Date>=strtodate('1900-01-01') then where:=where+' AND d492.issue_date>='+''''+datetostr(dt1.Date)+'''';
  if dt2.Date>=strtodate('1900-01-01') then where:=where+' AND d492.issue_date<='+''''+datetostr(dt2.Date+1)+'''';

 if rg1.ItemIndex=0  then
 begin
 try
  screen.Cursor:=crappstart; //执行程序光标,等待...
  case radiogroup2.ItemIndex of
   0:
    begin
     select:='SELECT TOP 100 PERCENT d10.cust_code as code,d10.abbr_name as name,';
     group:='GROUP BY d10.cust_code,d10.abbr_name ';
     order:='ORDER BY area desc';  //为了把汇总记录排在首行。
    end;
   1:
    begin
     select:='SELECT TOP 100 PERCENT d08.prod_code as code,d08.product_name as name,';
     group:='GROUP BY d08.prod_code,d08.product_name ';
     order:='ORDER BY area desc';
    end;
   2:
    begin
     select:='SELECT TOP 100 PERCENT d25.manu_part_number as code,d25.manu_part_desc as name,';
     group:='GROUP BY d25.manu_part_number,d25.manu_part_desc ';
     order:='ORDER BY area desc';
    end;
   3:
    begin
     select:='SELECT TOP 100 PERCENT CONVERT(varchar,year(d492.issue_date)*100+month(d492.issue_date)) as code,''空列'' as name,';
     group:='GROUP BY year(d492.issue_date)*100+month(d492.issue_date) ';
     order:='ORDER BY year(d492.issue_date)*100+month(d492.issue_date) ';
    end;
   4:
    begin
     select:='SELECT TOP 100 PERCENT CONVERT(varchar,d492.issue_date,23) as code,''空列'' as name,';
     group:='GROUP BY convert(varchar,d492.issue_date,23) ';
     order:='ORDER BY convert(varchar,d492.issue_date,23) ';
    end;
  end; //select 为sql的select语句
  select:=select+'SUM(d492.issued_qty) as pcs,SUM(d492.issued_qty*D25.unit_sq) as area ,sum(d492.ord_req_qty) as ord_pcs,sum(d492.ord_req_qty*D25.unit_sq) as ord_area '+dm.ADOQuery1.SQL.Text;
  with dm.aq492 do
  begin
    close;
    sql.text:=select+#13+#10+'FROM data0492 d492 inner join data0025 d25 on d492.bom_ptr=d25.rkey '+
      'inner join data0010 d10 on d492.COMPLETED=d10.rkey inner join data0008 d08 '+
      'on d25.prod_code_ptr=d08.rkey '+
      'INNER join dbo.Data0060 on d492.SO_NO = dbo.Data0060.SALES_ORDER '+
      #13+#10+where+' '+#13+#10+group+' '+#13+#10+order;
    open;
  end;
  detail_form:=Tdetail_form.Create(application);
  if detail_form.ShowModal=mrok then begin end;
 finally
  detail_form.Free;
  screen.Cursor:=crdefault;
 end;
 end
 else
 begin
   try
      frmTotather:=TfrmTotather.Create(nil);
      
     if (Trim(cbb2.Text)=Trim(cbb1.text) ) and (rg1.ItemIndex=1) then
     begin
      ShowMessage('汇总二维数据时横竖列不能一样！');
      exit;
     end;

    if (Trim(cbb2.Text)='' ) and (rg1.ItemIndex=1) then
     begin
      ShowMessage('请选择完整的数据汇总字段！');
      cbb2.SetFocus;
      exit;
    end;

    Lsum:=' round(SUM(d492.issued_qty),2) as 投产PCS数,round(SUM(d492.issued_qty*D25.unit_sq),2) as 不含板边投产面积 , '+#13+#10+
         ' round(sum(d492.ord_req_qty),2) as 订单pcs数, round(sum(d492.ord_req_qty*D25.unit_sq),2) as 订单面积, '+#13+#10+ //
          ' round(SUM(case when D492.upanel1 >0 then D492.ISSUED_QTY* '+#13+#10+
          ' cast(substring(pnl1_size,1,CHARINDEX(''*'',pnl1_size)-4) as money)* '+#13+#10+
          ' cast(substring(pnl1_size,CHARINDEX(''*'',pnl1_size)+2,len(pnl1_size)- '+#13+#10+
          ' (CHARINDEX(''*'',pnl1_size)+3)) as money)*0.000001/d492.upanel1 '+#13+#10+
          ' when d492.upanel2 >0 then d492.ISSUED_QTY* '+#13+#10+
          ' cast(substring(pnl2_size,1,CHARINDEX(''*'',pnl2_size)-4) as money)* '+#13+#10+
          ' cast(substring(pnl2_size,CHARINDEX(''*'',pnl2_size)+2,len(pnl2_size)- '+#13+#10+
          ' (CHARINDEX(''*'',pnl2_size)+3)) as money)*0.000001/d492.upanel2 '+#13+#10+
          ' else D25.unit_sq * d492.ISSUED_QTY end),2) as 含板边投产面积 '+#13+#10+
          ' FROM data0492 d492  '+#13+#10+
          '  inner join data0025 d25 on d492.bom_ptr=d25.rkey '+#13+#10+
          '  inner join data0010 d10 on d492.COMPLETED=d10.rkey '+#13+#10+
          '  inner join data0008 d08 on d25.prod_code_ptr=d08.rkey '+#13+#10+
          '  INNER join dbo.Data0060 on d492.SO_NO = dbo.Data0060.SALES_ORDER ' ;

   case cbb1.itemindex  of
    0:
    begin
     Lstr1:='d10.ABBR_NAME as 客户';
     Lstr11:='d10.ABBR_NAME';
    // frmTotather.Fname1:='客户';
    end;
    1:
    begin
     Lstr1:='d08.PRODUCT_NAME  as 产品类型';
     Lstr11:='d08.PRODUCT_NAME' ;
     //frmTotather.Fname1:='产品类型';
    end;
    2:
    begin
     Lstr1:='d25.MANU_PART_NUMBER as 本厂编号 ';
     Lstr11:='d25.MANU_PART_NUMBER';
     //frmTotather.Fname1:='本厂编号';
    end;
    3:
    begin
     Lstr1:='convert(char(7),d492.issue_date,120) as 月份';
     Lstr11:='convert(char(7),d492.issue_date,120)';
    // frmTotather.Fname1:='月份';
    end;
    4:
    begin
     Lstr1:='convert(char(10),d492.issue_date,120) as 日期';
     Lstr11:='convert(char(10),d492.issue_date,120)' ;
     //frmTotather.Fname1:='日期';
    end ;      
   end;

    case  cbb2.itemindex of
    0:
    begin
     Lstr2:='D10.ABBR_NAME as 客户';
     Lstr22:='D10.ABBR_NAME';
    // frmTotather.Fname2:='客户';
    end;
    1:
    begin
     Lstr2:=' D08.PRODUCT_NAME  as 产品类型';
     Lstr22:=' D08.PRODUCT_NAME';
    // frmTotather.Fname2:='产品类型';
    end;
    2:
    begin
     Lstr2:='d25.MANU_PART_NUMBER as 本厂编号' ;
     Lstr22:=' d25.MANU_PART_NUMBER';
     //frmTotather.Fname2:='本厂编号';
    end;
    3:
    begin
     Lstr2:='convert(char(7),d492.issue_date,120) as 月份';
     Lstr22:='convert(char(7),d492.issue_date,120)';
     //frmTotather.Fname2:='月份';
    end;
    4:
    begin
     Lstr2:='convert(char(10),d492.issue_date,120) as 日期';
     Lstr22:='convert(char(10),d492.issue_date,120)';
    // frmTotather.Fname2:='日期';
    end;
   end;

    if (vprev='1') or (vprev='2') then
    begin
     frmTotather.cbb1.Items.Clear;
     frmTotather.cbb1.Items.Add('数量');
     frmTotather.cbb1.Items.Add('面积');
     frmTotather.cbb1.ItemIndex:=0;
    end;

     frmTotather.cbb1.ItemIndex:=0;
    frmTotather.pgc1.ActivePageIndex:=0;

    frmTotather.qry_detail.close;
    frmTotather.qry_detail.sql.clear;
     s:= 'select '+Lstr1+','+Lstr2+',' +Lsum+where+' group by '+Lstr11+','+Lstr22+ ' order by '+Lstr11;
   // showmessage(s);
    frmTotather.qry_detail.sql.text:= S;
    frmTotather.qry_detail.open;

//    frmTotather.eh60.SumList.Active:=True;
//    frmTotather.eh60.FooterRowCount:=1;
//    frmTotather.eh60.columns[2].footer.fieldname:='数量';
//    frmTotather.eh60.columns[2].footer.ValueType:=fvtSum;
//    frmTotather.eh60.columns[3].footer.fieldname:='面积';
//    frmTotather.eh60.columns[3].footer.ValueType:=fvtSum;
//    frmTotather.eh60.columns[4].footer.fieldname:='不含税金额';
//    frmTotather.eh60.columns[4].footer.ValueType:=fvtSum;
//    frmTotather.eh60.columns[5].footer.fieldname:='含税金额';
//    frmTotather.eh60.columns[5].footer.ValueType:=fvtSum;

  //
    frmTotather.qryV.close;
    frmTotather.qryV.sql.clear;
    s:=  'select '+Lstr1+',' +Lsum+where+' group by '+Lstr11+ ' order by '+Lstr11;
   // showmessage(s);
    frmTotather.qryV.sql.text:= S;
    frmTotather.qryV.open;

    frmTotather.qryH.close;
    frmTotather.qryH.sql.clear;
    s:= 'select '+Lstr2+','+Lsum+where+' group by '+Lstr22+ ' order by '+Lstr22;
    //showmessage(s);
    frmTotather.qryH.sql.text:= S;
    frmTotather.qryH.open;

    frmTotather.ShowModal;
   finally
   frmTotather.Free;
   end;
  end;
 end;


procedure Tcondition_form.BitBtn2Click(Sender: TObject);
var i:byte;  //重置
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure Tcondition_form.BitBtn3Click(Sender: TObject);
begin  //退出
  application.Terminate;
end;

procedure Tcondition_form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin  //条件为层数时控制输入数字
  if listbox1.ItemIndex=6 then
    if not (key in ['0'..'9']) then abort;
  if key=#13 then button1.SetFocus;
end;

procedure Tcondition_form.Edit1Exit(Sender: TObject);
begin  //搜索输入的条件是否存在
  if (trim(edit1.Text)<>'') and (listbox1.ItemIndex in [0,1,9]) then
  with dm.aqtmp do
  begin
    Close;
    case listbox1.ItemIndex of
      0:sql.Text:='select cust_code from data0010 where cust_code='''+trim(edit1.text)+'''';
      1:sql.Text:='select prod_code from data0008 where prod_code='''+trim(edit1.text)+'''';
      9:sql.Text:='select rkey,warehouse_code from data0015 where warehouse_code='''+trim(edit1.text)+'''';
    end;
    open;
    if isempty then
    begin
      case listbox1.ItemIndex of
        0:showmessage('找不到您输入的客户代码，请重输！');
        1:showmessage('找不到您输入的产品类型，请重输！');
        9:showmessage('找不到您输入的工厂代码，请重输！');
      end; //case结束
      edit1.Text:='';
      edit1.SetFocus;
    end
    else if listbox1.ItemIndex=9 then
      warehouse_ptr:=fieldvalues['rkey'];
  end;
end;

procedure Tcondition_form.PopupMenu1Popup(Sender: TObject);
begin  //删除条件菜单弹出控制
  if trim(sgrid1.Cells[1,sgrid1.Row])='' then
    n1.Enabled:=false
  else n1.Enabled:=true;
end;

procedure Tcondition_form.rg1Click(Sender: TObject);
begin
   if rg1.ItemIndex=0 then
    begin
      RadioGroup2.Visible:=true;
      cbb1.Visible:=false;
      cbb2.Visible:=false;
    end
    else
    begin
      RadioGroup2.Visible:=false;
      cbb1.Visible:=true;
      cbb2.Visible:=true;
    end
end;

end.
