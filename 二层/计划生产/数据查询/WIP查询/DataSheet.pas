// ****************************************************************************//
// ****                                                                    ****//
// **** Programer: Jacky Zhong                                             ****//
// **** Date: Aug. 2007                                                    ****//
// ****                                                                    ****//
// ****                                                                    ****//
// ****************************************************************************//
unit DataSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGridEh, DB, ADODB, StdCtrls,
  Buttons, ImgList, TeEngine, Series, TeeProcs, Chart, ToolWin, DBGrids,
  ppBands, ppCtrls, ppPrnabl, ppClass, Math,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppModule,
  daDataModule, ppVar, ppEndUsr, Menus;

type
  TExcludeColumns = set of 0 .. 255;

type
  TfrmDataSheet = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ToolButton16: TToolButton;
    CheckBox1: TCheckBox;
    Chart4: TChart;
    BarSeries1: TBarSeries;
    ImageList1: TImageList;
    DBGridEh1: TDBGridEh;
    ppDBPipeline1: TppDBPipeline;
    pp1: TppReport;
    rgSortType: TRadioGroup;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel10: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine1: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine2: TppLine;
    ppLine31: TppLine;
    ppLabel3: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel25: TppLabel;
    ppLine37: TppLine;
    ppLabel26: TppLabel;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLabel7: TppLabel;
    ppLine62: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText11: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText61: TppDBText;
    ppDBText64: TppDBText;
    ppDBText23: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppDBText22: TppDBText;
    ppLine30: TppLine;
    ppLine32: TppLine;
    ppDBText1: TppDBText;
    ppDBText15: TppDBText;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppDBText53: TppDBText;
    ppDBText58: TppDBText;
    ppLine58: TppLine;
    ppDBText59: TppDBText;
    ppLine59: TppLine;
    ppDBText60: TppDBText;
    ppLine60: TppLine;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppLine61: TppLine;
    ppDBText65: TppDBText;
    ppLine63: TppLine;
    ppLine68: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine69: TppLine;
    ppLine70: TppLine;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    BitBtn3: TBitBtn;
    ToolButton1: TToolButton;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    PopupMenu1: TPopupMenu;
    CheckBox6: TCheckBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSortTypeClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    strSQL:string;
    FixedRow, FixedCol: Integer; // StringGrid固定显示的字段个数
    newrow, newcol, v_RptType, v_Sum_Type, v_UnitType: Integer;
    FsumQty_reject: Integer;
    FsumSQM_reject: real;
    FCustomCol: Integer;
    FCustomColType: string;
    FIncludeBorder: Boolean;

    FaWidth: array [0 .. 1023] of Integer;
    function Exec_Query(SumType, RptType, UnitType: Integer; SubSql: string;
      subsql1: string): Boolean; // 根据条件进行数据统计
    function Trans_Data_To_Grid(RptType: Integer): Boolean; // 统计结果写入到StringGrid
    procedure Add_Fixed_Column_Title(Rpt_Type, Sum_Type: Integer;
      Sqlstr1: string); // 添加固定字段到StringGrid,统计方式,汇总方式,SQL
    procedure Chart_Data; // 打开图表数据
    procedure SetSort(SortType: Integer); // 重设排序
    procedure Fitem_click(Sender: TObject);
    procedure SetOptimalGridCellWidth(sg: TStringGrid;
      ExcludeColumns: TExcludeColumns);
    procedure SaveCustomColToIni;
    procedure LoadCustomColFromIni;
    procedure GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
  public
    { Public declarations }
  end;

var
  frmDataSheet: TfrmDataSheet;

implementation

uses common, QuerySet, dm, MyClass, nowipso, IniFiles;
{$R *.dfm}

