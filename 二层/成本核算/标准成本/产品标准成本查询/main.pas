unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, DB, ADODB,DateUtils,Math;
type
 TExcludeColumns = set of 0..255;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    ADOConnection1: TADOConnection;
    adsMain: TADODataSet;
    adsDept: TADODataSet;
    adsProdCost: TADODataSet;
    AQTMP: TADOQuery;
    CheckBox1: TCheckBox;
    adsMoreInfo: TADODataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
  private
    UnitType,layer_type:byte;
    Total_row,Total_All:double;
    FaWidth:array[0..79] of integer;
    procedure DoSearch(subSql:string);//执行查询
    procedure InitGridTitle;//显示StringGrid的标题
    procedure SetOptimalGridCellWidth(sg: TStringGrid;
     ExcludeColumns: TExcludeColumns);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses common,QuerySet;
{$R *.dfm}

procedure TfrmMain.SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
 var
  i : Integer;
  j : Integer;
  max_width : Integer;
begin
with sg do
 begin
  Canvas.Font.Assign(Font);
  for i := 0 to (ColCount - 1) do
  begin
   if i in ExcludeColumns then Continue;
   max_width := 0;
   for j := 0 to (RowCount - 1) do
    max_width := Math.Max(max_width,Canvas.TextWidth(Cells[i,j]));
   if max_width > 0 then
    ColWidths[i] := max_width + 4
   else
    ColWidths[i] := DefaultColWidth;
  end; { for }
 end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  if StringGrid1.Rowcount<=3 then exit;
  Export_Grid_to_Excel(StringGrid1,'产品成本查询')
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TfrmMain.DoSearch(subSql: string);
  procedure ReClearGrid;
  var i:integer;
  begin
    for i:=0 to StringGrid1.ColCount-1 do
     StringGrid1.Cells[i,2]:='';
  end;

var
  sql1,sqlstr,topsql:string;
  i,j:integer;
  sql2: string;
  ltmp,ltmp2: Double;
  ltmpstr: string;
begin
  if subsql='' then
  begin
    if StringGrid1.RowCount > 2 then
    begin
      StringGrid1.RowCount:=3;
      ReClearGrid;
    end;
    exit;
  end;
  InitGridTitle;
//1.查找所有需要统计的产品
//2。列出产品的工序，
//3。统计每个产品各个工序的成本数据，data0460

