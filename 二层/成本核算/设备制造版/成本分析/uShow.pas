unit uShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, Grids, StdCtrls,math,ADODB, Menus,
  DBGridEh, DB, Excel2000,ComObj;

type
  TExcludeColumns = set of 0..255;
  TfrmShow = class(TForm)
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    PageControl3: TPageControl;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    PageControl4: TPageControl;
    TabSheet11: TTabSheet;
    StringGrid3: TStringGrid;
    TabSheet12: TTabSheet;
    StringGrid4: TStringGrid;
    PageControl5: TPageControl;
    TabSheet13: TTabSheet;
    StringGrid5: TStringGrid;
    TabSheet14: TTabSheet;
    StringGrid6: TStringGrid;
    PageControl8: TPageControl;
    TabSheet18: TTabSheet;
    TabSheet19: TTabSheet;
    PageControl9: TPageControl;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    PageControl10: TPageControl;
    TabSheet23: TTabSheet;
    TabSheet24: TTabSheet;
    TabSheet25: TTabSheet;
    PageControl11: TPageControl;
    TabSheet26: TTabSheet;
    StringGrid16: TStringGrid;
    TabSheet27: TTabSheet;
    StringGrid17: TStringGrid;
    TabSheet28: TTabSheet;
    PageControl12: TPageControl;
    TabSheet29: TTabSheet;
    TabSheet30: TTabSheet;
    PageControl13: TPageControl;
    TabSheet31: TTabSheet;
    TabSheet32: TTabSheet;
    StringGrid18: TStringGrid;
    StringGrid19: TStringGrid;
    Panel1: TPanel;
    PageControl14: TPageControl;
    TabSheet33: TTabSheet;
    TabSheet34: TTabSheet;
    TabSheet35: TTabSheet;
    PageControl15: TPageControl;
    TabSheet36: TTabSheet;
    StringGrid22: TStringGrid;
    TabSheet37: TTabSheet;
    StringGrid23: TStringGrid;
    TabSheet38: TTabSheet;
    StringGrid24: TStringGrid;
    TabSheet39: TTabSheet;
    StringGrid25: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PageControl16: TPageControl;
    TabSheet40: TTabSheet;
    TabSheet41: TTabSheet;
    StringGrid10: TStringGrid;
    StringGrid11: TStringGrid;
    StringGrid26: TStringGrid;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    m1: TMenuItem;
    m2: TMenuItem;
    dfh1: TMenuItem;
    m3: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    Panel2: TPanel;
    ADS451_total: TADODataSet;
    DataSource1: TDataSource;
    ADS451_totalinv_group_name: TStringField;
    ADS451_totalGROUP_NAME: TStringField;
    ADS451_totalINV_PART_NUMBER: TStringField;
    ADS451_totalINV_PART_DESCRIPTION: TStringField;
    ADS451_totalUNIT_CODE: TStringField;
    ADS451_totalSTOCK_SELL: TFloatField;
    ADS451_totalopen_quantity: TBCDField;
    ADS451_totalopen_amount: TFloatField;
    ADS451_totalin_quantity: TBCDField;
    ADS451_totalin_amount: TFloatField;
    ADS451_totalout_quantity: TBCDField;
    ADS451_totalout_amount: TFloatField;
    ADS451_totalreject_quantity: TBCDField;
    ADS451_totalreject_amount: TFloatField;
    ADS451_totalreturn_quantity: TBCDField;
    ADS451_totalreturn_amount: TFloatField;
    ADS451_totalclosed_quantity: TBCDField;
    ADS451_totalclosed_amount: TFloatField;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Label1: TLabel;
    ADS451_list: TADODataSet;
    DataSource2: TDataSource;
    ADS451_listinv_group_name: TStringField;
    ADS451_listGROUP_NAME: TStringField;
    ADS451_listINV_PART_NUMBER: TStringField;
    ADS451_listSTOCK_SELL: TFloatField;
    ADS451_listINV_PART_DESCRIPTION: TStringField;
    ADS451_listUNIT_CODE: TStringField;
    ADS451_listABBR_NAME: TStringField;
    ADS451_listLOCATION: TStringField;
    ADS451_listrohs: TStringField;
    ADS451_listSUPPLIER2: TStringField;
    ADS451_listOPEN_QUANTITY: TBCDField;
    ADS451_listIN_QUANTITY: TBCDField;
    ADS451_listOUT_QUANTITY: TBCDField;
    ADS451_listCLOSED_QUANTITY: TBCDField;
    ADS451_listREJECT_QUANTITY: TBCDField;
    ADS451_listRETURN_QUANTITY: TBCDField;
    ADS451_listUNIT_PRICE: TFloatField;
    ADS451_listtax_2: TFloatField;
    ADS451_listOPEN_amount: TFloatField;
    ADS451_listin_amount: TFloatField;
    ADS451_listout_amount: TFloatField;
    ADS451_listclosed_amount: TFloatField;
    ADS451_listreject_amount: TFloatField;
    ADS451_listreturn_amount: TFloatField;
    DBGridEh2: TDBGridEh;
    ADS372_total: TADODataSet;
    DataSource3: TDataSource;
    Panel3: TPanel;
    Label6: TLabel;
    ComboBox3: TComboBox;
    DBGridEh3: TDBGridEh;
    Edit2: TEdit;
    Label3: TLabel;
    ADS372_list: TADODataSet;
    DataSource4: TDataSource;
    DBGridEh4: TDBGridEh;
    ADS464_SO: TADODataSet;
    DataSource5: TDataSource;
    ADS464_SOPROD_CODE: TStringField;
    ADS464_SOPRODUCT_NAME: TStringField;
    ADS464_SOMANU_PART_NUMBER: TStringField;
    ADS464_SOMANU_PART_DESC: TStringField;
    ADS464_SOCUST_CODE: TStringField;
    ADS464_SOSALES_ORDER: TStringField;
    ADS464_SOSCH_DATE: TDateTimeField;
    ADS464_SOPARTS_ORDERED: TFloatField;
    ADS464_SOISSUED_QTY: TIntegerField;
    ADS464_SOquan_prod: TIntegerField;
    ADS464_SOso_ptr: TIntegerField;
    ADS464_SOmatl_cost: TFloatField;
    ADS464_SOovhd_cost: TFloatField;
    ADS464_SOamount: TFloatField;
    ADS464_SOsquare: TFloatField;
    ADS464_SOsqft_amount: TFloatField;
    ADS464_SOqty_amount: TFloatField;
    ADS464_SOso_type: TStringField;
    DBGridEh5: TDBGridEh;
    Edit3: TEdit;
    ADS464_WO: TADODataSet;
    DataSource6: TDataSource;
    ADS464_WOWO_PTR: TIntegerField;
    ADS464_WOWORK_ORDER_NUMBER: TStringField;
    ADS464_WOMANU_PART_NUMBER: TStringField;
    ADS464_WOMANU_PART_DESC: TStringField;
    ADS464_WOPROD_CODE: TStringField;
    ADS464_WOPRODUCT_NAME: TStringField;
    ADS464_WOmatl_cost: TFloatField;
    ADS464_WOovhd_cost: TFloatField;
    ADS464_WOquan_prod: TIntegerField;
    ADS464_WOamount: TFloatField;
    ADS464_WOsquare: TFloatField;
    ADS464_WOsqft_amount: TFloatField;
    ADS464_WOqty_amount: TFloatField;
    DBGridEh6: TDBGridEh;
    Label5: TLabel;
    PopupMenu3: TPopupMenu;
    N25: TMenuItem;
    N26: TMenuItem;
    EXCEL1: TMenuItem;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BtQry: TBitBtn;
    ADS451_totalABBR_NAME: TStringField;
    ADS451_listabbrname15: TStringField;
    ADS372_listPROD_CODE: TStringField;
    ADS372_listPRODUCT_NAME: TStringField;
    ADS372_listPRODUCT_DESC: TStringField;
    ADS372_listLOCATION: TStringField;
    ADS372_listUNIT_PRICE: TFloatField;
    ADS372_listOPEN_QUANTITY: TBCDField;
    ADS372_listOPEN_AMOUNT: TFloatField;
    ADS372_listIN_QUANTITY: TBCDField;
    ADS372_listIN_AMOUNT: TFloatField;
    ADS372_listOUT_QUANTITY: TBCDField;
    ADS372_listOUT_AMOUNT: TFloatField;
    ADS372_listCLOSED_QUANTITY: TBCDField;
    ADS372_listCLOSED_AMOUNT: TFloatField;
    ADS372_totalPROD_CODE: TStringField;
    ADS372_totalPRODUCT_NAME: TStringField;
    ADS372_totalPRODUCT_DESC: TStringField;
    ADS372_totalUNIT_PRICE: TFloatField;
    ADS372_totalOPEN_QUANTITY: TBCDField;
    ADS372_totalOPEN_AMOUNT: TFloatField;
    ADS372_totalIN_QUANTITY: TBCDField;
    ADS372_totalIN_AMOUNT: TFloatField;
    ADS372_totalOUT_QUANTITY: TBCDField;
    ADS372_totalOUT_AMOUNT: TFloatField;
    ADS372_totalCLOSED_QUANTITY: TBCDField;
    ADS372_totalCLOSED_AMOUNT: TFloatField;
    TabSheet15: TTabSheet;
    PageControl6: TPageControl;
    TabSheet16: TTabSheet;
    DBGridEh7: TDBGridEh;
    TabSheet17: TTabSheet;
    DBGridEh8: TDBGridEh;
    Panel4: TPanel;
    Label4: TLabel;
    Edit4: TEdit;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    ADS75_list: TADODataSet;
    ADS75_total: TADODataSet;
    ADS75_totalPROD_CODE: TStringField;
    ADS75_totalPRODUCT_NAME: TStringField;
    ADS75_totalPRODUCT_DESC: TStringField;
    ADS75_totalqty_opening: TBCDField;
    ADS75_totalqty_input: TBCDField;
    ADS75_totalqty_output: TBCDField;
    ADS75_totalqyt_closed: TBCDField;
    ADS75_totalmaterial_opening: TBCDField;
    ADS75_totalmaterial_input: TBCDField;
    ADS75_totalmaterial_output: TBCDField;
    ADS75_totalmaterial_closed: TBCDField;
    ADS75_totalworkhouse_opening: TBCDField;
    ADS75_totalworkhouse_input: TBCDField;
    ADS75_totalworkhouse_output: TBCDField;
    ADS75_totalworkhouse_closed: TBCDField;
    ADS75_totalwhcost_opening: TBCDField;
    ADS75_totalwhcost_input: TBCDField;
    ADS75_totalwhcost_output: TBCDField;
    ADS75_totalwhcost_closed: TBCDField;
    ADS75_totalovhdcost_opening: TBCDField;
    ADS75_totalovhdcost_input: TBCDField;
    ADS75_totalovhdcost_output: TBCDField;
    ADS75_totalovhdcost_closed: TBCDField;
    ADS75_listPROD_CODE: TStringField;
    ADS75_listPRODUCT_NAME: TStringField;
    ADS75_listPRODUCT_DESC: TStringField;
    ADS75_listABBR_NAME: TStringField;
    ADS75_listCUT_NO: TStringField;
    ADS75_listSO_NO: TStringField;
    ADS75_listqty_opening: TBCDField;
    ADS75_listqty_input: TBCDField;
    ADS75_listqty_output: TBCDField;
    ADS75_listqyt_closed: TBCDField;
    ADS75_listmaterial_opening: TBCDField;
    ADS75_listmaterial_input: TBCDField;
    ADS75_listmaterial_output: TBCDField;
    ADS75_listmaterial_closed: TBCDField;
    ADS75_listworkhouse_opening: TBCDField;
    ADS75_listworkhouse_input: TBCDField;
    ADS75_listworkhouse_output: TBCDField;
    ADS75_listworkhouse_closed: TBCDField;
    ADS75_listwhcost_opening: TBCDField;
    ADS75_listwhcost_input: TBCDField;
    ADS75_listwhcost_output: TBCDField;
    ADS75_listwhcost_closed: TBCDField;
    ADS75_listovhdcost_opening: TBCDField;
    ADS75_listovhdcost_input: TBCDField;
    ADS75_listovhdcost_output: TBCDField;
    ADS75_listovhdcost_closed: TBCDField;
    N20: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    ADS372_totalTRANS_QUANTITY: TBCDField;
    ADS372_totalTRANS_AMOUNT: TFloatField;
    ADS372_listTRANS_QUANTITY: TBCDField;
    ADS372_listTRANS_AMOUNT: TFloatField;
    TabSheet42: TTabSheet;
    TabSheet43: TTabSheet;
    DBGridEh9: TDBGridEh;
    DataSource9: TDataSource;
    DataSource10: TDataSource;
    ads428: TADODataSet;
    ads428RKEY: TIntegerField;
    ads428D0451_PTR: TIntegerField;
    ads428CUT_NO: TStringField;
    ads428INVENT_PTR: TIntegerField;
    ads428OPEN_QUANTITY: TFloatField;
    ads428OPEN_AMOUNT: TBCDField;
    ads428IN_QUANTITY: TFloatField;
    ads428IN_AMOUNT: TBCDField;
    ads428CLOSED_QTY: TFloatField;
    ads428CLOSED_AMOUNT: TBCDField;
    ads428QUAN_YIELD_SQFT: TFloatField;
    ads428QUAN_YIELD_AMT: TBCDField;
    ads428std_quan_yield: TBCDField;
    ads428BUDGET_COST: TBCDField;
    ads428STD_COST: TBCDField;
    ads428ACTUAL_COST: TBCDField;
    ads428warehouse_ptr: TIntegerField;
    ads428INV_PART_NUMBER: TStringField;
    ads428INV_PART_DESCRIPTION: TStringField;
    ads428matl_std_cost: TFloatField;
    ads428ABBR_NAME: TStringField;
    ads428Price: TFloatField;
    ads428Diff: TFloatField;
    ads428_1: TADODataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    BCDField1: TBCDField;
    FloatField2: TFloatField;
    BCDField2: TBCDField;
    FloatField3: TFloatField;
    BCDField3: TBCDField;
    FloatField4: TFloatField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    BCDField7: TBCDField;
    BCDField8: TBCDField;
    IntegerField4: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField5: TFloatField;
    StringField4: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DBGridEh10: TDBGridEh;
    Panel5: TPanel;
    Panel6: TPanel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    ADS75_listDEPT_NAME: TStringField;
    ADS75_totalovhdcost_inputSC: TBCDField;
    ADS75_listovhdcost_inputSC: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSheet9Show(Sender: TObject);
    procedure TabSheet11Show(Sender: TObject);
    procedure TabSheet13Show(Sender: TObject);
    procedure TabSheet18Show(Sender: TObject);
    procedure TabSheet20Show(Sender: TObject);
    procedure StringGrid4DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSheet23Show(Sender: TObject);
    procedure TabSheet26Show(Sender: TObject);
    procedure StringGrid16DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid17DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSheet31Show(Sender: TObject);
    procedure StringGrid18DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSheet36Show(Sender: TObject);
    procedure StringGrid23DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSheet38Show(Sender: TObject);
    procedure TabSheet39Show(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure m1Click(Sender: TObject);
    procedure m2Click(Sender: TObject);
    procedure m3Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure StringGrid6DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure PageControl9Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGridEh3TitleClick(Column: TColumnEh);
    procedure DBGridEh4TitleClick(Column: TColumnEh);
    procedure PageControl10Change(Sender: TObject);
    procedure DBGridEh5TitleClick(Column: TColumnEh);
    procedure DBGridEh6TitleClick(Column: TColumnEh);
    procedure Edit3Change(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure PageControl14Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGridEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtQryClick(Sender: TObject);
    procedure PageControl11Change(Sender: TObject);
    procedure TabSheet16Show(Sender: TObject);
    procedure DBGridEh7TitleClick(Column: TColumnEh);
    procedure DBGridEh8TitleClick(Column: TColumnEh);
    procedure PageControl6Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure TabSheet42Show(Sender: TObject);
    procedure TabSheet43Show(Sender: TObject);
    procedure ads428CalcFields(DataSet: TDataSet);
    procedure ads428_1CalcFields(DataSet: TDataSet);
    procedure DBGridEh9TitleClick(Column: TColumnEh);
    procedure DBGridEh10TitleClick(Column: TColumnEh);
    procedure Edit6Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
   PreColumn,PreColumn_list: TColumnEh;
   field_name,fieldname:string;

   PreColumn_372total,PreColumn_372list: TColumnEh;
   fieldname372total,fieldname372list:string;

   PreColumn_464so,PreColumn_464wo: TColumnEh;
   fieldname464so,fieldname464wo:string;

   PreColumn_75total,PreColumn_75list: TColumnEh;
   fieldname75total,fieldname75list:string;
   PreColumn428,PreColumn428_1: TColumnEh;
   fieldname428,fieldname428_1:string;

    procedure SetOptimalGridCellWidth(sg: TStringGrid;ExcludeColumns:TExcludeColumns);
    procedure Align(sender:TStringGrid;Rect:TRect; ACol,ARow:integer);

    procedure SetStrGridTitl();
    procedure showcontent1();
    procedure showcontent2();
    procedure showcontent3();
    procedure showcontent4();
    procedure showcontent5();
    procedure showcontent6();
    procedure showcontent7();
    procedure showcontent8();

    procedure showcontent10();
    procedure showcontent11();
    procedure showRejeToWIP();//返工成本转WIP
    procedure showcontent16();//报废成本汇总表
    procedure showcontent17();//报废成本明细表
    procedure showcontent18();//完工成本按客户汇总
    procedure showcontent19();//完工成本按类别汇总
    procedure showcontent21();//完工成本按作业单显示
    procedure showcontent22();//销售成本汇总表
    procedure showcontent23();//销售成本明细表
    procedure showcontent24();//材料发出汇总
    procedure showcontent25();//材料购入汇总
    function getFac(facrkey:integer):string;
    procedure DoSearch(subSql: string);

  public
    procedure ExPortExcel(const  pstrgrids:array of TStringGrid;pCap:array of string);
  end;

var
  frmShow: TfrmShow;

implementation

uses uMD, uMain, ProgressBar, uWoShow, Unit_lot,COMMON, QuerySet;

{$R *.dfm}
procedure TfrmShow.ExPortExcel(const pStrgrids:array of TStringGrid;pCap:array of string);
var
 iCount, jCount, v_cloumn,i,j: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin

 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;

 XLApp.SheetsInNewWorkbook := High(pStrgrids)+1;
 XLApp.WorkBooks.Add;
 for j:=Low(pStrgrids) to High(pStrgrids) do
 begin
   XLApp.WorkBooks[1].WorkSheets[j+1].Name := pCap[j];
   Sheet := XLApp.Workbooks[1].WorkSheets[j+1];

   v_cloumn:=math.Floor(pStrgrids[j].ColCount/2);

   Sheet.Cells[1, v_cloumn] :=pCap[j];

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to pStrgrids[j].ColCount - 1 do
    begin
       Sheet.Cells[3, iCount + 1 - v_cloumn] :=pStrgrids[j].Cells[iCount,0];
       Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
    end;

   jCount:= 4;
   //行
   i:=1;
   for i:=pStrgrids[j].Row to pStrgrids[j].Rowcount-1 do
   begin
    if pStrgrids[j].RowHeights[i]>0 then
    begin
     v_cloumn:=0;
     for iCount := 0 to pStrgrids[j].ColCount - 1 do
      Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=pStrgrids[j].Cells[iCount,i];
     Inc(jCount);
    end;
   end;

 end;
 XlApp.Visible := True;
 Screen.Cursor := crDefault;
end;

procedure TfrmShow.DoSearch(subSql: string);
var
  sqlstr:widestring;
  i:integer;
begin
  sqlstr:=ads372_list.CommandText;
  i:=Pos('WHERE',sqlstr);
  if i = 0 then
   begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
   end;
  Sqlstr:=copy(sqlstr,1,i-1);
  ads372_list.Close;
  ads372_list.CommandText := sqlstr+' WHERE (Data0372.D0451_PTR = :rkey451) '+#13+
  subsql ;
  ads372_list.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
  ads372_list.open;
 // StatusBar1.Panels[1].Text := IntToStr(ads372_list.RecordCount);
end;

procedure TfrmShow.SetOptimalGridCellWidth(sg: TStringGrid;ExcludeColumns:TExcludeColumns);
 var                               //自动列宽
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

procedure TfrmShow.SetStrGridTitl();  //set stringgrid
begin
 with stringgrid1 do
 begin
  cells[0,0]:='部门代号';
  cells[1,0]:='部门名称';
  cells[2,0]:='实际耗用成本';
  cells[3,0]:='金额差异';
  cells[4,0]:='实际标准成本';
  cells[5,0]:='工厂';
 end;

  with stringgrid2 do
  begin
    cells[0,0]:='部门';
    cells[1,0]:='部门名称';
    cells[2,0]:='材料代号';
    cells[3,0]:='单位';
    cells[4,0]:='计划价格';
    cells[5,0]:='实际价格';
    cells[6,0]:='本期领用';
    cells[7,0]:='本期金额';
    cells[8,0]:='实际标准成本';
    cells[9,0]:='实际耗用成本';
    cells[10,0]:='标准金额差异';
    cells[11,0]:='材料规格';
    cells[12,0]:='工厂';
  end;

  with stringgrid3 do
  begin
    cells[0,0]:='部门代号';
    cells[1,0]:='部门名称';
    cells[2,0]:='实际耗用成本';
    cells[3,0]:='金额差异';
    cells[4,0]:='实际标准成本';
    cells[5,0]:='工厂';
  end;

  with stringgrid4 do
  begin
    cells[0,0]:='部门';
    cells[1,0]:='部门名称';
    cells[2,0]:='材料代号';
    cells[3,0]:='单位';
    cells[4,0]:='计划价格';
    cells[5,0]:='实际价格';
    cells[6,0]:='本期领用';
    cells[7,0]:='本期金额';
    cells[8,0]:='实际标准成本';
    cells[9,0]:='实际耗用成本';
    cells[10,0]:='标准金额差异';
    cells[11,0]:='材料规格';
    cells[12,0]:='工厂';
  end;

  with stringgrid5 do
  begin
    cells[0,0]:='部门代号';
    cells[1,0]:='部门名称';
    cells[2,0]:='标准成本';
    cells[3,0]:='实际耗用成本';
    cells[4,0]:='价格差异';
    cells[5,0]:='工厂';
  end;

  with stringgrid6 do
  begin
    cells[0,0]:='部门';
    cells[1,0]:='部门名称';
    cells[2,0]:='材料代号';
    cells[3,0]:='单位';
    cells[4,0]:='计划价格';
    cells[5,0]:='实际价格';
    cells[6,0]:='期初存量';
    cells[7,0]:='本期领用';
    cells[8,0]:='期末存量';
    cells[9,0]:='期初金额';
    cells[10,0]:='本期金额';
    cells[11,0]:='期末金额';
    cells[12,0]:='标准成本';
    cells[13,0]:='实际成本';
    stringgrid6.ColWidths[14]:=0;
    cells[15,0]:='价格差异';
    cells[16,0]:='材料规格';
    cells[17,0]:='工厂';
  end;

  with stringgrid7 do
  begin
    cells[0,0]:='分类';
    cells[1,0]:='材料类别';
    cells[2,0]:='类别名称';
    cells[3,0]:='标准成本';
    cells[4,0]:='实际成本';
    cells[5,0]:='金额差异';
    cells[6,0]:='实际标准成本';
    cells[7,0]:='工厂';
  end;

  with stringgrid8 do
   begin
    cells[0,0]:='部门代码';
    cells[1,0]:='部门名称';
    cells[2,0]:='部门期间总工时';
    cells[3,0]:='直接人工';
    cells[4,0]:='制造费用';
    cells[5,0]:='费用小计';
    cells[6,0]:='工厂';
   end;

  with stringgrid10 do                     //返工成本汇总表
   begin
    cells[0,0]:='序号';
    cells[1,0]:='工序';
    cells[2,0]:='工序名称';
    cells[3,0]:='返工数量';
    cells[4,0]:='返工面积';
    cells[5,0]:='返工成本';
   end;

  with stringgrid11 do               //返工成本明细表
   begin
    cells[0,0]:='序号';
    cells[1,0]:='工序';
    cells[2,0]:='返工部件';
    cells[3,0]:='数量(PCS)';
    cells[4,0]:='数量(面积)';
    cells[5,0]:='材料成本';
    cells[6,0]:='制造费用';
    cells[7,0]:='总成本';
   end;

  with stringgrid26 do               //产成品返工转WIP
  begin
    cells[0,0]:='本厂编号';
    cells[1,0]:='客户型号';
    cells[2,0]:='作业单号';
    cells[3,0]:='返工数量';
    cells[4,0]:='返工面积';
    cells[5,0]:='完工材料成本';
    cells[6,0]:='完工制造费用';
    cells[7,0]:='返工日期';
  end;

  with stringgrid16 do            //报废成本分析汇总表
   begin
    cells[0,0]:='序号';
    cells[1,0]:='工序';
    cells[2,0]:='工序名称';
    cells[3,0]:='报废数量';
    cells[4,0]:='报废面积';
    cells[5,0]:='报废成本';
    cells[6,0]:='工厂简称';
   end;

  with stringgrid17 do                        //报废成本分析明细表
   begin
    cells[0,0]:='工序代码';
    cells[1,0]:='本厂编号';
    cells[2,0]:='客户型号';
    cells[3,0]:='产品类型';
    cells[4,0]:='层数';

    cells[5,0]:='数量(PCS)';
    cells[6,0]:='数量(面积)';
    cells[7,0]:='材料成本';
    cells[8,0]:='制造费用';
    cells[9,0]:='总成本';
    cells[10,0]:='作业单号';
    cells[11,0]:='客户代码';
    cells[12,0]:='工厂简称';
   end;

  with stringgrid18 do                        //完工成本分析按客户汇总
  begin
    cells[0,0]:='客户代码';
    cells[1,0]:='客户简称';
    cells[2,0]:='材料成本';
    cells[3,0]:='制造费用';
    cells[4,0]:='入库数量';
    cells[5,0]:='本期产值';
    cells[6,0]:='产出面积';
    cells[7,0]:='成本率';
    cells[8,0]:='成本/面积';
  end;

  with stringgrid19 do                        //完工成本分析按类别汇总
  begin
    stringgrid19.ColWidths[0]:=0;
    cells[1,0]:='类型代码';
    cells[2,0]:='类型名称';
    cells[3,0]:='材料成本';
    cells[4,0]:='制造费用';
    cells[5,0]:='产出数量';
    cells[6,0]:='本期产值';
    cells[7,0]:='产出面积';
    cells[8,0]:='成本率';
    cells[9,0]:='成本/面积';
  end;

  with stringgrid22 do                        //销售成本汇总表
   begin
    cells[0,0]:='销售订单';
    cells[1,0]:='订单类型';
    cells[2,0]:='客户简称';
    cells[3,0]:='本厂编号';
    cells[4,0]:='客户型号';
    cells[5,0]:='产品类型';
    cells[6,0]:='类型名称';
    cells[7,0]:='销售面积';
    cells[8,0]:='销售数量';
    cells[9,0]:='销售金额';
    cells[10,0]:='销售成本';
    cells[11,0]:='销售毛利';
    cells[12,0]:='成本率%';
   end;

  with stringgrid23 do                        //销售成本明细表
   begin
    cells[0,0] := '销售订单';
    cells[1,0] := '出货日期';
    cells[2,0] := '客户简称';
    cells[3,0] := '本厂编号';
    cells[4,0] := '客户型号';
    cells[5,0] := '类型代码';
    cells[6,0] := '作业单号';
    cells[7,0] := '销售数量';
    cells[8,0] := '销售面积';
    cells[9,0] := '销售金额';
    cells[10,0] := '材料成本';
    cells[11,0] := '制造费用';
    cells[12,0] := '销售成本';
    cells[13,0] := '销售毛利';
    cells[14,0] := '成本率%';
   end;

  with stringgrid24 do                        //材料发出汇总
   begin
    cells[0,0]:='类别';
    cells[1,0]:='项目';
    cells[2,0]:='生产领用';
    cells[3,0]:='非生产用';
    cells[4,0]:='梅州单面厂';
    cells[5,0]:='梅州双面厂';
    cells[6,0]:='深圳单面厂';
    cells[7,0]:='合计';
   end;

  with stringgrid25 do                        //材料购入汇总
   begin
    cells[0,0]:='类别';
    cells[1,0]:='项目';
    cells[2,0]:='中国';
    cells[3,0]:='梅双厂';
    cells[4,0]:='深圳单面厂';
    cells[5,0]:='威达通';
    cells[6,0]:='中国香港';
    cells[7,0]:='梅州化工厂';
    cells[8,0]:='合计';
   end;  
end;

procedure TfrmShow.showcontent1();
var i:integer;
  vqty1,vqty2:currency;
begin
  i:=1;
  Stringgrid1.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid1.rows[1].Text:='';

  vqty1:=0;
  vqty2:=0;
  with dm.SP451 do
  while not eof do
  begin
    Stringgrid1.rows[i].Text :='';
    Stringgrid1.Cells[0,i]:=fieldbyname('dept_code').AsString;
    Stringgrid1.Cells[1,i]:=fieldbyname('dept_name').AsString;
    Stringgrid1.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency);
    Stringgrid1.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency-
                                                   fieldbyname('std_cost').AsCurrency);
    Stringgrid1.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('std_cost').AsCurrency);

    Stringgrid1.Cells[5,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);

    vqty1:=vqty1+fieldbyname('std_cost').AsCurrency;
    vqty2:=vqty2+fieldbyname('actual_cost').AsCurrency;
    next;
    i:=i+1;
  end;

  if i<>1 then
   begin
    Stringgrid1.rowcount:=Stringgrid1.rowcount+1;
    Stringgrid1.rows[Stringgrid1.rowcount-1].Text :='';
    Stringgrid1.Cells[0,Stringgrid1.rowcount-1]:='合计';
    Stringgrid1.Cells[2,Stringgrid1.rowcount-1]:=Formatfloat('#,##0.00',vqty2);

    Stringgrid1.Cells[3,Stringgrid1.rowcount-1]:=Formatfloat('#,##0.00',vqty2-vqty1);
    Stringgrid1.Cells[4,Stringgrid1.rowcount-1]:=Formatfloat('#,##0.00',vqty1);

   end; 
  //SetOptimalGridCellWidth(stringgrid1,[]);  //使所有stringgrid单元格宽度自适应
