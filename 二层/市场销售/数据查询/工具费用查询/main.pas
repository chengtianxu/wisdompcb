unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ADODB, StdCtrls, ExtCtrls,ComObj,Excel2000, ComCtrls,
  Buttons;

type
  Tmain_form = class(TForm)
    Panel1: TPanel;
    aq61: TADOQuery;
    aq61rkey: TAutoIncField;
    aq61CATEGORY: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SG1: TStringGrid;
    SG2: TStringGrid;
    spbtnClear: TSpeedButton;
    spBtnExit: TSpeedButton;
    spBtnExport: TSpeedButton;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    RadioGroup2: TRadioGroup;
    Label3: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    ADOConnection1: TADOConnection;
    aqtmp: TADOQuery;
    AQ25: TADOQuery;
    AQ_SUM: TADOQuery;
    AQ25CUST_CODE: TStringField;
    AQ25ABBR_NAME: TStringField;
    AQ25SALES_REP_NAME: TStringField;
    AQ25MANU_PART_NUMBER: TStringField;
    AQ25MANU_PART_DESC: TStringField;
    AQ25CUST_PART_PTR: TIntegerField;
    AQ_DETAIL: TADOQuery;
    AQ10: TADOQuery;
    AQ_SUM1: TADOQuery;
    AQ_TOOLS: TADOQuery;
    AQ10CUST_CODE: TStringField;
    AQ10ABBR_NAME: TStringField;
    AQ10SALES_REP_NAME: TStringField;
    AQ10CUSTOMER_PTR: TIntegerField;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Bevel1: TBevel;
    AQ25ANALYSIS_CODE_2: TStringField;
    AQ25customer_ptr: TIntegerField;
    AQ25COMM_ASSIGNED_BY_E_P: TIntegerField;
    AQ10COMM_ASSIGNED_BY_E_P: TIntegerField;
    AQ25ORIG_CUSTOMER: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spBtnExitClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure spBtnExportClick(Sender: TObject);
    procedure spbtnClearClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
  private
    sql_25,sql_10:string;
    whouse_ptr,cust_ptr,rep_ptr:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_form: Tmain_form;

implementation

uses Pick_item_single,constvar,common;