procedure TfrmDataSheet.FormCreate(Sender: TObject);
begin
  if not App_init_2(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！', '提示', 1);
    application.Terminate;
    exit;
  end;
  self.Caption := application.Title;


//   user_ptr:='785';
//   vprev:='4';
//   dmcon.ADOConnection1.Open;

  MyDataClass := TMyDataClass.Create(dmcon.ADOConnection1);
  v_RptType := 1;
  v_Sum_Type := 1;
  Add_Fixed_Column_Title(1, 1, '');
  FCustomCol := -1;
end;

procedure TfrmDataSheet.SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
var
  i: Integer;
  j: Integer;
  max_width: Integer;
begin
  with sg do
  begin
    Canvas.Font.Assign(Font);
    for i := 0 to (ColCount - 1) do
    begin
      if i in ExcludeColumns then
        Continue;
      max_width := 0;
      for j := 0 to (RowCount - 1) do
        max_width := Math.Max(max_width, Canvas.TextWidth(Cells[i, j]));
      if max_width > 0 then
        ColWidths[i] := max_width + 4
      else
        ColWidths[i] := DefaultColWidth;
    end; { for }
  end;
end;

procedure TfrmDataSheet.Fitem_click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    StringGrid1.ColWidths[TMenuItem(Sender).Tag] := -1
  else
    StringGrid1.ColWidths[TMenuItem(Sender).Tag] := FaWidth
      [TMenuItem(Sender).Tag];
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SaveCustomColToIni;
end;

function TfrmDataSheet.Exec_Query(SumType, RptType, UnitType: Integer;
  SubSql: string; subsql1: string): Boolean;
var
  sqlstr: string; // 汇总方式,统计方式,单位
  spName: string;
  Params: Array [0 .. 5] of variant;
  Direction: array [0 .. 5] of TParameterDirection;
  sSql: string;
  iPos: Integer;
begin
  try
    with dmcon do
    begin
      asp_WIP_List.close;
      asp_WIP_List.Parameters.Clear;
      if RptType = 0 then // 统计方式为汇总的 WIP
        spName := 'WIP_Sum_Report'
      else // 统计方式为明细的 WIP
        spName := 'WIP_Report';

      Params[0] := 0;
      Params[1] := SumType;
      Params[2] := UnitType;
      Params[3] := SubSql;
      Params[4] := subsql1;
      if FIncludeBorder then
        Params[5] := 1
      else
        Params[5] := 0;

      Direction[0] := pdReturnValue;
      Direction[1] := pdInput;
      Direction[2] := pdInput;
      Direction[3] := pdInput;
      Direction[4] := pdInput;
      Direction[5] := pdInput;
      //asp_WIP_List.Prepared;

      MyDataClass.ExecProc(asp_WIP_List, spName, Params, Direction, 2);

      StatusBar1.Panels[1].Text := IntToStr(asp_WIP_List.RecordCount);
      // 打开部门，汇总表
      if not FIncludeBorder then
      begin
        if SumType = 1 then // 按工序
          sqlstr := ' declare @CalcUnit  int select @CalcUnit =' + IntToStr
            (UnitType) +
            ' SELECT D34.Seq_Nr,D34.DEPT_CODE,D34.Dept_Name,Qty= ' +
            #13
            + ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(case when d34.PCS_AS_UNIT=0 then (D56.PANELS) when d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)'+  //在线外发总数按 34.PCS_AS_UNIT 汇总
              ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq),3)  end ' + ' ,sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) as Qty,sum(D56.PANELS) AS PNL_Qty,round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq),3) as SQM_Qty, ' +
              ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED) / dbo.getparentnum(d25.rkey))' + ' when 1 then sum((D56.PANELS) / dbo.getparentnum(d25.rkey)) when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq / dbo.getparentnum(d25.rkey)),3)  end as asparentqty ' +
              ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-13  外发汇总按pnl统计时按34。PCS_AS_UNIT 汇总
              ' when 1 then sum((case when d06.prod_status = 4 and d34.PCS_AS_UNIT=0 then D56.PANELS when  d06.prod_status  = 4 and d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)) '+
              ' when 2 then round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) end as qty_out'+
              ' ,round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) as SQM_Qty_out ' +   //外发面积
              ' ,case @CalcUnit when 0 then sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-19 在线汇总统计当按pnl统计时不按 34.PCS_AS_UNIT 汇总
              ' when 1 then sum((case when d06.prod_status  <> 4  then D56.PANELS  ELSE 0 END))'+
              ' when 2 then round(sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) end as qty_Online'+
              ' ,round(sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) as SQM_Qty_Online ' +   //在线面积
              ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-13   外发汇总统计当按pnl统计时不按 34.PCS_AS_UNIT 汇总
              ' when 1 then sum((case when d06.prod_status  = 4  then D56.PANELS  ELSE 0 END)) '+
              ' when 2 then round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) end as qty_out34'+
              ' ,case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(D56.PANELS)'+  //在线外发总数不按 34.PCS_AS_UNIT 汇总
              ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq),3)  end as qty_OP' +
              ' FROM dbo.Data0006 D06 INNER JOIN dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY ' +
              ' INNER JOIN dbo.data0492 D492 ON D06.CUT_NO = D492.CUT_NO ' +
              ' inner JOIN dbo.data0010 D10 ON D25.CUSTOMER_PTR=D10.rKey ' +
        		  ' inner join dbo.data0008 d08 on d08.rkey = d25.PROD_CODE_PTR ' +
        		  ' inner join dbo.data0007 d07 on d07.rkey = d08.PR_GRP_POINTER ' +
              ' INNER JOIN dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR left Outer JOIN ' + ' dbo.data0060 D60 ON D60.sales_order=D492.So_NO INNER JOIN dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY ' + SubSql + ' and D34.Seq_Nr>0 and D34.ttype=1' + ' GROUP BY D34.Seq_Nr,D34.DEPT_CODE, D34.DEPT_Name order by D34.Seq_Nr '
          // and barcode_entry_flag='+QuotedStr('Y')+

        else
          sqlstr := ' declare @CalcUnit  int select @CalcUnit =' + IntToStr
            (UnitType) +
            ' SELECT D34_Dpt.Seq_Nr, D34_Dpt.Dept_Code,D34_Dpt.Dept_Name,Qty= '
            + #13
            + ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(case when d34.PCS_AS_UNIT=0 then (D56.PANELS) when d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)'+
            ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq),3)  end '
            +
            ' ,sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) as Qty,sum(D56.PANELS) AS PNL_Qty ,round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq),3) as SQM_Qty, '+
            ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED) / dbo.getparentnum(d25.rkey))' + ' when 1 then sum((D56.PANELS) / dbo.getparentnum(d25.rkey)) when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq / dbo.getparentnum(d25.rkey)),3)  end as asparentqty ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-13
            ' when 1 then sum((case when d06.prod_status = 4 and d34.PCS_AS_UNIT=0 then D56.PANELS when  d06.prod_status  = 4 and d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)) '+
            ' when 2 then round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) end as qty_out'+
            ' ,round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) as SQM_Qty_out ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-19
            ' when 1 then sum((case when d06.prod_status  <> 4  then D56.PANELS  ELSE 0 END))'+
            ' when 2 then round(sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) end as qty_Online'+
            ' ,round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) as SQM_Qty_Online ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //20
            ' when 1 then sum((case when d06.prod_status  = 4  then D56.PANELS  ELSE 0 END))'+
            ' when 2 then round(sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) end as qty_out34'+
            ' ,case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(D56.PANELS) '+
            ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq),3)  end as qty_OP' +
            ' FROM dbo.Data0006 D06 INNER JOIN dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY ' +
            ' INNER JOIN dbo.data0492 D492 ON D06.CUT_NO = D492.CUT_NO ' +
            ' inner JOIN dbo.data0010 D10 ON D25.CUSTOMER_PTR=D10.rKey ' +
            ' INNER JOIN dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR  ' +
        		  ' inner join dbo.data0008 d08 on d08.rkey = d25.PROD_CODE_PTR ' +
        		  ' inner join dbo.data0007 d07 on d07.rkey = d08.PR_GRP_POINTER ' +            
            ' left Outer JOIN dbo.data0060 D60 ON D60.sales_order=D492.So_NO INNER JOIN dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY inner join	dbo.Data0034 D34_Dpt ON D34.Big_DEPT_PTR = D34_Dpt.RKEY ' + SubSql + ' and D34_Dpt.ttype=5 and D34_Dpt.Seq_NR>0 GROUP BY D34_Dpt.Seq_Nr,D34_Dpt.DEPT_CODE,D34_Dpt.DEPT_Name order by D34_Dpt.Seq_Nr ';

      end
      else
      begin
        if SumType = 1 then // 按工序
          sqlstr := ' declare @CalcUnit  int select @CalcUnit =' + IntToStr
            (UnitType) +
            ' SELECT D34.Seq_Nr,D34.DEPT_CODE,D34.Dept_Name,Qty= ' +
            #13
            + ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(case when d34.PCS_AS_UNIT=0 then (D56.PANELS) when d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)'+
            ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL)),3)  end ' + ' ,sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) as Qty,sum(D56.PANELS) AS PNL_Qty,round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL)),3) as SQM_Qty, ' +
            ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED) / dbo.getparentnum(d25.rkey))' + ' when 1 then sum((D56.PANELS) / dbo.getparentnum(d25.rkey)) when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) / dbo.getparentnum(d25.rkey)),3)  end as asparentqty ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-13
            ' when 1 then sum((case when d06.prod_status = 4 and d34.PCS_AS_UNIT=0 then D56.PANELS when  d06.prod_status  = 4 and d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)) '+
            ' when 2 then round(sum((case when d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) end as qty_out'+
            ' ,round(sum((case when d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) as SQM_Qty_out ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-19
            ' when 1 then sum((case when d06.prod_status  <> 4  then D56.PANELS  ELSE 0 END))'+
            ' when 2 then round(sum((case when d06.prod_status <> 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) end as qty_Online'+
            ' ,round(sum((case when d06.prod_status <> 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) as SQM_Qty_Online ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-19
            ' when 1 then sum((case when d06.prod_status  = 4  then D56.PANELS  ELSE 0 END))'+
            ' when 2 then round(sum((case when d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) end as qty_out34'+
            ' ,case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum (D56.PANELS) '+
            ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL)),3)  end as qty_OP' +
            ' FROM dbo.Data0006 D06 INNER JOIN dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY ' +
            ' INNER JOIN dbo.data0492 D492 ON D06.CUT_NO = D492.CUT_NO ' +
        		  ' inner join dbo.data0008 d08 on d08.rkey = d25.PROD_CODE_PTR ' +
        		  ' inner join dbo.data0007 d07 on d07.rkey = d08.PR_GRP_POINTER ' +
            ' inner JOIN dbo.data0010 D10 ON D25.CUSTOMER_PTR=D10.rKey  INNER JOIN dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR left Outer JOIN ' + ' dbo.data0060 D60 ON D60.sales_order=D492.So_NO INNER JOIN dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY ' + SubSql + ' and D34.Seq_Nr>0 and D34.ttype=1' + ' GROUP BY D34.Seq_Nr,D34.DEPT_CODE, D34.DEPT_Name order by D34.Seq_Nr '
          // and barcode_entry_flag='+QuotedStr('Y')+
        else
          sqlstr := ' declare @CalcUnit  int select @CalcUnit =' + IntToStr
            (UnitType) +
            ' SELECT D34_Dpt.Seq_Nr, D34_Dpt.Dept_Code,D34_Dpt.Dept_Name,Qty= '
            + #13
            + ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(case when d34.PCS_AS_UNIT=0 then (D56.PANELS) when d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)'+
            ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL)),3)  end '
            +
            ' ,sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) as Qty,sum(D56.PANELS) AS PNL_Qty ,round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL)),3) as SQM_Qty ,' +
            ' case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED) / dbo.getparentnum(d25.rkey))' + ' when 1 then sum((D56.PANELS) / dbo.getparentnum(d25.rkey)) when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) / dbo.getparentnum(d25.rkey)),3)  end as asparentqty ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-13
            ' when 1 then sum((case when d06.prod_status = 4 and d34.PCS_AS_UNIT=0 then D56.PANELS when  d06.prod_status  = 4 and d34.PCS_AS_UNIT=1 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED ELSE 0 END)) '+
            ' when 2 then round(sum((case when d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) end as qty_out'+
            ' ,round(sum((case when d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) as SQM_Qty_out ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-19
            ' when 1 then sum((case when d06.prod_status  <> 4  then D56.PANELS  ELSE 0 END))'+
            ' when 2 then round(sum((case when d06.prod_status <> 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) end as qty_Online'+
            ' ,round(sum((case when d06.prod_status <> 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) as SQM_Qty_Online ' +
            ' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) ' +    //2017-6-19
            ' when 1 then sum((case when d06.prod_status  = 4  then D56.PANELS  ELSE 0 END))'+
            ' when 2 then round(sum((case when d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)),3) end as qty_out34'+
            ' ,case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)) when 1 then sum(D56.PANELS) '+
            ' when 2 then round(sum((D56.QTY_BACKLOG+D56.TO_BE_STOCKED)*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL)),3)  end as qty_OP'+
            ' FROM dbo.Data0006 D06 INNER JOIN dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY ' +
            ' INNER JOIN dbo.data0492 D492 ON D06.CUT_NO = D492.CUT_NO ' +
            ' inner join dbo.data0008 d08 on d08.rkey = d25.PROD_CODE_PTR ' +
            ' inner join dbo.data0007 d07 on d07.rkey = d08.PR_GRP_POINTER ' +
            ' inner JOIN dbo.data0010 D10 ON D25.CUSTOMER_PTR=D10.rKey  INNER JOIN dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR left Outer JOIN ' + ' dbo.data0060 D60 ON D60.sales_order=D492.So_NO INNER JOIN dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY inner join	dbo.Data0034 D34_Dpt ON D34.Big_DEPT_PTR = D34_Dpt.RKEY ' + SubSql + ' and D34_Dpt.ttype=5 and D34_Dpt.Seq_NR>0 GROUP BY D34_Dpt.Seq_Nr,D34_Dpt.DEPT_CODE,D34_Dpt.DEPT_Name order by D34_Dpt.Seq_Nr ';
      end;
