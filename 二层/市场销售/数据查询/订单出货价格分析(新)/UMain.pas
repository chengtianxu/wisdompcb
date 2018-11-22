unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons,ConstVar, DB, ADODB,DateUtils;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn_Exit: TBitBtn;
    btn_export: TBitBtn;
    btn_qry: TBitBtn;
    lbl_FIeld: TLabel;
    edt_value: TEdit;
    dbgrdhDBGrid1: TDBGridEh;
    qry_main: TADOQuery;
    ds1: TDataSource;
    rg_ct: TRadioGroup;
    lbl1: TLabel;
    edtRate: TEdit;
    lbl2: TLabel;
    edt_SRate: TEdit;
    qry1: TADOQuery;
    qry2: TADOQuery;
    strngfld_mainPROD_CODE: TStringField;
    strngfld_mainSALES_REP_NAME: TStringField;
    strngfld_mainCUST_CODE: TStringField;
    strngfld_mainMANU_PART_NUMBER: TStringField;
    strngfld_mainMANU_PART_DESC: TStringField;
    strngfld_mainSALES_ORDER: TStringField;
    strngfld_mainABBR_NAME: TStringField;
    fltfld_mainPARTS_ORDERED: TFloatField;
    bcdfld_mainSALES_DISCOUNT: TBCDField;
    bcdfld_mainUNIT_LEN: TBCDField;
    bcdfld_mainUNIT_WTH: TBCDField;
    intgrfld_mainTUNITS: TIntegerField;
    dtmfld_mainDATE_SHIPPED: TDateTimeField;
    strngfld_mainCURR_CODE: TStringField;
    strngfld_mainORIG_CUSTOMER: TStringField;
    fltfld_mainsqft_price: TFloatField;
    bcdfld_mainTUSAGE: TBCDField;
    intgrfld_mainquan_shipped: TIntegerField;
    fltfld_mainamount: TFloatField;
    fltfld_mainunit_sq: TFloatField;
    fltfld_mainTotalArea: TFloatField;
    fltfld_mainstand_rate: TFloatField;
    strngfld_mainPRODUCT_NAME: TStringField;
    strngfld_mainROW_NAME: TStringField;
    fltfld_mainpart_price: TFloatField;
    bcdfld_mainpart_price2: TBCDField;
    bcdfld_maintotal_cost: TBCDField;
    bcdfld_mainrate_margin: TBCDField;
    fltfld_mainDSDesigner: TFloatField;
    bcdfld_mainDSDesigner2: TBCDField;
    lbl3: TLabel;
    edt_JRate: TEdit;
    bcdfld_mainAllCost_PCS: TBCDField;
    bcdfld_mainbuhanshuijiage_Pcs: TBCDField;
    qry_mainPO_NUMBER: TStringField;
    qry_mainTNUMBERs: TStringField;
    procedure btn_qryClick(Sender: TObject);
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure dbgrdhDBGrid1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure rg_ctClick(Sender: TObject);
    procedure qry_mainAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdhDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    PreColumn :TColumnEh ;
    Field_name: string;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
          uses UDM,common,Pick_Item_Single, UQry;
{$R *.dfm}


procedure TFrmMain.btn_qryClick(Sender: TObject);
var
  i:integer;
  ssql,s:  string;
