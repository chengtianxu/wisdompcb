unit spell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids, Mask, RzEdit, RzSpnEdt,math,
  DBGrids;

type
  TForm_spell = class(TForm)
    dtpk1: TDateTimePicker;
    Label5: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Edit2: TEdit;
    Label18: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    stg1: TStringGrid;
    stg2: TStringGrid;
    Label16: TLabel;
    Edit4: TEdit;
    UpDown1: TUpDown;
    Label4: TLabel;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure stg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure stg1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    function find_pcs_qty(rkey25,spec_rkey:string): STRING;
    function wo_number(cutno: string; pana_or_b: byte;
     total_row, curr_row,pan_b_qty: integer): string;
    procedure append_279(rkey25:integer);
    function return_totalpcs():Integer;
  public
    { Public declarations }
    rkey25,customer:integer;    //合并料号之本厂编号,客户指针 
  end;

var
  Form_spell: TForm_spell;

implementation

uses damo, putprod,common, DB, ADODB;

{$R *.dfm}

procedure TForm_spell.append_279(rkey25:integer);
begin
with dm.ADOQuery4 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT Data0278.SPEC_RKEY,'+#13+
  'Data0279.SOURCE_PTR,Data0279.PARAMETER_VALUE'+#13+
  'FROM   dbo.Data0278 INNER JOIN'+#13+
  'dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER_PTR'+#13+
  'WHERE (dbo.Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'','+#13+
  '''5'', ''6'', ''7'', ''8'', ''9'', ''P'')) AND'+#13+
  '(dbo.Data0279.SOURCE_PTR ='+inttostr(rkey25) +') AND'+#13+
  '(dbo.Data0279.IES_PROD = 1)'+#13+
  'ORDER BY dbo.Data0279.IES_CRP';       //'P'为大料PCS总数
  open;
 end;
 while not dm.ADOQuery4.Eof do   //加载全局开料参数
 begin
  dm.ADO279.AppendRecord([dm.ADOQuery4.fieldbyname('PARAMETER_VALUE').AsString,
                          dm.ADOQuery4.fieldbyname('SOURCE_PTR').AsInteger,
                          trim(dm.ADOQuery4.fieldbyname('SPEC_RKEY').AsString)]);
  dm.ADOQuery4.Next;
 end;
end;

procedure TForm_spell.FormActivate(Sender: TObject);
var
  v_sql:string;
begin
 stg1.Cells[0,0]:='参数代码';
 stg1.Cells[1,0]:='参数名称';
 stg1.Cells[2,0]:='参数值';
 stg1.ColWidths[3]:=-1;
with Stg2 do
 begin
  cells[0, 0] := '顺序';
  cells[1, 0] := '销售订单';
  cells[2, 0] := '本厂编号';
  cells[3, 0] := '客户型号';
  cells[4, 0] := '订单数量';
  cells[5, 0] := '回复交期';
  cells[6, 0] := '交货尺寸';
  cells[7, 0] := '交货单元数';
  cells[8, 0] := 'SET/PNL';
  cells[9, 0] := '投产数量';
  cells[10, 0] := '层数';
  cells[11, 0] := '订单参考';

  Cells[12,0] := 'rkey25';
  Cells[13,0] := 'rkey60';
  Cells[14,0] := 'rkey10';
  ColWidths[12]:=-1;
  ColWidths[13]:=-1;
  ColWidths[14]:=-1;
 end;
 dm.ADO279.Open;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT dbo.Data0278.PARAMETER_NAME,'+#13+
  'Data0278.PARAMETER_DESC, Data0278.SPEC_RKEY,'+#13+
  'Data0279.SOURCE_PTR,Data0279.PARAMETER_VALUE'+#13+
  'FROM         dbo.Data0278 INNER JOIN'+#13+
  'dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER_PTR'+#13+
  'WHERE (dbo.Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'','+#13+
  '''5'', ''6'', ''7'', ''8'', ''9'', ''P'')) AND'+#13+
  '(dbo.Data0279.SOURCE_PTR ='+inttostr(rkey25) +') AND'+#13+
  '(dbo.Data0279.IES_PROD = 1)'+#13+
  'ORDER BY dbo.Data0279.IES_CRP';       //'P'为大料PCS总数
  open;
 end;
 stg1.RowCount:=dm.ADOQuery1.RecordCount+1;