end;

procedure TfrmShow.showcontent2();
var i:integer;
    vqty1,vqty2,vqty3,vqty4:currency;
    vleng:currency;
begin
  i:=1;
  Stringgrid2.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid2.rows[1].Text:='';
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;

  Application.CreateForm(TFrmProgress, FrmProgress);
  FrmProgress.show;
  with dm.SP451 do
  while not eof do
  begin

    Stringgrid2.rows[i].Text :='';
    Stringgrid2.cells[0,i]:=Fieldbyname('dept_code').asstring;
    Stringgrid2.cells[1,i]:=Fieldbyname('dept_name').asstring;
    Stringgrid2.cells[2,i]:=Fieldbyname('inv_part_number').asstring;
    Stringgrid2.cells[3,i]:=Fieldbyname('unit_code').asstring;
    Stringgrid2.cells[4,i]:=Formatfloat('#,##0.00',Fieldbyname('matl_std_cost').AsCurrency);
    if Fieldbyname('in_quantity').AsCurrency<>0 then
      Stringgrid2.cells[5,i]:=Formatfloat('#,##0.00',Fieldbyname('in_amount').AsCurrency/
                                                   Fieldbyname('in_quantity').AsCurrency);

    Stringgrid2.cells[6,i]:=Formatfloat('#,##0.00',Fieldbyname('in_quantity').AsCurrency);

    Stringgrid2.cells[7,i]:=Formatfloat('#,##0.00',Fieldbyname('in_amount').AsCurrency);

    Stringgrid2.cells[8,i]:=Formatfloat('#,##0.00',Fieldbyname('std_cost').AsCurrency);
    Stringgrid2.cells[9,i]:=Formatfloat('#,##0.00',Fieldbyname('actual_cost').AsCurrency);

   Stringgrid2.cells[10,i]:=Formatfloat('#,##0.00',
       Fieldbyname('actual_cost').AsCurrency-Fieldbyname('std_cost').AsCurrency);

    Stringgrid2.cells[11,i]:=Fieldbyname('inv_part_description').asstring;
    Stringgrid2.Cells[12,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);

    vqty1:=vqty1+Fieldbyname('in_amount').AsCurrency;;
    vqty2:=vqty2+Fieldbyname('std_cost').AsCurrency;
    vqty3:=vqty3+Fieldbyname('actual_cost').AsCurrency;
    vqty4:=vqty4+Fieldbyname('actual_cost').AsCurrency-
                 Fieldbyname('std_cost').AsCurrency;

    next;
    i:=i+1;
    vleng:=int(500*recno/recordcount);
    FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng));
  end;
  frmprogress.Free;
  if i<>1 then
   begin
    Stringgrid2.rowcount:=Stringgrid2.rowcount+1;
    Stringgrid2.rows[Stringgrid2.rowcount-1].Text :='';
    Stringgrid2.Cells[0,Stringgrid2.rowcount-1]:='合计';
    Stringgrid2.cells[7,Stringgrid2.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid2.cells[8,Stringgrid2.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid2.cells[9,Stringgrid2.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid2.cells[10,Stringgrid2.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
   end; 
  SetOptimalGridCellWidth(stringgrid2,[]);  //使所有stringgrid单元格宽度自适应
//  ComboBox1Change(nil);
end;

procedure TfrmShow.showcontent3();
var i:integer;
  vqty1,vqty2:currency;
begin
  i:=1;
  Stringgrid3.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid3.rows[1].Text:='';

  vqty1:=0;
  vqty2:=0;
  with dm.SP451 do
  while not eof do
  begin
    Stringgrid3.rows[i].Text :='';
    Stringgrid3.Cells[0,i]:=fieldbyname('dept_code').AsString;
    Stringgrid3.Cells[1,i]:=fieldbyname('dept_name').AsString;
    Stringgrid3.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency);
    Stringgrid3.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency-
                                                   fieldbyname('std_cost').AsCurrency);
    Stringgrid3.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('std_cost').AsCurrency);

    Stringgrid3.Cells[5,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);

    vqty1:=vqty1+fieldbyname('std_cost').AsCurrency;
    vqty2:=vqty2+fieldbyname('actual_cost').AsCurrency;
    next;
    i:=i+1;
  end;

  if i<>1 then
   begin
    Stringgrid3.rowcount:=Stringgrid3.rowcount+1;
    Stringgrid3.rows[Stringgrid3.rowcount-1].Text :='';
    Stringgrid3.Cells[0,Stringgrid3.rowcount-1]:='合计';
    Stringgrid3.Cells[2,Stringgrid3.rowcount-1]:=Formatfloat('#,##0.00',vqty2);

    Stringgrid3.Cells[3,Stringgrid3.rowcount-1]:=Formatfloat('#,##0.00',vqty2-vqty1);
    Stringgrid3.Cells[4,Stringgrid3.rowcount-1]:=Formatfloat('#,##0.00',vqty1);

   end; 
  //SetOptimalGridCellWidth(stringgrid3,[]);  //使所有stringgrid单元格宽度自适应
end;

procedure TfrmShow.showcontent4();
var i:integer;
    vqty1,vqty2,vqty3,vqty4:currency;
    vleng:currency;
begin
  i:=1;
  Stringgrid4.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid4.rows[1].Text:='';
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;

  Application.CreateForm(TFrmProgress, FrmProgress);
  FrmProgress.show;
  with dm.SP451 do
  while not eof do
  begin

    Stringgrid4.rows[i].Text :='';
    Stringgrid4.cells[0,i]:=Fieldbyname('dept_code').asstring;
    Stringgrid4.cells[1,i]:=Fieldbyname('dept_name').asstring;
    Stringgrid4.cells[2,i]:=Fieldbyname('inv_part_number').asstring;
    Stringgrid4.cells[3,i]:=Fieldbyname('unit_code').asstring;
    Stringgrid4.cells[4,i]:=Formatfloat('#,##0.00',Fieldbyname('matl_std_cost').AsCurrency);
    if Fieldbyname('in_quantity').AsCurrency<>0 then
      Stringgrid4.cells[5,i]:=Formatfloat('#,##0.00',Fieldbyname('in_amount').AsCurrency/
                                                   Fieldbyname('in_quantity').AsCurrency);

    Stringgrid4.cells[6,i]:=Formatfloat('#,##0.00',Fieldbyname('in_quantity').AsCurrency);

    Stringgrid4.cells[7,i]:=Formatfloat('#,##0.00',Fieldbyname('in_amount').AsCurrency);

    Stringgrid4.cells[8,i]:=Formatfloat('#,##0.00',Fieldbyname('std_cost').AsCurrency);
    Stringgrid4.cells[9,i]:=Formatfloat('#,##0.00',Fieldbyname('actual_cost').AsCurrency);

   Stringgrid4.cells[10,i]:=Formatfloat('#,##0.00',
       Fieldbyname('actual_cost').AsCurrency-Fieldbyname('std_cost').AsCurrency);

    Stringgrid4.cells[11,i]:=Fieldbyname('inv_part_description').asstring;
    Stringgrid4.Cells[12,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);

    vqty1:=vqty1+Fieldbyname('in_amount').AsCurrency;;
    vqty2:=vqty2+Fieldbyname('std_cost').AsCurrency;
    vqty3:=vqty3+Fieldbyname('actual_cost').AsCurrency;
    vqty4:=vqty4+Fieldbyname('actual_cost').AsCurrency-
                 Fieldbyname('std_cost').AsCurrency;

    next;
    i:=i+1;
    vleng:=int(500*recno/recordcount);
    FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng));
  end;
  frmprogress.Free;
  if i<>1 then
   begin
    Stringgrid4.rowcount:=Stringgrid4.rowcount+1;
    Stringgrid4.rows[Stringgrid4.rowcount-1].Text :='';
    Stringgrid4.Cells[0,Stringgrid4.rowcount-1]:='合计';
    Stringgrid4.cells[7,Stringgrid4.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid4.cells[8,Stringgrid4.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid4.cells[9,Stringgrid4.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid4.cells[10,Stringgrid4.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
   end; 
  SetOptimalGridCellWidth(Stringgrid4,[]);  //使所有stringgrid单元格宽度自适应
//  ComboBox1Change(nil);
end;

procedure TfrmShow.showcontent5();
var i:integer;
  vqty2,vqty3:currency;
begin
  i:=1;
  Stringgrid5.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid5.rows[1].Text:='';
  vqty2:=0;
  vqty3:=0;
  with DM.SP451 do
  while not eof do
   begin
    Stringgrid5.rows[i].Text :='';
    Stringgrid5.Cells[0,i]:=fieldbyname('dept_code').AsString;
    Stringgrid5.Cells[1,i]:=fieldbyname('dept_name').AsString;
    Stringgrid5.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('std_cost').AsCurrency);
    Stringgrid5.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency);
    Stringgrid5.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency-
                                                   fieldbyname('std_cost').AsCurrency);
    Stringgrid5.Cells[5,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);
    vqty2:=vqty2+fieldbyname('std_cost').AsCurrency;
    vqty3:=vqty3+fieldbyname('actual_cost').AsCurrency;
    next;
    i:=i+1;
   end;
  if i<>1 then
   begin
    Stringgrid5.rowcount:=Stringgrid5.rowcount+1;
    Stringgrid5.rows[Stringgrid5.rowcount-1].Text :='';
    Stringgrid5.Cells[0,Stringgrid5.rowcount-1]:='合计';
    Stringgrid5.Cells[2,Stringgrid5.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid5.Cells[4,Stringgrid5.rowcount-1]:=Formatfloat('#,##0.00',vqty3-vqty2);
    Stringgrid5.Cells[3,Stringgrid5.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
   end; 
  SetOptimalGridCellWidth(stringgrid5,[]);  //使所有stringgrid单元格宽度自适应
 // ComboBox1Change(nil);
end;

procedure TfrmShow.showcontent6();
var i:integer;
    vqty1,vqty3,vqty4,vqty5,vqty6,vqty2:currency;
     vDifSqt,vDifCost:currency;
begin
  i:=1;
  Stringgrid6.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid6.rows[1].Text:='';
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  vqty6:=0;
  with DM.SP451 do
  while not eof do
  begin
    Stringgrid6.rows[i].Text :='';
    Stringgrid6.cells[0,i]:=Fieldbyname('dept_code').asstring;
    Stringgrid6.cells[1,i]:=Fieldbyname('dept_name').asstring;
    Stringgrid6.cells[2,i]:=Fieldbyname('inv_part_number').asstring;
    Stringgrid6.cells[3,i]:=Fieldbyname('unit_code').asstring;
    Stringgrid6.cells[4,i]:=Formatfloat('#,##0.00',Fieldbyname('matl_std_cost').AsCurrency);
    if Fieldbyname('in_quantity').AsCurrency<>0 then
      Stringgrid6.cells[5,i]:=Formatfloat('#,##0.00',Fieldbyname('in_amount').AsCurrency/
                                                     Fieldbyname('in_quantity').AsCurrency);
    Stringgrid6.cells[6,i]:=Formatfloat('#,##0.00',Fieldbyname('open_quantity').AsCurrency);
    Stringgrid6.cells[7,i]:=Formatfloat('#,##0.00',Fieldbyname('in_quantity').AsCurrency);
    Stringgrid6.cells[8,i]:=Formatfloat('#,##0.00',Fieldbyname('closed_qty').AsCurrency);
    Stringgrid6.cells[9,i]:=Formatfloat('#,##0.00',Fieldbyname('open_amount').AsCurrency);
    Stringgrid6.cells[10,i]:=Formatfloat('#,##0.00',Fieldbyname('in_amount').AsCurrency);
    Stringgrid6.cells[11,i]:=Formatfloat('#,##0.00',Fieldbyname('closed_amount').AsCurrency);
    Stringgrid6.cells[12,i]:=Formatfloat('#,##0.00',Fieldbyname('std_cost').AsCurrency);
    Stringgrid6.cells[13,i]:=Formatfloat('#,##0.00',Fieldbyname('actual_cost').AsCurrency);
    vDifCost:=Fieldbyname('actual_cost').AsCurrency-Fieldbyname('std_cost').AsCurrency;

    Stringgrid6.cells[15,i]:=Formatfloat('#,##0.00',vDifCost);
    Stringgrid6.cells[16,i]:=Fieldbyname('inv_part_description').asString;
    Stringgrid6.Cells[17,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);
    vqty1:=vqty1+Fieldbyname('open_amount').AsCurrency;
    vqty2:=vqty2+Fieldbyname('in_amount').AsCurrency;
    vqty3:=vqty3+Fieldbyname('closed_amount').AsCurrency;
    vqty4:=vqty4+Fieldbyname('std_cost').AsCurrency;
    vqty5:=vqty5+Fieldbyname('actual_cost').AsCurrency;
    vqty6:=vqty6+vDifCost;
    { cells[0,0]:='部门';
    cells[1,0]:='部门名称';
    cells[2,0]:='材料代号';
    cells[3,0]:='单位';
    cells[4,0]:='计划价格';
    cells[5,0]:='实际价格';
    cells[6,0]:='期初存量';
    cells[7,0]:='本期领用';
    cells[8,0]:='期末存量';
    cells[9,0]:='期初金额';
    cells[10,0]:='本期金额';
    cells[11,0]:='期末金额';
    cells[12,0]:='标准成本';
    cells[13,0]:='实际成本';
    stringgrid6.ColWidths[14]:=0;
    cells[15,0]:='价格差异';
    cells[16,0]:='材料规格';
    cells[17,0]:='工厂'; }
    next;
    i:=i+1;
  end;
  if i<>1 then
   begin
    Stringgrid6.rowcount:=Stringgrid6.rowcount+1;
    Stringgrid6.rows[Stringgrid6.rowcount-1].Text :='';
    Stringgrid6.Cells[0,Stringgrid6.rowcount-1]:='合计';
    Stringgrid6.cells[9,Stringgrid6.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid6.cells[10,Stringgrid6.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid6.cells[11,Stringgrid6.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid6.cells[12,Stringgrid6.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid6.cells[13,Stringgrid6.rowcount-1]:=Formatfloat('#,##0.00',vqty5);
    Stringgrid6.cells[15,Stringgrid6.rowcount-1]:=Formatfloat('#,##0.00',vqty6);
   end; 
//  SetOptimalGridCellWidth(stringgrid6,[14]);  //使所有stringgrid单元格宽度自适应
  ComboBox1Change(nil);
end;

procedure TfrmShow.showcontent7();
var i:integer;
    vqty1,vqty2,vqty3:currency;
begin

  i:=1;
  Stringgrid7.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid7.rows[1].Text:='';

  vqty1:=0;
  vqty2:=0;
  vqty3:=0;

  with dm.SP451 do
  while not eof do
   begin
    Stringgrid7.Cells[0,i]:=fieldbyname('type').AsString;
    Stringgrid7.Cells[1,i]:=fieldbyname('group_name').AsString;
    Stringgrid7.Cells[2,i]:=fieldbyname('group_desc').AsString;
    Stringgrid7.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('budget_cost').AsCurrency);
    Stringgrid7.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency);
    Stringgrid7.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('actual_cost').AsCurrency-
                                                   fieldbyname('budget_cost').AsCurrency);
    Stringgrid7.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('std_cost').AsCurrency);
    Stringgrid7.Cells[7,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);
    vqty1:=vqty1+fieldbyname('budget_cost').AsCurrency;
    vqty2:=vqty2+fieldbyname('actual_cost').AsCurrency;
    vqty3:=vqty3+fieldbyname('std_cost').AsCurrency;
    next;
    i:=i+1;
   end;
  if i<>1 then
   begin
    Stringgrid7.rowcount:=Stringgrid7.rowcount+1;
    Stringgrid7.rows[Stringgrid7.rowcount-1].Text :='';
    Stringgrid7.Cells[0,Stringgrid7.rowcount-1]:='合计';
    Stringgrid7.Cells[3,Stringgrid7.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid7.Cells[4,Stringgrid7.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid7.Cells[5,Stringgrid7.rowcount-1]:=Formatfloat('#,##0.00',vqty2-vqty1);
    Stringgrid7.Cells[6,Stringgrid7.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
   end; 
  SetOptimalGridCellWidth(stringgrid7,[]);  //使所有stringgrid单元格宽度自适应
 // ComboBox1Change(nil);
end;

procedure TfrmShow.showcontent8();
var i:integer;
    vhour,vqty1,vqty2:Currency;
begin
  vhour:=0;
  vqty1:=0;
  vqty2:=0;
  i:=1;
  Stringgrid8.rowcount:=dm.sp451.RecordCount +1;

  with DM.SP451 do
  while not eof do
  begin
  Stringgrid8.rows[i].Text :='';
  Stringgrid8.Cells[0,i]:=fieldbyname('dept_code').AsString;
  Stringgrid8.Cells[1,i]:=fieldbyname('dept_name').AsString;
  Stringgrid8.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('yield_sqft').AsCurrency);

  Stringgrid8.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('ovhd_1').AsCurrency);
  Stringgrid8.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('ovhd_2').AsCurrency);

  Stringgrid8.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('ovhd_1').AsCurrency+
                                    fieldbyname('ovhd_2').AsCurrency);
  Stringgrid8.Cells[6,i]:=getFac(fieldbyname('warehouse_ptr').AsInteger);
  vhour:=vhour+fieldbyname('yield_sqft').AsCurrency;
  vqty1:=vqty1+fieldbyname('ovhd_1').AsCurrency;
  vqty2:=vqty2+fieldbyname('ovhd_2').AsCurrency;
  next;
  i:=i+1;
  end;
  if i<>1 then
   begin
    Stringgrid8.rowcount:=Stringgrid8.rowcount+1;
    Stringgrid8.rows[Stringgrid8.rowcount-1].Text :='';
    Stringgrid8.Cells[0,Stringgrid8.rowcount-1]:='合计';
    Stringgrid8.Cells[2,Stringgrid8.rowcount-1]:=Formatfloat('#,##0.##',vhour);
    Stringgrid8.Cells[3,Stringgrid8.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid8.Cells[4,Stringgrid8.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid8.Cells[5,Stringgrid8.rowcount-1]:=Formatfloat('#,##0.00',vqty1+vqty2);
   end;
  //SetOptimalGridCellWidth(stringgrid8,[1]);  //使所有stringgrid单元格宽度自适应
//  ComboBox1Change(nil);
end;

procedure TfrmShow.showcontent10();
var i:integer;
    vqty1,vqty2:currency;
begin
  vqty1:=0;
  vqty2:=0;
  i:=1;
  Stringgrid10.rowcount:=dm.sp451.RecordCount +1;

  with DM.SP451 do
  while not eof do
   begin
    Stringgrid10.rows[i].Text :='';
    Stringgrid10.Cells[0,i]:=inttostr(i);
    Stringgrid10.Cells[1,i]:=fieldbyname('dept_code').AsString;
    Stringgrid10.Cells[2,i]:=fieldbyname('dept_name').AsString;
    Stringgrid10.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('qty_reworked').AsCurrency);
    Stringgrid10.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('sqft_reworked').AsCurrency);
    Stringgrid10.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('std_cost').AsCurrency);
    vqty1:=vqty1+fieldbyname('sqft_reworked').AsCurrency;
    vqty2:=vqty2+fieldbyname('std_cost').AsCurrency;
    next;
    i:=i+1;
   end;
  
  if i<>1 then
   begin
    Stringgrid10.rowcount:=Stringgrid10.rowcount+1;
    Stringgrid10.rows[Stringgrid10.rowcount-1].Text :='';
    Stringgrid10.Cells[1,Stringgrid10.rowcount-1]:='合计';
    Stringgrid10.Cells[4,Stringgrid10.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid10.Cells[5,Stringgrid10.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
   end;
end;

procedure TfrmShow.showcontent11();
var i:integer;
    vqty1,vqty2,vqty3:currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;

  i:=1;
  Stringgrid11.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid11.rows[1].Text:='';
  with DM.SP451 do
  while not eof do
  begin

    Stringgrid11.rows[i].Text :='';
    Stringgrid11.Cells[0,i]:=inttostr(i);
    Stringgrid11.Cells[1,i]:=fieldbyname('dept_code').AsString;
    Stringgrid11.Cells[2,i]:=fieldbyname('manu_part_number').AsString;
    Stringgrid11.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('qty_reworked').AsCurrency);
    Stringgrid11.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('sqft_reworked').AsCurrency);
    Stringgrid11.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('TOT_STD_MATL_COST').AsCurrency);
    Stringgrid11.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('TOT_STD_OVHD_COST').AsCurrency);
    Stringgrid11.Cells[7,i]:=Formatfloat('#,##0.00',fieldbyname('TOT_STD_MATL_COST').AsCurrency+
    fieldbyname('TOT_STD_OVHD_COST').AsCurrency);
    vqty1:=vqty1+fieldbyname('sqft_reworked').AsCurrency;
    vqty2:=vqty2+fieldbyname('TOT_STD_MATL_COST').AsCurrency;
    vqty3:=vqty3+fieldbyname('TOT_STD_OVHD_COST').AsCurrency;
    next;
    i:=i+1;
  end;
  if i<>1 then
   begin
    Stringgrid11.rowcount:=Stringgrid11.rowcount+1;
    Stringgrid11.rows[Stringgrid11.rowcount-1].Text :='';
    Stringgrid11.Cells[1,Stringgrid11.rowcount-1]:='合计';
    Stringgrid11.Cells[4,Stringgrid11.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid11.Cells[5,Stringgrid11.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid11.Cells[6,Stringgrid11.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid11.Cells[7,Stringgrid11.rowcount-1]:=Formatfloat('#,##0.00',vqty2+vqty3);
  end;
end;

procedure TfrmShow.showRejeToWIP(); //返工成本转WIP
var i:integer;
    vqty1,vqty2,vqty3:currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  i:=1;
  Stringgrid26.rowcount:=dm.sp451.RecordCount +1;

  with DM.SP451 do
  while not eof do
   begin
    Stringgrid26.rows[i].Text :='';
    Stringgrid26.Cells[0,i]:=fieldbyname('MANU_PART_NUMBER').Value;
    Stringgrid26.Cells[1,i]:=fieldbyname('MANU_PART_DESC').Value;
    Stringgrid26.Cells[2,i]:=fieldbyname('WORK_ORDER_NUMBER').Value;
    Stringgrid26.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('QUANTITY').AsCurrency);
    Stringgrid26.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('sqft').AsCurrency);
    Stringgrid26.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('tot_matl_cost').AsCurrency);
    Stringgrid26.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('tot_ovhd_cost').AsCurrency);
    Stringgrid26.Cells[7,i]:=fieldbyname('sys_date').AsString;
    vqty1:=vqty1+fieldbyname('sqft').AsCurrency;
    vqty2:=vqty2+fieldbyname('tot_matl_cost').AsCurrency;
    vqty3:=vqty3+fieldbyname('tot_ovhd_cost').AsCurrency;
    next;
    i:=i+1;
   end;
  if i<>1 then
   begin
    Stringgrid26.rowcount:=Stringgrid26.rowcount+1;
    Stringgrid26.rows[Stringgrid26.rowcount-1].Text :='';
    Stringgrid26.Cells[1,Stringgrid26.rowcount-1]:='合计';
    Stringgrid26.Cells[4,Stringgrid26.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid26.Cells[5,Stringgrid26.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid26.Cells[6,Stringgrid26.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
  end;
end;


//报废成本汇总表
procedure TfrmShow.showcontent16();
var i:integer;
    vqty0,vqty1,vqty2:currency;
begin
  vqty0:=0;
  vqty1:=0;
  vqty2:=0;
  i:=1;
  Stringgrid16.rowcount:=dm.sp451.RecordCount +1;
  with DM.SP451 do
  while not eof do
   begin
    Stringgrid16.rows[i].Text :='';
    Stringgrid16.Cells[0,i]:=inttostr(i);
    Stringgrid16.Cells[1,i]:=fieldbyname('dept_code').AsString;
    Stringgrid16.Cells[2,i]:=fieldbyname('dept_name').AsString;
    Stringgrid16.Cells[3,i]:=Formatfloat('#,##0',fieldbyname('qty_rejected').AsCurrency);
    Stringgrid16.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('sqft_rejected').AsCurrency);
    Stringgrid16.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('std_cost').AsCurrency);
    Stringgrid16.Cells[6,i]:=fieldbyname('abbr_name').AsString;
    vqty0:=vqty0+fieldbyname('qty_rejected').AsCurrency;
    vqty1:=vqty1+fieldbyname('sqft_rejected').AsCurrency;
    vqty2:=vqty2+fieldbyname('std_cost').AsCurrency;
    next;
    i:=i+1;
   end;

  if i<>1 then
   begin
    Stringgrid16.rowcount:=Stringgrid16.rowcount+1;
    Stringgrid16.rows[Stringgrid16.rowcount-1].Text :='';
    Stringgrid16.Cells[1,Stringgrid16.rowcount-1]:='合计';
    Stringgrid16.Cells[3,Stringgrid16.rowcount-1]:=Formatfloat('#,##0',vqty0);
    Stringgrid16.Cells[4,Stringgrid16.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid16.Cells[5,Stringgrid16.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
   end;

  SetOptimalGridCellWidth(Stringgrid16,[]);  //使所有stringgrid单元格宽度自适应

 
end;

procedure TfrmShow.showcontent17(); //报废成本明细表
var i:integer;
    vqty0,vqty1,vqty2,vqty3,vqty4:currency;
    vTCost:currency;
    vleng:currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  i:=1;

  Stringgrid17.rowcount:=dm.sp451.RecordCount +1;
  Application.CreateForm(TFrmProgress, FrmProgress);
  FrmProgress.show;
  with DM.SP451 do
  while not eof do
   begin
    Stringgrid17.rows[i].Text :='';
    Stringgrid17.Cells[0,i]:=fieldbyname('dept_code').AsString;;
    Stringgrid17.Cells[1,i]:=fieldbyname('manu_part_number').AsString;
    Stringgrid17.Cells[2,i]:=fieldbyname('manu_part_desc').AsString;

    Stringgrid17.Cells[3,i]:=fieldbyname('PRODUCT_NAME').AsString;
    Stringgrid17.Cells[4,i]:=fieldbyname('LAYERS').AsString;

    Stringgrid17.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('qty_rejected').AsCurrency);
    Stringgrid17.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('sqft_rejected').AsCurrency);
    Stringgrid17.Cells[7,i]:=Formatfloat('#,##0.00',fieldbyname('tot_std_matl_cost').AsCurrency);
    Stringgrid17.Cells[8,i]:=Formatfloat('#,##0.00',fieldbyname('tot_std_ovhd_cost').AsCurrency);
    vTCost:=fieldbyname('tot_std_matl_cost').AsCurrency+
            fieldbyname('tot_std_ovhd_cost').AsCurrency;
    Stringgrid17.Cells[9,i]:=Formatfloat('#,##0.00',vTCost);
    Stringgrid17.Cells[10,i]:=fieldbyname('work_order_number').Value;
    Stringgrid17.Cells[11,i]:=fieldbyname('abbr_name').Value;
    Stringgrid17.Cells[12,i]:=fieldbyname('abbrname15').Value;
    vqty0:=vqty0+fieldbyname('qty_rejected').AsCurrency;
    vqty1:=vqty1+fieldbyname('sqft_rejected').AsCurrency;
    vqty2:=vqty2+fieldbyname('tot_std_matl_cost').AsCurrency;
    vqty3:=vqty3+fieldbyname('tot_std_ovhd_cost').AsCurrency;
    vqty4:=vqty4+vTCost;
    next;
    i:=i+1;
    vleng:=int(500*recno/recordcount);
    FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng));
   end;
  frmprogress.Free;
  if i<>1 then
   begin
    Stringgrid17.rowcount:=Stringgrid17.rowcount+1;
    Stringgrid17.rows[Stringgrid17.rowcount-1].Text :='';
    Stringgrid17.Cells[1,Stringgrid17.rowcount-1]:='合计';
    Stringgrid17.Cells[5,Stringgrid17.rowcount-1]:=Formatfloat('#,##0',vqty0);
    Stringgrid17.Cells[6,Stringgrid17.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid17.Cells[7,Stringgrid17.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid17.Cells[8,Stringgrid17.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid17.Cells[9,Stringgrid17.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
   end; 
  SetOptimalGridCellWidth(Stringgrid17,[]);  //使所有stringgrid单元格宽度自适应

end;

procedure TfrmShow.showcontent18(); //完工成本按客户汇总
var i:integer;
    vqty1,vqty2,vqty3,vqty4,vqty5,vqty6,vqty7:currency;
    vCost:Currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  i:=1;
  Stringgrid18.rowcount:=dm.sp451.RecordCount +1;
  Stringgrid18.rows[1].Text:='';
{

}
  with DM.SP451 do
  while not eof do
  begin

    Stringgrid18.rows[i].Text :='';
    Stringgrid18.Cells[0,i]:=fieldbyname('cust_code').AsString;
    Stringgrid18.Cells[1,i]:=fieldbyname('abbr_name').AsString;
    Stringgrid18.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('matl_cost').AsCurrency);
    Stringgrid18.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('ovhd_cost').AsCurrency);
    Stringgrid18.Cells[4,i]:=Formatfloat('#,##0',fieldbyname('quan_prod').AsCurrency);
    Stringgrid18.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
    Stringgrid18.Cells[6,i]:=Formatfloat('#,##0.0000',fieldbyname('square').AsCurrency);

    vCost:=fieldbyname('matl_cost').AsCurrency+fieldbyname('ovhd_cost').AsCurrency;
     if fieldbyname('amount').AsCurrency=0 then
     vqty6:=0
    else
     vqty6:=vCost/fieldbyname('amount').AsCurrency;

    if fieldbyname('square').AsCurrency=0 then
     vqty7:=0
    else
     vqty7:=vCost/fieldbyname('square').AsCurrency;

    Stringgrid18.Cells[7,i]:=Formatfloat('#,##0.00',vqty6*100)+'%';
    Stringgrid18.Cells[8,i]:=Formatfloat('#,##0.0000',vqty7);

    vqty1:=vqty1+fieldbyname('matl_cost').AsCurrency;
    vqty2:=vqty2+fieldbyname('ovhd_cost').AsCurrency;
    vqty3:=vqty3+fieldbyname('quan_prod').AsCurrency;
    vqty4:=vqty4+fieldbyname('amount').AsCurrency;
    vqty5:=vqty5+fieldbyname('square').AsCurrency;

    next;
    i:=i+1;
  end;
  if i<>1 then
   begin
    Stringgrid18.rowcount:=Stringgrid18.rowcount+1;
    Stringgrid18.rows[Stringgrid18.rowcount-1].Text :='';
    Stringgrid18.Cells[1,Stringgrid18.rowcount-1]:='合计';
    Stringgrid18.Cells[2,Stringgrid18.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid18.Cells[3,Stringgrid18.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid18.Cells[4,Stringgrid18.rowcount-1]:=Formatfloat('#,##0',vqty3);
    Stringgrid18.Cells[5,Stringgrid18.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid18.Cells[6,Stringgrid18.rowcount-1]:=Formatfloat('#,##0.0000',vqty5);
    vCost:=vqty1+vqty2;
    if vqty4>0 then
    begin
    vqty6:=vCost/vqty4;
    Stringgrid18.Cells[7,Stringgrid18.rowcount-1]:=Formatfloat('#,##0.00',vqty6*100)+'%';
    end;
    if vqty5>0 then
    begin
    vqty7:=vCost/vqty5;
    Stringgrid18.Cells[8,Stringgrid18.rowcount-1]:=Formatfloat('#,##0.00',vqty7);
    end;
   end;

  SetOptimalGridCellWidth(Stringgrid18,[]);  //使所有stringgrid单元格宽度自适应
end;

procedure TfrmShow.showcontent19();    //完工成本按类别汇总
var i:integer;
    vqty1,vqty2,vqty3,vqty4,vqty5,vqty6,vqty7:currency;
    vCost:Currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  
  i:=1;
  Stringgrid19.rowcount:=dm.sp451.RecordCount +1;

  with DM.SP451 do
  while not eof do
  begin

    Stringgrid19.rows[i].Text :='';

    Stringgrid19.Cells[1,i]:=fieldbyname('PROD_CODE').AsString;
    Stringgrid19.Cells[2,i]:=fieldbyname('PRODUCT_NAME').AsString;
    Stringgrid19.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('matl_cost').AsCurrency);
    Stringgrid19.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('ovhd_cost').AsCurrency);
    Stringgrid19.Cells[5,i]:=Formatfloat('#,##0',fieldbyname('quan_prod').AsCurrency);
    Stringgrid19.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
    Stringgrid19.Cells[7,i]:=Formatfloat('#,##0.0000',fieldbyname('square').AsCurrency);

    vCost:=fieldbyname('matl_cost').AsCurrency+fieldbyname('ovhd_cost').AsCurrency;

    if fieldbyname('amount').AsCurrency=0 then
     vqty6:=0
    else
     vqty6:=vCost/fieldbyname('amount').AsCurrency;
    if fieldbyname('square').AsCurrency=0 then
     vqty7:=0
    else
     vqty7:=vCost/fieldbyname('square').AsCurrency;
    Stringgrid19.Cells[8,i]:=Formatfloat('#,##0.00',vqty6*100)+'%';
    Stringgrid19.Cells[9,i]:=Formatfloat('#,##0.0000',vqty7);

    vqty1:=vqty1+fieldbyname('matl_cost').AsCurrency;
    vqty2:=vqty2+fieldbyname('ovhd_cost').AsCurrency;
    vqty3:=vqty3+fieldbyname('quan_prod').AsCurrency;
    vqty4:=vqty4+fieldbyname('amount').AsCurrency;
    vqty5:=vqty5+fieldbyname('square').AsCurrency;

    next;
    i:=i+1;
  end;
  if i<>1 then
   begin
    Stringgrid19.rowcount:=Stringgrid19.rowcount+1;
    Stringgrid19.rows[Stringgrid19.rowcount-1].Text :='';
    Stringgrid19.Cells[1,Stringgrid19.rowcount-1]:='合计';
    Stringgrid19.Cells[3,Stringgrid19.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid19.Cells[4,Stringgrid19.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid19.Cells[5,Stringgrid19.rowcount-1]:=Formatfloat('#,##0',vqty3);
    Stringgrid19.Cells[6,Stringgrid19.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid19.Cells[7,Stringgrid19.rowcount-1]:=Formatfloat('#,##0.0000',vqty5);
    vCost:=vqty1+vqty2;

    vqty6:=vCost/vqty4;
    vqty7:=vCost/vqty5;
    Stringgrid19.Cells[8,Stringgrid19.rowcount-1]:=Formatfloat('#,##0.00',vqty6*100)+'%';
    Stringgrid19.Cells[9,Stringgrid19.rowcount-1]:=Formatfloat('#,##0.00',vqty7);

   end;

  SetOptimalGridCellWidth(Stringgrid19,[0]);  //使所有stringgrid单元格宽度自适应
end;

//完工成本按作业单显示
procedure TfrmShow.showcontent21();

begin

end;

procedure TfrmShow.showcontent22();//销售成本汇总表
var i:integer;
    vqty1,vqty2,vqty3,vqty4,vqty5,vqty6,vqty7:currency;
    vCost:Currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  vqty6:=0;
  vqty7:=0;
  i:=1;
  Stringgrid22.rowcount:=dm.sp451.RecordCount +1;

  with DM.SP451 do
  while not eof do
  begin

    Stringgrid22.rows[i].Text :='';
    Stringgrid22.Cells[0,i]:=fieldbyname('SALES_ORDER').AsString;
    Stringgrid22.Cells[1,i]:=fieldbyname('so_type').AsString;
    Stringgrid22.Cells[2,i]:=fieldbyname('abbr_name').AsString;
    Stringgrid22.Cells[3,i]:=fieldbyname('MANU_PART_NUMBER').AsString;
    Stringgrid22.Cells[4,i]:=fieldbyname('MANU_PART_DESC').AsString;
    Stringgrid22.Cells[5,i]:=fieldbyname('PROD_CODE').AsString;
    Stringgrid22.Cells[6,i]:=fieldbyname('PRODUCT_NAME').AsString;

    Stringgrid22.Cells[7,i]:=Formatfloat('#,##0.0000',fieldbyname('sales_sqft').AsCurrency);
    Stringgrid22.Cells[8,i]:=Formatfloat('#,##0',fieldbyname('ship_total52').AsCurrency);
    Stringgrid22.Cells[9,i]:=Formatfloat('#,##0.00',fieldbyname('sales_amount').AsCurrency);
    Stringgrid22.Cells[10,i]:=Formatfloat('#,##0.00',fieldbyname('sales_cost').AsCurrency);
    Stringgrid22.Cells[11,i]:=Formatfloat('#,##0.00',fieldbyname('sales_amount').AsCurrency-
                                                     fieldbyname('sales_cost').AsCurrency);
    Stringgrid22.Cells[12,i]:=Formatfloat('#,##0.00',fieldbyname('cost_rate').AsCurrency);

    vqty1:=vqty1+fieldbyname('sales_sqft').AsCurrency;
    vqty2:=vqty2+fieldbyname('ship_total52').AsCurrency;
    vqty3:=vqty3+fieldbyname('sales_amount').AsCurrency;
    vqty4:=vqty4+fieldbyname('sales_cost').AsCurrency;
    //vqty5:=vqty5+(vqty3-vqty4);

    next;
    i:=i+1;
  end;
  if i<>1 then
   begin
    Stringgrid22.rowcount:=Stringgrid22.rowcount+1;
    Stringgrid22.rows[Stringgrid22.rowcount-1].Text :='';
    Stringgrid22.Cells[1,Stringgrid22.rowcount-1]:='合计';
    Stringgrid22.Cells[7,Stringgrid22.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid22.Cells[8,Stringgrid22.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid22.Cells[9,Stringgrid22.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid22.Cells[10,Stringgrid22.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid22.Cells[11,Stringgrid22.rowcount-1]:=Formatfloat('#,##0.00',vqty3-vqty4);
    if vqty3<>0 then
     Stringgrid22.Cells[12,Stringgrid22.rowcount-1]:=Formatfloat('#,##0.00',vqty4/vqty3*100);
   end;

  SetOptimalGridCellWidth(Stringgrid22,[]);  //使所有stringgrid单元格宽度自适应
end;

procedure TfrmShow.showcontent23();//销售成本明细表
var i:integer;
    vqty1,vqty2,vqty3,vqty4,vqty5,vqty6,vqty7:currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  vqty6:=0;
  vqty7:=0;

  i:=1;
  Stringgrid23.rowcount := dm.sp451.RecordCount + 1;

  with DM.SP451 do
  while not eof do
   begin
    Stringgrid23.rows[i].Text :='';
    Stringgrid23.Cells[0,i]:=fieldbyname('SALES_ORDER').AsString;
    Stringgrid23.Cells[1,i]:=fieldbyname('date_assign').AsString;
    Stringgrid23.Cells[2,i]:=fieldbyname('abbr_name').AsString;
    Stringgrid23.Cells[3,i]:=fieldbyname('Manu_PART_NUMBER').AsString;
    Stringgrid23.Cells[4,i]:=fieldbyname('Manu_PART_DESC').AsString;
    Stringgrid23.Cells[5,i]:=fieldbyname('PROD_code').AsString;
    Stringgrid23.Cells[6,i]:=fieldbyname('WORK_ORDER_NUMBER').AsString;
    Stringgrid23.Cells[7,i]:=Formatfloat('#,##0',fieldbyname('QUAN_SHP').AsCurrency);
    Stringgrid23.Cells[8,i]:=Formatfloat('#,##0.00',fieldbyname('sales_square').AsCurrency);
    Stringgrid23.Cells[9,i]:=Formatfloat('#,##0.00',fieldbyname('sales_amount').AsCurrency);
    Stringgrid23.Cells[10,i]:=Formatfloat('#,##0.00',fieldbyname('MATL_COST').AsCurrency);
    Stringgrid23.Cells[11,i]:=Formatfloat('#,##0.00',fieldbyname('OVHD_COST').AsCurrency);
    Stringgrid23.Cells[12,i]:=Formatfloat('#,##0.00',fieldbyname('sales_matl_cost').AsCurrency);
    Stringgrid23.Cells[13,i]:=Formatfloat('#,##0.00',fieldbyname('sales_amount').AsCurrency-
                                                     fieldbyname('sales_matl_cost').AsCurrency);
    Stringgrid23.Cells[14,i]:=Formatfloat('#,##0.00',fieldbyname('cost_rate').AsCurrency);
    vqty1:=vqty1+fieldbyname('QUAN_SHP').AsCurrency;
    vqty2:=vqty2+fieldbyname('sales_square').AsCurrency;
    vqty3:=vqty3+fieldbyname('sales_amount').AsCurrency;
    vqty4:=vqty4+fieldbyname('MATL_COST').AsCurrency;
    vqty5:=vqty5+fieldbyname('OVHD_COST').AsCurrency;
    vqty6:=vqty6+fieldbyname('sales_matl_cost').AsCurrency;
    vqty7:=vqty7+(vqty3-vqty6);
    next;
    i:=i+1;
   end;
   
  if i<>1 then
   begin
    Stringgrid23.rowcount:=Stringgrid23.rowcount+1;
    Stringgrid23.rows[Stringgrid23.rowcount-1].Text :='';
    Stringgrid23.Cells[1,Stringgrid23.rowcount-1]:='合计';
    Stringgrid23.Cells[7,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid23.Cells[8,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid23.Cells[9,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid23.Cells[10,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid23.Cells[11,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty5);
    Stringgrid23.Cells[12,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty6);
    Stringgrid23.Cells[13,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty7);
    if vqty3>0 then
     Stringgrid23.Cells[14,Stringgrid23.rowcount-1]:=Formatfloat('#,##0.00',vqty6*100/vqty3);
   end;
  SetOptimalGridCellWidth(Stringgrid23,[]);  //使所有stringgrid单元格宽度自适应
end;

procedure TfrmShow.showcontent24();//材料发出汇总
var i:integer;
    vqty1,vqty2,vqty3,vqty4,vqty5,vqty6:currency;
    vCost,vleng:Currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  vqty6:=0;

  i:=1;
  Stringgrid24.rowcount:=2;
  Stringgrid24.rows[1].Text:='';
 
  dm.Qery1.Open;
  dm.Qery1.First;
  with dm.Qery1 do
  while not dm.Qery1.Eof do
   begin
    Stringgrid24.rowcount:=i+1;
    Stringgrid24.rows[i].Text :='';
    if trim(fieldbyname('ttype').Value) ='M' then
     Stringgrid24.Cells[0,i]:='辅助材料'
    else
     Stringgrid24.Cells[0,i]:='原材料';
    Stringgrid24.Cells[1,i]:=fieldbyname('inv_group_desc').AsString;
    i:=i+1;
    dm.Qery1.Next;
   end;
  dm.Qery1.first;

  Application.CreateForm(TFrmProgress, FrmProgress);
  FrmProgress.show;
  with DM.SP451 do
  while not dm.Qery1.eof do
  begin
    i:=dm.Qery1.RecNo;
    close;
    ProcedureName:='wzsp451;31';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vDeN']:='生产领用';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid24.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=fieldbyname('amount').AsCurrency;
      vqty1:=vqty1+fieldbyname('amount').AsCurrency;
     end
    else
     begin
      Stringgrid24.Cells[2,i]:='0';
      vCost:=0;
     end; 

    close;
    ProcedureName:='wzsp451;31';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vDeN']:='非生产用';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid24.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty2:=vqty2+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid24.Cells[3,i]:='0';
    close;
    ProcedureName:='wzsp451;31';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vDeN']:='梅州单面厂';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid24.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty3:=vqty3+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid24.Cells[4,i]:='0';
    close;
    ProcedureName:='wzsp451;31';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vDeN']:='梅州双面厂';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid24.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty4:=vqty4+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid24.Cells[5,i]:='0';
    close;
    ProcedureName:='wzsp451;31';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vDeN']:='深圳单面厂';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid24.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty5:=vqty5+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid24.Cells[6,i]:='0';

    Stringgrid24.Cells[7,i]:=Formatfloat('#,##0.00',vCost);

    vqty6:=vqty6+vCost;

    dm.Qery1.next;
    vleng:=int(500*dm.Qery1.recno/dm.Qery1.recordcount);
    FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng))
  end;
  frmprogress.Free;
  if i>2 then
   begin
    Stringgrid24.rowcount:=Stringgrid24.rowcount+1;
    Stringgrid24.rows[Stringgrid24.rowcount-1].Text :='';
    Stringgrid24.Cells[1,Stringgrid24.rowcount-1]:='合计';
    Stringgrid24.Cells[2,Stringgrid24.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid24.Cells[3,Stringgrid24.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid24.Cells[4,Stringgrid24.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid24.Cells[5,Stringgrid24.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid24.Cells[6,Stringgrid24.rowcount-1]:=Formatfloat('#,##0.00',vqty5);
    Stringgrid24.Cells[7,Stringgrid24.rowcount-1]:=Formatfloat('#,##0.00',vqty6)

   end;

  //SetOptimalGridCellWidth(Stringgrid24,[]);  //使所有stringgrid单元格宽度自适应
end;

procedure TfrmShow.showcontent25();//材料购入汇总
var i:integer;
    vqty1,vqty2,vqty3,vqty4,vqty5,vqty6,vqty7:currency;
    vCost,vleng:Currency;
begin
  vqty1:=0;
  vqty2:=0;
  vqty3:=0;
  vqty4:=0;
  vqty5:=0;
  vqty6:=0;
  vqty7:=0;

  i:=1;
  Stringgrid25.rowcount:=2;;
  Stringgrid25.rows[1].Text:='';
 
  dm.Qery1.Open;
  dm.Qery1.First;
  with dm.Qery1 do
  while not dm.Qery1.Eof do
   begin
    Stringgrid25.rowcount:=i+1;
    Stringgrid25.rows[i].Text :='';
    if trim(fieldbyname('ttype').Value) ='M' then
     Stringgrid25.Cells[0,i]:='辅助材料'
    else
     Stringgrid25.Cells[0,i]:='原材料';
    Stringgrid25.Cells[1,i]:=fieldbyname('inv_group_desc').AsString;
    i:=i+1;
    dm.Qery1.Next;
   end;
  dm.Qery1.first;
  Application.CreateForm(TFrmProgress, FrmProgress);
  FrmProgress.show;
  with DM.SP451 do
  while not dm.Qery1.eof do
  begin
    i:=dm.Qery1.RecNo;
    close;
    ProcedureName:='wzsp451;32';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vCounN']:='中国';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid25.Cells[2,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=fieldbyname('amount').AsCurrency;
      vqty1:=vqty1+fieldbyname('amount').AsCurrency;
     end
    else
     begin
      Stringgrid25.Cells[2,i]:='0';
      vCost:=0;
     end; 

    close;
    ProcedureName:='wzsp451;32';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vCounN']:='梅双厂';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid25.Cells[3,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty2:=vqty2+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid25.Cells[3,i]:='0';
    close;
    ProcedureName:='wzsp451;32';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vCounN']:='深圳单面厂';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid25.Cells[4,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty3:=vqty3+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid25.Cells[4,i]:='0';
    close;
    ProcedureName:='wzsp451;32';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vCounN']:='威达通';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid25.Cells[5,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty4:=vqty4+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid25.Cells[5,i]:='0';
    close;
    ProcedureName:='wzsp451;32';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vCounN']:='中国香港';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid25.Cells[6,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty5:=vqty5+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid25.Cells[6,i]:='0';
    close;
    ProcedureName:='wzsp451;32';
    Parameters.Refresh;
    parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
    parameters.ParamValues['@vCounN']:='梅州化工厂';
    parameters.ParamValues['@vtype']:=dm.Qery1.FieldValues['ttype'];
    parameters.ParamValues['@vInvGroup']:=dm.Qery1.FieldValues['inv_group_desc'];
    open;
    if RecordCount>0 then
     begin
      Stringgrid25.Cells[7,i]:=Formatfloat('#,##0.00',fieldbyname('amount').AsCurrency);
      vCost:=vCost+fieldbyname('amount').AsCurrency;
      vqty6:=vqty6+fieldbyname('amount').AsCurrency;
     end
    else
     Stringgrid25.Cells[7,i]:='0';

    Stringgrid25.Cells[8,i]:=Formatfloat('#,##0.00',vCost);

    vqty7:=vqty7+vCost;

    dm.Qery1.next;
    vleng:=int(500*dm.Qery1.recno/dm.Qery1.recordcount);
    FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng))
  end;
  frmprogress.Free;
  if i>2 then
   begin
    Stringgrid25.rowcount:=Stringgrid25.rowcount+1;
    Stringgrid25.rows[Stringgrid25.rowcount-1].Text :='';
    Stringgrid25.Cells[1,Stringgrid25.rowcount-1]:='合计';
    Stringgrid25.Cells[2,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty1);
    Stringgrid25.Cells[3,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty2);
    Stringgrid25.Cells[4,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty3);
    Stringgrid25.Cells[5,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty4);
    Stringgrid25.Cells[6,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty5);
    Stringgrid25.Cells[7,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty6);
    Stringgrid25.Cells[8,Stringgrid25.rowcount-1]:=Formatfloat('#,##0.00',vqty7);
   end;
end;
//格式化
procedure TfrmShow.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If (acol>1) AND (acol<9) then
   begin
    with TStringGrid(Sender) do  //Try
     begin
      Canvas.TextRect(rect,rect.right-Canvas.TextWidth(Cells[aCol,aRow])-2,
        rect.Top+2, trim(Cells[aCol,aRow]));
      Canvas.FrameRect(rect)
     end;
   end;
end;

procedure TfrmShow.StringGrid7DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) and (acol<>2) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);
end;

procedure TfrmShow.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) and (acol<>2) AND
     (acol<>17) AND (acol<>18) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);
end;

procedure TfrmShow.StringGrid4DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) and (acol<>2)
  AND (acol<>17) and (acol<>18) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);  //右对集
end;

procedure TfrmShow.StringGrid16DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) and (acol<>2) and (acol<>6) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);
end;

procedure TfrmShow.StringGrid17DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) and (acol<>2) and
     (acol<>3) and
     (acol<>4) AND
     (acol<>10) and
     (acol<>11) and
     (acol<>12) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);
end;

procedure TfrmShow.StringGrid18DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);
end;

procedure TfrmShow.StringGrid23DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
   if (acol<>0) AND (acol<>1) and (acol<>2) AND (acol<>3) and (acol<>4) AND (acol<>5)
   AND (acol<>6) then
    Align(TStringGrid(Sender),Rect,Acol,ARow);
end;
//对齐
procedure TfrmShow.Align(sender:TStringGrid;Rect:TRect; ACol,ARow:integer);
begin
  with Sender do
   begin
    Canvas.TextRect(rect,rect.right-Canvas.TextWidth(Cells[ACol,aRow])-2,
       rect.Top+2, trim(Cells[ACol,aRow]));
    Canvas.FrameRect(rect)
   end;
end;


procedure TfrmShow.FormShow(Sender: TObject);
begin
 SetStrGridTitl();
 TabSheet9.Show;

 PreColumn := DBGrideh1.Columns[3];
 PreColumn_list := DBGrideh2.Columns[3];
// PreColumn_372total:=DBGrideh3.Columns[3];
// PreColumn_372list:= DBGrideh4.Columns[2];
 PreColumn_372total:=DBGrideh3.Columns[0];
 PreColumn_372list:= DBGrideh4.Columns[0];

 PreColumn_464so := DBGrideh5.Columns[2];
 PreColumn_464wo := DBGrideh6.Columns[1];

 PreColumn_75total:=DBGrideh7.Columns[0];
 PreColumn_75list:= DBGrideh8.Columns[0];

 PreColumn428:=DBGrideh9.Columns[0];
 PreColumn428_1:= DBGrideh10.Columns[0];

 field_name := PreColumn.FieldName;
 fieldname := PreColumn_list.FieldName;
 fieldname372total:=PreColumn_372total.FieldName;
 fieldname372list:=PreColumn_372list.FieldName;

 fieldname464so:= PreColumn_464so.fieldname;
 fieldname464wo:= PreColumn_464wo.FieldName;

 fieldname75total:=PreColumn_75total.FieldName;
 fieldname75list:=PreColumn_75list.FieldName;

 fieldname428:=PreColumn428.FieldName;
 fieldname428_1:=PreColumn428_1.FieldName;
end;

procedure TfrmShow.TabSheet9Show(Sender: TObject);   //直接材料汇总消耗分析
begin
if TTabSheet(Sender).Caption='汇总表' then
  if StringGrid1.RowCount<3 then
   begin
    DM.SP451.close;
    DM.SP451.ProcedureName:='wzsp451;8';
    dm.SP451.Parameters.Refresh;
    DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
    dM.SP451.open;
    showcontent1();
   end
  else
else
 if StringGrid2.RowCount<3 then
  begin
   DM.SP451.close;
   DM.SP451.ProcedureName:='wzsp451;3';
   dm.SP451.Parameters.Refresh;
   DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
   dM.SP451.open;
   showcontent2();
  end;
end;

//间接材料消耗分析
procedure TfrmShow.TabSheet11Show(Sender: TObject);
begin
  if TTabSheet(Sender).Caption='汇总表' then
   if StringGrid3.RowCount<3 then
     begin
      DM.SP451.close;
      DM.SP451.ProcedureName:='wzsp451;11';
      dm.SP451.Parameters.Refresh;
      DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
      dM.SP451.open;
      showcontent3();
     end
   else
  else
    if StringGrid4.RowCount<3 then
      begin
       DM.SP451.close;
       DM.SP451.ProcedureName:='wzsp451;16';
       dm.SP451.Parameters.Refresh;
       DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
       dM.SP451.open;
       showcontent4();
      end
end;

procedure TfrmShow.TabSheet13Show(Sender: TObject);    //其它材料消耗
begin
  if TTabSheet(Sender).Caption='汇总表' then
    if StringGrid5.RowCount<3  then
     begin
      DM.SP451.close;
      DM.SP451.ProcedureName:='wzsp451;21';
      dm.SP451.Parameters.Refresh;
      DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
      dM.SP451.open;
      showcontent5();
     end
    else
  else
   if StringGrid6.RowCount<3  then
    begin
     DM.SP451.close;
     DM.SP451.ProcedureName:='wzsp451;20';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
     dM.SP451.open;
     showcontent6();
    end;
end;

procedure TfrmShow.TabSheet18Show(Sender: TObject); //返工成本分析
begin
 if TTabSheet(Sender).Caption='汇总数据' then
  if StringGrid10.RowCount < 3 then
    begin
     DM.SP451.close;
     DM.SP451.ProcedureName:='wzsp451;24';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
     DM.SP451.open;
     showcontent10();
    end;

 if TTabSheet(Sender).Caption='明细数据' then
  if StringGrid11.RowCount < 3 then
    begin
     DM.SP451.close;
     DM.SP451.ProcedureName:='wzsp451;23';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
     DM.SP451.open;
     showcontent11();
    end;
    
  if TTabSheet(Sender).Caption='特殊出仓成本' then
   if StringGrid26.RowCount < 3 then
    begin
     DM.SP451.close;
     DM.SP451.ProcedureName:='wzsp451;41';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vdate1']:=FrmMain.Qery451actual_fm_date.value;
     DM.SP451.parameters.ParamValues['@vdate2']:=FrmMain.Qery451actual_end_date.value;
     DM.SP451.open;
     showRejeToWIP();
    end;
end;

procedure TfrmShow.TabSheet20Show(Sender: TObject);   //材料进出存
begin
  if TTabSheet(Sender).Caption='汇总数据' then
   if not ads451_total.Active then
    begin
     ads451_total.close;
     ads451_total.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ads451_total.open;
    end;

 if TTabSheet(Sender).Caption='明细数据' then
  if not ads451_list.Active then
    begin
     ads451_list.close;
     ads451_list.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ads451_list.open;
    end;
end;

procedure TfrmShow.TabSheet23Show(Sender: TObject); //成品进出存
begin
  if TTabSheet(Sender).Caption='汇总数据' then
   if not ads372_total.Active then
    begin
     ads372_total.close;
     ads372_total.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ads372_total.open;
    end;

 if TTabSheet(Sender).Caption='明细数据' then
  if not ads372_list.Active then
    begin
     ads372_list.close;
     ads372_list.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ads372_list.open;
    end;
end;

procedure TfrmShow.TabSheet26Show(Sender: TObject);    //报废成本分析
begin
 if TTabSheet(Sender).Caption='汇总数据' then
  begin
   if StringGrid16.RowCount < 3 then
   begin
    dm.SP451.Close;
    DM.SP451.ProcedureName:='wzsp451;13';
    dm.SP451.Parameters.Refresh;
    DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
    dm.SP451.Open;
    showcontent16();
   end;
  end;
 if TTabSheet(Sender).Caption='明细数据' then
  begin
  if StringGrid17.RowCount < 3 then
    begin
     dm.SP451.Close;
     DM.SP451.ProcedureName:='wzsp451;12';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').Value;
     dm.SP451.Open;
     showcontent17();
    end;
  end;
end;

procedure TfrmShow.TabSheet31Show(Sender: TObject); //完工成本分析
begin
 dm.SP451.Filter:='';
 if TTabSheet(Sender).Caption='按客户' then
  if StringGrid18.RowCount <3 then
   begin
    dm.SP451.Close;
    DM.SP451.ProcedureName:='wzsp451;18';
    dm.SP451.Parameters.Refresh;
    DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
    dm.SP451.Open;
    showcontent18();
   end;
 if TTabSheet(Sender).Caption='按类别' then
  if StringGrid19.RowCount <3 then
    begin
     dm.SP451.Close;
     DM.SP451.ProcedureName:='wzsp451;19';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').Value;
     dm.SP451.Open;
     showcontent19();
    end;
    
 if TTabSheet(Sender).Caption='按订单' then
  if not ADS464_SO.Active then
    begin
     ADS464_SO.close;
     ADS464_SO.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ADS464_SO.open;
    end;

 if TTabSheet(Sender).Caption='按作业单' then
  if not ADS464_WO.Active then
    begin
     ADS464_WO.close;
     ADS464_WO.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ADS464_WO.open;
    end;

end;

procedure TfrmShow.TabSheet36Show(Sender: TObject);   //销售成本分析
begin
 if TTabSheet(Sender).Caption='汇总数据' then
  if StringGrid22.RowCount <3 then
   begin
    dm.SP451.Close;
    DM.SP451.ProcedureName:='wzsp451;30';
    dm.SP451.Parameters.Refresh;
    DM.SP451.parameters.ParamValues['@vtp']:=1;
    DM.SP451.parameters.ParamValues['@vdate1']:=FrmMain.Qery451actual_fm_date.value;
    DM.SP451.parameters.ParamValues['@vdate2']:=FrmMain.Qery451actual_end_date.value;
    dm.SP451.Open;
    showcontent22();
   end;
    
 if TTabSheet(Sender).Caption='明细数据' then
  if StringGrid23.RowCount <3 then
    begin
     dm.SP451.Close;
     DM.SP451.ProcedureName:='wzsp451;30';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vtp']:=0;
     DM.SP451.parameters.ParamValues['@vdate1']:=FrmMain.Qery451actual_fm_date.value;
     DM.SP451.parameters.ParamValues['@vdate2']:=FrmMain.Qery451actual_end_date.value;
     dm.SP451.Open;
     showcontent23();
    end;
 dm.SP451.Close;
end;

procedure TfrmShow.TabSheet38Show(Sender: TObject); //材料发出汇总
begin
 if TTabSheet(Sender).Caption='材料发出汇总' then
  if StringGrid24.RowCount <4 then
    showcontent24;
end;

procedure TfrmShow.TabSheet39Show(Sender: TObject);
begin
 if TTabSheet(Sender).Caption='材料购入汇总' then
  if StringGrid25.RowCount <4 then
    showcontent25;
end;

//退出
procedure TfrmShow.SpeedButton1Click(Sender: TObject);
begin

 frmShow.Close;
end;

procedure TfrmShow.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 dm.SP451.Close;
 dm.Qery1.Close;
 self.ADS451_total.Close;
 self.ADS451_list.Close;
 self.ADS372_total.Close;
 self.ADS372_list.Close;
 self.ADS464_SO.Close;
 self.ADS464_WO.Close; 
end;

//查完工工单
procedure TfrmShow.N1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmWoShow, FrmWoShow);
  FrmWoShow.ADS464_LIST.Close;
  FrmWoShow.ADS464_LIST.Parameters.ParamValues['rkey451;rkey60']:=
          VarArrayOf([FrmMain.Qery451rkey.value,self.ADS464_SOso_ptr.Value]);
  FrmWoShow.ADS464_LIST.open;
  FrmWoShow.ShowModal;
  FrmWoShow.Free;
end;

procedure TfrmShow.MenuItem1Click(Sender: TObject);   //导出
begin
  stringgrid26.Row:=1;
  ExPortExcel([stringgrid26],['产成品返工转WIP']);
end;

procedure TfrmShow.N4Click(Sender: TObject);
begin
  stringgrid22.Row:=1;
  ExPortExcel([stringgrid22],['销售成本汇总']);
end;

procedure TfrmShow.N5Click(Sender: TObject);
begin
  stringgrid23.Row:=1;
  ExPortExcel([stringgrid23],['销售成本明细']);
end;

procedure TfrmShow.N6Click(Sender: TObject);
begin
  stringgrid24.Row:=1;
  ExPortExcel([stringgrid24],['材料发出去向']);
end;

procedure TfrmShow.N7Click(Sender: TObject);
begin
 stringgrid25.Row:=1;
 ExPortExcel([stringgrid25],['材料购入']);
end;

procedure TfrmShow.m1Click(Sender: TObject);
begin
  stringgrid1.Row:=1;stringgrid2.Row:=1;
  ExPortExcel([stringgrid1,stringgrid2],['部门材料成本汇总','部门材料成本明细']);
end;

procedure TfrmShow.m2Click(Sender: TObject);
begin
//  StringGrid3.Row:=1;StringGrid4.Row:=1;
//  ExPortExcel([StringGrid3,StringGrid4],['间接材料汇总','间接材料明细']);
  Export_dbGridEH_to_Excel(DBGRIDEH9,m2.Caption);
end;

procedure TfrmShow.m3Click(Sender: TObject);
begin
//  stringgrid5.Row:=1;
//  stringgrid6.Row:=1;
//  ExPortExcel([stringgrid5,stringgrid6],['其它材料汇总','其它材料明细']);
  Export_dbGridEH_to_Excel(DBGRIDEH10,m3.Caption);
end;

procedure TfrmShow.N17Click(Sender: TObject);
begin
 stringgrid7.Row:=1;
 ExPortExcel([stringgrid7],['材料结构汇总']);
end;

procedure TfrmShow.N19Click(Sender: TObject);
begin
 stringgrid8.Row:=1;
 ExPortExcel([stringgrid8],['制造费用汇总']);
end;

procedure TfrmShow.N14Click(Sender: TObject);
begin
 stringgrid16.Row:=1;
 ExPortExcel([stringgrid16],['报废成本汇总']);
end;

procedure TfrmShow.N16Click(Sender: TObject);
begin
 stringgrid17.Row:=1;
 ExPortExcel([stringgrid17],['报废成本明细']);
end;

procedure TfrmShow.SpeedButton4Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmShow.StringGrid6DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol<>0) AND (acol<>1) and (acol<>2)
   AND (acol<>16) and (acol<>17) then
   Align(TStringGrid(Sender),Rect,Acol,ARow);  //右对集
end;

procedure TfrmShow.TabSheet2Show(Sender: TObject);
begin
 if StringGrid7.RowCount<3 then
  begin
   DM.SP451.close;
   DM.SP451.ProcedureName:='wzsp451;7';
   dm.SP451.Parameters.Refresh;
   DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451.fieldbyname('rkey').value;
   dM.SP451.open;
   showcontent7();
  end;
end;

procedure TfrmShow.TabSheet3Show(Sender: TObject);
begin
  if StringGrid8.RowCount<4  then
    begin
     DM.SP451.close;
     DM.SP451.ProcedureName:='wzsp451;22';
     dm.SP451.Parameters.Refresh;
     DM.SP451.parameters.ParamValues['@vptr']:=FrmMain.Qery451rkey.value;
     DM.SP451.open;
     showcontent8();
    end;
end;

procedure TfrmShow.DBGridEh1TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TfrmShow.Edit1Change(Sender: TObject);
begin
if pagecontrol9.ActivePageIndex=0 then
 if trim(Edit1.text)<>'' then
  self.ADS451_total.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADS451_total.filter := ''
else
 if trim(Edit1.text)<>'' then
  ADS451_list.Filter := fieldname+' like ''%'+trim(edit1.text)+'%'''
 else
  ADS451_list.filter := ''
end;

procedure TfrmShow.DBGridEh2TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  fieldname:=column.FieldName;
  edit1.SetFocus;
  PreColumn_list.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_list := column;
 end
else
 edit1.SetFocus;
end;

procedure TfrmShow.PageControl9Change(Sender: TObject);
begin
if PageControl9.ActivePageIndex=0 then
 begin
  label1.Caption:=PreColumn.Title.Caption;

 end
else
 begin
  label1.Caption:=PreColumn_list.Title.Caption;

 end;
end;

procedure TfrmShow.ComboBox3Change(Sender: TObject);
begin
//if combobox3.ItemIndex=0 then
// begin
//  dbgrideh3.Columns[6].FieldName:='open_amount';
//  dbgrideh3.Columns[8].FieldName:='in_amount';
//  dbgrideh3.Columns[10].FieldName:='out_amount';
//  dbgrideh3.Columns[12].FieldName:='spec_out_amount';
//  dbgrideh3.Columns[14].FieldName:='closed_amount';
//  dbgrideh3.Columns[16].FieldName:='transfer_amount';
//  dbgrideh3.Columns[18].FieldName:='scrap_amount';
//
//  dbgrideh4.Columns[11].FieldName:='open_amount';
//  dbgrideh4.Columns[13].FieldName:='in_amount';
//  dbgrideh4.Columns[15].FieldName:='out_amount';
//  dbgrideh4.Columns[17].FieldName:='spec_out_amount';
//  dbgrideh4.Columns[19].FieldName:='closed_amount';
//  dbgrideh4.Columns[21].FieldName:='transfer_amount';
//  dbgrideh4.Columns[23].FieldName:='scrap_amount';
// end
//else
// begin
//  dbgrideh3.Columns[6].FieldName:='open_amount_cost';
//  dbgrideh3.Columns[8].FieldName:='in_amount_cost';
//  dbgrideh3.Columns[10].FieldName:='out_amount_cost';
//  dbgrideh3.Columns[12].FieldName:='spec_out_amount_cost';
//  dbgrideh3.Columns[14].FieldName:='closed_amount_cost';
//  dbgrideh3.Columns[16].FieldName:='transfer_amount_cost';
//  dbgrideh3.Columns[18].FieldName:='scrap_amount_cost';
//
//  dbgrideh4.Columns[11].FieldName:='open_amount_cost';
//  dbgrideh4.Columns[13].FieldName:='in_amount_cost';
//  dbgrideh4.Columns[15].FieldName:='out_amount_cost';
//  dbgrideh4.Columns[17].FieldName:='spec_out_amount_cost';
//  dbgrideh4.Columns[19].FieldName:='closed_amount_cost';
//  dbgrideh4.Columns[21].FieldName:='transfer_amount_cost';
//  dbgrideh4.Columns[23].FieldName:='scrap_amount_cost';
// end;

end;

procedure TfrmShow.Edit2Change(Sender: TObject);
begin
if pagecontrol10.ActivePageIndex=0 then
 if trim(Edit2.text)<>'' then
  ADS372_total.Filter := fieldname372total+' like ''%'+trim(edit2.text)+'%'''
 else
  ADS372_total.filter := ''
else
 if trim(Edit2.text)<>'' then
  ADS372_list.Filter := fieldname372list+' like ''%'+trim(edit2.text)+'%'''
 else
  ADS372_list.filter := ''
end;

procedure TfrmShow.DBGridEh3TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname372total<>column.FieldName) then
 begin
  label3.Caption := column.Title.Caption;
  self.fieldname372total := column.FieldName;
  edit2.SetFocus;
  PreColumn_372total.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_372total := column;
 end