//获取外层产品
  sql1:=' SELECT D25.RKEY FROM Data0025 D25 INNER JOIN '+
        ' Data0060 D60 ON D25.RKEY = D60.CUST_PART_PTR INNER JOIN '+
        ' Data0064 D64 ON D60.RKEY = D64.SO_PTR INNER JOIN'+
        ' Data0008 D08 ON D25.PROD_CODE_PTR = D08.RKEY INNER JOIN'+
        ' Data0010 D10 ON D25.CUSTOMER_PTR = D10.RKEY '+ subsql+ //条件子句
        ' GROUP BY D25.RKEY ';
  topsql:= sql1;        // 顶层25产品
     {   ' GROUP BY D25.RKEY ,D25.MANU_PART_NUMBER, D25.MANU_PART_DESC, D10.CUST_CODE,'+
        ' D10.ABBR_NAME, D08.PROD_CODE, D08.PRODUCT_NAME,  D25.ttype ';
      }

  if layer_type=1 then //查询已出货的内层部件信息
   begin
    sqlstr:='SELECT D025.MANU_PART_NUMBER,D025.MANU_PART_DESC,D010.CUST_CODE,'+ //第二层
            'D010.ABBR_NAME, D008.PROD_CODE, D008.PRODUCT_NAME, D025.RKEY,'+
            'D025.ttype,D025.unit_sq,D025.EST_SCRAP '+
            'FROM Data0025 D025 inner join'+
            ' Data0008 D008 ON D025.PROD_CODE_PTR = D008.RKEY INNER JOIN'+
            ' Data0010 D010 ON D025.CUSTOMER_PTR = D010.RKEY'+
            //' left join tmp2 on tmp2.manu_part_number = D025.MANU_PART_NUMBER ' +
            ' where  d025.parent_ptr in ('+topsql+')'+
            ' GROUP BY D025.MANU_PART_NUMBER, D025.MANU_PART_DESC, D010.CUST_CODE,'+
            ' D010.ABBR_NAME, D008.PROD_CODE, D008.PRODUCT_NAME, D025.RKEY , '+
            'D025.ttype,D025.unit_sq, D025.EST_SCRAP';
    sqlstr:= sqlstr+#13+
    'union all'+#13+                                                    //连上第三层产品
    'SELECT D025.MANU_PART_NUMBER,D025.MANU_PART_DESC,D010.CUST_CODE,'+
            'D010.ABBR_NAME, D008.PROD_CODE, D008.PRODUCT_NAME, D025.RKEY,'+
            'D025.ttype,D025.unit_sq,D025.EST_SCRAP'+
            ' FROM Data0025 D025 inner join'+
            ' Data0008 D008 ON D025.PROD_CODE_PTR = D008.RKEY INNER JOIN'+
            ' Data0010 D010 ON D025.CUSTOMER_PTR = D010.RKEY inner join'+
            ' data0025 d025_1 on D025.parent_ptr=d025_1.rkey'+
            //' left join tmp2 on tmp2.manu_part_number = D025.MANU_PART_NUMBER ' +
            ' where  d025_1.parent_ptr in ('+topsql+')'+
            ' GROUP BY D025.MANU_PART_NUMBER, D025.MANU_PART_DESC, D010.CUST_CODE,'+
            ' D010.ABBR_NAME, D008.PROD_CODE, D008.PRODUCT_NAME, D025.RKEY,'+
            ' D025.ttype,D025.unit_sq, D025.EST_SCRAP  order by D025.MANU_PART_NUMBER ';

   sql1:='select rkey from data0025 d025 where parent_ptr in ('+sql1+')'; //第二层
    sql1:= sql1+#13+              //连上第三层产品
    'union all'+#13+
    'SELECT   Data0025.RKEY'+#13+
    'FROM   dbo.Data0025 INNER JOIN'+#13+
    ' dbo.Data0025 AS Data0025_1 ON dbo.Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
    ' where Data0025_1.parent_ptr in ('+topsql+')';

   end
  else //查询已出货的外层部件信息
    sqlstr:='SELECT D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D10.CUST_CODE,'+
            'D10.ABBR_NAME, D08.PROD_CODE, D08.PRODUCT_NAME, D25.RKEY,'+
            'D25.ttype,D25.unit_sq,D25.EST_SCRAP,SUM(D64.QUAN_SHIPPED) AS total_qty,'+
            'ROUND(SUM(D64.QUAN_SHIPPED * D25.unit_sq), 3) AS total_sqft,'+
            'ROUND(SUM(D64.QUAN_SHIPPED * D60.PARTS_ALLOC / D60.EXCH_RATE), 2) AS total_money,'+
            //'substring(max(convert(varchar,d85.qte_date,112)+convert(varchar,d85.markup)),9,7) as discount '+
            ' max(d85.rate_margin) as discount, ' +
            //' max(d85.rate_margin) as maolilv2 ' +
            ' max((d85.quote_taxprice - d85.total_cost) / d85.quote_taxprice * 100) as maolilv2 ' +
            ' FROM dbo.Data0025 D25 INNER JOIN '+
            ' Data0060 D60 ON D25.RKEY = D60.CUST_PART_PTR INNER JOIN '+
            ' Data0064 D64 ON D60.RKEY = D64.SO_PTR INNER JOIN'+
            ' Data0008 D08 ON D25.PROD_CODE_PTR = D08.RKEY INNER JOIN'+
            ' Data0010 D10 ON D25.CUSTOMER_PTR = D10.RKEY LEFT JOIN '+
            ' Data0085 D85 ON D60.QTE_PTR=D85.RKEY ' +#13+subsql+  //条件子句
            //' left join tmp2 on tmp2.manu_part_number = d25.MANU_PART_NUMBER '
            ' GROUP BY D25.MANU_PART_NUMBER, D25.MANU_PART_DESC, D10.CUST_CODE,'+
            ' D10.ABBR_NAME, D08.PROD_CODE, D08.PRODUCT_NAME, D25.RKEY , '+
            ' D25.ttype,D25.unit_sq, D25.EST_SCRAP '+//,d85.rate_margin '+
            //' tmp2.TUSAGE,tmp2.outare,tmp2.outprice,tmp2.gys ' +
            ' ORDER BY D25.MANU_PART_NUMBER ';

