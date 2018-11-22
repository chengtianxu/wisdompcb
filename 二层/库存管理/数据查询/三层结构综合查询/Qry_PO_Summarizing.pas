unit Qry_PO_Summarizing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, ComObj, 
  ComCtrls, MXPIVSRC, MXDB, MXGRID, Mxstore, TeEngine, Series, TeeProcs,
  Chart, Buttons, ExtDlgs, ImgList, RzDTP, Mask, RzEdit, ToolWin, RzTabs,
  DBClient, DBGridEh, Menus,mxcommon;

type
  TfrmQry_PO_Summarizing = class(TForm)
    DecisionSource1: TDecisionSource;
    SavePictureDialog1: TSavePictureDialog;
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnQry: TToolButton;
    btnFind: TToolButton;
    btnPrint: TToolButton;
    btnExport: TToolButton;
    btnExit: TToolButton;
    ImageList1: TImageList;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    labelKey: TLabel;
    dtpStartDate: TRzDateTimePicker;
    edtKey: TRzEdit;
    Label7: TLabel;
    dtpEndDate: TRzDateTimePicker;
    cdsPoDetail: TClientDataSet;
    cdsPoSum: TClientDataSet;
    cdsMatrlGroup: TClientDataSet;
    cdsBalance: TClientDataSet;
    cdsGroupBalance: TClientDataSet;
    dsPoDetail: TDataSource;
    dsPoSum: TDataSource;
    pagecontrol1: TRzPageControl;
    TabSheet6: TRzTabSheet;
    TabSheet7: TRzTabSheet;
    TabSheet8: TRzTabSheet;
    TabSheet9: TRzTabSheet;
    TabSheet10: TRzTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    Chart1: TChart;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Series1: TBarSeries;
    Chart2: TChart;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit3: TEdit;
    UpDown2: TUpDown;
    Series2: TBarSeries;
    cdsColumns: TClientDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    DecisionCube2: TDecisionCube;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ADOquery1CalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure dtpStartDateChange(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N4Click(Sender: TObject);
    procedure cdsPoDetailAfterOpen(DataSet: TDataSet);
    procedure edtKeyChange(Sender: TObject);
  private
    { Private declarations }
    po_fieldname,pota_fieldname:string;
    v_colwidth: array of integer;
  public
    { Public declarations }
    bDate,eDate:Tdate;iType,iFactory,pQryNo:integer;
    procedure InitForm(QryNo:integer;vData:Olevariant);
  end;

var
  frmQry_PO_Summarizing: TfrmQry_PO_Summarizing;

implementation
uses ConstDeclare,Client_FUnc,PUBFunc,QryColumnSet,dlgRecordFind;


{$R *.dfm}

procedure TfrmQry_PO_Summarizing.FormActivate(Sender: TObject);
begin
  self.po_fieldname:='PO_NUMBER';
  self.pota_fieldname:='group_name';
  self.Series1.Clear;

  while not self.cdsbalance.Eof do
  begin
    Series1.Add(cdsbalance.FieldValues['purch_amount'],cdsbalance.Fields[0].value);
    cdsbalance.Next;
  end;
  while not self.cdsGroupBalance.Eof do
  begin
    Series2.Add(cdsGroupBalance.fieldbyName('purch_amount').Value,cdsGroupBalance.fieldbyName('ABBR_NAME').Value);
    cdsGroupBalance.Next;
  end;
  chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图'; 
  pagecontrol1.ActivePageIndex:=0;
end;

procedure TfrmQry_PO_Summarizing.PageControl1Change(Sender: TObject);
begin
  combobox1.Enabled:= pagecontrol1.ActivePageIndex = 3;
  combobox2.Enabled:=combobox1.Enabled ;
  CheckBox1.Enabled :=combobox1.Enabled;
  if pagecontrol1.ActivePageIndex = 0 then
    StatusBar1.Panels[1].Text := IntToStr(cdsPoDetail.RecordCount)
  else
    StatusBar1.Panels[1].Text := IntToStr(cdsPoSum.RecordCount);

  if pagecontrol1.ActivePageIndex > 1 then
  begin
    edtKey.Visible:= false;
    LabelKey.Visible := false;
    Label7.Visible := false;
    dtpStartDate.Visible := Label7.Visible;
    dtpEndDate.Visible := Label7.Visible;
  end;
end;

procedure TfrmQry_PO_Summarizing.ADOquery1CalcFields(DataSet: TDataSet);
begin
{ case DataSet.FieldByName('status').asinteger of
  1: adoquery1po_stat.Value := '待审核';
  2: adoquery1po_stat.Value := '被退回';
  3: adoquery1po_stat.Value := '已保留';
  4: adoquery1po_stat.Value := '已暂缓';
  5: adoquery1po_stat.Value := '已审核';
  6: adoquery1po_stat.Value := '已收货';
  7: adoquery1po_stat.Value := '已完成';
  8: adoquery1po_stat.Value := '未提交';
 end;

 if adoquery1PO_TYPE.Value = 'S' then
  adoquery1Ttype.Value := '生产物料'
 else
  adoquery1Ttype.Value := '非生产物料';

 if adoquery1discount2_days.Value=0 then
  adoquery1in_out.Value := '国内'
 else
  adoquery1in_out.Value := '国外';
  }
end;

procedure TfrmQry_PO_Summarizing.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
chart2.View3D:=self.CheckBox1.Checked;
end;

procedure TfrmQry_PO_Summarizing.ComboBox2Change(Sender: TObject);
begin
case combobox2.ItemIndex of
0:begin
   self.Series1.Clear;
   cdsBalance.First;
   while not cdsBalance.Eof do
    begin
     Series1.Add(cdsBalance.FieldValues['purch_amount'],cdsBalance.Fields[0].value);
     cdsBalance.Next;
    end;
   self.Series1.ValueFormat:='0.00';
   self.Chart1.LeftAxis.AxisValuesFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
1:begin
   self.Series1.Clear;
   self.cdsBalance.First;
   while not cdsBalance.Eof do
    begin
     Series1.Add(cdsBalance.FieldValues['purch_quan'],cdsBalance.Fields[0].value);
     cdsBalance.Next;
    end;
   self.Series1.ValueFormat:='0.00';
   self.Chart1.LeftAxis.AxisValuesFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
2:begin
   self.Series1.Clear;
   self.cdsBalance.First;
   while not self.cdsBalance.Eof do
    begin
     Series1.Add(cdsBalance.FieldValues['amoney_percent'],cdsBalance.Fields[0].value);
     cdsBalance.Next;
    end;
   self.Series1.ValueFormat:='0.0000%';
   self.Chart1.LeftAxis.AxisValuesFormat:='0%';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
3:begin
   self.Series1.Clear;
   self.cdsBalance.First;
   while not cdsBalance.Eof do
    begin
     Series1.Add(cdsBalance.FieldValues['qty_percent'],cdsBalance.Fields[0].value);
     cdsBalance.Next;
    end;
   self.Series1.ValueFormat:='0.0000%';
   self.Chart1.LeftAxis.AxisValuesFormat:='0%';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
end;
end;

procedure TfrmQry_PO_Summarizing.ComboBox1Change(Sender: TObject);
var
  vData:Olevariant;
  ErrorMsg:widestring;
begin
  if coMyQuery.Get_Po_Bala_Data(iType,vData,ErrorMsg,bDate,eDate,iFactory,pQryNo,combobox1.ItemIndex) then
    cdsBalance.Data := vData
  else
    ShowMsg(ErrorMsg,1);
  self.ComboBox2Change(sender);
end;

procedure TfrmQry_PO_Summarizing.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton2Click(Sender: TObject);
begin
chart1.NextPage;

end;

procedure TfrmQry_PO_Summarizing.SpeedButton1Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton3Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TfrmQry_PO_Summarizing.SpeedButton4Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton5Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TfrmQry_PO_Summarizing.ComboBox3Change(Sender: TObject);
var
  vData:Olevariant;
  ErrorMsg:widestring;
begin
  cdsMatrlGroup.MoveBy(combobox3.ItemIndex+1-cdsMatrlGroup.RecNo);
  if coMyQuery.Get_Po_Group_Bala_Data(iType,vData,ErrorMsg,bDate,eDate,iFactory,pQryNo,cdsMatrlGroup.fieldByName('rKey').AsInteger) then
    cdsGroupBalance.Data := vData
  else
    ShowMsg(ErrorMsg,1);
  ComboBox4Change(sender);
end;

procedure TfrmQry_PO_Summarizing.ComboBox4Change(Sender: TObject);
begin
case combobox4.ItemIndex of
0:begin                             //采购金额
   self.Series2.Clear;
   cdsGroupBalance.First;
   while not cdsGroupBalance.Eof do
    begin
     Series2.Add(cdsGroupBalance.FieldByName('purch_amount').Value,cdsGroupBalance.FieldByName('ABBR_NAME').Value);
     cdsGroupBalance.Next;
    end;
   self.Series2.ValueFormat:='0.00';
   self.Chart2.LeftAxis.AxisValuesFormat:='0';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
1:begin                            //采购数量
   self.Series2.Clear;
   self.cdsGroupBalance.First;
   while not self.cdsGroupBalance.Eof do
    begin
     Series2.Add(cdsGroupBalance.FieldByName('purch_quan').Value,cdsGroupBalance.FieldByName('ABBR_NAME').Value);
     cdsGroupBalance.Next;
    end;
   self.Series2.ValueFormat:='0.00';
   self.Chart2.LeftAxis.AxisValuesFormat:='0';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
2:begin                                //金额百分比
   self.Series2.Clear;
   self.cdsGroupBalance.First;
   while not self.cdsGroupBalance.Eof do
    begin
     Series2.Add(cdsGroupBalance.FieldByName('amoney_percent').Value,cdsGroupBalance.FieldByName('ABBR_NAME').Value);
     cdsGroupBalance.Next;
    end;
   self.Series2.ValueFormat:='0.0000%';
   self.Chart2.LeftAxis.AxisValuesFormat:='0%';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
3:begin                              //数量百分比
   self.Series2.Clear;
   self.cdsGroupBalance.First;
   while not self.cdsGroupBalance.Eof do
    begin
     Series2.Add(cdsGroupBalance.FieldByName('qty_percent').Value,cdsGroupBalance.FieldByName('ABBR_NAME').Value);
     cdsGroupBalance.Next;
    end;
   self.Series2.ValueFormat:='0.0000%';
   self.Chart2.LeftAxis.AxisValuesFormat:='0%';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
end;
end;

procedure TfrmQry_PO_Summarizing.Edit3Change(Sender: TObject);
begin
self.Chart2.MaxPointsPerPage:=updown2.Position;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton12Click(Sender: TObject);
begin
chart2.NextPage;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton11Click(Sender: TObject);
begin
chart2.PreviousPage;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton10Click(Sender: TObject);
begin
  IF Chart2.view3doptions.Zoom>1 THEN
    Chart2.view3doptions.Zoom := Chart2.view3doptions.Zoom-2;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton9Click(Sender: TObject);
begin
  IF Chart2.view3doptions.Zoom<300 THEN
    Chart2.view3doptions.Zoom := Chart2.view3doptions.Zoom+2;
end;

procedure TfrmQry_PO_Summarizing.SpeedButton8Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart2.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TfrmQry_PO_Summarizing.SpeedButton7Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart2.Print;
end;

procedure TfrmQry_PO_Summarizing.InitForm(QryNo: integer;
  vData: Olevariant);
begin
  cdsPoDetail.Data := vData[0];
  cdsPoSum.Data := vData[1];
  cdsBalance.Data := vData[2];
  cdsMatrlGroup.Data := vData[3];

  if cdsPoSum.RecordCount > 1 then   //如果记录数大于2 才能进行维数分析
    DecisionCube2.DataSet:=cdsPoSum;

  cdsMatrlGroup.First;
  while not cdsMatrlGroup.eof do begin
    combobox3.Items.Add(trim(cdsMatrlGroup.FieldByName('inv_group_name').Asstring)
        +trim(cdsMatrlGroup.FieldByName('inv_group_desc').Asstring));
    cdsMatrlGroup.next;
  end;
  combobox3.ItemIndex:=0;
  ComboBox3Change(self);  

  cdsColumns.close;
  cdsColumns.Data:=vData[4];
  cdsColumns.open;
  Add_Columns_ToDBGrid(DBGridEh1,cdsColumns);

  cdsColumns.Close;
  cdsColumns.Data:=vData[5];
  cdsColumns.open;
  Add_Columns_ToDBGrid(DBGridEh2,cdsColumns);
  cdsColumns.Close;
 
  if qryNo = qry_Prchs_summarizing then
  begin
    TabSheet6.Caption := '采购订单明细';
  end
  else
  begin
    TabSheet6.Caption := '按采购收货明细';
  end;
  FormActivate(nil);
  Show;
end;

procedure TfrmQry_PO_Summarizing.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  frmQry_PO_Summarizing := nil;
end;

procedure TfrmQry_PO_Summarizing.btnFindClick(Sender: TObject);
var
  P:TPoint;
begin
  P.X := BtnFind.ClientOrigin.X;
  P.Y := btnFind.Height+btnFind.ClientOrigin.Y;
  PopupMenu2.Popup(P.X,P.Y);
end;

procedure TfrmQry_PO_Summarizing.btnExportClick(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex = 0 then
  begin
    if DBGridEh1.DataSource.DataSet.IsEmpty then abort;
      Export_dbGridEH_to_Excel(DBGridEh1,pagecontrol1.ActivePage.Caption);
  end
  else if pagecontrol1.ActivePageIndex = 1 then
  begin
    if DBGridEh2.DataSource.DataSet.IsEmpty then abort;
      Export_dbGridEH_to_Excel(DBGridEh2,pagecontrol1.ActivePage.Caption);
  end
end;

procedure TfrmQry_PO_Summarizing.DBGridEh1CellClick(Column: TColumnEh);
begin
  edtKey.Enabled:= not Column.Grid.DataSource.DataSet.IsEmpty;
  dtpStartDate.Enabled := edtKey.Enabled;
  dtpEndDate.Enabled := edtKey.Enabled;

  if Column.Grid.DataSource.DataSet.IsEmpty then abort;
  labelKey.Caption := Column.Title.Caption;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label7.Visible := not edtKey.Visible;
  dtpStartDate.Visible := Label7.Visible;
  dtpEndDate.Visible := Label7.Visible;
  labelKey.Visible:= pagecontrol1.ActivePageIndex < 2;
end;

procedure TfrmQry_PO_Summarizing.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter:string;
//DataSet:TClientDataSet;
  pDBGRid:TDBGRidEH;
begin
  if pagecontrol1.ActivePageIndex = 0 then
    pDBGRid:=DBGridEh1
  else if pagecontrol1.ActivePageIndex = 1 then
    pDBGRid:=DBGridEh2;

  if not pDBGRid.DataSource.DataSet.Active then abort;
  TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
  TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
  if pDBGRid.SelectedField.DataType in [ftDate, ftDateTime] then
  begin
    sFilter := pDBGRid.SelectedField.FieldName+'>='+TmpStr1+ ' AND ' +pDBGRid.SelectedField.FieldName+'<'+TmpStr2;
    pDBGRid.DataSource.DataSet.Filter := sFilter;
    pDBGRid.DataSource.DataSet.Filtered:= true;
  end;
end;

procedure TfrmQry_PO_Summarizing.N8Click(Sender: TObject);
var
  vData:OleVariant;
  ErrorMsg:wideString;
  sqlstr:string;
  pDBGRid:TDBGRidEH;
begin
  inherited;
  if pagecontrol1.ActivePageIndex >1  then exit;
  
  if ((strToInt(vprev)=2) or (strToInt(vprev)=4)) then
  begin
    with TfrmQryColumnSet.Create(Application) do
    try
      InitForm(pQryNo);
      cdsColumnSet.Filtered := false;
      if pagecontrol1.ActivePageIndex = 0 then
        cdsColumnSet.Filter := 'SeqNo<200'
      else
        cdsColumnSet.Filter := 'SeqNo>=200';
      cdsColumnSet.filtered := true;
      if Showmodal = mrok then
      begin
        if pagecontrol1.ActivePageIndex = 0 then
        begin
          sqlstr:= 'select * from qry_Column_List where SeqNo<200 and qryNo='+IntToStr(pQryNo);
          pDBGRid:= DBGridEh1;
        end
        else
        begin
          sqlstr:= 'select * from qry_Column_List where SeqNo>=200 and qryNo='+IntToStr(pQryNo);
          pDBGRid:= DBGridEh2;
        end;
        if not coMyQuery.Get_Sql_Data(sqlstr,vData,ErrorMsg) then
        begin
          ShowMsg('获取服务器数据失败:！'+ErrorMsg,1);
          abort;
        end
        else
        begin
          cdsColumns.Data := vData;
          Reset_Grid_Columns(pDBGRid,cdsColumns);//Add_Columns_ToDBGrid(dbgrid3,cdsColumnList);
        end;
      end;
    finally
      free;
    end;
  end
  else
    ShowMsg('对不起,您没有设置栏位显示的权限!',1);
end;

procedure TfrmQry_PO_Summarizing.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmQry_PO_Summarizing.DBGridEh1TitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(Column.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(Column.Field.DataSet).IndexName:='';
    TClientDataSet(Column.Field.DataSet).DeleteIndex(OldIndex);
  end;
  if Column.Title.SortMarker = smDownEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixPrimary]);
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
  begin
//      TClientDataSet(Column.Field.DataSet).DeleteIndex('px');
      Column.Title.SortMarker := smNoneEh;
  end
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smDownEh;
  end;{end case}
end;

procedure TfrmQry_PO_Summarizing.N4Click(Sender: TObject);
var
  ListString:TStrings;
  FieldName:string;
  DBGRid:TDBGRidEh;
begin
  if pagecontrol1.ActivePageIndex >1  then exit;
  if pagecontrol1.ActivePageIndex = 0 then
    DBGRid := DBGRidEh1
  else
    DBGRid := DBGRidEh2;
  if DBGRid.DataSource.DataSet.IsEmpty then
  begin
    ShowMsg('没有数据,无法查找',1);
    exit;
  end;
  with TfrmdlgRecordFind.Create(Application)do
  try
    try
      ListString:= TStringList.Create;
      Add_Fields_To_List(DBGRid,ListString);
      comboxFieldList.Items.AddStrings(ListString);
      comboxFieldList.ItemIndex := comboxFieldList.IndexOf(DBGrid.Columns.Items[DBGrid.SelectedIndex].Title.Caption);
    finally
      ListString.Free;
    end;
    if ShowModal = mrok then
    begin
      if (trim(comboxFieldList.Text) = '') OR (trim(edtValue.Text)='') then exit;
      FieldName :=Find_FieldName_In_DBGRid(DBGRid,trim(comboxFieldList.Text));
      if FieldName = '' then exit;
        DBGRid.DataSource.DataSet.Locate(FieldName,trim(edtValue.Text),[loPartialKey])
    end;
  finally
    free;
  end;
end;

procedure TfrmQry_PO_Summarizing.cdsPoDetailAfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[1].Text := IntToStr(DataSet.RecordCount);
end;

procedure TfrmQry_PO_Summarizing.edtKeyChange(Sender: TObject);
var  tmpstr,sFilter:string;
cdsQueryData:TDataSet;
DBGrid3:TDBgRidEh;
begin
  case pagecontrol1.ActivePageIndex of
    0 :  DBGrid3 := DBGridEh1;
    1 :  DBGrid3 := DBGridEh2;
    else DBGrid3 := nil;
  end;
  cdsQueryData:= DBGrid3.DataSource.dataset;
  if not cdsQueryData.Active then abort;
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    cdsQueryData.Filtered:= false
  else
  begin
    if (DBGrid3.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      cdsQueryData.Filter := 'Upper('+DBGrid3.SelectedField.FieldName+') Like '+ QuotedStr(sFilter);
//      sFilter := '%'+TmpStr+'%';
//      cdsQueryData.Filter := DBGrid3.SelectedField.FieldName+' Like '+ QuotedStr(sFilter);
      cdsQueryData.Filtered:= true;
    end
    else if DBGrid3.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := DBGrid3.SelectedField.FieldName+'>='+TmpStr;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      cdsQueryData.Filter := sFilter;
      cdsQueryData.Filtered:= true;
    end
    else if DBGrid3.SelectedField.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      cdsQueryData.Filter := DBGrid3.SelectedField.FieldName + sFilter;
      cdsQueryData.Filtered:= true;
    end;
  end;
end;

end.