else
 edit2.SetFocus;
end;

procedure TfrmShow.DBGridEh4TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname372list<>column.FieldName) then
 begin
  label3.Caption := column.Title.Caption;
  self.fieldname372list := column.FieldName;
  edit2.SetFocus;
  PreColumn_372list.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_372list := column;
  ads372_list.IndexFieldNames := column.FieldName;
 end
else
 edit2.SetFocus;
end;

procedure TfrmShow.PageControl10Change(Sender: TObject);
begin
if PageControl10.ActivePageIndex=0 then
 begin
  label3.Caption:=PreColumn_372total.Title.Caption;
  //btqry.Visible:=false;
 end
else
 begin
  label3.Caption:=PreColumn_372list.Title.Caption;
  //btqry.Visible:=true;
 end;
end;

procedure TfrmShow.DBGridEh5TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname464so<>column.FieldName) then
 begin
  label5.Caption := column.Title.Caption;
  self.fieldname464so := column.FieldName;
  edit3.SetFocus;
  PreColumn_464so.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_464so := column;
 end
else
 edit3.SetFocus;
end;

procedure TfrmShow.DBGridEh6TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname464wo<>column.FieldName) then
 begin
  label5.Caption := column.Title.Caption;
  self.fieldname464wo := column.FieldName;
  edit3.SetFocus;
  PreColumn_464wo.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_464wo := column;
 end