//    sql2 := ';with tmp1 as ' +
//            '(' +
//            ' select d25.manu_part_number,max(d207.rkey) as rkey207, max(d207.tdate)as date207 from data0207 d207 ' +
//            ' inner join data0468 d468 on d207.D0468_PTR = d468.rkey ' +
//            ' inner join data0060 d60 on d468.SO_NO = d60.SALES_ORDER ' +
//            ' inner join data0025 d25 on d25.rkey = d60.CUST_PART_PTR ' +
//            //where (d207.TDATE >= QuotedStr(formatdatetime('yyyy-mm-dd',DTPD1.Date)) AND (d207.TDATE <= '2014-02-17 23:59:00')
//            ' group by d25.manu_part_number), ' +
//            ' tmp2 as ( ' +
//            ' select d207.rkey,d25.manu_part_number, d25.TUSAGE, d17.INV_DESCRIPTION/*规格*/, ' +
//            ' d468.QUAN_ISSUED*d17.STOCK_SELL as outare/*发放面积*/, ' +
//            ' d207.QUANTITY*d22.PRICE*d456.exch_rate as outprice/*发放金额*/, ' +
//            ' d23.ABBR_NAME + d22.SUPPLIER2 as gys/*供应商*/ ' +
//            ' from data0207 d207 ' +
//            ' inner join tmp1 on d207.rkey = tmp1.rkey207 ' +
//            ' inner join data0468 d468 on d207.D0468_PTR = d468.rkey ' +
//            ' inner join data0492 d492 on d492.CUT_NO = d468.CUT_NO ' +
//            ' inner join data0025 d25 on d25.rkey = d492.BOM_PTR ' +
//            ' inner join data0022 d22 on d207.D0022_PTR = d22.rkey ' +
//            ' inner join data0456 d456 on d22.GRN_PTR = d456.rkey ' +
//            ' inner join data0023 d23 on d456.SUPP_PTR = d23.rkey ' +
//            ' inner join data0017 d17 on d207.INVENTORY_PTR = d17.rkey ' +
//            //where (d207.TDATE >= '2013-12-19 00:00:00') AND (d207.TDATE <= '2014-02-17 23:59:00')
//            ' ) ';

  adsMain.close;
  adsMain.CommandText:=sqlstr;      //1.获得产品列表
  adsMain.Prepared;
  adsMain.open;
  //如果没有产品，那么清空StringGrid数据
  if adsMain.IsEmpty then
  begin
    if StringGrid1.RowCount > 2 then
    begin
     StringGrid1.RowCount:=3;
     ReClearGrid;
    end;
    exit;
  end;

  //2.获得工序列表，group by相关产品的460工序
  sqlstr:= ' select D.*,data0034.dept_code,data0034.dept_name,data0034.seq_nr from ('+
           ' select dept_ptr from data0460 where bom_ptr in ('+sql1+')'+
           ' group by data0460.dept_ptr) D inner join data0034 on D.dept_ptr=data0034.rkey'+
           ' where data0034.is_cost_dept=1 order by data0034.seq_nr ';
  adsDept.Close;
  adsDept.CommandText:=sqlstr;
  adsDept.Prepared;
  adsDept.Open;
  if layer_type=0 then //外层
  begin
    StringGrid1.ColCount := 20 + adsDept.RecordCount;
    StringGrid1.Cells[7,1] := '大料利用率';
    StringGrid1.Cells[StringGrid1.ColCount-7-5,1]:='报废率';
    StringGrid1.Cells[StringGrid1.ColCount-6-5,1]:='报废成本';
    StringGrid1.Cells[StringGrid1.ColCount-5-5,1]:='小计';
    StringGrid1.Cells[StringGrid1.ColCount-4-5,1]:='出仓数量';
    StringGrid1.Cells[StringGrid1.ColCount-3-5,1]:='出仓面积';
    StringGrid1.Cells[StringGrid1.ColCount-2-5,1]:='销售金额';
    StringGrid1.Cells[StringGrid1.ColCount-1-5,1]:='报价毛利率';
    StringGrid1.Cells[StringGrid1.ColCount-1-4,1]:='标准成本毛利率';
    StringGrid1.Cells[StringGrid1.ColCount-4,1]:='供应商';
    StringGrid1.Cells[StringGrid1.ColCount-3,1]:='大料规格';
    StringGrid1.Cells[StringGrid1.ColCount-2,1]:='发放金额';
    StringGrid1.Cells[StringGrid1.ColCount-1,1]:='发放面积';
    
  end
  else begin //内层
    StringGrid1.Cells[7,1] := '大料利用率';
    StringGrid1.ColCount := 15 + adsDept.RecordCount;
    StringGrid1.Cells[StringGrid1.ColCount-3-4,1]:='报废率';
    StringGrid1.Cells[StringGrid1.ColCount-2-4,1]:='报废成本';
    StringGrid1.Cells[StringGrid1.ColCount-1-4,1]:='小计';
    StringGrid1.Cells[StringGrid1.ColCount-4,1]:='供应商';
    StringGrid1.Cells[StringGrid1.ColCount-3,1]:='大料规格';
    StringGrid1.Cells[StringGrid1.ColCount-2,1]:='发放金额';
    StringGrid1.Cells[StringGrid1.ColCount-1,1]:='发放面积';
  end;
  //加载工序信息到StringGrid中

   for i:=0 to StringGrid1.ColCount-1 do
    FaWidth[i] :=StringGrid1.ColWidths[i];

  while not adsDept.eof do begin
    StringGrid1.Cells[7+ adsDept.RecNo,0]:=adsDept.FieldByName('Dept_Code').AsString;
    StringGrid1.Cells[7+ adsDept.RecNo,1]:=adsDept.FieldByName('Dept_Name').AsString;
    adsDept.next;
  end;

  //3.获取产品的成本数据
  sqlstr:= ' select Bom_ptr,dept_ptr,sum(IsNUll(MATL_PER_SQFT_1,0) + '+
      'IsNULL(MATL_PER_SQFT_2,0) +IsNULL(Sub_Producing_Cost,0) + '+
      'IsNULL(Sub_Matl_Cost,0) +  IsNULL(ProducingCost,0)) as Total'+
      ' from data0460 where bom_ptr in('+ sql1+')'+
      ' group by Bom_ptr,dept_ptr';

  adsProdCost.Close;
  adsProdCost.CommandText := sqlstr;
  adsProdCost.Prepared;
  adsProdCost.Open;
  //统计结果写入StringGrid
  StringGrid1.RowCount:=3+ adsMain.RecordCount;//3代表预留三行，2行标题，1行汇总
  Total_All:=0;
  for i:=2 to adsMain.RecordCount+1 do    //2代表标题行
  begin
    StringGrid1.Rows[i].Clear;  //清除Grid内容
    StringGrid1.Cells[0,i]:= adsmain.fieldbyName('MANU_PART_NUMBER').AsString;
    StringGrid1.Cells[1,i]:= adsmain.fieldbyName('MANU_PART_DESC').AsString;
    StringGrid1.Cells[2,i]:= adsmain.fieldbyName('CUST_CODE').AsString;
    StringGrid1.Cells[3,i]:= adsmain.fieldbyName('ABBR_NAME').AsString;
    StringGrid1.Cells[4,i]:= adsmain.fieldbyName('PROD_CODE').AsString;
    StringGrid1.Cells[5,i]:= adsmain.fieldbyName('PRODUCT_NAME').AsString;
    if adsMoreInfo.Locate('manu_part_number',adsMain.fieldbyname('MANU_PART_NUMBER').AsString,[]) then
    begin
      StringGrid1.Cells[7,i]:= adsMoreInfo.fieldbyName('TUSAGE').AsString;
      StringGrid1.Cells[StringGrid1.ColCount-4,i]:=adsMoreInfo.fieldbyName('gys').AsString;//'供应商';
      StringGrid1.Cells[StringGrid1.ColCount-3,i]:=adsMoreInfo.fieldbyName('INV_DESCRIPTION').AsString;//'大料规格';
      StringGrid1.Cells[StringGrid1.ColCount-2,i]:=adsMoreInfo.fieldbyName('outprice').AsString;//'发放金额';
      StringGrid1.Cells[StringGrid1.ColCount-1,i]:=adsMoreInfo.fieldbyName('outare').AsString;//'发放面积';
    end;
    if layer_type=0 then
    begin
      StringGrid1.Cells[StringGrid1.ColCount-7-5 ,i]:= adsmain.fieldbyName('EST_SCRAP').AsString+'%';
      StringGrid1.Cells[StringGrid1.ColCount-4-5 ,i]:= adsmain.fieldbyName('total_qty').AsString;
      StringGrid1.Cells[StringGrid1.ColCount-3-5 ,i]:= adsmain.fieldbyName('total_sqft').AsString;
      StringGrid1.Cells[StringGrid1.ColCount-2-5 ,i]:= adsmain.fieldbyName('total_money').AsString;
      StringGrid1.Cells[StringGrid1.ColCount-1-5 ,i]:= adsmain.fieldbyName('discount').AsString + '%';
    end
    else StringGrid1.Cells[StringGrid1.ColCount-3-4 ,i]:= adsmain.fieldbyName('EST_SCRAP').AsString+'%';

    if adsmain.fieldbyName('ttype').asinteger = 0 then
      StringGrid1.Cells[6,i]:= '量产'
    else StringGrid1.Cells[6,i]:= '样板';
    //根据产品指针来过滤，获取某产品的各个工序的成本数据
    adsProdCost.Filter:='bom_ptr='+adsmain.fieldbyName('rKey').AsString;
    adsProdCost.Filtered:=true;
    Total_row:=0;
    ltmp2 := 0;
    ltmpstr := '';
    if adsProdCost.RecordCount>0 then
    begin
      for j:=1 to adsProdCost.RecordCount do
      begin
      //在工序列表中查找相应的工序，如果能找到，那么就写入SgringGrid
        if adsDept.Locate('Dept_ptr',adsProdCost.fieldbyName('dept_ptr').Value,[]) then
        begin
          if adsProdCost.FieldByName('Total').Asfloat <> 0 then
          begin
            ltmpstr := format('%9.5f',[adsProdCost.FieldByName('Total').asfloat*adsMain.fieldByName('Unit_sq').AsFloat]);
            ltmp2 := ltmp2+adsProdCost.FieldByName('Total').asfloat*adsMain.fieldByName('Unit_sq').AsFloat;
            if UnitType = 0 then //统计单位：平方米
             begin
              Total_row:=Total_row+adsProdCost.FieldByName('Total').asfloat;
              StringGrid1.Cells[adsDept.recno+7,i]:= format('%8.3f',[adsProdCost.FieldByName('Total').asfloat]);
             end
            else begin //pcs
              Total_row:=Total_row+adsProdCost.FieldByName('Total').asfloat*adsMain.fieldByName('Unit_sq').AsFloat;
              StringGrid1.Cells[adsDept.recno+7,i]:= format('%9.5f',
                [adsProdCost.FieldByName('Total').asfloat*adsMain.fieldByName('Unit_sq').AsFloat]);
            end;
          end;
        end;
        adsProdCost.next;
      end;
    end;
    if Total_row <> 0 then
     if layer_type=0 then  //外层
     begin
      StringGrid1.Cells[StringGrid1.ColCount-6-5,i]:= format('%8.3f',
        [Total_row*adsmain.fieldbyName('EST_SCRAP').ASFloat*0.01]);
      StringGrid1.Cells[StringGrid1.ColCount-5-5,i]:= format('%8.3f',
        [Total_row*(1+adsmain.fieldbyName('EST_SCRAP').ASFloat*0.01)]);


      //标准成本毛利利率
      if adsmain.fieldbyName('total_qty').AsInteger * adsmain.fieldbyName('total_money').AsFloat <> 0 then
      begin
        ltmp := adsmain.fieldbyName('total_money').AsFloat / adsmain.fieldbyName('total_qty').AsInteger;
        StringGrid1.Cells[StringGrid1.ColCount-1-4 ,i] :=
        FormatFloat('0.000',(ltmp -
        ltmp2*(1+adsmain.fieldbyName('EST_SCRAP').ASFloat*0.01)) / ltmp * 100) + '%';
      end else
        StringGrid1.Cells[StringGrid1.ColCount-1-4 ,i] := '';


     end
     else begin   //内层
      StringGrid1.Cells[StringGrid1.ColCount-2-4,i]:= format('%8.3f',
        [Total_row*adsmain.fieldbyName('EST_SCRAP').ASFloat*0.01]);
      StringGrid1.Cells[StringGrid1.ColCount-1-4,i]:= format('%8.3f',
        [Total_row*(1+adsmain.fieldbyName('EST_SCRAP').ASFloat*0.01)]);
     end;

    Total_All:=Total_All+Total_Row*(1+adsmain.fieldbyName('EST_SCRAP').ASFloat*0.01);
    adsMain.Next;
  end;
  
  StringGrid1.Rows[StringGrid1.RowCount-1].Clear;
  StringGrid1.Cells[0,StringGrid1.RowCount-1]:= '合计';
  if layer_type=0 then  //外层
    StringGrid1.Cells[StringGrid1.ColCount-5-5,StringGrid1.RowCount-1]:= format('%8.3f',[Total_All])
  else //内层
    StringGrid1.Cells[StringGrid1.ColCount-1-4,StringGrid1.RowCount-1]:= format('%8.3f',[Total_All]);

  if UnitType = 0 then //平方米
    StringGrid1.Cells[0,1]:='(单位:平方米)'
  else //PCS
    StringGrid1.Cells[0,1]:='(单位:PCS)';

  adsMain.close;
  adsDept.close;
  adsProdCost.close;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