{$R *.dfm}
procedure Tmain_form.FormCreate(Sender: TObject);
begin
  if not app_init_2(self.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与系统管理员联系!',1);
    application.Terminate;
  end;

//  user_ptr:='785';
//  rkey73:='785';
//  vprev:='4';

  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  keypreview:=true;
end;

procedure Tmain_form.FormActivate(Sender: TObject);
var i:integer;
begin
  SG1.Cells[0,0] := '客户编号';
  SG1.Cells[1,0] := '客户简称';
  SG1.Cells[2,0] := '业务员';
  SG1.Cells[3,0] := '本厂编号';
  SG1.Cells[4,0] := '客户型号';
  SG1.cells[5,0] := '物料编号';
  SG1.Cells[6,0] := '关联原客户';
  SG1.colwidths[3]:=80;
  SG1.colwidths[4]:=120;  
  SG1.colwidths[5]:=120;
  SG1.colwidths[6]:=100;
  //==========================================
  SG2.Cells[0,0] := '客户编号';
  SG2.Cells[1,0] := '客户简称';
  SG2.Cells[2,0] := '业务员';
  //=====================================================================
  aq61.Close;
  aq61.Open;

  if not aq61.IsEmpty then
  begin
   SG1.ColCount:=SG1.ColCount+aq61.RecordCount*3;
   SG2.ColCount:=SG2.ColCount+aq61.RecordCount*3;
   for i:=0 to aq61.RecordCount-1 do
   begin
    SG1.Cells[7+i*3,0]:=trim(aq61CATEGORY.Value)+' 应收';
    SG1.Cells[8+i*3,0]:=trim(aq61CATEGORY.Value)+' 挂账';
    SG1.Cells[9+i*3,0]:=Trim(aq61CATEGORY.Value)+' 免费';
    SG1.ColWidths[7+i*3]:=length(trim(aq61CATEGORY.Value)+' 应收')*7;
    SG1.ColWidths[8+i*3]:=length(trim(aq61CATEGORY.Value)+' 挂账')*7;
    SG1.ColWidths[9+i*3]:=length(trim(aq61CATEGORY.Value)+' 免费')*7;

    SG2.Cells[3+i*3,0]:=trim(aq61CATEGORY.Value)+' 应收';
    SG2.Cells[4+i*3,0]:=trim(aq61CATEGORY.Value)+' 挂账';
    SG2.Cells[5+i*3,0]:=trim(aq61CATEGORY.Value)+' 免费';
    SG2.ColWidths[3+i*3]:=length(trim(aq61CATEGORY.Value)+' 应收')*7;
    SG2.ColWidths[4+i*3]:=length(trim(aq61CATEGORY.Value)+' 挂账')*7;
    SG2.ColWidths[5+i*3]:=length(trim(aq61CATEGORY.Value)+' 免费')*7;
    aq61.Next;
   end;
   aq61.First;
  end;
  //==============================================================================
  SG1.Cells[SG1.ColCount-6,0]:='累计应收';
  SG1.Cells[SG1.ColCount-5,0]:='累计挂账';
  SG1.Cells[SG1.ColCount-4,0]:='累计免费';
  SG1.Cells[SG1.ColCount-3,0]:='数量';
  SG1.Cells[SG1.ColCount-2,0]:='产值';
  SG1.Cells[SG1.ColCount-1,0]:='挂账占产值%';
  SG1.ColWidths[SG1.ColCount-2]:=80;
  SG1.ColWidths[SG1.ColCount-1]:=80;

  SG2.Cells[SG2.ColCount-6,0] := '累计应收';
  SG2.Cells[SG2.ColCount-5,0] := '累计挂账';
  SG2.Cells[SG2.ColCount-4,0] := '累计免费';
  SG2.Cells[SG2.ColCount-3,0] := '数量';
  SG2.Cells[SG2.ColCount-2,0] := '产值';
  SG2.Cells[SG2.ColCount-1,0] := '挂账占产值%';
  SG2.ColWidths[SG2.ColCount-2]:=80;
  SG2.ColWidths[SG2.ColCount-1]:=80;
end;

procedure Tmain_form.SpeedButton1Click(Sender: TObject);
var
 InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
 try
  case radiogroup1.ItemIndex of
   0:
   begin
    InputVar.Fields:='cust_code/客户代码/110,customer_name/客户名称/350';
    InputVar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
    inputvar.KeyField:='cust_code';
   end;
   1:
   begin
    InputVar.Fields := 'EMPL_CODE/销售代表代码/150,EMPLOYEE_NAME/销售代表名称/310';
    InputVar.Sqlstr :='select rkey,EMPL_CODE,EMPLOYEE_NAME from Data0005 order by EMPL_CODE';
    inputvar.KeyField:='EMPL_CODE';
   end;
  end;   //end case
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case radiogroup1.ItemIndex of
     0:
     begin
      edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      cust_ptr:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
     end;
     1:
     begin
      edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
      Self.rep_ptr:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
     end;
    end;
  end
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure Tmain_form.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex=0 then
  begin
   label3.Caption:='客户:';
   edit1.Text:='';
   edit1.Font.Color:=clblue;
  end
  else begin
   label3.Caption:='业务员:';
   edit1.Text:='';
   edit1.Font.Color:=clblue;
  end;
end;



procedure Tmain_form.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then perform(WM_NEXTDLGCTL,0,0); //按回车光标自动下移
end;

procedure Tmain_form.FormShow(Sender: TObject);
begin
  dtpk2.Date:=getsystem_date(aqtmp,1);
  dtpk1.Date:=dtpk2.Date-31;
  sql_25:=aq25.SQL.Text;
  sql_10:=aq10.SQL.Text;
  whouse_ptr:=0;
  with aqtmp do  //获取现在工厂
  begin
    combobox1.Items.Clear;
    combobox1.Items.Add('All-所有工厂');
    combobox1.ItemIndex:=0;
    sql.text:='select warehouse_code,abbr_name from data0015 order by rkey';
    open;
    first;
    while not Eof do
    begin
      combobox1.Items.Add(fieldvalues['warehouse_code']+'-'+fieldvalues['abbr_name']);
      Next;
    end;
    close;
  end;
end;

procedure Tmain_form.ComboBox1Change(Sender: TObject);
begin
  if combobox1.ItemIndex=0 then
    whouse_ptr:=0
  else
  with aqtmp do
  begin
    sql.Text:='select rkey from data0015 where warehouse_code=:p1';
    parameters.ParamByName('p1').Value:=copy(combobox1.Text,1,pos('-',combobox1.Text)-1);
    open;
    whouse_ptr:=fieldbyname('rkey').AsInteger;
    close;
  end;
end;

procedure Tmain_form.BitBtn1Click(Sender: TObject);
var i,j:integer;
    where,group,order:string;
    y_amount,n_amount,s_amount:double;
    total_amount: array of double;
begin
  screen.Cursor:=crAppStart; //等待光标

  for i:=1 to sg1.RowCount-1 do
    sg1.Rows[i].Clear;
  sg1.RowCount:=2;  //清空明细表
  setlength(total_amount,aq61.RecordCount*3+5);//设置数组下标个数
  for i:=low(total_amount) to high(total_amount) do total_amount[i]:=0;

  aq25.Close;
  aq25.SQL.Text:=sql_25;
  group:='GROUP BY Data0010.CUST_CODE,Data0010.ABBR_NAME,Data0025.MANU_PART_NUMBER,'+
         'Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2,Data0005.EMPLOYEE_NAME,data0025.ORIG_CUSTOMER,Data0060.CUST_PART_PTR,'+
         'data0060.customer_ptr,Data0060.COMM_ASSIGNED_BY_E_P';
  order:='ORDER BY Data0010.CUST_CODE';
  if radiogroup2.ItemIndex=0 then       //出货
  begin
    aq25.SQL.Text:=aq25.SQL.Text+'INNER JOIN Data0064 ON Data0064.SO_PTR=Data0060.RKEY ';
    where:='WHERE (Data0064.DATE_SHIPPED >=:d1) AND (Data0064.DATE_SHIPPED <=:d2)';
    if whouse_ptr<>0 then
      where:=where+' and Data0060.ship_reg_tax_id='''+inttostr(whouse_ptr)+'''';
    if (radiogroup1.ItemIndex=0) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.customer_ptr='''+inttostr(cust_ptr)+''''
    else
     if (radiogroup1.ItemIndex=1) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.COMM_ASSIGNED_BY_E_P='''+inttostr(rep_ptr)+'''';
  end
  else                           //订单
   begin
    where:='WHERE (Data0060.ENT_DATE >=:d1) AND (Data0060.ENT_DATE <=:d2)';
    if whouse_ptr<>0 then
      where:=where+' and Data0060.ship_reg_tax_id='''+inttostr(whouse_ptr)+'''';
    if (radiogroup1.ItemIndex=0) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.customer_ptr='''+inttostr(cust_ptr)+''''
    else
     if (radiogroup1.ItemIndex=1) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.COMM_ASSIGNED_BY_E_P='''+inttostr(rep_ptr)+'''';
   end;

  if (vprev='1') or (vprev='3') then
    where:=where + ' and data0010.rkey in (SELECT CUSTOMER_PTR '
                                         +'FROM dbo.DATA0100 '
                                         +'WHERE  CSI_PTR= '+ rkey73 +' )';
  aq25.SQL.Text:=aq25.SQL.Text+where+#13+group+#13+order;
  aq25.Parameters.ParamByName('d1').Value:=dtpk1.Date;
  if radiogroup2.ItemIndex=0 then
    aq25.Parameters.ParamByName('d2').Value:=dtpk2.Date
  else
   aq25.Parameters.ParamByName('d2').Value:=dtpk2.Date+1;
  aq25.Open;  //查出需要符合条件的的部件

  SG1.RowCount := aq25.RecordCount+2;
  SG1.Cells[0,SG1.RowCount-1]:='合计：';
  for i:=1 to aq25.RecordCount do
  begin
    SG1.Cells[0,i]:=aq25CUST_CODE.Value;
    SG1.Cells[1,i]:=aq25ABBR_NAME.Value;
    SG1.Cells[2,i]:=aq25SALES_REP_NAME.Value;
    SG1.Cells[3,i]:=aq25MANU_PART_NUMBER.Value;
    SG1.Cells[4,i]:=aq25MANU_PART_DESC.Value;
    sg1.Cells[5,i]:=aq25ANALYSIS_CODE_2.Value;   //客户物料号
    SG1.Cells[6,i]:=AQ25ORIG_CUSTOMER.Value;

    aq_sum.Close;  //汇总
    aq_sum.Parameters.ParamByName('ttype').Value:=radiogroup2.ItemIndex;
    aq_sum.Parameters.ParamByName('p1').Value:=DTPk1.Date;
    aq_sum.Parameters.ParamByName('p3').Value:=DTPk1.Date;
    aq_sum.Parameters.ParamByName('p2').Value:=DTPk2.Date;
    aq_sum.Parameters.ParamByName('p4').Value:=DTPk2.Date+1;
    aq_sum.Parameters.ParamByName('rkey25').Value:=aq25cust_part_ptr.Value;
    aq_sum.Parameters.ParamByName('rkey_25').Value:=aq25cust_part_ptr.Value;

    aq_sum.Parameters.ParamByName('rkey10').Value:=AQ25customer_ptr.Value;
    aq_sum.Parameters.ParamByName('rkey05').Value:=AQ25COMM_ASSIGNED_BY_E_P.Value;
    aq_sum.Parameters.ParamByName('rkey_10').Value:=AQ25customer_ptr.Value;
    aq_sum.Parameters.ParamByName('rkey_05').Value:=AQ25COMM_ASSIGNED_BY_E_P.Value;

    aq_sum.Prepared:=true;
    aq_sum.Open;
    if not aq_sum.IsEmpty then
    begin
      SG1.Cells[SG1.ColCount-2,i] := formatfloat('0.00',aq_sum.fieldbyname('money_sum').AsFloat);
      SG1.Cells[SG1.ColCount-3,i] := formatfloat('0.00',aq_sum.fieldbyname('qty_sum').AsFloat);
      total_amount[high(total_amount)]:=total_amount[high(total_amount)]+aq_sum.FieldValues['money_sum'];
      total_amount[high(total_amount)-1]:=total_amount[high(total_amount)-1]+aq_sum.FieldValues['qty_sum'];
    end;

    AQ_DETAIL.Close; //详细工具费用

    if radiogroup2.ItemIndex=0 then
    begin
        AQ_DETAIL.SQL.Text:='SELECT TOP 100 PERCENT Data0062.ADDL_CAT_PTR, SUM(Data0062.AMOUNT/D1.EXCH_RATE) '+
                            'AS Y_amount, SUM(Data0062.FREE_AMOUNT) AS N_amount,sum(data0062.costfree_amount) as s_amount '+
                            'FROM Data0062 INNER JOIN '+
                            '(SELECT Data0060.RKEY,Data0060.exch_rate,data0060.ORIG_CUSTOMER '+
                            'FROM Data0064 INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY '+
                            'inner join data0010 on data0060.customer_ptr=data0010.rkey '+
                            'WHERE (Data0064.DATE_SHIPPED >='''+datetostr(DTPk1.Date)+''') '+
                            'AND (Data0064.DATE_SHIPPED <='''+datetostr(DTPk2.Date)+''') '+
                            'AND data0060.CUST_PART_PTR ='+aq25cust_part_ptr.AsString+
                            ' and data0060.customer_ptr ='+AQ25customer_ptr.AsString+
                            ' and data0060.COMM_ASSIGNED_BY_E_P='+AQ25COMM_ASSIGNED_BY_E_P.AsString+
                            ' GROUP BY Data0060.RKEY,Data0060.exch_rate,data0060.ORIG_CUSTOMER) d1 ON Data0062.SO_PTR = d1.RKEY '+
                  'GROUP BY Data0062.ADDL_CAT_PTR '+
                  'ORDER BY Data0062.ADDL_CAT_PTR';
    end
    else
     begin
         aq_detail.SQL.Text:='SELECT Data0062.ADDL_CAT_PTR,'+
                          'SUM(Data0062.AMOUNT/Data0060.EXCH_RATE) AS Y_amount,SUM(Data0062.free_amount) '+
                          'AS N_amount,sum(data0062.costfree_amount) as s_amount '+
                          'FROM Data0060 INNER JOIN Data0062 ON Data0060.RKEY = Data0062.SO_PTR '+
                          'inner join data0010 on data0060.customer_ptr=data0010.rkey '+
                           'where data0060.ent_date>='''+datetostr(DTPk1.Date)+
                           ''' and data0060.ent_date<='''+datetostr(DTPk2.Date+1)+''' AND '+   //输入日期为带时分格式
                          'data0060.CUST_PART_PTR='+aq25cust_part_ptr.AsString+
                          ' and data0060.customer_ptr ='+AQ25customer_ptr.AsString+
                          ' and data0060.COMM_ASSIGNED_BY_E_P='+AQ25COMM_ASSIGNED_BY_E_P.AsString+
                          ' GROUP BY Data0062.ADDL_CAT_PTR '+
                          'order by Data0062.ADDL_CAT_PTR ';
     end;
    aq_detail.Open;

    if not aq_detail.IsEmpty then
    begin
     y_amount:=0;
     n_amount:=0;
     s_amount:=0;
     for j:=1 to aq_detail.RecordCount do
     begin
      if aq61.Locate('rkey',aq_detail.FieldValues['ADDL_CAT_PTR'],[]) then
      begin
       if aq_detail.FieldValues['Y_amount']>0 then
       begin
        SG1.Cells[7+(aq61.RecNo-1)*3,i]:=formatfloat('0.00',aq_detail.fieldbyname('Y_amount').AsFloat);
        total_amount[(aq61.RecNo-1)*3]:=total_amount[(aq61.RecNo-1)*3]+aq_detail.FieldValues['Y_amount'];
        y_amount:=y_amount+aq_detail.FieldValues['Y_amount'];
       end;
       if aq_detail.FieldValues['N_amount']>0 then
       begin
        SG1.Cells[8+(aq61.RecNo-1)*3,i]:=formatfloat('0.00',aq_detail.fieldbyname('N_amount').AsFloat);
        total_amount[(aq61.RecNo-1)*3+1]:=total_amount[(aq61.RecNo-1)*3+1]+aq_detail.FieldValues['N_amount'];
        n_amount:=n_amount+aq_detail.FieldValues['N_amount'];
       end;
       if aq_detail.FieldValues['S_amount']>0 then
       begin
        SG1.Cells[9+(aq61.RecNo-1)*3,i]:=formatfloat('0.00',aq_detail.fieldbyname('s_amount').AsFloat);
        total_amount[(aq61.RecNo-1)*3+2]:=total_amount[(aq61.RecNo-1)*3+2]+aq_detail.FieldValues['s_amount'];
        s_amount:=s_amount+aq_detail.FieldValues['s_amount'];
       end;
      end;
      aq_detail.Next;
     end;

     if y_amount>0 then
     begin
      SG1.Cells[SG1.ColCount-6,i]:=formatfloat('0.00',y_amount);
      total_amount[high(total_amount)-4]:=total_amount[high(total_amount)-4]+y_amount;
     end;
     if n_amount>0 then
     begin
      SG1.Cells[SG1.ColCount-5,i]:=formatfloat('0.00',n_amount);
      total_amount[high(total_amount)-3]:=total_amount[high(total_amount)-3]+N_amount;
      if SG1.Cells[SG1.ColCount-2,i]<>'' then
       if strtofloat(SG1.Cells[SG1.ColCount-2,i])>0 then
        SG1.Cells[SG1.ColCount-1,i] :=
        formatfloat('0.00',(n_amount/strtofloat(SG1.Cells[SG1.ColCount-2,i]))*100);
     end;
     if s_amount>0 then
     begin
      SG1.Cells[SG1.ColCount-4,i]:=formatfloat('0.00',s_amount);
      total_amount[high(total_amount)-2]:=total_amount[high(total_amount)-2]+s_amount;
     end;
    end;
    AQ25.Next;
  end; //循环结束

  for i:=low(total_amount) to high(total_amount)-4 do  //明细最后一行汇总
    SG1.Cells[7+i,SG1.RowCount-1]:=formatfloat('0.00',total_amount[i]);

  SG1.Cells[SG1.ColCount-2,SG1.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)]);
  SG1.Cells[SG1.ColCount-3,SG1.RowCount-1]:=formatfloat('0',total_amount[high(total_amount)-1]);
  SG1.Cells[SG1.ColCount-4,SG1.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-2]);
  SG1.Cells[SG1.ColCount-5,SG1.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-3]);
  SG1.Cells[SG1.ColCount-6,SG1.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-4]);
  if total_amount[high(total_amount)]>0 then
    SG1.Cells[SG1.ColCount-1,SG1.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-3]
                                            /total_amount[high(total_amount)]*100);

//=================================================================以下是汇总项目的计算
  for i:=1 to sg2.RowCount-1 do
    sg2.Rows[i].Clear;
  sg2.RowCount:=2;  //清空汇总表
  for i:=low(total_amount) to high(total_amount) do total_amount[i]:=0;

  aq10.Close;
  aq10.SQL.Text:=sql_10;
  group:='GROUP BY Data0010.CUST_CODE,Data0010.ABBR_NAME,Data0005.EMPLOYEE_NAME,'+
         'Data0060.CUSTOMER_PTR,Data0060.COMM_ASSIGNED_BY_E_P';
  order:='ORDER BY Data0010.CUST_CODE';
  if radiogroup2.ItemIndex=0 then
  begin
    aq10.SQL.Text:=aq10.SQL.Text+'INNER JOIN Data0064 ON Data0060.RKEY=Data0064.SO_PTR';
    where:='WHERE (Data0064.DATE_SHIPPED >=:d1) AND (Data0064.DATE_SHIPPED <=:d2)';
    if whouse_ptr<>0 then
      where:=where+' and Data0060.ship_reg_tax_id='''+inttostr(whouse_ptr)+'''';
    if (radiogroup1.ItemIndex=0) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.customer_ptr='''+inttostr(cust_ptr)+''''
    else
     if (radiogroup1.ItemIndex=1) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.COMM_ASSIGNED_BY_E_P='''+inttostr(rep_ptr)+'''';
  end
  else
  begin
    where:='WHERE (Data0060.ENT_DATE >=:d1) AND (Data0060.ENT_DATE <=:d2)';
    if whouse_ptr<>0 then
      where:=where+' and Data0060.ship_reg_tax_id='''+inttostr(whouse_ptr)+'''';
    if (radiogroup1.ItemIndex=0) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.customer_ptr='''+inttostr(cust_ptr)+''''
    else
     if (radiogroup1.ItemIndex=1) and (trim(edit1.Text)<>'') then
      where:=where+' and Data0060.COMM_ASSIGNED_BY_E_P='''+inttostr(rep_ptr)+'''';
  end;
  if (vprev='1') or (vprev='3') then
  where:=where + ' and data0010.rkey in (SELECT CUSTOMER_PTR '
                                       +'FROM dbo.DATA0100 '
                                       +'WHERE CSI_PTR= '+ rkey73 +' )';
  aq10.SQL.Text:=aq10.SQL.Text+where+#13+group+#13+order;
  aq10.Parameters.ParamByName('d1').Value:=dtpk1.Date;
  if radiogroup2.ItemIndex=0 then
    aq10.Parameters.ParamByName('d2').Value:=dtpk2.Date
  else
   aq10.Parameters.ParamByName('d2').Value:=dtpk2.Date+1;
  aq10.Open;

  SG2.RowCount := aq10.RecordCount+2;
  SG2.Cells[0,SG2.RowCount-1]:='合计：';

//==============================================================================
 for i:=1 to aq10.RecordCount do
 begin
  SG2.Cells[0,i]:=aq10CUST_CODE.Value;
  SG2.Cells[1,i]:=aq10ABBR_NAME.Value;
  SG2.Cells[2,i]:=aq10SALES_REP_NAME.Value;

  aq_sum1.Close; //产值统计
  aq_sum1.Parameters.ParamByName('ttype').Value:=radiogroup2.ItemIndex;
  aq_sum1.Parameters.ParamByName('p1').Value:=DTPk1.Date;
  aq_sum1.Parameters.ParamByName('p2').Value:=DTPk2.Date;
  aq_sum1.Parameters.ParamByName('p3').Value:=DTPk1.Date;
  aq_sum1.Parameters.ParamByName('p4').Value:=DTPk2.Date+1;
  aq_sum1.Parameters.ParamByName('rkey10').Value:=aq10customer_ptr.Value;
  aq_sum1.Parameters.ParamByName('rkey_10').Value:=aq10customer_ptr.Value;
  aq_sum1.Parameters.ParamByName('rkey05').Value:=AQ10COMM_ASSIGNED_BY_E_P.Value;
  aq_sum1.Parameters.ParamByName('rkey_05').Value:=AQ10COMM_ASSIGNED_BY_E_P.Value;
  aq_sum1.Open;

  if not aq_sum1.IsEmpty then
  begin
   SG2.Cells[SG2.ColCount-2,i] := formatfloat('0.00',aq_sum1.fieldbyname('money_sum').AsFloat);
   SG2.Cells[SG2.ColCount-3,i] := formatfloat('0.00',aq_sum1.fieldbyname('qty_sum').AsFloat);
   total_amount[high(total_amount)]:=total_amount[high(total_amount)]+aq_sum1.FieldValues['money_sum'];
   total_amount[high(total_amount)-1]:=total_amount[high(total_amount)-1]+aq_sum1.FieldValues['qty_sum'];
  end;

  aq_tools.Close;  //工具费用统计
  aq_tools.Parameters.ParamByName('ttype').Value:=radiogroup2.ItemIndex;
  aq_tools.Parameters.ParamByName('d1').Value:=DTPk1.Date;
  aq_tools.Parameters.ParamByName('d2').Value:=DTPk2.Date;
  aq_tools.Parameters.ParamByName('d3').Value:=DTPk1.Date;
  aq_tools.Parameters.ParamByName('d4').Value:=DTPk2.Date+1;
  aq_tools.Parameters.ParamByName('rkey10').Value:=aq10customer_ptr.Value;
  aq_tools.Parameters.ParamByName('rkey_10').Value:=aq10customer_ptr.Value;
  aq_tools.Parameters.ParamByName('rkey05').Value:=AQ10COMM_ASSIGNED_BY_E_P.Value;
  aq_tools.Parameters.ParamByName('rkey_05').Value:=AQ10COMM_ASSIGNED_BY_E_P.Value;
  aq_tools.Open;

  if not aq_tools.IsEmpty then
  begin
   y_amount:=0;
   n_amount:=0;
   s_amount:=0;
   for j:=1 to aq_tools.RecordCount do
   begin
    if aq61.Locate('rkey',aq_tools.FieldValues['ADDL_CAT_PTR'],[]) then
    begin
     if aq_tools.FieldValues['Y_amount']>0 then
     begin
      SG2.Cells[3+(aq61.RecNo-1)*3,i]:=formatfloat('0.00',aq_tools.fieldbyname('Y_amount').AsFloat);
      total_amount[(aq61.RecNo-1)*3]:=total_amount[(aq61.RecNo-1)*3]+aq_tools.FieldValues['Y_amount'];
      y_amount:=y_amount+aq_tools.FieldValues['Y_amount'];
     end;
     if aq_tools.FieldValues['N_amount']>0 then
     begin
      SG2.Cells[4+(aq61.RecNo-1)*3,i]:=formatfloat('0.00',aq_tools.fieldbyname('N_amount').AsFloat);
      total_amount[(aq61.RecNo-1)*3+1]:=total_amount[(aq61.RecNo-1)*3+1]+aq_tools.FieldValues['N_amount'];
      n_amount:=n_amount+aq_tools.FieldValues['N_amount'];
     end;
     if aq_tools.FieldValues['S_amount']>0 then
     begin
      SG2.Cells[5+(aq61.RecNo-1)*3,i]:=formatfloat('0.00',aq_tools.fieldbyname('S_amount').AsFloat);
      total_amount[(aq61.RecNo-1)*3+2]:=total_amount[(aq61.RecNo-1)*3+2]+aq_tools.FieldValues['S_amount'];
      s_amount:=s_amount+aq_tools.FieldValues['S_amount'];
     end;
    end;
    aq_tools.Next;
   end;
   if y_amount>0 then
   begin
    SG2.Cells[SG2.ColCount-6,i]:=formatfloat('0.00',y_amount);
    total_amount[high(total_amount)-4]:=total_amount[high(total_amount)-4]+y_amount;
   end;
   if n_amount>0 then
   begin
    SG2.Cells[SG2.ColCount-5,i]:=formatfloat('0.00',n_amount);
    total_amount[high(total_amount)-3]:=total_amount[high(total_amount)-3]+N_amount;
    if SG2.Cells[SG2.ColCount-2,i]<>'' then
     if strtofloat(SG2.Cells[SG2.ColCount-2,i])>0 then
      SG2.Cells[SG2.ColCount-1,i] :=
       formatfloat('0.00',(n_amount/strtofloat(SG2.Cells[SG2.ColCount-2,i]))*100);
   end;
   if s_amount>0 then
   begin
    SG2.Cells[SG2.ColCount-4,i]:=formatfloat('0.00',s_amount);
    total_amount[high(total_amount)-2]:=total_amount[high(total_amount)-2]+S_amount;
   end;
  end;
  aq10.Next;
 end;  //汇总统计循环结束

 for i:=low(total_amount) to high(total_amount)-5 do
  SG2.Cells[3+i,SG2.RowCount-1]:=formatfloat('0.00',total_amount[i]);

 SG2.Cells[SG2.ColCount-2,SG2.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)]);
 SG2.Cells[SG2.ColCount-3,SG2.RowCount-1]:=formatfloat('0',total_amount[high(total_amount)-1]);
 SG2.Cells[SG2.ColCount-4,SG2.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-2]);
 SG2.Cells[SG2.ColCount-5,SG2.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-3]);
 SG2.Cells[SG2.ColCount-6,SG2.RowCount-1]:=formatfloat('0.00',total_amount[high(total_amount)-4]);
 if total_amount[high(total_amount)]>0 then
   SG2.Cells[SG2.ColCount-1,SG2.RowCount-1]:=
     formatfloat('0.00',total_amount[high(total_amount)-3]/total_amount[high(total_amount)]*100);

 screen.Cursor:=crdefault;  //计算完成，恢复光标
end;

procedure Tmain_form.spbtnClearClick(Sender: TObject);
begin
  sg1.Refresh;
  sg2.Refresh;
end;

procedure Tmain_form.spBtnExportClick(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex=0 then
    export_grid_to_excel(sg1,'工具费用明细数据')
  else export_grid_to_excel(sg2,'工具费用汇总数据');
end;

procedure Tmain_form.spBtnExitClick(Sender: TObject);
begin
  application.Terminate;
end;

//应收挂帐金额输入的是本位币，不需转换，08-09-24
procedure Tmain_form.Edit1Exit(Sender: TObject);
begin
 if Trim(Edit1.Text)<>'' then
  if radiogroup1.ItemIndex=0 then
   begin
    aqtmp.SQL.Text:='select rkey from data0010 where cust_code=:p1 ';
    aqtmp.Parameters.ParamByName('p1').Value:=trim(edit1.Text);
    aqtmp.Open;
    if (not aqtmp.IsEmpty) then
      cust_ptr:=aqtmp.fieldbyname('rkey').AsInteger
    else
     begin
       cust_ptr:=0;
       Edit1.Text:='';
       ShowMsg('客户代码错误,请重新输入!',1);
     end;
   end
  else
   begin
    aqtmp.SQL.Text:='select rkey from data0005 where empl_code=:p1 ';
    aqtmp.Parameters.ParamByName('p1').Value:=trim(edit1.Text);
    aqtmp.Open;
    if (not aqtmp.IsEmpty) then
      rep_ptr:=aqtmp.fieldbyname('rkey').AsInteger
    else
     begin
       rep_ptr:=0;
       Edit1.Text:='';
       ShowMsg('业务员代码错误,请重新输入!',1);
     end;
   end;
end;

end.

