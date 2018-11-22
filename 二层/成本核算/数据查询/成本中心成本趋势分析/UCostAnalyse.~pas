unit UCostAnalyse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, DbChart,DateUtils, ExtDlgs;

type
  TFrmCostAnalyse = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl4: TPanel;
    pnl5: TPanel;
    ts2: TTabSheet;
    pnl6: TPanel;
    pnl7: TPanel;
    dbgrdh1: TDBGridEh;
    ds1: TDataSource;
    qry_detail: TADOQuery;
    btn1: TBitBtn;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    Label1: TLabel;
    btn_export: TBitBtn;
    lbl2: TLabel;
    cbb_CostItem: TComboBox;
    btn_qry: TButton;
    lbl_field: TLabel;
    strngfld_detailDSDesigner: TStringField;
    dtmfld_detailDSDesigner2: TDateTimeField;
    dtmfld_detailDSDesigner3: TDateTimeField;
    strngfld_detailDSDesigner4: TStringField;
    strngfld_detailDSDesigner5: TStringField;
    bcdfld_detailDSDesigner6: TBCDField;
    bcdfld_detailDSDesigner7: TBCDField;
    bcdfld_detailDSDesigner8: TBCDField;
    bcdfld_detailDSDesigner9: TBCDField;
    bcdfld_detailDSDesigner10: TBCDField;
    bcdfld_detailDSDesigner11: TBCDField;
    bcdfld_detailDSDesigner12: TBCDField;
    bcdfld_detailDSDesigner13: TBCDField;
    bcdfld_detailDSDesigner14: TBCDField;
    bcdfld_detailDSDesigner15: TBCDField;
    bcdfld_detailDSDesigner16: TBCDField;
    lbl34: TLabel;
    cbb_WH: TComboBox;
    qry_period: TADOQuery;
    dlgPnt1: TPrintDialog;
    dlgSP1: TSavePictureDialog;
    ud1: TUpDown;
    edt_PCount: TEdit;
    btn7: TSpeedButton;
    btn6: TSpeedButton;
    btn5: TSpeedButton;
    btn4: TSpeedButton;
    btn3: TSpeedButton;
    btn_print: TSpeedButton;
    atncfld_detailrkey: TAutoIncField;
    strngfld_detailDSDesigner1: TStringField;
    cht1: TChart;
    Series1: TBarSeries;
    lbl3: TLabel;
    cbb_cost: TComboBox;
    qry_cost: TADOQuery;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_QryCost2Click(Sender: TObject);
    procedure edt_costChange(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure btn_exportClick(Sender: TObject);
    procedure cbb_CostItemChange(Sender: TObject);
    procedure btn_selWHClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbb_WHChange(Sender: TObject);
    procedure btn_SelCoseClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure edt_PCountChange(Sender: TObject);
    procedure cbb_costChange(Sender: TObject);

  private
    { Private declarations }
     field_name,Pssql,Pstr,Fstr,Cstr: string;
    PreColumn : TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmCostAnalyse: TFrmCostAnalyse;

implementation
     uses udm,UCostPeriod,common, Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrmCostAnalyse.btn1Click(Sender: TObject);
begin
close;
end;

procedure TFrmCostAnalyse.FormShow(Sender: TObject);
var
  ssql:string;
begin
  pgc1.ActivePageIndex:=0;
  dtp1.date:= StartOfTheYear(now)-1;
  dtp2.date:=Now;

  Pssql:=qry_detail.SQL.Text;


//  field_name:= dbgrdh1.columns[3].fieldname;
//  PreColumn:=dbgrdh1.columns[3];
// dbgrdh1.columns[3].title.Color:=clRed;

    cbb_CostItem.Clear;
    cbb_CostItem.items.AddObject('产出面积',TObject(1));
    cbb_CostItem.items.AddObject('外发生产面积',TObject(2));
    cbb_CostItem.items.AddObject('直接人工',TObject(3));
    cbb_CostItem.items.AddObject('设备折旧',TObject(4));
    cbb_CostItem.items.AddObject('水电其它',TObject(5));
    cbb_CostItem.items.AddObject('外发费用',TObject(6));
    cbb_CostItem.items.AddObject('二类材料',TObject(7));
    cbb_CostItem.items.AddObject('一类材料',TObject(8));
    cbb_CostItem.items.AddObject('每平米制造费用',TObject(9));
    cbb_CostItem.items.AddObject('每平米材料费用',TObject(10));
    cbb_CostItem.items.AddObject('每平米外发费用',TObject(11));

   // if not qry_detail.Active  then qry_detail.Open;

 ssql:=' select rkey , abbr_name from data0015 ';
  dm.openqry(dm.qry_temp,ssql);
   cbb_WH.Clear;
   cbb_WH.Items.Add('全部');
  if not dm.qry_temp.IsEmpty then
  begin
   dm.qry_temp.First;

  while not dm.qry_temp.Eof do
  begin
   cbb_WH.items.AddObject(dm.qry_temp.fieldbyname('abbr_name').asstring,TObject(dm.qry_temp.fieldbyname('rkey').asinteger));
   dm.qry_temp.next;
  end;
  cbb_WH.ItemIndex:=0;
  end;
end;  

procedure TFrmCostAnalyse.FormCreate(Sender: TObject);
begin


  if not App_Init(dm.con1) then
   begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
   end;

  self.Caption :=Application.Title;
end;


procedure TFrmCostAnalyse.btn_QryCost2Click(Sender: TObject);
//var
//  InputVar: PDlgInput ;
//  ssql: string;
begin
//  try
//      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
//
//      InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50';
//       InputVar.Sqlstr := ' select  dept_code, dept_name,rkey from data0034 where rkey=cost_dept_ptr ';
//        InputVar.AdoConn :=dm.con1;
//        frmPick_Item_Single.InitForm_New(InputVar) ;
//           if frmPick_Item_Single.ShowModal=mrok then
//           begin
//          edt_cost2.text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
//          edt_cost2.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//            qry_detail.Filtered:=false;
//            qry_detail.Filter:=' b.dept_ptr='+inttostr(edt_cost2.tag)+' ';
//            qry_detail.Filtered:=true;
//          end;
//      finally
//    frmPick_Item_Single.Free ;
//  end;

end;


procedure TFrmCostAnalyse.edt_costChange(Sender: TObject);
begin
//   if qry_detail.isempty  then
//   begin
//    qry_detail.filtered:=false;
//    ShowMessage('请先查询出成本数据!');
//   exit;
//   end;
// //qry_detail.Filtered:=false;
//  if qry_detail.FieldByName(field_name).FieldKind = fkCalculated then  exit;
//  if qry_detail.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
//  begin
//    if trim(edt_cost.text) <> '' then
//    begin
//      if qry_detail.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
//        qry_detail.Filter:=field_name + ' like ''%' + trim(edt_cost.text) + '%'' ' //+ statussql
//      else if qry_detail.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
//        qry_detail.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_cost.text,0));//+ statussql;
//    end else
//       qry_detail.Filter:='';
//  end;
//
//  qry_detail.Filtered:=true;
//
//      if trim(edt_cost.text)=''  then    qry_detail.Filtered:=false;
end;

procedure TFrmCostAnalyse.dbgrdh1TitleClick(Column: TColumnEh);
begin
//if (Column.FieldName<> '成本中心代码') and (Column.FieldName<> '成本中心名称')   then exit;

if qry_detail.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_detail.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_detail.Sort:=Column.FieldName+' DESC';
  end;

//  if qry_detail.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
//
//  if (field_name <> column.FieldName) then
//  begin
//    lbl_field.Caption := column.Title.Caption ;
//    field_name := column.FieldName ;
//    edt_cost.SetFocus;
//    PreColumn.Title.Color := clBtnFace;
//    Column.Title.Color := clred ;
//    PreColumn := column ;
//  end else
//    edt_cost.SetFocus;
end;

procedure TFrmCostAnalyse.btn_exportClick(Sender: TObject);
begin

   if qry_detail.IsEmpty then exit;
   common.Export_dbGridEH_to_Excel(dbgrdh1,'成本中心成本趋势分析');

end;

procedure TFrmCostAnalyse.cbb_CostItemChange(Sender: TObject);

var
  i:integer;
begin
  if qry_detail.isempty  then
   begin
    ShowMessage('请先查询出成本数据!');
   exit;
   end;
  if qry_detail.IsEmpty then exit;
  if  Trim(cbb_WH.text)='全部' then
  begin
   ShowMessage('请先选择工厂!');
    pgc1.ActivePageIndex:=0;
  cbb_WH.SetFocus;
  exit;
  end;

   if  Trim(cbb_cost.text)='全部' then
  begin
   ShowMessage('请先选择成本中心!');
   pgc1.ActivePageIndex:=0;
   cbb_cost.SetFocus;
  exit;
  end; 

//  dbcht1.Series[0].DataSource:=qry_detail;
//  dbcht1.Series[0].XLabelsSource:=qry_detail.Fields[0].FieldName;
//  dbcht1.Series[0].YValues.ValueSource:= qry_detail.Fields[5+cbb_CostItem.itemindex].FieldName;
//  dbcht1.LeftAxis.Title.Caption:= cbb_CostItem.text;

    series1.Clear;

    qry_detail.DisableControls;
    qry_detail.First;
    while not qry_detail.Eof do
    begin
      Series1.Add(qry_detail.Fields[6+cbb_CostItem.itemindex].Value,qry_detail.Fields[1].AsString);
      qry_detail.Next;
    end;
    qry_detail.first;
   // Series1.ValueFormat:='#,##';
    cht1.LeftAxis.Title.Caption:=cbb_CostItem.Text;
    qry_detail.EnableControls;





end;

procedure TFrmCostAnalyse.btn_selWHClick(Sender: TObject);
//var
//  InputVar: PDlgInput ;
begin
//  try
//      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
//
//      InputVar.Fields := 'warehouse_code/工厂代码/100,warehouse_name/工厂名称/200,rkey/ID/50';
//       InputVar.Sqlstr := ' select warehouse_code , warehouse_name,rkey from data0015 ';
//        InputVar.AdoConn :=dm.con1;
//        frmPick_Item_Single.InitForm_New(InputVar) ;
//           if frmPick_Item_Single.ShowModal=mrok then
//           begin
//          edt_factory.text:= frmPick_Item_Single.adsPick.fieldbyname('warehouse_name').asstring;
//          edt_factory.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//          end;
//    finally
//    frmPick_Item_Single.Free ;
//  end;
end;

procedure TFrmCostAnalyse.btn_qryClick(Sender: TObject);
var
  ssql:string;
begin
 try
 frmCostPeriod:=TfrmCostPeriod.Create(nil);

  with frmCostPeriod.qry1 do
  begin
   close;
   Parameters.ParamByName('BDate').value:=FormatDateTime('yyyy-MM-dd',dtp1.date);
   Parameters.ParamByName('EDate').value:=FormatDateTime('yyyy-MM-dd',dtp2.date);
   open;
  end ;
  frmCostPeriod.ShowModal;

    if frmCostPeriod.ModalResult=mrok then
     begin
         pstr :=' and (';
     frmCostPeriod.qry1.first;
     while not frmCostPeriod.qry1.eof do
     begin
        if frmCostPeriod.qry1.fieldbyname('sel').asboolean then
        pstr := pstr+' a.end_date='''+frmCostPeriod.qry1.fieldbyname('end_date').asstring+''' or';
        
      frmCostPeriod.qry1.next;
     end;

        pstr:=copy(pstr,0,Length(pstr)-3) + ')';
        qry_detail.filtered:=false;
     dm.openqry(qry_detail,Pssql+pstr);

     
      with qry_cost do
      begin
       close;
       Parameters.ParamByName('BDate').value:=FormatDateTime('yyyy-MM-dd',dtp1.date);
       Parameters.ParamByName('EDate').value:=FormatDateTime('yyyy-MM-dd',dtp2.date);
       open;
      end ;

      cbb_cost.Clear;
      cbb_cost.Items.Add('全部');
      if not qry_cost.IsEmpty then
      begin
      qry_cost.First;

      while not qry_cost.Eof do
      begin
      cbb_cost.items.Add(qry_cost.fieldbyname('dept_name').asstring);
      qry_cost.next;
      end;
      cbb_cost.ItemIndex:=0;
      end;





     end;

 finally
  frmCostPeriod.Free;
 end;

end;

procedure TFrmCostAnalyse.Button1Click(Sender: TObject);
//var
//  InputVar: PDlgInput ;
//  ssql: string;
begin
//  try
//      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
//
//      InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50';
//       InputVar.Sqlstr := ' select  dept_code, dept_name,rkey from data0034 where rkey=cost_dept_ptr ';
//        InputVar.AdoConn :=dm.con1;
//        frmPick_Item_Single.InitForm_New(InputVar) ;
//           if frmPick_Item_Single.ShowModal=mrok then
//           begin
//          edt_cost.text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
//          edt_cost.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//          end;
//    finally
//    frmPick_Item_Single.Free ;
//  end;
//
//   // qry_detail.Filtered:=false;
//
//    qry_detail.Filter:=' b.dept_ptr= '+inttostr(edt_cost.tag)+' ';
//    qry_detail.Filtered:=true;

end;

procedure TFrmCostAnalyse.cbb_WHChange(Sender: TObject);
begin
//   if qry_detail.isempty  then
//   begin
//
//   ShowMessage('请先查询出成本数据!');
//   exit;
//   end;
  fstr:= ' and d.abbr_name ='''+cbb_WH.Text+''' ';

  if  cbb_WH.Text='全部' then
  begin
    dm.openqry(qry_detail,Pssql+pstr);
    fstr:='';
  end
  else
  begin
  dm.openqry(qry_detail,Pssql+pstr+ fstr);
  // qry_detail.Filtered:=false;
  end;

 
end;

procedure TFrmCostAnalyse.btn_SelCoseClick(Sender: TObject);
//var
//  InputVar: PDlgInput ;
//  ssql: string;
begin
//  try
//      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
//
//      InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50';
//       InputVar.Sqlstr := ' select  dept_code, dept_name,rkey from data0034 where rkey=cost_dept_ptr ';
//        InputVar.AdoConn :=dm.con1;
//        frmPick_Item_Single.InitForm_New(InputVar) ;
//           if frmPick_Item_Single.ShowModal=mrok then
//           begin
//          edt_cost.text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
//          edt_cost.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//            //qry_detail.Filtered:=false;
//            qry_detail.Filter:=' b.dept_ptr='+inttostr(edt_cost.tag)+' ';
//            qry_detail.Filtered:=true;
//          end;
//      finally
//    frmPick_Item_Single.Free ;
//  end;
end;

procedure TFrmCostAnalyse.btn_printClick(Sender: TObject);
begin
  if dlgPnt1.Execute then   cht1.Print;
end;

procedure TFrmCostAnalyse.btn3Click(Sender: TObject);
begin
  if dlgSP1.Execute then
    cht1.SaveToBitmapFile(dlgSP1.FileName+'.bmp');
end;

procedure TFrmCostAnalyse.btn4Click(Sender: TObject);
begin
  if cht1.view3doptions.Zoom<300 then
    cht1.view3doptions.Zoom := cht1.view3doptions.Zoom+2;
end;

procedure TFrmCostAnalyse.btn5Click(Sender: TObject);
begin
 if cht1.view3doptions.Zoom>2 then
    cht1.view3doptions.Zoom := cht1.view3doptions.Zoom-2;
end;

procedure TFrmCostAnalyse.btn6Click(Sender: TObject);
begin
  cht1.PreviousPage;
end;

procedure TFrmCostAnalyse.btn7Click(Sender: TObject);
begin
cht1.NextPage;
end;

procedure TFrmCostAnalyse.edt_PCountChange(Sender: TObject);
begin
  cht1.MaxPointsPerPage:=ud1.Position;
end;

procedure TFrmCostAnalyse.cbb_costChange(Sender: TObject);
begin

  if  Trim(cbb_WH.text)='全部' then
  begin
   ShowMessage('请先选择工厂!');
    pgc1.ActivePageIndex:=0;
  cbb_WH.SetFocus;
  exit;
  end;
  
  cstr:= ' and c.dept_name ='''+cbb_cost.Text+''' ';

  if  cbb_cost.Text='全部' then
  begin
  dm.openqry(qry_detail,Pssql+pstr+fstr);
   cstr:='';
  end
  else
  dm.openqry(qry_detail,Pssql+pstr+fstr+cstr);

end;

end.