var i:integer;
    sqlstr:string;
    sql2: string;
begin
  if frmQuerySet.ShowModal = mrOk then
  with frmQuerySet do
  begin
    sqlstr:=' WHERE (D64.Date_assign>='+QuotedStr(formatdatetime('yyyy-mm-dd',DTPD1.Date)
      +formatdatetime(' hh:nn:ss',dtpt1.Time))+') '
      +' and (D64.Date_assign<='+QuotedStr(formatdatetime('yyyy-mm-dd',DTPD2.Date)
      +formatdatetime(' hh:nn:ss',dtpt2.Time))+') ';
    for i:=1 to sgrid1.RowCount-2 do
     begin
      if sgrid1.Cells[2,i]<> '' then
        Sqlstr:=sqlstr+sgrid1.Cells[2,i]+#13;
     end;
    UnitType:=RadioGroup1.ItemIndex;      //平米成本,PC S成本
    layer_type:=Radiogroup2.ItemIndex;    //外层,内层
    sql2 := ';with tmp1 as ' +
            '(' +
            ' select d25.manu_part_number,max(d207.rkey) as rkey207, max(d207.tdate)as date207 from data0207 d207 ' +
            ' inner join data0468 d468 on d207.D0468_PTR = d468.rkey ' +
            ' inner join data0060 d60 on d468.SO_NO = d60.SALES_ORDER ' +
            ' inner join data0025 d25 on d25.rkey = d60.CUST_PART_PTR ' +
            ' where (d207.TDATE >= ' + QuotedStr(formatdatetime('yyyy-mm-dd',DTPD1.Date)) + ') AND (d207.TDATE <= ' + QuotedStr(formatdatetime('yyyy-mm-dd',DTPD2.Date)) + ')' +
            ' group by d25.manu_part_number), ' +
            ' tmp2 as ( ' +
            ' select d207.rkey,d25.manu_part_number, d25.TUSAGE, d17.INV_DESCRIPTION/*规格*/, ' +
            ' d468.QUAN_ISSUED*d17.STOCK_SELL as outare/*发放面积*/, ' +
            ' d207.QUANTITY*d22.PRICE*d456.exch_rate as outprice/*发放金额*/, ' +
            ' d23.ABBR_NAME + d22.SUPPLIER2 as gys/*供应商*/ ' +
            ' from data0207 d207 ' +
            ' inner join tmp1 on d207.rkey = tmp1.rkey207 ' +
            ' inner join data0468 d468 on d207.D0468_PTR = d468.rkey ' +
            ' inner join data0492 d492 on d492.CUT_NO = d468.CUT_NO ' +
            ' inner join data0025 d25 on d25.rkey = d492.BOM_PTR ' +
            ' inner join data0022 d22 on d207.D0022_PTR = d22.rkey ' +
            ' inner join data0456 d456 on d22.GRN_PTR = d456.rkey ' +
            ' inner join data0023 d23 on d456.SUPP_PTR = d23.rkey ' +
            ' inner join data0017 d17 on d207.INVENTORY_PTR = d17.rkey ' +
            ' where (d207.TDATE >= ' + QuotedStr(formatdatetime('yyyy-mm-dd',DTPD1.Date)) + ') AND (d207.TDATE <= ' + QuotedStr(formatdatetime('yyyy-mm-dd',DTPD2.Date)) + ')' +
            ' ) select * from tmp2' ;