else
 edit3.SetFocus;
end;

procedure TfrmShow.Edit3Change(Sender: TObject);
begin
if pagecontrol14.ActivePageIndex=0 then
 if trim(Edit3.text)<>'' then
  ADS464_SO.Filter := fieldname464so+' like ''%'+trim(edit3.text)+'%'''
 else
  ADS464_SO.filter := ''
else
 if trim(Edit3.text)<>'' then
  ADS464_WO.Filter := fieldname464wo+' like ''%'+trim(edit3.text)+'%'''
 else
  ADS464_WO.filter := ''
end;

procedure TfrmShow.N25Click(Sender: TObject);
begin
 try
  Form_lot:=tForm_lot.Create(application);
  Form_lot.ADO410_16.close;
  Form_lot.ADO410_16.Parameters.ParamByName('@vptr').Value:=ADS464_WOWO_PTR.Value;
  Form_lot.ADO410_16.Parameters.ParamByName('@vstep').Value:=0;
  Form_lot.ADO410_16.Open;
  Form_lot.ShowModal;
 finally
  Form_lot.ADO410_16.close;
  Form_lot.Free;
 end;
end;

procedure TfrmShow.N2Click(Sender: TObject);
begin
Export_Grid_to_Excel(stringgrid18,n2.Caption);
end;