//      ShowMessage(sqlstr);
      dmcon.adsDept_Sum.close;
      dmcon.adsDept_Sum.CommandText := sqlstr;
      dmcon.adsDept_Sum.Prepared;
      dmcon.adsDept_Sum.open;
      
      if UnitType = 0 then
      begin
        DBGridEh1.Columns[3].Title.Caption := '外发数量(PCS)' ;
        DBGridEh1.Columns[2].Title.Caption := '在线数量(PCS)' ;
      end
      else if UnitType = 1 then
      begin
        DBGridEh1.Columns[3].Title.Caption := '外发数量(Panel)' ;
        DBGridEh1.Columns[2].Title.Caption := '在线数量(Panel)' ;
      end
      else if UnitType = 2 then
      begin
        DBGridEh1.Columns[3].Title.Caption := '外发数量(平方米)';
        DBGridEh1.Columns[2].Title.Caption := '在线数量(平方米)';
      end;

    end;
   
    result := true;
  except
    on E: Exception do
    begin
      messagedlg(E.Message, mterror, [mbcancel], 0);
      result := false;
    end;
  end; // end try
end;

procedure TfrmDataSheet.BitBtn4Click(Sender: TObject);
var
  i, UnitType: Integer;
  sqlstr: string;
  wo_status: string;
  item: TMenuItem;
begin
  with frmQuerySet do
  begin
    try
      if frmQuerySet = nil then
        frmQuerySet := TfrmQuerySet.Create(application);
      if ShowModal = mrOk then
      begin
        FIncludeBorder := rgBB.ItemIndex = 1;  //是否板边
        for i := 1 to sgrid1.RowCount - 2 do //条件
          if sgrid1.Cells[2, i] <> '' then
            sqlstr := sqlstr + sgrid1.Cells[2, i];
         
        UnitType := rgUnit.ItemIndex; // 统计单位
        v_RptType := rgRptType.ItemIndex; // 统计方式
        v_UnitType := UnitType; // 统计单位

        if radiogroup1.ItemIndex = 0 then // 订单状态
          sqlstr := sqlstr + ' and D60.Status<>4 '
        else if radiogroup1.ItemIndex = 1 then
          sqlstr := sqlstr + ' and D60.Status=4 '
        else
          sqlstr := sqlstr + '';

        for i := 0 to GroupBox4.ControlCount - 1 do //生产状态
          if TCheckBox(GroupBox4.Controls[i]).Checked then
            wo_status := wo_status + IntToStr
              (TCheckBox(GroupBox4.Controls[i]).Tag) + ',';
        if wo_status <> '' then
        begin
          wo_status := copy(wo_status, 1, length(wo_status) - 1);
          sqlstr := sqlstr + ' and d06.prod_status in (' + wo_status + ') ';
        end
        else
        begin
          showmessage('您必须选一个生产状态条件才能查询!');
          exit;
        end;
        screen.Cursor := crSQLWait;



        if trim(sqlstr) <> '' then
          sqlstr := ' Where (1=1) ' + sqlstr
        else
          sqlstr := ' Where (1=1) ';
        v_Sum_Type := rgSumType.ItemIndex; // 汇总方式
        

        Add_Fixed_Column_Title(v_RptType, rgSumType.ItemIndex, sqlstr);


        // 增加传入参数wo_status,并修改存储过程--andy081028
        Exec_Query(rgSumType.ItemIndex, v_RptType, UnitType, sqlstr, wo_status);

        strSQL:=sqlstr;

        if v_RptType = 1 then // 按明细统计
          SetSort(rgSortType.ItemIndex);
        rgSortType.Enabled := v_RptType = 1;

        Trans_Data_To_Grid(rgRptType.ItemIndex);
        Chart_Data;
        screen.Cursor := crDefault;

        LoadCustomColFromIni;

        self.PopupMenu1.Items.Clear;
        for i := 0 to StringGrid1.ColCount - 2 do
        begin
          item := TMenuItem.Create(self);
          item.Caption := StringGrid1.Cells[i, 0];
          item.Tag := i;
          if StringGrid1.ColWidths[i] = -1 then
            FaWidth[i] := 80
          else
            FaWidth[i] := StringGrid1.ColWidths[i];
          if ((v_RptType = 0) and (i = 3)) or ((v_RptType = 1) and (i = 7)) or ((v_RptType = 1) and (i = 31)) then
            StringGrid1.ColWidths[i] := -1;
          item.Checked := StringGrid1.ColWidths[i] > 0;
          item.OnClick := Fitem_click;
          self.PopupMenu1.Items.Add(item);
        end;
        self.BitBtn7.Enabled := true;
        self.CheckBox6.Enabled := true;
      end;
    finally
      frmQuerySet.Hide;
    end;
  end;
end;

procedure TfrmDataSheet.BitBtn1Click(Sender: TObject);
begin
  close;
end;

function TfrmDataSheet.Trans_Data_To_Grid(RptType: Integer): Boolean;
var
  i, j, k,abbr, PNL_A_B: Integer;
  Cut_NO, Part_NO, SO_NO: string;
  Qty_Online, Qty_ONLine_SQM: double;
