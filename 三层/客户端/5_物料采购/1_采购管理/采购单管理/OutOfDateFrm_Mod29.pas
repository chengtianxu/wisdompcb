unit OutOfDateFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmOutOfDay_Mod29 = class(TfrmBaseMain)
    chk1: TCheckBox;
    chk2: TCheckBox;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl2: TLabel;
    procedure chk1Click(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure chk2Click(Sender: TObject);
  private
    { Private declarations }
    day:TDateTime;
    function GetMainSql:string;
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmOutOfDay_Mod29: TfrmOutOfDay_Mod29;

implementation

uses uCommFunc,System.DateUtils;

{$R *.dfm}

{ TfrmOutOfDay_Mod29 }

procedure TfrmOutOfDay_Mod29.chk1Click(Sender: TObject);
begin
  inherited;
  if chk1.Checked then chk2.Enabled:= true
  else chk2.Enabled:= False;
  day:= gFunc.GetSvrDateTime(dtdatetime);
  if not gSvrIntf.IntfGetDataBySql(GetMainSql,cdsMain) then
  begin
    ShowMessage('取得数据失败');
    exit;
  end;
end;

procedure TfrmOutOfDay_Mod29.chk2Click(Sender: TObject);
begin
  inherited;
  day:= gFunc.GetSvrDateTime(dtdatetime);
  if not gSvrIntf.IntfGetDataBySql(GetMainSql,cdsMain) then
  begin
    ShowMessage('取得数据失败');
    exit;
  end;
end;

procedure TfrmOutOfDay_Mod29.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('要求到货日期').Value < day then
  begin
    ehMain.Canvas.Font.Color :=clred ;
    ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmOutOfDay_Mod29.GetData;
begin
  day:= gFunc.GetSvrDateTime(dtdatetime);
  dtp2.Date:= IncDay(day,1);
  dtp1.Date:= IncDay(dtp2.Date,-7);
  FMainFrmSql:= GetMainSql;
  inherited;
end;

function TfrmOutOfDay_Mod29.GetMainSql: string;
var
  sql1,sql2:string;
begin
  sql1:= 'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,   '+#13+
         '              dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_ORD, '+#13+
         '             dbo.Data0071.tax_price, dbo.Data0071.TAX_2, dbo.Data0001.CURR_NAME,     '+#13+
         '             dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME,                                   '+#13+
         '             dbo.Data0071.REQ_DATE as 要求到货日期, dbo.Data0071.recd_DATE as 最后收货日期,     '+#13+
         '             dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS 欠货数量,   '+#13+
         '              dbo.Data0071.reason as 请购原因, dbo.Data0071.extra_req as 特别要求,   '+#13+
         '              dbo.Data0071.rohs as 环保等级, dbo.Data0071.IF_urgency as 是否紧急,            '+#13+
         '             dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EMPLOYEE_NAME as 采购人员,    '+#13+
         '             ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS_CODE_1) as 请购人员,    '+#13+
         '             ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  as 请购部门,              '+#13+
         '             ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  as 请购编号,              '+#13+
         '             case  data0070.STATUS when 1 then ''待审核'' when 2 then ''被退回'' when 3 then ''已保留'' when 4 then ''已暂缓''     '+#13+
         '              when 5 then ''已审核'' when 6 then ''已收货'' when 7 then ''已完成'' when 8 then ''未提交'' end as 状态,      '+#13+
         '              ''编码物料'' as 类型                                                                 '+#13+
         '   FROM         dbo.Data0071 INNER JOIN                                                          '+#13+
         '             dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN                   '+#13+
         '             dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN                 '+#13+
         '             dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN         '+#13+
         '             dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN         '+#13+
         '             dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Data0005.RKEY INNER JOIN          '+#13+
         '             dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN         '+#13+
         '             dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN         '+#13+
         '             dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY LEFT OUTER JOIN               '+#13+
         '             dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0068.RKEY LEFT OUTER JOIN        '+#13+
         '             dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = data0005_1.RKEY LEFT OUTER JOIN    '+#13+
         '             dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN '+#13+
         '             dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO = data0034_1.DEPT_CODE           '+#13+
         '    WHERE  dbo.Data0070.PO_DATE >= ' + QuotedStr(DateToStr(dtp1.Date)) + #13+
         '                    and dbo.Data0070.PO_DATE <= ' + QuotedStr(DateToStr(dtp2.Date)) + #13;

  sql2:='  UNION  ' +#13+
        '  SELECT     dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, dbo.Data0072.DESCRIPTION2,     ' + #13+
        '             dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.ABBR_NAME, dbo.Data0072.QUAN_ORD,  ' + #13+
        '            dbo.Data0072.tax_price, dbo.Data0072.state_TAX, dbo.Data0001.CURR_NAME,         ' + #13+
        '            dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME,                              ' + #13+
        '            dbo.Data0072.del_DATE as 要求到货日期, dbo.Data0072.recd_DATE as 最后收货日期,         ' + #13+
        '            dbo.Data0072.QUANTITY_RECEIVED, dbo.Data0072.QUAN_ORD - dbo.Data0072.QUANTITY_RECEIVED AS 欠货数量,   '+ #13+
        '             dbo.Data0072.reason as 请购原因, '''' as 特别要求,                           ' + #13+
        '             dbo.Data0072.rohs as 环保等级, dbo.Data0072.IF_urgency as 是否紧急,        ' + #13+
        '            dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EMPLOYEE_NAME as 采购人员,  '+ #13+
        '            ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS_CODE_1) as 请购人员,   ' + #13+
        '            ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  as 请购部门,             ' + #13+
        '            ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  as 请购编号,                   '+ #13+
        '            case  data0070.STATUS when 1 then ''待审核'' when 2 then ''被退回'' when 3 then ''已保留'' when 4 then ''已暂缓''  ' + #13+
        '             when 5 then ''已审核'' when 6 then ''已收货'' when 7 then ''已完成'' when 8 then ''未提交'' end as 状态 ,   '  + #13+
        '            ''非编码物料'' as 类型                                                               '  + #13+
        '  FROM         dbo.Data0072 INNER JOIN                                                          ' + #13+
        '            dbo.Data0070 ON dbo.Data0072.POPTR = dbo.Data0070.RKEY  INNER JOIN                 '  + #13+
        '            dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN       '  + #13+
        '            dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN               '  + #13+
        '            dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Data0005.RKEY INNER JOIN       '   + #13+
        '            dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN      '   + #13+
        '            dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN      '   + #13+
        '            dbo.Data0204 ON dbo.Data0072.rkey204 = dbo.Data0204.RKEY LEFT OUTER JOIN           '   + #13+
        '            dbo.Data0068 ON dbo.Data0204.PURCHase_REQ_PTR = dbo.Data0068.RKEY LEFT OUTER JOIN  '   + #13+
        '            dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = data0005_1.RKEY LEFT OUTER JOIN '  + #13+
        '            dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN '+ #13+
        '            dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO = data0034_1.DEPT_CODE        '   + #13+
        '    WHERE  dbo.Data0070.PO_DATE >= ' + QuotedStr(DateToStr(dtp1.Date)) + #13+
        '                    and dbo.Data0070.PO_DATE <= ' + QuotedStr(DateToStr(dtp2.Date)) + #13;
  if chk1.Checked then
  begin
    sql1:= sql1 + ' and data0070.STATUS=5 and dbo.Data0071.QUAN_ORD > dbo.Data0071.QUAN_RECD ' + #13;
    sql2:= sql2 + ' and data0070.STATUS=5 and dbo.Data0072.QUAN_ORD > dbo.Data0072.QUANTITY_RECEIVED ' + #13;
  end;
  if chk2.Checked then
  begin
    sql1:= sql1 + ' and dbo.Data0071.REQ_DATE < GETDATE() ';
    sql2:= sql2 + ' and dbo.Data0072.del_DATE < GETDATE() ';
  end;
  Result:= sql1 + sql2;
end;

end.