procedure TfrmShow.N3Click(Sender: TObject);
begin
Export_Grid_to_Excel(stringgrid19,n3.Caption);
end;

procedure TfrmShow.N26Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(DBGRIDEH5,'完工成本按订单明细');
end;

procedure TfrmShow.EXCEL1Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(DBGRIDEH6,'完工成本按作业单明细');
end;

procedure TfrmShow.N12Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGRIDEH3,n12.Caption);
end;

procedure TfrmShow.N13Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGRIDEH4,n13.Caption);
end;

procedure TfrmShow.N22Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGRIDEH1,n22.Caption);
end;

procedure TfrmShow.N24Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGRIDEH2,n24.Caption);
end;

procedure TfrmShow.PageControl14Change(Sender: TObject);
begin
if pagecontrol14.ActivePageIndex=0 then
 label5.Caption := PreColumn_464so.Title.Caption
else
 label5.Caption := PreColumn_464wo.Title.Caption;
end;

function TfrmShow.getFac(facrkey: integer): string;
begin
  if DM.tmp.Locate('rkey',facrkey,[]) then
    result:=DM.tmp.Fields[2].AsString
  else
    result:='';
end;

procedure TfrmShow.ComboBox1Change(Sender: TObject);
  procedure adjust(grd:TStringGrid;sFac:string);
  var iRow,iCol,i,j:integer;
      AtotalV:array[1..18] of real;
  begin
    iRow:=grd.RowCount;
    if iRow<3 then exit;