begin
  // 1.如果是同一个配料单，同一产品，不同A_B_C板的，不需要显示重复的基本数据
  with dmcon do
  begin
    if RptType = 1 then // 明细模式
    begin
      Cut_NO := '';
      Part_NO := '';
      SO_NO := '';
      PNL_A_B := -1;
      abbr := 0;

      StringGrid1.RowCount := FixedRow + asp_WIP_List.RecordCount + 2;
      for i := FixedRow to StringGrid1.RowCount - 1 do
        StringGrid1.Rows[i].Clear;
       
      Qty_Online := 0;
      Qty_ONLine_SQM := 0;
      for i := 0 to asp_WIP_List.RecordCount - 1 do
      begin
        j := i + FixedRow;
        StringGrid1.Rows[j].Clear;
        
        if (trim(asp_WIP_List.fieldbyName('Cut_No').AsString) = Cut_NO) and
          (trim(asp_WIP_List.fieldbyName('Manu_Part_Number').AsString)
            = Part_NO) and (asp_WIP_List.fieldbyName('PANEL_A_B')
            .Asinteger <> PNL_A_B) then
        else
        begin
          abbr := 0;

          StringGrid1.Cells[0, j] := asp_WIP_List.fieldbyName('Cust_Code')
            .AsString;
          StringGrid1.Cells[1 + abbr, j] := asp_WIP_List.fieldbyName('FOB').AsString;
          StringGrid1.Cells[2 + abbr, j] := asp_WIP_List.fieldbyName('CUT_NO')
            .AsString;
          case asp_WIP_List.FieldByName('ttype').AsInteger of
            0: StringGrid1.Cells[3 + abbr, j] := '正常投产';
            1: StringGrid1.Cells[3 + abbr, j] := '补料投产';
            2: StringGrid1.Cells[3 + abbr, j] := '按MRB重投';
            3: StringGrid1.Cells[3 + abbr, j] := '按MRB返修';
            4: StringGrid1.Cells[3 + abbr, j] := '按板号投产';
                  
          end;
          abbr :=  1;
          StringGrid1.Cells[3 + abbr, j] := trim(asp_WIP_List.fieldbyName
              ('reference_number').AsString);
          
          StringGrid1.Cells[3 + abbr, j] := trim(asp_WIP_List.fieldbyName
              ('reference_number').AsString);
          StringGrid1.Cells[4 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('MANU_PART_DESC').AsString);
          StringGrid1.Cells[5 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('esp_ProdName').AsString); // 本厂编号
          StringGrid1.Cells[6 + abbr, j] := trim(asp_WIP_List.fieldbyName('Prod_Code')
              .AsString);

          StringGrid1.Cells[7 + abbr, j] := trim(asp_WIP_List.fieldbyName('SAMPLE_NR')
              .AsString); // 测试成型备注

          StringGrid1.Cells[8 + abbr, j] := trim(asp_WIP_List.fieldbyName('ANALYSIS_CODE_3')
              .AsString); // 大料规格

          StringGrid1.Cells[9 + abbr, j] := trim(asp_WIP_List.fieldbyName('ANALYSIS_CODE_1')
              .AsString); // 交货尺寸


          //单个面积显示chengtx
//          if Part_NO <> trim(asp_WIP_List.fieldbyName('Manu_Part_Number')
//              .AsString) then
            StringGrid1.Cells[10 + abbr, j] := trim(asp_WIP_List.fieldbyName('Unit_sq')
                .AsString);
        //------


         StringGrid1.Cells[11 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('ISSUE_DATE').AsString); // 投产日期

          StringGrid1.Cells[12 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('ENT_DATE').AsString); // 下单日期

          StringGrid1.Cells[13 + abbr, j] := trim(asp_WIP_List.fieldbyName('SCH_COMPL_DATE')
              .AsString); // 回复交期

          // StringGrid1.cells[8,j]:=trim(asp_WIP_List.fieldbyName('ISSUE_DATE').AsString) ;
          // StringGrid1.cells[9,j]:=trim(asp_WIP_List.fieldbyName('SCH_DATE').AsString) ;

          if SO_NO <> trim(asp_WIP_List.fieldbyName('SO_NO').AsString) then
            if asp_WIP_List.fieldbyName('PARTS_ORDERED').asfloat > 0 then
            begin
              StringGrid1.Cells[14 + abbr, j] := trim
                (asp_WIP_List.fieldbyName('PARTS_ORDERED').AsString); // '订单数';
              StringGrid1.Cells[16 + abbr, j] := trim
                (asp_WIP_List.fieldbyName('ownQty').AsString); // '欠货数';
            end;

          StringGrid1.Cells[15 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('PARTS_SHIPPED').AsString); // '已交货';

          StringGrid1.Cells[17 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('ord_req_qty').AsString); // '待计划数';

          if asp_WIP_List.fieldbyName('Issued_qty').asfloat > 0 then
            StringGrid1.Cells[18 + abbr, j] := trim
              (asp_WIP_List.fieldbyName('Issued_qty').AsString); // '投产数';
          if asp_WIP_List.fieldbyName('PARTS_SHIPPED').asfloat > 0 then
          end;



          if asp_WIP_List.fieldbyName('Qty_PNL').asfloat > 0 then
            StringGrid1.Cells[19 + abbr, j] := trim
              (asp_WIP_List.fieldbyName('Qty_PNL').AsString); // 'Pnl数';

          StringGrid1.Cells[20 + abbr, j] := trim
            (asp_WIP_List.fieldbyName('PANEL_Desc').AsString);
          // '投产PNL';
          if asp_WIP_List.fieldbyName('PARTS_PER_PANEL').asfloat > 0 then
            StringGrid1.Cells[21 + abbr, j] := trim
              (asp_WIP_List.fieldbyName('PARTS_PER_PANEL').AsString);
          // 'A/B拼版';

          if asp_WIP_List.fieldbyName('Qty_Rej').asfloat > 0 then
            StringGrid1.Cells[22 + abbr, j] := trim
              (asp_WIP_List.fieldbyName('Qty_Rej').AsString); // '报废';
          if asp_WIP_List.fieldbyName('Qty_OnLine').asfloat > 0 then
            StringGrid1.Cells[23 + abbr, j] := trim
              (asp_WIP_List.fieldbyName('Qty_OnLine').AsString); // '在制';
          if asp_WIP_List.fieldbyName('Qty_Finished').asfloat > 0 then
            StringGrid1.Cells[24 + abbr, j] := trim
              (asp_WIP_List.fieldbyName('Qty_Finished').AsString); // '入仓';
          if Part_NO <> trim(asp_WIP_List.fieldbyName('Manu_Part_Number')
              .AsString) then
            if asp_WIP_List.fieldbyName('Qty_OnHand').asfloat > 0 then
              StringGrid1.Cells[StringGrid1.ColCount - 2, j] := trim
                (asp_WIP_List.fieldbyName('Qty_OnHand').AsString); // '库存';
//          StringGrid1.Cells[9, j] := trim(asp_WIP_List.fieldbyName('Unit_sq')
//              .AsString);
          StringGrid1.Cells[25 + abbr, j] := trim(asp_WIP_List.fieldbyName('Status')
              .AsString); //

        StringGrid1.Cells[26 + abbr, j] := trim(asp_WIP_List.fieldbyName('cpjs').AsString);
        StringGrid1.Cells[27 + abbr, j] := trim(asp_WIP_List.fieldbyName('PRODUCT_NAME').AsString);
        StringGrid1.Cells[28 + abbr, j] := trim(asp_WIP_List.fieldbyName('PRODUCT_GROUP_NAME').AsString);
        StringGrid1.Cells[29 + abbr, j] := trim(asp_WIP_List.fieldbyName('ANALYSIS_CODE_2').AsString);//2017-6-22增加客户物料号赋值
        StringGrid1.Cells[30 + abbr, j] := trim(asp_WIP_List.fieldbyName('AC1').AsString);//2017-6-22增加分析代码
        StringGrid1.Cells[31 + abbr, j] := trim(asp_WIP_List.fieldbyName('cite_qryonhand').AsString);//2017-6-22增加引用库存pcs数量

          StringGrid1.Cells[StringGrid1.ColCount - 1, j] := trim
            (asp_WIP_List.fieldbyName('QTYREJECT').AsString); // 报废是否超过超投

          Cut_NO := trim(asp_WIP_List.fieldbyName('Cut_No').AsString);
          Part_NO := trim(asp_WIP_List.fieldbyName('Manu_Part_Number')
              .AsString);
          SO_NO := trim(asp_WIP_List.fieldbyName('SO_NO').AsString);
          PNL_A_B := asp_WIP_List.fieldbyName('PANEL_A_B').Asinteger;
          aqDept_List.first;