while not dm.ADOQuery1.Eof do   //加载全局开料参数
 begin
  stg1.Cells[0,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
  stg1.Cells[1,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARAMETER_DESC').AsString;
  stg1.Cells[2,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARAMETER_VALUE').AsString;
  stg1.Cells[3,dm.ADOQuery1.RecNo]:=trim(dm.ADOQuery1.fieldbyname('SPEC_RKEY').AsString);
  dm.ADO279.AppendRecord([dm.ADOQuery1.fieldbyname('PARAMETER_VALUE').AsString,
                          dm.ADOQuery1.fieldbyname('SOURCE_PTR').AsInteger,
                          trim(dm.ADOQuery1.fieldbyname('SPEC_RKEY').AsString)]);
  dm.ADOQuery1.Next;
 end;

 with dm.adoquery1 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where active_flag=''Y''';
   open;
   ComboBox2.Items.Clear;
   while not Eof do
   begin
     ComboBox2.Items.AddObject(fieldbyname('abbr_name').AsString,Pointer(FieldByName('rkey').AsInteger));
     Next;
   end;
   if ComboBox2.Items.Count>0 then
   ComboBox2.ItemIndex:=0;
  end;

  if ComboBox1.ItemIndex=4 then
   v_sql:= 'and data0060.prod_rel=''2'''
  else
   v_sql:= '';
 with DM.ADOQuery1 do
 begin
   Close;
   sql.Text:=
   'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+
   'dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.set_qty, dbo.SpellRelation.SetQnty,'+
   'dbo.Data0025.LAYERS, dbo.SpellRelation.SpellFrom_PTR,sum(data0060.PARTS_ORDERED) as PARTS_ORDERED '+
   'FROM  dbo.SpellRelation INNER JOIN '+
   'dbo.Data0025 ON dbo.SpellRelation.SpellFrom_PTR = dbo.Data0025.RKEY INNER JOIN '+
   'dbo.Data0060 ON dbo.SpellRelation.PO_PTR = dbo.Data0060.RKEY '+
   ' where SpellRelation.Spellto_PTR='+inttostr(rkey25)+
   ' and data0060.SpellTogether=1 '+v_sql+ //订单已确认，已合并
   ' GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+
   'dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.set_qty, dbo.SpellRelation.SetQnty,'+
   'dbo.Data0025.LAYERS, dbo.SpellRelation.SpellFrom_PTR';

   open;
   stg2.RowCount:=dm.ADOQuery1.RecordCount+1;
   BitBtn1.Enabled:=stg2.RowCount>=3;
   BitBtn3.Enabled:=BitBtn1.Enabled;
   while not Eof do
   begin
     stg2.Cells[0,RecNo]:=IntToStr(RecNo);
 //    stg2.Cells[1,RecNo]:=fieldbyname('SALES_ORDER').AsString;
     stg2.Cells[2,RecNo]:=fieldbyname('MANU_PART_NUMBER').AsString;
     stg2.Cells[3,RecNo]:=fieldbyname('MANU_PART_DESC').AsString;
     stg2.Cells[4,RecNo]:=fieldbyname('PARTS_ORDERED').AsString;
 //    stg2.Cells[5,RecNo]:=fieldbyname('SCH_DATE').AsString;
     stg2.Cells[6,RecNo]:=fieldbyname('ANALYSIS_CODE_1').AsString;
     stg2.Cells[7,RecNo]:=fieldbyname('set_qty').AsString;
     stg2.Cells[8,RecNo]:=fieldbyname('SetQnty').AsString;
     stg2.Cells[9,RecNo]:=IntToStr(fieldbyname('set_qty').AsInteger*
                                  fieldbyname('SetQnty').AsInteger);
     stg2.Cells[10,RecNo]:=fieldbyname('LAYERS').AsString;
//     stg2.Cells[11,RecNo]:=fieldbyname('REFERENCE_NUMBER').AsString;
     stg2.Cells[12,RecNo]:=fieldbyname('SpellFrom_PTR').AsString;
//     stg2.Cells[13,RecNo]:=fieldbyname('PO_PTR').AsString;
//     stg2.Cells[14,RecNo]:=fieldbyname('CUSTOMER_PTR').AsString;

     with dm.ADOQuery2 do
     begin
       close;
       SQL.Text:=
      'SELECT  top 1 Data0060.RKEY,dbo.Data0060.SALES_ORDER, dbo.Data0060.SCH_DATE,'+
      'data0060.CUSTOMER_PTR,dbo.Data0060.REFERENCE_NUMBER '+
      'FROM         dbo.SpellRelation  INNER JOIN '+
      ' dbo.Data0060 ON dbo.SpellRelation.PO_PTR = dbo.Data0060.RKEY '+
      'where SpellRelation.SpellTo_PTR='+inttostr(rkey25)+
      ' and SpellRelation.SpellFrom_PTR='+dm.ADOQuery1.FieldByName('SpellFrom_PTR').AsString+
      ' order by data0060.sch_date';
       Open;
      stg2.Cells[1,DM.ADOQuery1.RecNo]:=DM.ADOQuery2.fieldbyname('SALES_ORDER').AsString;
      stg2.Cells[5,DM.ADOQuery1.RecNo]:=DM.ADOQuery2.fieldbyname('SCH_DATE').AsString;
      stg2.Cells[11,DM.ADOQuery1.RecNo]:=DM.ADOQuery2.fieldbyname('REFERENCE_NUMBER').AsString;
      stg2.Cells[13,DM.ADOQuery1.RecNo]:=DM.ADOQuery2.fieldbyname('RKEY').AsString;
      stg2.Cells[14,DM.ADOQuery1.RecNo]:=DM.ADOQuery2.fieldbyname('CUSTOMER_PTR').AsString;
     end;
     self.append_279(fieldbyname('SpellFrom_PTR').AsInteger);
     next;
   end;
 end;

 with DM.ADOQuery1 do
  begin
   Close;
   sql.Text:=
   'SELECT  min(dbo.Data0060.SCH_DATE) as sch_date '+
   'FROM   dbo.SpellRelation INNER JOIN'+
   ' dbo.Data0060 ON dbo.SpellRelation.PO_PTR = dbo.Data0060.RKEY'+
   ' where SpellRelation.Spellto_PTR='+inttostr(rkey25)+
   ' and data0060.prod_rel=''2'' and data0060.SpellTogether=1'; //订单已确认，已合并
   open;
   if not FieldByName('sch_date').IsNull then
    dtpk1.Date:=fieldbyname('sch_date').AsDateTime
   else
    dtpk1.Date:=common.getsystem_date(dm.ADOQuery1,1)+strtoint(Edit3.text);
  end;

end;

procedure TForm_spell.stg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (acol=2) then
 stg1.Options:=stg1.Options+[goEditing]
else
 stg1.Options:=stg1.Options-[goEditing];
end;

procedure TForm_spell.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9',#13,#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm_spell.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as tedit).Text)='' then
 (sender as tedit).Text:='1';
end;

procedure TForm_spell.Edit4Change(Sender: TObject);
var
  i:integer;
begin
if (Edit4.Text<>'') and (stg2.RowCount>2) then
 begin
  for i:=1 to stg2.RowCount-1 do
  begin
     stg2.Cells[9,i]:=IntToStr(StrToInt(stg2.Cells[7,i])*
                                   StrToInt(stg2.Cells[8,i])*
                                   UpDown1.Position);
  end;
 end;
end;

function TForm_spell.find_pcs_qty(rkey25,spec_rkey:string): STRING;
begin
 dm.ADO279.Filter:='PRODUCTION_FLAG='+rkey25+
                    ' and spec_rkey='''+spec_rkey+'''';
                    
 if Trim(dm.ADO279PARAMETER_DESC.Value)<>'' then
  Result:=dm.ADO279PARAMETER_DESC.Value
 else
  Result:='0';
end;

function TForm_spell.wo_number(cutno: string; pana_or_b: byte;
  total_row, curr_row,pan_b_qty: integer): string;
var
 wo,zero:string;
 len:integer;
begin
  len:=Length(inttostr(total_row));
  zero:=StringofChar('0',Len-Length(IntToStr(curr_row)));  //补0字符数
  if pana_or_b=0 then       //A板作业单
   if pan_b_qty > 0 then    //有投B板
    wo:= cutno+'A'+'-'+inttostr(total_row)+'-'+zero+inttostr(curr_row)
   else
    wo:= cutno+'-'+inttostr(total_row)+'-'+zero+inttostr(curr_row)
  else               //b板作业单
   wo:= cutno+'B'+'-'+inttostr(total_row)+'-'+zero+inttostr(curr_row);
  result:=wo;
end;

function TForm_spell.return_totalpcs(): Integer;
var
  i,totalpcs:Integer;
begin
   totalpcs:=0;
 for i:=1 to stg2.RowCount-1 do
  totalpcs:=totalpcs+strtoint(stg2.Cells[7,i])*strtoint(stg2.Cells[8,i]);
  Result:=totalpcs;

//  stg2.cells[7, 0] := '交货单元数';
//  stg2.cells[8, 0] := 'SET/PNL';

end;

procedure TForm_spell.BitBtn1Click(Sender: TObject);
var
  i,j:Integer;
begin
 if StrToInt(self.find_pcs_qty(inttostr(self.rkey25),'3'))<>return_totalpcs() then
   begin
     ShowMsg('合并料号A板大料PCS总数不正确，不等于被合并料号PCS数之和',1);
     stg1.SetFocus;
   end
 else
try
 application.CreateForm(TForm_putprod,Form_putprod);
 dm.aqy04.close;
 dm.aqy04.Open;
 with Form_putprod do
 begin
   combobox1.ItemIndex:=self.ComboBox1.ItemIndex;//投产类型

    edit1.Text:='未超投';                 //超投标识

   whouseptr:=integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
   CUSTOMER_PTR:=self.customer;

   begin_step:=1;
   deptptr:=0;

   stg1.RowCount:=self.stg2.RowCount+1;

   stg1.Cells[0,1]:=dm.aqy04SEED_VALUE.Value+'-0';
   stg1.Cells[1,1]:=self.Edit1.Text;   //本厂编号
   stg1.Cells[2,1]:=datetostr(self.dtpk1.Date); //完工日期
   stg1.Cells[6,1]:=self.edit4.Text;            //投A板
   stg1.Cells[7,1]:='0';                        //投B板
   stg1.Cells[8,1]:='0';                       //超投率%
   stg1.Cells[10,1]:=self.Edit5.Text;  //大料规格
   stg1.Cells[11,1]:=inttostr(self.rkey25);
   stg1.Cells[12,1]:=self.find_pcs_qty(inttostr(self.rkey25),'3');       //A板PCS数
   stg1.Cells[13,1]:='0';                                                //B板PCS数

   stg1.Cells[3,1]:=IntToStr(strtoint(stg1.Cells[6,1])*strtoint(stg1.Cells[12,1])); //待计划数
   stg1.Cells[4,1]:=stg1.Cells[3,1];            //计划数
   stg1.Cells[5,1]:=stg1.Cells[3,1];            //投产数

   stg1.Cells[14,1]:=self.find_pcs_qty(inttostr(self.rkey25),'6')+'mm * '+
                       self.find_pcs_qty(inttostr(self.rkey25),'7')+'mm';     //A板尺寸
   stg1.Cells[15,1]:=self.find_pcs_qty(inttostr(self.rkey25),'8')+'mm * '+
                       self.find_pcs_qty(inttostr(self.rkey25),'9')+'mm';     //B板尺寸
   stg1.cells[16,1]:='0';  //'引用库存';
   stg1.cells[17,1]:='';   //'so';
   stg1.cells[18,1]:=IntToStr(self.customer);  //'customer';

   for i:=1 to ceil(UpDown1.Position/strtoint(self.Edit2.Text)) do
    begin
     stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,1];     //rkey25
     if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
      begin
       stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,1];
       stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,1];
      end;

     stg3.Cells[2,stg3.RowCount-1]:=wo_number(stg1.Cells[0,1],0,
                ceil(UpDown1.Position/strtoint(self.Edit2.Text)),i,0);

     stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[12,1];  //pcs/apnl

     if i < ceil(strtoint(stg1.Cells[6,1])/strtoint(self.Edit2.Text)) then
      begin
       stg3.Cells[4,stg3.RowCount-1]:= inttostr(strtoint(self.Edit2.Text));
       stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                strtoint(stg3.Cells[5,stg3.RowCount-1]));
      end
     else
      begin
       if strtoint(stg1.Cells[6,1]) mod strtoint(self.Edit2.Text)=0 then
        stg3.Cells[4,stg3.RowCount-1]:= inttostr(strtoint(self.Edit2.Text))
       else
        stg3.Cells[4,stg3.RowCount-1]:=
             inttostr(strtoint(stg1.Cells[6,1]) mod strtoint(self.Edit2.Text));

       stg3.Cells[3,stg3.RowCount-1]:=inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                              strtoint(stg3.Cells[5,stg3.RowCount-1]));
      end;
     stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,1];  //完工日期

     stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty(inttostr(self.rkey25),'6');
     stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty(inttostr(self.rkey25),'7');
     stg3.Cells[9,stg3.RowCount-1] :=  stg1.Cells[14,1];  //APNL尺寸
     stg3.Cells[11,stg3.RowCount-1]:= '0';             //A:0或者B:1板
     stg3.RowCount:=stg3.RowCount+1;    //加载a作业单
    end;

   for i:=1 to self.stg2.RowCount-1 do
    begin
     stg1.Cells[0,i+1]:=dm.aqy04SEED_VALUE.Value+'-'+inttostr(i);
     stg1.Cells[1,i+1]:=self.stg2.Cells[2,i];   //本厂编号
     if Self.ComboBox1.ItemIndex=4 then       //合拼投产
     begin
      stg1.Cells[2,i+1]:=self.stg2.Cells[5,i];   //完工日期
      stg1.Cells[3,i+1]:=Self.stg2.Cells[4,i];      //待计划数
     end
     else              //合拼补料
     begin
      stg1.Cells[2,i+1]:=datetostr(self.dtpk1.Date);   //完工日期
      stg1.Cells[3,i+1]:=Self.stg2.Cells[9,i];      //待计划数
     end;
     stg1.Cells[4,i+1]:=Self.stg2.Cells[9,i];      //计划数
     stg1.Cells[5,i+1]:=self.stg2.Cells[9,i];      //投产数

     stg1.Cells[6,i+1]:='0';            //投A板
     stg1.Cells[7,i+1]:='0';            //投B板

     if StrToInt(stg1.Cells[5,i+1])- StrToInt(stg1.Cells[3,i+1])>0 then
      stg1.Cells[8,i+1]:=           //超投率%
       FormatFloat('0.00',(StrToInt(stg1.Cells[5,i+1])- StrToInt(stg1.Cells[3,i+1]))/
        StrToInt(stg1.Cells[3,i+1])*100)
     else
      stg1.Cells[8,i+1]:='0';

     stg1.Cells[10,i+1]:=self.Edit5.Text;  //大料规格
     stg1.Cells[11,i+1]:=self.stg2.Cells[12,i];  //rkey25

     stg1.Cells[12,i+1]:=self.find_pcs_qty(self.stg2.Cells[12,i],'3'); //A板PCS数
     stg1.Cells[13,i+1]:=self.find_pcs_qty(self.stg2.Cells[12,i],'4'); //B板PCS数

     stg1.Cells[14,i+1]:=self.find_pcs_qty(self.stg2.Cells[12,i],'6')+'mm * '+
                         self.find_pcs_qty(self.stg2.Cells[12,i],'7')+'mm';     //A板尺寸
     stg1.Cells[15,i+1]:=self.find_pcs_qty(self.stg2.Cells[12,i],'8')+'mm * '+
                         self.find_pcs_qty(self.stg2.Cells[12,i],'9')+'mm';     //B板尺寸
     stg1.cells[16,i+1]:='0';  //'引用库存';

     stg1.cells[17,i+1]:=Self.stg2.Cells[1,i];  //'so';
     stg1.cells[18,i+1]:=self.stg2.Cells[14,i];  //'customer';

     for j:=1 to ceil(UpDown1.Position/strtoint(self.Edit2.Text)) do
      begin
       stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,i+1];     //rkey25
       if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
        begin
         stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,i+1];  //配料单号
         stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,i+1];   //本厂编号
        end;

       stg3.Cells[2,stg3.RowCount-1]:=wo_number(stg1.Cells[0,i+1],0,    //作业单号
                  ceil(UpDown1.Position/strtoint(self.Edit2.Text)),j,0);

       stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[12,i+1];  //pcs/apnl

       stg3.Cells[4,stg3.RowCount-1]:='0'; //投产PANEL数,子作业单投产panel都为0
       if j < ceil(strtoint(stg1.Cells[6,1])/strtoint(self.Edit2.Text)) then
        begin
         stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(self.Edit2.Text)*
                                                  strtoint(self.stg2.Cells[7,i])*
                                                  strtoint(self.stg2.Cells[8,i]));
        end
       else
        begin
         if strtoint(stg1.Cells[6,1]) mod strtoint(self.Edit2.Text)=0 then
          stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(self.Edit2.Text)*
                                                  strtoint(self.stg2.Cells[7,i])*
                                                  strtoint(self.stg2.Cells[8,i]))
         else
          stg3.Cells[3,stg3.RowCount-1]:=inttostr(
                              (strtoint(stg1.Cells[6,1]) mod strtoint(self.Edit2.Text))*
                              strtoint(Self.stg2.Cells[7,i])*
                              strtoint(self.stg2.Cells[8,i]));
        end;

       stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,i+1];  //完工日期
       stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty(stg1.Cells[11,i+1],'6');
       stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty(stg1.Cells[11,i+1],'7');
       stg3.Cells[9,stg3.RowCount-1] :=  stg1.Cells[14,i+1];  //APNL尺寸
       stg3.Cells[11,stg3.RowCount-1]:= '0';             //A:0或者B:1板
       stg3.RowCount:=stg3.RowCount+1;    //加载a作业单
      end;

    end;
 end;

 if Form_putprod.ShowModal=mrok then
  try
    with dm.ADOQuery2 do  // 记录投产的销售订单明细表535 13.01.07
     begin
      close;
      sql.Text:='SELECT  CUT_NO,SALES_ORDER,QTY_PLANNED '+
                'FROM  Data0535 where CUT_NO is null';
      open;
     end;

    for i:=1 to  stg2.RowCount-1 do  //主订单增加计划数，投产数量
    begin                             //增加投产销售订单明细
     with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='select prod_rel,to_be_planned,qty_plannned,issued_qty'+#13+
                 'from data0060 where sales_order='+quotedstr(stg2.Cells[1,i]);
      open;
      edit;
      fieldbyname('qty_plannned').AsInteger:=fieldbyname('qty_plannned').AsInteger+
                                              strtoint(stg2.Cells[9,i]);
      fieldbyname('issued_qty').AsInteger:=fieldbyname('issued_qty').AsInteger+
                                              strtoint(stg2.Cells[9,i]);
      post;
     end;

     with dm.ADOQuery1 do
     begin
       close;
       SQL.Text:=
      'SELECT Data0060.RKEY,dbo.Data0060.SALES_ORDER,data0060.to_be_planned  '+
      'FROM  dbo.SpellRelation  INNER JOIN '+
      ' dbo.Data0060 ON dbo.SpellRelation.PO_PTR = dbo.Data0060.RKEY '+
      'where SpellRelation.SpellTo_PTR='+inttostr(rkey25)+
      ' and SpellRelation.SpellFrom_PTR='+quotedstr(stg2.Cells[12,i])+
      ' order by data0060.sch_date';
       Open;
       while not Eof do
       begin
         dm.ADOQuery2.AppendRecord([Form_putprod.stg1.Cells[0,i+1],
                                   fieldbyname('SALES_ORDER').asstring,
                                   fieldbyname('to_be_planned').asinteger]);
         Next;
       end;
     end;

    end;
    if self.ComboBox1.ItemIndex=4 then
    with dm.ADOQuery1 do     //合拼料号下的所有销售订单变为已投产，待计划数为０
     begin
       close;
       SQL.Text:=
       'update data0060 set to_be_planned=0,prod_rel=''3'' '+
       'FROM  dbo.SpellRelation  INNER JOIN '+
       'dbo.Data0060 ON dbo.SpellRelation.PO_PTR = dbo.Data0060.RKEY '+
       'where SpellRelation.SpellTo_PTR='+inttostr(rkey25);
       ExecSQL;
     end;
      
   if dm.ADOConnection1.InTransaction then dm.ADOConnection1.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;  //end try

finally
  Form_putprod.Free;
end;
end;

procedure TForm_spell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADO279.Filter:='';
 dm.ADO279.CancelBatch();
 dm.ADO279.Close;
end;

procedure TForm_spell.stg1Exit(Sender: TObject);
var
   i:integer;
begin
 for i:=1 to stg1.RowCount-1  do
 begin

  dm.ADO279.Filter:='PRODUCTION_FLAG='+inttostr(self.rkey25)+
                    ' and spec_rkey='''+trim(stg1.Cells[3,i])+'''';
  dm.ADO279.Edit;
  dm.ADO279PARAMETER_DESC.Value:=stg1.Cells[2,i];
  dm.ADO279.Post;

 end;
end;

procedure TForm_spell.BitBtn3Click(Sender: TObject);
begin
  if messagedlg('取消合并投产是不可逆操作是您确定吗?',
                mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   with DM.ADOQuery1 do
    begin
     Close;
     sql.Text:=
     'update data0060 set SpellTogether=0 '+
     'FROM   dbo.SpellRelation INNER JOIN'+
     ' dbo.Data0060 ON dbo.SpellRelation.PO_PTR = dbo.Data0060.RKEY'+
     ' where SpellRelation.Spellto_PTR='+inttostr(rkey25)+
     ' and data0060.prod_rel=''2'' and data0060.SpellTogether=1'; //订单已确认，已合并
     ExecSQL;
    end;

   with DM.ADOQuery1 do
    begin
     Close;
     sql.Text:=
     'delete  SpellRelation '+
     ' where SpellRelation.Spellto_PTR='+inttostr(rkey25);
     if ExecSQL>0 then
      ShowMsg('取消操作成功',1)
     else
      ShowMsg('对不起，取消合拼失败，可能已被他人先取消了!',1);

    end;

  end;
end;

end.