//    iCol:=grd.ColCount-1;
    for i:=1 to 18 do AtotalV[i]:=0;
    if grd<>StringGrid8 then j:=1 else j:=2;

    if sFac='所有工厂' then
     begin
      for i:=j to iRow-2 do
      begin
        grd.RowHeights[i]:=19;
        for iCol:=2 to grd.ColCount-2 do
        begin
          if (trim(grd.Cells[iCol,iRow-1])<>'') and (grd.Cells[iCol,i]<>'') then
            AtotalV[iCol]:=AtotalV[iCol]+strtofloat(StringReplace(grd.Cells[iCol,i],',','',[rfReplaceAll]));
        end;
      end;
     end
    else
     begin
      for i:=j to iRow-2 do
      begin
        if sFac<>grd.Cells[grd.ColCount-1,i] then
         begin grd.RowHeights[i]:=-1 ;continue;end;
        grd.RowHeights[i]:=19 ;
        for iCol:=2 to grd.ColCount-2 do
          if (trim(grd.Cells[iCol,iRow-1])<>'') and (grd.Cells[iCol,i]<>'') then
          AtotalV[iCol]:=AtotalV[iCol]+strtofloat(StringReplace(grd.Cells[iCol,i],',','',[rfReplaceAll]));
      end;
     end;

    for i:=2 to grd.ColCount-2 do
      if trim(grd.Cells[i,iRow-1])<>'' then grd.Cells[i,iRow-1]:=formatfloat('#,###.00',AtotalV[i]);
  end;