//          ShowMessage(asp_WIP_List.fieldbyName
//              (trim(aqDept_List.fieldbyName('Dept_Code').AsString))
//              .AsString);
          for k := 0 to aqDept_List.RecordCount - 1 do
          begin
            if asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)).asfloat > 0 then
            begin
//              ShowMessage(aqDept_List.fieldbyName('Dept_Code').AsString+'_out');
//              ShowMessage(asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)+'_out').AsString);
//              ShowMessage(IntToStr(asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)+'_out').Asinteger));
              if asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)+'_out').AsFloat > 0 then
              begin
//                 ShowMessage(asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)+'_out').AsString+'a');
                StringGrid1.Cells[FixedCol + k, j] := trim(asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)).AsString
                  +'('+ asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)+'_out').AsString +')'); // 'A/B拼版';  //2017-6-13
              end
              else
              begin
                StringGrid1.Cells[FixedCol + k, j] := trim(asp_WIP_List.fieldbyName(trim(aqDept_List.fieldbyName('Dept_Code').AsString)).AsString ); // 'A/B拼版';
              end;
            end;

            aqDept_List.next;
          end;

          asp_WIP_List.next;
        end;
        StringGrid1.Cells[20 + abbr, j + 1] := format('%.1f', [Qty_Online]);
      end
      else
      begin // 汇总模式
        StringGrid1.RowCount := FixedRow + asp_WIP_List.RecordCount + 2;
        for i := FixedRow to StringGrid1.RowCount - 1 do
          StringGrid1.Rows[i].Clear;
        for i := 0 to asp_WIP_List.RecordCount - 1 do
        begin
          j := i + FixedRow;
          StringGrid1.Rows[j].Clear;
          StringGrid1.Cells[0, j] := asp_WIP_List.fieldbyName('Cust_Code')
            .AsString;
          StringGrid1.Cells[1, j] := trim(asp_WIP_List.fieldbyName
              ('MANU_PART_NUMBER').AsString);
          StringGrid1.Cells[2, j] := trim
            (asp_WIP_List.fieldbyName('MANU_PART_DESC').AsString);

          StringGrid1.Cells[3, j] := trim(asp_WIP_List.fieldbyName('SAMPLE_NR')
              .AsString); // 测试成型备注

          StringGrid1.Cells[4, j] := trim(asp_WIP_List.fieldbyName('ANALYSIS_CODE_3')
              .AsString); // 大料规格
          StringGrid1.Cells[5, j] := trim(asp_WIP_List.fieldbyName('ANALYSIS_CODE_1')
              .AsString); // 交货尺寸

          StringGrid1.Cells[6, j] := trim
            (asp_WIP_List.fieldbyName('Product_Name').AsString);
          if asp_WIP_List.fieldbyName('PARTS_ORDERED').asfloat > 0 then
            StringGrid1.Cells[7, j] := trim
              (asp_WIP_List.fieldbyName('PARTS_ORDERED').AsString); // '待计划数';
          if asp_WIP_List.fieldbyName('Issued_qty').asfloat > 0 then
            StringGrid1.Cells[8, j] := trim
              (asp_WIP_List.fieldbyName('Issued_qty').AsString); // '投产数';
          if asp_WIP_List.fieldbyName('PARTS_SHIPPED').asfloat > 0 then
            StringGrid1.Cells[9, j] := trim
              (asp_WIP_List.fieldbyName('PARTS_SHIPPED').AsString); // '待发放';
          if asp_WIP_List.fieldbyName('Qty_PNL').asfloat > 0 then
            StringGrid1.Cells[10, j] := trim(asp_WIP_List.fieldbyName('Qty_PNL')
                .AsString); // 'Pnl数';
          if asp_WIP_List.fieldbyName('Qty_SQM').asfloat > 0 then
            StringGrid1.Cells[11, j] := trim(asp_WIP_List.fieldbyName('Qty_SQM')
                .AsString); // '平方米';
          if asp_WIP_List.fieldbyName('Qty_Rej').asfloat > 0 then
            StringGrid1.Cells[12, j] := trim
              (asp_WIP_List.fieldbyName('Qty_Rej').AsString); // '报废';
          if asp_WIP_List.fieldbyName('Qty_OnLine').asfloat > 0 then
            StringGrid1.Cells[13, j] := trim
              (asp_WIP_List.fieldbyName('Qty_OnLine').AsString); // '在制';
          if asp_WIP_List.fieldbyName('Qty_Finished').asfloat > 0 then
            StringGrid1.Cells[14, j] := trim
              (asp_WIP_List.fieldbyName('Qty_Finished').AsString); // '入仓';

        StringGrid1.Cells[15, j] := trim(asp_WIP_List.fieldbyName('cpjs').AsString);
        StringGrid1.Cells[16, j] := trim(asp_WIP_List.fieldbyName('PRODUCT_NAME').AsString);
        StringGrid1.Cells[17, j] := trim(asp_WIP_List.fieldbyName('PRODUCT_GROUP_NAME').AsString);

          if Part_NO <> trim(asp_WIP_List.fieldbyName('Manu_Part_Number')
              .AsString) then
            if asp_WIP_List.fieldbyName('Qty_OnHand').asfloat > 0 then
              StringGrid1.Cells[StringGrid1.ColCount - 2, j] := trim
                (asp_WIP_List.fieldbyName('Qty_OnHand').AsString); // '库存';
          StringGrid1.Cells[StringGrid1.ColCount - 1, j] :=
            asp_WIP_List.fieldbyName('QTYREJECT').AsString;
          aqDept_List.first;
          for k := 0 to aqDept_List.RecordCount - 1 do
          begin
            if asp_WIP_List.fieldbyName
              (trim(aqDept_List.fieldbyName('Dept_Code').AsString))
              .asfloat > 0 then
              StringGrid1.Cells[FixedCol + k, j] := trim
                (asp_WIP_List.fieldbyName
                  (trim(aqDept_List.fieldbyName('Dept_Code').AsString))
                  .AsString); // 'A/B拼版';
            aqDept_List.next;
          end;
          asp_WIP_List.next;
        end;
        StringGrid1.Cells[13, j + 1] := format('%.1f', [Qty_Online]);
      end;

      if v_UnitType = 0 then
        StringGrid1.Cells[1, j + 1] := '合计(PCS)'
      else if v_UnitType = 1 then
        StringGrid1.Cells[1, j + 1] := '合计(PANEL)'
      else if v_UnitType = 2 then
        StringGrid1.Cells[1, j + 1] := '合计(平方米)';
      StringGrid1.Cells[1, j + 2] := '合计(平方米)';

      adsDept_Sum.first;
      while not adsDept_Sum.Eof do
      begin
        if aqDept_List.Locate('Dept_Code',
          adsDept_Sum.fieldbyName('Dept_Code').AsString, []) then
        begin
          Qty_ONLine_SQM := Qty_ONLine_SQM + adsDept_Sum.fieldbyName('SQM_Qty')
            .asfloat;
          Qty_Online := Qty_Online + adsDept_Sum.fieldbyName('qty_OP').asfloat;
          if (adsDept_Sum.FieldByName('Qty_out').asfloat>0) and (RptType = 1) then
          begin
            StringGrid1.Cells[FixedCol + aqDept_List.RecNo - 1, j + 1] := format
            ('%8.2f', [adsDept_Sum.fieldbyName('Qty').asfloat])+'('+ Trim(format
            ('%8.2f', [adsDept_Sum.fieldbyName('Qty_out').asfloat]))+')';
          end
          else
          begin
            StringGrid1.Cells[FixedCol + aqDept_List.RecNo - 1, j + 1] := format
            ('%8.2f', [adsDept_Sum.fieldbyName('Qty').asfloat]);
          end;
          if (adsDept_Sum.FieldByName('SQM_Qty_out').asfloat>0) and (RptType = 1) then
          begin
            StringGrid1.Cells[FixedCol + aqDept_List.RecNo - 1, j + 2] := format
            ('%8.2f', [adsDept_Sum.fieldbyName('SQM_Qty').asfloat])+'('+ Trim(format
            ('%8.2f', [adsDept_Sum.fieldbyName('SQM_Qty_out').asfloat]))+')';
          end
          else
          begin
            StringGrid1.Cells[FixedCol + aqDept_List.RecNo - 1, j + 2] := format
            ('%8.2f', [adsDept_Sum.fieldbyName('SQM_Qty').asfloat]);
          end;

        end;
        adsDept_Sum.next;
      end;
      
      if RptType = 1 then // 明细模式
      begin
        StringGrid1.Cells[19 + abbr, j + 1] := format('%.2f', [Qty_Online]);
        StringGrid1.Cells[19 + abbr, j + 2] := format('%.2f', [Qty_ONLine_SQM]);
        StringGrid1.Cells[22 + abbr, j + 1] := ''; // adsDept_Sum.fieldbyName('sumQty_reject').AsString+' PCS';/  inttostr(FsumQty_reject)+' PCS';
        StringGrid1.Cells[22 + abbr, j + 2] := ''; // format('%8.2f',[adsDept_Sum.fieldbyName('sumSQM_reject').AsFloat]);
      end
      else
      begin
        StringGrid1.Cells[13 , j + 1] := format('%.2f', [Qty_Online]);
        StringGrid1.Cells[13, j + 2] := format('%.2f', [Qty_ONLine_SQM]);
      end;
    end;
  end;

  procedure TfrmDataSheet.Add_Fixed_Column_Title(Rpt_Type, Sum_Type: Integer;
    Sqlstr1: string);
  var
    abbr, i: Integer;
    sqlstr: string;
  begin
    abbr := 0;
    if Rpt_Type = 1 then // 明细
    begin
      FCustomColType := 'MX';