//            ShowMessage(sql2);
            adsMoreInfo.Close;
            adsMoreInfo.CommandText := sql2;
            adsMoreInfo.Open;
            DoSearch(sqlstr);
  end;
end;

procedure TfrmMain.InitGridTitle;
begin
  StringGrid1.Rows[0].Clear;//清除Grid内容
  StringGrid1.Rows[1].Clear;//清除Grid内容
  StringGrid1.ColCount:= 9;
  StringGrid1.Cells[0,0]:= '本厂编号';
  StringGrid1.Cells[1,0]:= '客户型号';
  StringGrid1.Cells[2,0]:= '客户代码';
  StringGrid1.Cells[3,0]:= '客户简称';
  StringGrid1.Cells[4,0]:= '类型代码';
  StringGrid1.Cells[5,0]:= '类型名称';
  StringGrid1.Cells[6,0]:= '量产/样板';
  StringGrid1.Cells[8,0]:= '合计';
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin


  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;


  self.Caption :=Application.Title;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  InitGridTitle;
  frmQuerySet.DTPD1.Date:=date()-dayof(date())+1; //本月第一天
  frmQuerySet.DTPD2.Date:=date();
end;

procedure TfrmMain.StringGrid1KeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adsmain.CommandText);
end;

procedure TfrmMain.CheckBox1Click(Sender: TObject);
var
  i:integer;
  ExcludeColumns: TExcludeColumns;
begin
 for i:=0 to StringGrid1.ColCount-1 do
  if StringGrid1.ColWidths[i] < 0 then
   ExcludeColumns:=ExcludeColumns+[i];

  if CheckBox1.Checked then
   SetOptimalGridCellWidth(StringGrid1,ExcludeColumns)
  else
   for i:=0 to StringGrid1.ColCount-1 do
    if StringGrid1.ColWidths[i] > 0 then
     StringGrid1.ColWidths[i]:= FaWidth[i];
end;


end.