begin
  if (PageControl1.ActivePageIndex=0) and
     (PageControl2.ActivePageIndex=0) and
     (PageControl3.ActivePageIndex=0) then
  adjust(StringGrid1,ComboBox1.Items[ComboBox1.itemindex]) ;
  if (PageControl1.ActivePageIndex=0) and
     (PageControl2.ActivePageIndex=0) and
     (PageControl3.ActivePageIndex=1) then
  adjust(StringGrid2,ComboBox1.Items[ComboBox1.itemindex]) ;

  if (PageControl1.ActivePageIndex=0) and
     (PageControl2.ActivePageIndex=1) and
     (PageControl4.ActivePageIndex=0) then
  adjust(StringGrid3,ComboBox1.Items[ComboBox1.itemindex]) ;
  if (PageControl1.ActivePageIndex=0) and
     (PageControl2.ActivePageIndex=1) and
     (PageControl4.ActivePageIndex=1) then
  adjust(StringGrid4,ComboBox1.Items[ComboBox1.itemindex]) ;

  if (PageControl1.ActivePageIndex=0) and
     (PageControl2.ActivePageIndex=2) and
     (PageControl5.ActivePageIndex=0) then
  adjust(StringGrid5,ComboBox1.Items[ComboBox1.itemindex]) ;
  if (PageControl1.ActivePageIndex=0) and
     (PageControl2.ActivePageIndex=2) and
     (PageControl5.ActivePageIndex=1) then
  adjust(StringGrid6,ComboBox1.Items[ComboBox1.itemindex]) ;

  if (PageControl1.ActivePageIndex=1) then
  adjust(StringGrid7,ComboBox1.Items[ComboBox1.itemindex]) ;