//      FixedCol := 30;
      FixedCol := 33;     //2017-6-22增加客户物料号列数 ，6-23  分析代码 //2017-6-28 引用库存pcs数量
      FixedRow := 2;
      with StringGrid1 do
      begin
        abbr := 0;
        StringGrid1.FixedCols := 9;
        Cells[0, 0] := '客户';
        Cells[1 + abbr, 0] := '客户订单号';
        Cells[2 + abbr, 0] := '配料单号';
        Cells[3 + abbr, 0] := '投产类型';
        abbr := 1;
        Cells[3 + abbr, 0] := '参考号';
        Cells[4 + abbr, 0] := '客户型号';
        Cells[5 + abbr, 0] := '本厂编号';
        Cells[6 + abbr, 0] := '产品类型';
        Cells[7 + abbr, 0] := '测试成型备注';
        Cells[8 + abbr, 0] := '大料规格';
        Cells[9 + abbr, 0] := '交货尺寸';
        Cells[10 + abbr, 0] := '单只面积';
        Cells[11 + abbr, 0] := '投产期';
        Cells[12 + abbr, 0] := '下单日期';
        Cells[13 + abbr, 0] := '计划完工期';
        Cells[14 + abbr, 0] := '订单数';
        Cells[15 + abbr, 0] := '已交货';
        Cells[16 + abbr, 0] := '欠货数';
        Cells[17 + abbr, 0] := '待计划数';
        Cells[18 + abbr, 0] := '投产数';
        Cells[19 + abbr, 0] := '在线Pnl数';
        Cells[20 + abbr, 0] := '投产PNL';
        Cells[21 + abbr, 0] := 'PCS/PNL';
        Cells[22 + abbr, 0] := '报废';
        Cells[23 + abbr, 0] := '在制';
        Cells[24 + abbr, 0] := '入仓';
        Cells[25 + abbr, 0] := '完成状况';
        Cells[26 + abbr, 0] := '产品阶数';
        Cells[27 + abbr, 0] := '产品类型';
        Cells[28 + abbr, 0] := '产品组别';
        Cells[29 + abbr, 0] := '客户物料号';    //2017-6-22增加客户物料号列数
        Cells[30 + abbr, 0] := '分析代码';    //2017-6-23分析代码
        Cells[31 + abbr, 0] := '引用库存pcs数量';    //2017-6-28 引用库存pcs数量
      end;
    end
    else
    begin // 汇总
      FCustomColType := 'HZ';
      with StringGrid1 do
      begin
        FixedCol := 18;
        FixedRow := 2;
        StringGrid1.FixedCols := 2;
        Cells[0, 0] := '客户';
        Cells[1 + abbr, 0] := '本厂编号';
        Cells[2 + abbr, 0] := '客户型号';
        Cells[3 + abbr, 0] := '测试成型备注';
        Cells[4 + abbr, 0] := '大料规格';
        Cells[5 + abbr, 0] := '交货尺寸';
        Cells[6 + abbr, 0] := '基本工艺';
        Cells[7 + abbr, 0] := '待计划数';
        Cells[8 + abbr, 0] := '投产数';
        Cells[9 + abbr, 0] := '待发放';
        Cells[10 + abbr, 0] := 'Pnl数';
        Cells[11 + abbr, 0] := '平方米';
        Cells[12 + abbr, 0] := '报废';
        Cells[13 + abbr, 0] := '在制数';
        Cells[14 + abbr, 0] := '入仓';
        Cells[15 + abbr, 0] := '产品阶数';
        Cells[16 + abbr, 0] := '产品类型';
        Cells[17 + abbr, 0] := '产品组别';
      end;
    end;
    FCustomCol := FixedCol;

    if Sum_Type = 0 then // 按班组 汇总
      sqlstr := 'SELECT TOP 100 PERCENT Dept_Code,Dept_Name ' +
        'From data0034 WHERE (TTYPE=5) and (Seq_Nr>0) and (rkey in ' +
        '(select big_dept_ptr from data0034 where (TTYPE=1) group by big_dept_ptr ' +
        '))' + ' order by SEQ_NR '
    else
    begin // 按工序   汇总
      sqlstr := 'SELECT TOP 100 PERCENT D34.DEPT_CODE,D34.Dept_Name ' +
        'FROM dbo.Data0006 D06 INNER JOIN dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY ' +
  		   ' inner join dbo.data0008 d08 on d08.rkey = d25.PROD_CODE_PTR ' +
    		 ' inner join dbo.data0007 d07 on d07.rkey = d08.PR_GRP_POINTER ' +
        ' INNER JOIN dbo.data0010 D10 ON D25.CUSTOMER_PTR = D10.rKey INNER JOIN ' +
        ' dbo.Data0492 D492 on D06.Cut_no=D492.Cut_no '
        + ' INNER JOIN dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR INNER JOIN dbo.Data0034 D34 ' + 'ON D56.DEPT_PTR = D34.RKEY left outer join data0060 d60 on d492.so_no=d60.sales_order ' + Sqlstr1 + ' group by D34.dept_code,D34.dept_name,D34.seq_nr ' + 'order by D34.seq_nr';
    end;
    
    
    with dmcon do
    begin
      aqDept_List.close;
      aqDept_List.sql.Clear;
      aqDept_List.sql.Add(sqlstr);
      aqDept_List.open;


      StringGrid1.ColCount := FixedCol + aqDept_List.RecordCount + 2;

      for i := 0 to FixedCol - 1 do
        StringGrid1.ColWidths[i] := 80;
      for i := FixedCol to StringGrid1.ColCount - 1 do
      begin
        StringGrid1.Cols[i].Clear;
        StringGrid1.ColWidths[i] := 94;
      end;

      StringGrid1.ColWidths[StringGrid1.ColCount - 1] := -1;
      
      StringGrid1.Cells[StringGrid1.ColCount - 2, 0] := '';
      StringGrid1.Cells[StringGrid1.ColCount - 2, 1] := '';

      StringGrid1.Rows[1].Clear; // 增加andy081028
      StringGrid1.Cells[StringGrid1.ColCount - 2, 1] := '库存';
      aqDept_List.first;
      for i := 0 to aqDept_List.RecordCount - 1 do
      begin
        StringGrid1.Cells[FixedCol + i, 0] := StringReplace
          (trim(aqDept_List.fieldbyName('Dept_Code').AsString), 'F_', '', []);
        StringGrid1.Cells[FixedCol + i, 1] := trim
          (aqDept_List.fieldbyName('Dept_Name').AsString);
        aqDept_List.next;
      end;
    end;
  end;

  procedure TfrmDataSheet.BitBtn2Click(Sender: TObject);
  begin
    Export_Grid_to_Excel(StringGrid1, 'WIP产品数据', [0, 1, 4]);
  end;

  procedure TfrmDataSheet.StringGrid1SelectCell(Sender: TObject;
    ACol, ARow: Integer; var CanSelect: Boolean);
  begin
    newrow := ARow;
    newcol := ACol;
    StringGrid1.Refresh;
  end;

  procedure TfrmDataSheet.StringGrid1DrawCell(Sender: TObject;
    ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  begin
    if StringGrid1.Cells[18, ARow] = '已延期' then
    begin
      StringGrid1.Canvas.Brush.Color := clAqua;
      StringGrid1.Canvas.FillRect(Rect);
      StringGrid1.Canvas.TextRect(Rect, Rect.left + 2, Rect.Top + 2,
        trim(StringGrid1.Cells[ACol, ARow]))
    end;

    if (ACol = StringGrid1.ColCount - 2) then
    else If ACol > 16 then
      StringGrid1.Canvas.TextRect(Rect,
        Rect.right - StringGrid1.Canvas.TextWidth(trim(StringGrid1.Cells[ACol,
            ARow])) - 2, Rect.Top + 2, trim(StringGrid1.Cells[ACol, ARow]))
    else If (ACol > 8) and (ACol <> 14) and (ACol <> 15) then
      StringGrid1.Canvas.TextRect(Rect,
        Rect.right - StringGrid1.Canvas.TextWidth(trim(StringGrid1.Cells[ACol,
            ARow])) - 2, Rect.Top + 2, trim(StringGrid1.Cells[ACol, ARow]));

    if (ARow > 1) and (trim(StringGrid1.Cells[StringGrid1.ColCount - 1, ARow])
        <> '') and (strtofloat(StringGrid1.Cells[StringGrid1.ColCount - 1,
        ARow]) > 0) then
    begin
      StringGrid1.Canvas.Brush.Color := clred;
      StringGrid1.Canvas.Brush.Style := bsSolid;
      StringGrid1.Canvas.FrameRect(Rect);
    end;

    if ARow = newrow then
    begin
      if ACol = newcol then
      begin
        StringGrid1.Canvas.Brush.Color := clred;
        StringGrid1.Canvas.FrameRect(Rect);
      end
      else
      begin
        StringGrid1.Canvas.Brush.Color := clblue;
        StringGrid1.Canvas.FrameRect(Rect);
      end;
    end;
  end;

  procedure TfrmDataSheet.ToolButton5Click(Sender: TObject);
  begin
    if Chart4.view3doptions.Zoom < 300 THEN
      Chart4.view3doptions.Zoom := Chart4.view3doptions.Zoom + 2;
  end;

  procedure TfrmDataSheet.ToolButton6Click(Sender: TObject);
  begin
    if Chart4.view3doptions.Zoom > 1 THEN
      Chart4.view3doptions.Zoom := Chart4.view3doptions.Zoom - 2;
  end;

  procedure TfrmDataSheet.ToolButton7Click(Sender: TObject);
  begin
    if Chart4.view3doptions.HorizOffset > -500 THEN
      Chart4.view3doptions.HorizOffset := Chart4.view3doptions.HorizOffset - 5;
  end;

  procedure TfrmDataSheet.ToolButton8Click(Sender: TObject);
  begin
    if Chart4.view3doptions.HorizOffset < 500 THEN
      Chart4.view3doptions.HorizOffset := Chart4.view3doptions.HorizOffset + 5;
  end;

  procedure TfrmDataSheet.ToolButton9Click(Sender: TObject);
  begin
    if Chart4.view3doptions.VertOffset > -500 THEN
      Chart4.view3doptions.VertOffset := Chart4.view3doptions.VertOffset - 5;
  end;

  procedure TfrmDataSheet.ToolButton10Click(Sender: TObject);
  begin
    if Chart4.view3doptions.VertOffset < 500 THEN
      Chart4.view3doptions.VertOffset := Chart4.view3doptions.VertOffset + 5;
  end;

  procedure TfrmDataSheet.ToolButton11Click(Sender: TObject);
  begin
    if Chart4.Chart3DPercent < 96 THEN
      Chart4.Chart3DPercent := Chart4.Chart3DPercent + 5;
  end;

  procedure TfrmDataSheet.ToolButton12Click(Sender: TObject);
  begin
    if Chart4.Chart3DPercent >= 6 THEN
      Chart4.Chart3DPercent := Chart4.Chart3DPercent - 5;
  end;

  procedure TfrmDataSheet.ToolButton14Click(Sender: TObject);
  begin
    Chart4.PreviousPage;
  end;

  procedure TfrmDataSheet.ToolButton15Click(Sender: TObject);
  begin
    Chart4.NextPage;
  end;

  procedure TfrmDataSheet.CheckBox1Click(Sender: TObject);
  begin
    Chart4.View3D := CheckBox1.Checked;
    ToolButton5.Enabled := CheckBox1.Checked;
    ToolButton6.Enabled := CheckBox1.Checked;
    ToolButton7.Enabled := CheckBox1.Checked;
    ToolButton8.Enabled := CheckBox1.Checked;
    ToolButton9.Enabled := CheckBox1.Checked;
    ToolButton10.Enabled := CheckBox1.Checked;
    ToolButton11.Enabled := CheckBox1.Checked;
    ToolButton12.Enabled := CheckBox1.Checked;
  end;

  procedure TfrmDataSheet.Edit1Change(Sender: TObject);
  begin
    Chart4.MaxPointsPerPage := strtoint(Edit1.Text);
  end;

  procedure TfrmDataSheet.Chart_Data;
  begin
    BarSeries1.Clear;
    Chart4.MaxPointsPerPage := dmcon.adsDept_Sum.RecordCount;
    dmcon.adsDept_Sum.first;
    WITH dmcon.adsDept_Sum do
    begin
      while not Eof do
      begin
        BarSeries1.Add(dmcon.adsDept_Sum.fieldbyName('qty_Online').asfloat,
          dmcon.adsDept_Sum.fieldbyName('Dept_Code').AsString, clgreen);
        dmcon.adsDept_Sum.next;
      end;
      Chart4.MaxPointsPerPage := dmcon.adsDept_Sum.RecordCount;
      Edit1.Text := IntToStr(dmcon.adsDept_Sum.RecordCount);
      Chart4.MaxPointsPerPage := strtoint(Edit1.Text);
    end;
  end;

  procedure TfrmDataSheet.BitBtn5Click(Sender: TObject);
  var
    Label_Tmp: TppLabel;
    Text_Tmp: TppDBText;
    i: Integer;
    TmpClass: TComponent;
  begin
    if (v_RptType = 1) and (v_Sum_Type = 0) then
    begin
      with dmcon do
      begin
        if asp_WIP_List.IsEmpty then
          exit;
        for i := 0 to 16 do
        begin
          TmpClass := frmDataSheet.findComponent('ppDBText' + IntToStr(49 + i));
          if TmpClass <> nil then
            Text_Tmp := TppDBText(TmpClass);

          TmpClass := frmDataSheet.findComponent('ppLabel' + IntToStr(33 + i));
          if TmpClass <> nil then
            Label_Tmp := TppLabel(TmpClass);
          if adsDept_Sum.Locate('Dept_Code', Text_Tmp.DataField, []) then
            Label_Tmp.Caption := format('%8.2f',
              [adsDept_Sum.fieldbyName('SQM_Qty').asfloat]);
        end;
      end;
      pp1.Print;
    end
    else
      ShowMsg('目前只能打印按部门汇总的明细报表', 1);
  end;

  procedure TfrmDataSheet.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    MyDataClass.Free;
  end;

  procedure TfrmDataSheet.SetSort(SortType: Integer);
  var
    tmpstr: string;
  begin
    case SortType of
      0:
        tmpstr :=
          ' SCH_COMPL_DATE ASC,MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC ';
      // 交期排序
      1:
        tmpstr :=
          ' Cust_Code ASC,MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC,SCH_COMPL_DATE ASC ';
      // 客户代号
      2:
        tmpstr :=
          ' MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC,SCH_COMPL_DATE ASC ';
      // 本厂编号排序
      3:
        tmpstr :=
          ' MANU_PART_DESC ASC,MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC,SCH_COMPL_DATE ASC ';
      // 客户型号排序
      4:
        tmpstr :=
          ' sales_order ASC, MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC,SCH_COMPL_DATE ASC ';
      // 订单排序
      5:
        tmpstr :=
          ' FOB ASC,MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC,SCH_COMPL_DATE ASC ';
      // 合同号排序
      6:
        tmpstr :=
          ' Product_Name ASC ,MANU_PART_NUMBER ASC,CUT_NO ASC,PANEL_A_B ASC,SCH_COMPL_DATE ASC ';
      // 产品类别排序
    end;
    dmcon.asp_WIP_List.Sort := tmpstr;
  end;

  procedure TfrmDataSheet.rgSortTypeClick(Sender: TObject);
  begin
    if dmcon.asp_WIP_List.IsEmpty then
      abort;
    if v_RptType = 1 then
    begin
      SetSort(rgSortType.ItemIndex);
      Trans_Data_To_Grid(v_RptType);
    end;
  end;

  procedure TfrmDataSheet.BitBtn3Click(Sender: TObject);
  begin
    Export_dbGridEH_to_Excel(DBGridEh1, '汇总分析数据');
  end;

  procedure TfrmDataSheet.BitBtn6Click(Sender: TObject);
  begin
    application.CreateForm(TForm_nowipso, Form_nowipso);
    Form_nowipso.ShowModal;
    Form_nowipso.Free;
  end;

  procedure TfrmDataSheet.BitBtn7Click(Sender: TObject);
  begin
    PopupMenu1.Popup(mouse.CursorPos.x, mouse.CursorPos.y);
  end;

  procedure TfrmDataSheet.CheckBox6Click(Sender: TObject);
  var
    i: Integer;
    ExcludeColumns: TExcludeColumns;
  begin
    for i := 0 to StringGrid1.ColCount - 1 do
      if StringGrid1.ColWidths[i] < 0 then
        ExcludeColumns := ExcludeColumns + [i];

    if CheckBox6.Checked then
      SetOptimalGridCellWidth(StringGrid1, ExcludeColumns)
    else
      for i := 0 to StringGrid1.ColCount - 1 do
        if StringGrid1.ColWidths[i] > 0 then
          StringGrid1.ColWidths[i] := FaWidth[i];
  end;

  procedure TfrmDataSheet.SaveCustomColToIni;
  var
    LFile: TIniFile;
    i: Integer;
  begin
    LFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PinBan.ini');
    try
      for i := 0 to FCustomCol - 1 do
        LFile.WriteString('WIP_COL_W', FCustomColType + IntToStr(i),
          IntToStr(StringGrid1.ColWidths[i]));
    finally
      LFile.Free;
    end;
  end;

  procedure TfrmDataSheet.LoadCustomColFromIni;
  var
    LFile: TIniFile;
    i: Integer;
    W: Integer;
  begin
    LFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PinBan.ini');
    try
      for i := 0 to FCustomCol - 1 do
      begin
        W := LFile.ReadInteger('WIP_COL_W', FCustomColType + IntToStr(i), -999);
        if W <> -999 then
          StringGrid1.ColWidths[i] := W;
      end;
    finally
      LFile.Free;
    end;
  end;

procedure TfrmDataSheet.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//选择stringgrid控件的方法
begin
  if Button=mbLeft then
  begin
    stringgrid1.MouseToCell(x,y,column,row);
//   if (Row=0) and (column in [0,1,2,3,4,5,8,12,18]) then
    if (Row=0) then
    begin
      GetSort(StringGrid1,column);
    end;
  end;
end;

procedure TfrmDataSheet.GetSort(var GenStrGrid: TStringGrid;
  ThatCol: Integer);
const
 TheSeparator = '@'; // Define the Separator
var
 CountItem, I, J, K, ThePosition : Integer;
 MyList : TStringList;
 MyString, TempString : String;
begin
CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
//  for i:=0 to CountItem-3 do
//  begin
// //   GenStrGrid.Cells[ThatCol,i] := StringofChar('0',3-Length(GenStrGrid.Cells[ThatCol,i])+GenStrGrid.Cells[ThatCol,i];
//    GenStrGrid.Cells[ThatCol,i] :=  GenStrGrid.Cells[ThatCol,i];
//  end;
  MyList := TStringList.Create; //Create the List
  MyList.Sorted := False;
  try
  begin
   for I := 2 to (CountItem - 3) do
    MyList.Add(GenStrGrid.Rows[I].Strings[ThatCol] + TheSeparator + GenStrGrid.Rows[I].Text);
    Mylist.Sort;//Sort the List
//    ShowMessage(IntToStr(MyList.Count));

    for K := 1 to Mylist.Count do
    begin
     MyString := MyList.Strings[(K - 1)];//Take the String of the line (K ? 1)
     ThePosition := Pos(TheSeparator, MyString);//Find the position of the Separator in the String
     TempString := '';
     {Eliminate the Text of the column on which we have sorted the StringGrid}
     TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
     MyList.Strings[(K - 1)] := '';
     MyList.Strings[(K - 1)] := TempString;

    end;
    for J := 2 to (CountItem - 3) do
      GenStrGrid.Rows[CountItem-1-J].Text := MyList.Strings[(J - 2)];//Refill the StringGrid
  end;
  finally
    MyList.Free;//Free the List
  end;
  CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-3 do
  begin
    GenStrGrid.Cells[ThatCol,i] := inttostr(strtoint(GenStrGrid.Cells[ThatCol,i]));
  end;
end;

procedure TfrmDataSheet.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(strSQL);
end;

end.