begin
  try
  frmqry:=Tfrmqry.create(nil);
   //frmqry.showmodal;
  with frmqry do
  begin

    if ShowModal <> mrok then Exit;
          // ShowMessage(' and  data0064.DATE_SHIPPED>='''+formatdatetime('yyyy-mm-dd',dtp1.date)+''' AND data0064.DATE_SHIPPED<'''+formatdatetime('yyyy-mm-dd',dtp2.date)+''' ');
       Screen.Cursor:=crHourGlass;
        qry_main.close;
        if rg_ct.itemindex=0  then
         ssql:= qry1.sql.text + ' and  data0064.DATE_SHIPPED>='''+formatdatetime('yyyy-mm-dd',dtp1.date)+''' AND data0064.DATE_SHIPPED<'''+formatdatetime('yyyy-mm-dd',dtp2.date)+''' '
        else
         ssql :=qry2.sql.text + ' and  data0098.RMA_DATE>='''+formatdatetime('yyyy-mm-dd',dtp1.date)+''' AND data0098.RMA_DATE<'''+formatdatetime('yyyy-mm-dd',dtp2.date)+''' ';

       if ((vprev <> '2') and (vprev <> '4')) then
        ssql:=ssql + ' and data0010.rkey in (SELECT   CUSTOMER_PTR   FROM    dbo.DATA0100   WHERE  (CSI_PTR ='+rkey73+' )) ';

        for i:= 1 to frmQry.SGrid1.RowCount - 2 do
          ssql:= ssql + frmqry.SGrid1.Cells[2,i] + #13;
         // ShowMessage(ssql);
        qry_main.sql.text:=ssql;
        qry_main.open;
        Screen.Cursor:=crDefault;;
  end;

     finally
       frmqry.free;
      end; 
end;

procedure TFrmMain.btn_ExitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btn_exportClick(Sender: TObject);
begin
  if not qry_main.IsEmpty  then 
Export_dbGridEH_to_Excel(dbgrdhDBGrid1, self.Caption);
end;

procedure TFrmMain.dbgrdhDBGrid1TitleClick(Column: TColumnEh);
begin
 IF qry_main.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      qry_main.Sort:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
     qry_main.Sort:= Column.FieldName + ' DESC';
    end;
    if Field_Name <> Column.FieldName then
    begin
      Field_Name:= Column.FieldName;
      lbl_FIeld.Caption:= Column.Title.Caption;
      edt_value.text:= '' ;
      edt_value.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end
    else
    if Field_Name = Column.FieldName then
    begin
      edt_value.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end;
//    if qry_main.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
//    begin
//      dtpDate.Date := getsystem_date(dm.aqGetDate,1);
//      edtFilter.SendToBack;
//    end
//    else
//    begin
//      edtFilter.BringToFront;
//      with dm.adsBrowse do
//      begin
//        Close;
//        FindCompentOnPanel(StatusSQL);
//        CommandText:= NewSQL + StatusSQL;
//        Prepared;
//        Open;
//      end;
//    end;
  end
  else
    ShowMessage('没有打开数据，请按: 查询 ');
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin

 Field_name:= dbgrdhDBGrid1.Columns[0].FieldName;
 PreColumn:=dbgrdhDBGrid1.Columns[0];
 
end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
   var
  S: String;
  //BDate,EDate: String;
begin
  IF  qry_main.isempty  Then   exit;

  qry_main.filtered:=false;
    qry_main.Filter := '';
    S:= '';
  
    if trim(edt_value.text) <> '' then
    begin
      if qry_main.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edt_value.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edt_value.text) + '%''';
      end
      else
      if qry_main.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edt_value.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edt_value.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edt_value.text);
        except
          ShowMessage('输入的内容不相符，只能输入数字！');
        end;
      end;
    end;
    qry_main.Filter:= S;
    qry_main.filtered:=true;

//    if qry_main.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
//    begin
//      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
//      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
//      dm.adsBrowse.Close;
//      if rgStatus.ItemIndex <> 2 then
//        S:= ' and Status = ' + inttostr(rgStatus.ItemIndex) +
//            ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +''''
//      else
//        S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
//      FindCompentOnPanel(StatusSQL);
//      dm.adsBrowse.CommandText:= NewSQL + S + StatusSQL;
//      dm.adsBrowse.Open;
//    end;

end;



procedure TFrmMain.rg_ctClick(Sender: TObject);
begin
   qry_main.Close;
if rg_ct.ItemIndex = 0 then
begin
  dbgrdhDBGrid1.Columns[13].Title.caption := '出货日期';
  dbgrdhDBGrid1.Columns[14].Title.caption := '出货数量';
  dbgrdhDBGrid1.Columns[15].Title.caption := '出货面积';
  dbgrdhDBGrid1.Columns[16].Title.caption := '出货金额(本币不含税)';
end
else
begin
  dbgrdhDBGrid1.Columns[13].Title.caption := '退货日期';
  dbgrdhDBGrid1.Columns[14].Title.caption := '退货数量';
  dbgrdhDBGrid1.Columns[15].Title.caption := '退货面积';
  dbgrdhDBGrid1.Columns[16].Title.caption := '退货金额(本币不含税)';