//  if (PageControl1.ActivePageIndex=2) then
//  adjust(StringGrid8,ComboBox1.Items[ComboBox1.itemindex]) ;

  if (PageControl1.ActivePageIndex=6) and
     (PageControl11.ActivePageIndex=0) then
   adjust(StringGrid16,ComboBox1.Items[ComboBox1.itemindex]) ;

  if (PageControl1.ActivePageIndex=6) and
     (PageControl11.ActivePageIndex=1) then
  adjust(StringGrid17,ComboBox1.Items[ComboBox1.itemindex]) ;
end;

procedure TfrmShow.PageControl1Change(Sender: TObject);
begin
  ComboBox1.Visible:=(PageControl1.ActivePageIndex<3) or
   (PageControl1.ActivePageIndex=6);
  Label2.Visible:=ComboBox1.Visible;

 ComboBox1Change(sender);
end;

procedure TfrmShow.DBGridEh4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ads372_list.CommandText);
end;

procedure TfrmShow.BtQryClick(Sender: TObject);
var i:integer;
    sqlstr:string;
begin
 try
  frmQuerySet:=tfrmQuerySet.Create(application);
  frmqueryset.DTPk1.Date:=
  StrToDateDef('yyyy-mm-dd',frmmain.Qery451actual_fm_date.Value);
  frmqueryset.DTpk2.Date:=
  StrToDateDef('yyyy-mm-dd',frmmain.Qery451actual_end_date.Value);

  frmqueryset.dttm1.Time:=
  StrToTimeDef('hh:nn:ss',frmmain.Qery451actual_fm_date.Value);

  frmqueryset.dttm2.Time:=
  StrToTimeDef('hh:nn:ss',frmmain.Qery451actual_end_date.Value);

  if frmQuerySet.ShowModal = mrOk then
  begin
   for i:=1 to frmQuerySet.sgrid1.RowCount-2 do
     Sqlstr:=sqlstr+frmQuerySet.sgrid1.Cells[2,i];
   sqlstr:=sqlstr+'';
   DoSearch(sqlstr);
  end;
 finally
  frmQuerySet.free;
 end;
end;



procedure TfrmShow.PageControl11Change(Sender: TObject);
begin
 ComboBox1Change(sender);
end;

procedure TfrmShow.TabSheet16Show(Sender: TObject);
begin
  if TTabSheet(Sender).Caption='汇总数据' then
   if not ads75_total.Active then
    begin
     ads75_total.close;
     ads75_total.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ads75_total.open;
    end;

 if TTabSheet(Sender).Caption='明细数据' then
  if not ads75_list.Active then
    begin
     ads75_list.close;
     ads75_list.parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
     ads75_list.open;
    end;
end;

procedure TfrmShow.DBGridEh7TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname75total<>column.FieldName) then
 begin
  label4.Caption := column.Title.Caption;
  self.fieldname75total := column.FieldName;
  edit4.SetFocus;
  PreColumn_75total.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_75total := column;
 end
else
 edit4.SetFocus;
end;

procedure TfrmShow.DBGridEh8TitleClick(Column: TColumnEh);
begin
if (not column.ReadOnly) and (fieldname75list<>column.FieldName) then
 begin
  label4.Caption := column.Title.Caption;
  self.fieldname75list := column.FieldName;
  edit4.SetFocus;
  PreColumn_75list.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn_75list := column;
  ads75_list.IndexFieldNames := column.FieldName;
 end
else
 edit4.SetFocus;
end;

procedure TfrmShow.PageControl6Change(Sender: TObject);
begin
  if PageControl6.ActivePageIndex=0 then
    label4.Caption:=PreColumn_75total.Title.Caption
  else
    label4.Caption:=PreColumn_75list.Title.Caption;
end;

procedure TfrmShow.Edit4Change(Sender: TObject);
begin
if PageControl6.ActivePageIndex=0 then
 if trim(Edit4.text)<>'' then
  ADS75_total.Filter := fieldname75total+' like ''%'+trim(edit4.text)+'%'''
 else
  ADS75_total.filter := ''
else
 if trim(Edit4.text)<>'' then
  ADS75_list.Filter := fieldname75list+' like ''%'+trim(edit4.text)+'%'''
 else
  ADS75_list.filter := ''
end;

procedure TfrmShow.N27Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGRIDEH7,N27.Caption);
end;

procedure TfrmShow.N28Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGRIDEH8,N28.Caption);
end;

procedure TfrmShow.TabSheet42Show(Sender: TObject);
begin
  ads428.close;
  ads428.Parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
  ads428.open;
end;

procedure TfrmShow.TabSheet43Show(Sender: TObject);
begin
  ads428_1.close;
  ads428_1.Parameters.ParamValues['rkey451']:=FrmMain.Qery451rkey.value;
  ads428_1.open;
end;

procedure TfrmShow.ads428CalcFields(DataSet: TDataSet);
begin
  if ads428.FieldByName('IN_QUANTITY').AsFloat = 0 then
    ads428.FieldByName('Price').AsFloat:= 0
  else
    ads428.FieldByName('Price').AsFloat:= ads428.FieldByName('IN_AMOUNT').AsFloat/ads428.FieldByName('IN_QUANTITY').AsFloat;
  ads428.FieldByName('Diff').AsFloat:= ads428.FieldByName('ACTUAL_COST').AsFloat-ads428.FieldByName('STD_COST').AsFloat;
end;

procedure TfrmShow.ads428_1CalcFields(DataSet: TDataSet);
begin
  if ads428_1.FieldByName('IN_QUANTITY').AsFloat = 0 then
    ads428_1.FieldByName('Price').AsFloat:= 0
  else
    ads428_1.FieldByName('Price').AsFloat:= ads428_1.FieldByName('IN_AMOUNT').AsFloat/ads428_1.FieldByName('IN_QUANTITY').AsFloat;
  ads428_1.FieldByName('Diff').AsFloat:= ads428_1.FieldByName('ACTUAL_COST').AsFloat-ads428_1.FieldByName('STD_COST').AsFloat;
end;

procedure TfrmShow.DBGridEh9TitleClick(Column: TColumnEh);
begin
if (fieldname428<>column.FieldName) then
 begin
  Label8.Caption := column.Title.Caption;
  self.fieldname428 := column.FieldName;
  edit6.SetFocus;
  PreColumn428.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn428 := column;
 end
else
 edit6.SetFocus;
end;

procedure TfrmShow.DBGridEh10TitleClick(Column: TColumnEh);
begin
if (fieldname428_1<>column.FieldName) then
 begin
  Label7.Caption := column.Title.Caption;
  self.fieldname428_1 := column.FieldName;
  edit5.SetFocus;
  PreColumn428_1.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn428_1 := column;
 end
else
 edit5.SetFocus;
end;

procedure TfrmShow.Edit6Change(Sender: TObject);
begin
if PageControl2.ActivePageIndex=3 then
 if trim(Edit6.text)<>'' then
  ads428.Filter := fieldname428+' like ''%'+trim(Edit6.text)+'%'''
 else
  ads428.filter := '';
end;

procedure TfrmShow.Edit5Change(Sender: TObject);
begin
if PageControl2.ActivePageIndex=4 then
 if trim(Edit5.text)<>'' then
  ads428_1.Filter := fieldname428_1+' like ''%'+trim(Edit5.text)+'%'''
 else
  ads428_1.filter := '';
end;

end.