end;
end;

procedure TFrmMain.qry_mainAfterOpen(DataSet: TDataSet);
var
  tmp_Value, {tmp_Rate,} tmp_TotalCost, tmp_Value1,jin1, jin2: double;   // tmp_Qty,
  stand_soamount,stand_TotalCost:double;
begin
  tmp_value := 0;
 // tmp_Qty := 0;
  tmp_TotalCost := 0;
  tmp_Value1 := 0;
  stand_soamount := 0;
  stand_TotalCost := 0;
  jin1:=0;
  jin2:=0;
  try
   DataSet.DisableControls;
   DataSet.First;
   while not DataSet.Eof do
   begin
     tmp_Value1:= tmp_Value1 + DataSet.FieldByName('Amount').asfloat*(1- //实际销售金额*(1-佣金比)
       DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01);

     jin1:=jin1+DataSet.FieldByName('buhanshuijiage_Pcs').asfloat* DataSet.FieldByName('quan_shipped').asfloat;
     jin2:=jin2+DataSet.FieldByName('AllCost_PCS').asfloat* DataSet.FieldByName('quan_shipped').asfloat ;

                   //  AllCost_PCS
     tmp_TotalCost:= tmp_TotalCost + DataSet.FieldByName('Amount').asfloat*(1- //总成本=实际销售金额*(1-佣金比-毛利率)
       DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01-
       DataSet.FieldByName('rate_margin').asfloat*0.01);

     tmp_value := tmp_value + DataSet.FieldByName('Amount').asfloat; //实际销售金额
    // tmp_Qty := tmp_Qty + DataSet.FieldByName('TotalArea').asfloat;
     if DataSet.FieldByName('stand_rate').AsCurrency<>0 then
      begin
        stand_soamount:=stand_soamount+ DataSet.FieldByName('Amount').asfloat*(1-
           DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01);

        stand_TotalCost:=stand_TotalCost + DataSet.FieldByName('Amount').asfloat*
           (1- DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01-
                DataSet.FieldByName('stand_rate').asfloat*0.01);
      end;
    DataSet.Next;
   end;

   // edtProdQty.Text := FloatToStr(ExRoundTo(tmp_Qty,2));     //销售面积
   // edtProdValue.Text := FloatToStr(ExRoundTo(tmp_Value,2));  //实际销售金额

   if tmp_value <> 0 then                  //加权毛利率
     edtRate.Text:= FloatToStr(ExRoundTo(100*(tmp_Value1-tmp_TotalCost)/tmp_value,2))
   else
     edtRate.Text := '0.00';

   if jin1<>0  then
    edt_JRate.text:= FloatToStr(ExRoundTo(100*(jin1-jin2)/jin1,2))
    else
     edt_JRate.Text := '0.00';
     
   if stand_soamount <> 0 then                  //加权标准成本毛利率
     edt_SRate.Text:= FloatToStr(ExRoundTo(100*(stand_soamount-stand_TotalCost)/stand_soamount,2))
   else
     edt_SRate.Text := '0.00';

   //AutoFitWidth(DBGrid1);
  finally
   DataSet.First;
   Dataset.EnableControls;
  end;

//    dbgrdhDBGrid1.columns[15].Footer.fieldname:='TotalArea';
//     dbgrdhDBGrid1.columns[15].footer.valuetype:=fvtsum;
//
//     dbgrdhDBGrid1.columns[16].footer.fieldname:='amount';
//     dbgrdhDBGrid1.columns[16].footer.valuetype:=fvtsum;


end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin

  
//   rkey73:='72';
//   user_ptr:='3';
//   vprev:='4';

 if not App_Init_2(dm.con1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！', '提示', 1);
    application.Terminate;
  end;


  self.Caption := Application.Title;

end;

procedure TFrmMain.dbgrdhDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if (chr(key)='V') and (ssalt in shift) then
  begin
     showmessage(qry_main.SQL.Text)
//  if rg_ct.itemindex=0 then
//  showmessage(qry1.SQL.Text)
//  else
//  showmessage(qry2.SQL.Text);
  end;
end;

end.


