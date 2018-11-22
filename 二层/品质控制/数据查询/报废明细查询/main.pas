unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Menus, Grids, DBGridEh, ADODB,
  OleServer, Excel2000,ComObj;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    ADOConnection1: TADOConnection;
    ADS58: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    ADS58MRB_NO: TStringField;
    ADS58WORK_ORDER_NUMBER: TStringField;
    ADS58REJ_CODE: TStringField;
    ADS58REJECT_DESCRIPTION: TStringField;
    ADS58QTY_REJECT: TFloatField;
    ADS58PANELS: TIntegerField;
    ADS58TDATETIME: TDateTimeField;
    ADS58EMPLOYEE_NAME: TStringField;
    ADS58AUDIT_DATETIME: TDateTimeField;
    ADS58authempl_name: TStringField;
    ADS58DEPT_CODE: TStringField;
    ADS58DEPT_NAME: TStringField;
    ADS58MANU_PART_NUMBER: TStringField;
    ADS58MANU_PART_DESC: TStringField;
    ADS58PROD_CODE: TStringField;
    ADS58PRODUCT_NAME: TStringField;
    ADS58CUST_CODE: TStringField;
    ADS58ABBR_NAME: TStringField;
    ADS58set_qty: TIntegerField;
    ADS58ANALYSIS_CODE_1: TStringField;
    ADS58unit_sq: TFloatField;
    ADS58rejsqft: TFloatField;
    BitBtn6: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    ADS58ReqDeptCode: TStringField;
    ADS58ReqDeptName: TStringField;
    ADS58TTYPE1: TStringField;
    ADS58SO_NO: TStringField;
    ADS58PO_NUMBER: TStringField;
    ADS58DEPT_CODE2: TStringField;
    ADS58DEPT_NAME2: TStringField;
    ADS58TUSAGE: TBCDField;
    ADS58rejsqft_db: TFloatField;
    ADS58REFERENCE: TStringField;
    ADS58abbr_name15: TStringField;
    ADS58SAMPLE_NR: TStringField;
    ADS58cost_name: TStringField;
    ADS58CPJS: TStringField;
    ADS58rej_type: TStringField;
    ADS58Field: TFloatField;
    ADS58ORIG_CUSTOMER: TStringField;
    ADS58WO_PTR: TIntegerField;
    N1: TMenuItem;
    ADS58LAYERS: TWordField;
    ADS58ISSUED_QTY: TIntegerField;
    ADS58ORD_REQ_QTY: TIntegerField;
    ADS58QTY_REJECT_1: TIntegerField;
    Edit2: TEdit;
    lbl1: TLabel;
    Edit3: TEdit;
    lbl2: TLabel;
    N2: TMenuItem;
    ADS58rkey: TIntegerField;
    ADS58used_qty: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure pmINPopup(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    sql_text:string;
    rkey419:Integer;
    FSDate,FEdate:TDateTime;
    IsIn:Boolean;
    procedure showField;
    procedure coltodb;
    procedure loadField(tmp: TADOQuery;DbGrid: TDBGridEh);
//    procedure item_click(sender:TObject);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses common, condition, PasFieldShow, InFrm,DateUtils;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(self.ADOConnection1) then
  begin
    showmsg('程序启动失败，请与管理员联系！',1);
    application.Terminate;
  end;
  self.caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  TimeSeparator := ':';
  ShortTimeFormat := 'HH:mm:ss';
//
//  rkey73:='3022' ;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
//  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
  try
    frmFieldShow:=TfrmFieldShow.Create(Application);
    frmFieldShow.key419:=rkey419;
    if frmFieldShow.ShowModal=mryes then
    begin
      Self.showField;
    end;
  finally
    frmFieldShow.Free;
  end;
end;

//procedure tform1.item_click(sender:TObject);
//var i:byte;
//begin
// (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
// if (sender as tmenuItem).Checked then
// begin
//  for i:=0 to DBGridEh1.FieldCount-1 do
//  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
//   begin
//    DBGridEh1.Columns[i].Visible:=true;
//    break;
//   end;
// end
// else begin
//  for i:=0 to DBGridEh1.FieldCount-1 do
//  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
//   begin
//    DBGridEh1.Columns[i].Visible:=false;
//    break;
//   end;
// end;
//end;

procedure TForm1.FormShow(Sender: TObject);
//var
////  i:integer;
//  item:TMenuItem;
begin
  FEdate:= getsystem_date(adoquery1,1);
  FSDate:= IncDay(FEdate,-3);
  IsIn := False;
  ADS58.Close;
  ADS58.CommandText:='SELECT     D58.rkey,D58.MRB_NO, dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0039.REJ_CODE, dbo.Data0039.REJECT_DESCRIPTION,  '+#13+
            '             rej_type=CASE dbo.Data0039.rej_type WHEN 0 THEN ''工厂报废''                                       '+#13+
            '                                                 WHEN 1 THEN ''供应商报废''                                     '+#13+
            '                                                 WHEN 2 THEN ''客户报废''                                       '+#13+
            '                                                 WHEN 3 THEN ''市场报废''                                       '+#13+
            '                                                 WHEN 4 THEN ''其它'' END,                                      '+#13+
            '             D58.QTY_REJECT, D58.WO_PTR,                                                                                   '+#13+
            '             dbo.Data0025.SAMPLE_NR, D58.PANELS, D58.TDATETIME, dbo.Data0005.EMPLOYEE_NAME, D58.AUDIT_DATETIME,  '+#13+
            '             d05.EMPLOYEE_NAME AS authempl_name, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.Data0025.MANU_PART_NUMBER,  '+#13+
            '             dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, '+#13+
            '             dbo.Data0025.set_qty, dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.unit_sq, D58.QTY_REJECT * dbo.Data0025.unit_sq AS rejsqft,  '+#13+
            '             ''顶层报废面积''=cast(D58.QTY_REJECT * dbo.Data0025.unit_sq/dbo.GetParentNum(data0025.rkey) as decimal(30,18))  , dbo.Data0025.TUSAGE, dbo.Data0034.cost_name,  '+#13+
            '             CASE WHEN data0006.PARTS_PER_PANEL > 0 THEN D58.QTY_REJECT * data0006.panel_ln * data0006.panel_wd * 0.000001 / data0006.PARTS_PER_PANEL '+#13+
            '             ELSE D58.QTY_REJECT * dbo.Data0025.unit_sq END AS rejsqft_db, Data0034_1.DEPT_CODE AS ReqDeptCode, dbo.Data0060.ORIG_CUSTOMER,   '+#13+
            '             Data0034_1.DEPT_NAME AS ReqDeptName, CASE D58.TTYPE WHEN 0 THEN ''生产报废'' WHEN 1 THEN ''盘点报废'' END AS TTYPE1, dbo.data0492.SO_NO,  '+#13+
            '             dbo.Data0097.PO_NUMBER, D58.REFERENCE, dbo.Data0015.ABBR_NAME AS abbr_name15, ISNULL(Data0034_2.DEPT_CODE, dbo.Data0034.DEPT_CODE)  '+#13+
            '             AS DEPT_CODE2, ISNULL(Data0034_2.DEPT_NAME, dbo.Data0034.DEPT_NAME) AS DEPT_NAME2,data0025.CPJS ,data0025.LAYERS  '+#13+
            '             , dbo.data0492.ISSUED_QTY,dbo.data0492.ORD_REQ_QTY, dbo.data0492.QTY_REJECT AS QTY_REJECT_1,0 as used_qty '+#13+
            '  FROM         dbo.Data0060 LEFT OUTER JOIN    '+#13+
            '                        dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY RIGHT OUTER JOIN     '+#13+
            '                        dbo.Data0058  D58 INNER JOIN          '+#13+
            '                        dbo.Data0006 ON D58.WO_PTR = dbo.Data0006.RKEY INNER JOIN         '+#13+
            '                        dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN              '+#13+
            '                        dbo.Data0039 ON D58.REJECT_PTR = dbo.Data0039.RKEY INNER JOIN                       '+#13+
            '                        dbo.Data0005 ON D58.EMPL_PTR = dbo.Data0005.RKEY INNER JOIN                          '+#13+
            '                        dbo.Data0034 ON D58.RESP_DEPT_PTR = dbo.Data0034.RKEY LEFT OUTER JOIN                    '+#13+
            '                        dbo.Data0034 AS Data0034_2 ON dbo.Data0034.BIG_DEPT_PTR = Data0034_2.RKEY INNER JOIN    '+#13+
            '                        dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN                    '+#13+
            '                        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN               '+#13+
            '                        dbo.Data0034 AS Data0034_1 ON D58.DEPT_PTR = Data0034_1.RKEY INNER JOIN                  '+#13+
            '                        dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY ON dbo.Data0060.SALES_ORDER = dbo.data0492.SO_NO LEFT OUTER JOIN    '+#13+
            '                        dbo.Data0005 AS d05 ON D58.AUDIT_EMPL_PTR = d05.RKEY INNER JOIN        '+#13+
            '                        dbo.Data0015 ON D58.warehouse_ptr = dbo.Data0015.RKEY      '+#13+
            '  WHERE D58.if_stock = 0 and  (D58.TDATETIME >='''+ formatdatetime('yyyy-mm-dd hh:nn:ss ',FSDate) +''') and        '+#13+
            '                     (D58.TDATETIME <= '''+ formatdatetime('yyyy-mm-dd hh:nn:ss ',FEdate) +''') and  (D58.TTYPE <> 2) ';
    ADS58.Open;

//  ADS58.Close;
//  ADS58.Parameters.ParamByName('tablename').Value:= 'Data0058';
//  ADS58.Parameters.ParamByName('dtpk1').Value:= FormatDateTime('YYYY-MM-DD HH:nn:ss',getsystem_date(adoquery1,1)-3);
//  ADS58.Parameters.ParamByName('dtpk2').Value:= FormatDateTime('YYYY-MM-DD HH:nn:ss',getsystem_date(adoquery1,0));
//  ADS58.Parameters.ParamByName('where').Value:= '';
//  ads58.Prepared;
//  ADS58.Open;
//  sql_text := ADS58.CommandText;
  PreColumn := DBGridEH1.Columns[0];
  
//  for i:=1 to DBGrideh1.Columns.Count do
//  begin
//    item := TmenuItem.Create(self) ;
//    item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
//    if dbgrideh1.Columns[i-1].Visible then
//      item.Checked := true ;
//    item.OnClick := item_click ;
//    self.PopupMenu1.Items.Add(item) ;
//  end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(self.ADS58.CommandText);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if dbgrideh1.DataSource.DataSet.IsEmpty then exit;
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
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
  dbgrideh1.DataSource.DataSet.DisableControls;
  dbgrideh1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrideh1.Columns.Count - 1 do
    if dbgrideh1.Columns.Items[iCount].Visible = true then
    begin
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrideh1.Columns[iCount].Title.Caption;
    end
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrideh1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrideh1.Columns.Count - 1 do
      if dbgrideh1.Columns[iCount].Visible = true then
      begin
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrideh1.Columns[iCount].Field.AsString;
      end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrideh1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:' + FormatDateTime('YYYY-MM-DD HH:mm:ss',FSDate);
  sheet.cells[3,1]:='到        :' + FormatDateTime('YYYY-MM-DD HH:mm:ss',FEdate);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh1.DataSource.DataSet.First;
  dbgrideh1.DataSource.DataSet.EnableControls;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  self.ADS58.Close;
  self.ADS58.Open;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ADS58.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   ADS58.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
   begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
   end
  else
   edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   ADs58.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else ADs58.filter := '';
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i:byte;
  LWhere,LQty:string;
  LSql,tablename:string;
  LField: TField;
begin
 with  form_condition do
 begin
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',FSDate));
  dtt1.Time := strtotime(formatdatetime('HH:nn:ss',FSDate));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',FEdate));
  dtt2.Time := strtotime(formatdatetime('HH:nn:ss',FEdate));
   if ShowModal=mrok then
   with ads58 do
   begin
     FSDate:= StrToDateTime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtt1.DateTime));
     FEDate:= StrToDateTime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtt2.DateTime));
     for i:=1 to form_condition.SGrid1.RowCount-2 do
       LWhere := LWhere + form_condition.SGrid1.Cells[2,i]+#13;
     if chk1.Checked then
     begin
       tablename:= 'Data0058IN' ;
       LQty := ',isnull(D58.used_qty,0) as used_qty';
       IsIn:= True;


       DBGridEh1.FieldColumns['used_qty'].Visible:= true;

     end
     else
     begin
       tablename:= 'Data0058';
       LQty := ',0 as used_qty';
       IsIn:= False;
       DBGridEh1.FieldColumns['used_qty'].Visible:= false;
     end;


//
//     Parameters.ParamValues['dtpk1']:=formatdatetime('yyyy-mm-dd ',dtpk1.Date)
//                                      +formatdatetime('hh:nn:ss',dtt1.DateTime);
//     Parameters.ParamValues['dtpk2']:=formatdatetime('yyyy-mm-dd ',dtpk2.Date)
//                                      +formatdatetime('hh:nn:ss',dtt2.DateTime);
//     Parameters.ParamValues['where']:= LWhere ;
//     Prepared;
//     ShowMessage(LWhere);
//     ShowMessage(Parameters.ParamValues['where']);
//     open;

      LSql:='SELECT    D58.rkey, D58.MRB_NO, dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0039.REJ_CODE, dbo.Data0039.REJECT_DESCRIPTION,  '+#13+
            '             rej_type=CASE dbo.Data0039.rej_type WHEN 0 THEN ''工厂报废''                                       '+#13+
            '                                                 WHEN 1 THEN ''供应商报废''                                     '+#13+
            '                                                 WHEN 2 THEN ''客户报废''                                       '+#13+
            '                                                 WHEN 3 THEN ''市场报废''                                       '+#13+
            '                                                 WHEN 4 THEN ''其它'' END,                                      '+#13+
            '             D58.QTY_REJECT, D58.WO_PTR,                                                                                   '+#13+
            '             dbo.Data0025.SAMPLE_NR, D58.PANELS, D58.TDATETIME, dbo.Data0005.EMPLOYEE_NAME, D58.AUDIT_DATETIME,  '+#13+
            '             d05.EMPLOYEE_NAME AS authempl_name, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.Data0025.MANU_PART_NUMBER,  '+#13+
            '             dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, '+#13+
            '             dbo.Data0025.set_qty, dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.unit_sq, D58.QTY_REJECT * dbo.Data0025.unit_sq AS rejsqft,  '+#13+
            '             ''顶层报废面积''=cast(D58.QTY_REJECT * dbo.Data0025.unit_sq/dbo.GetParentNum(data0025.rkey) as decimal(30,18))  , dbo.Data0025.TUSAGE, dbo.Data0034.cost_name,  '+#13+
            '             CASE WHEN data0006.PARTS_PER_PANEL > 0 THEN D58.QTY_REJECT * data0006.panel_ln * data0006.panel_wd * 0.000001 / data0006.PARTS_PER_PANEL '+#13+
            '             ELSE D58.QTY_REJECT * dbo.Data0025.unit_sq END AS rejsqft_db, Data0034_1.DEPT_CODE AS ReqDeptCode, dbo.Data0060.ORIG_CUSTOMER,   '+#13+
            '             Data0034_1.DEPT_NAME AS ReqDeptName, CASE D58.TTYPE WHEN 0 THEN ''生产报废'' WHEN 1 THEN ''盘点报废'' END AS TTYPE1, dbo.data0492.SO_NO,  '+#13+
            '             dbo.Data0097.PO_NUMBER, D58.REFERENCE, dbo.Data0015.ABBR_NAME AS abbr_name15, ISNULL(Data0034_2.DEPT_CODE, dbo.Data0034.DEPT_CODE)  '+#13+
            '             AS DEPT_CODE2, ISNULL(Data0034_2.DEPT_NAME, dbo.Data0034.DEPT_NAME) AS DEPT_NAME2,data0025.CPJS ,data0025.LAYERS  '+#13+
             '             , dbo.data0492.ISSUED_QTY,dbo.data0492.ORD_REQ_QTY, dbo.data0492.QTY_REJECT AS QTY_REJECT_1 ' + LQty+#13+
            '  FROM         dbo.Data0060 LEFT OUTER JOIN    '+#13+
            '                        dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY RIGHT OUTER JOIN     '+#13+
            '                        ' + Tablename +'  D58 INNER JOIN          '+#13+
            '                        dbo.Data0006 ON D58.WO_PTR = dbo.Data0006.RKEY INNER JOIN         '+#13+
            '                        dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN              '+#13+
            '                        dbo.Data0039 ON D58.REJECT_PTR = dbo.Data0039.RKEY INNER JOIN                       '+#13+
            '                        dbo.Data0005 ON D58.EMPL_PTR = dbo.Data0005.RKEY INNER JOIN                          '+#13+
            '                        dbo.Data0034 ON D58.RESP_DEPT_PTR = dbo.Data0034.RKEY LEFT OUTER JOIN                    '+#13+
            '                        dbo.Data0034 AS Data0034_2 ON dbo.Data0034.BIG_DEPT_PTR = Data0034_2.RKEY INNER JOIN    '+#13+
            '                        dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN                    '+#13+
            '                        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN               '+#13+
            '                        dbo.Data0034 AS Data0034_1 ON D58.DEPT_PTR = Data0034_1.RKEY INNER JOIN                  '+#13+
            '                        dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY ON dbo.Data0060.SALES_ORDER = dbo.data0492.SO_NO LEFT OUTER JOIN    '+#13+
            '                        dbo.Data0005 AS d05 ON D58.AUDIT_EMPL_PTR = d05.RKEY INNER JOIN        '+#13+
            '                        dbo.Data0015 ON D58.warehouse_ptr = dbo.Data0015.RKEY      '+#13+
            '  WHERE D58.if_stock = 0 and  (D58.TDATETIME >='''+  formatdatetime('yyyy-mm-dd ',dtpk1.Date) + formatdatetime('hh:nn:ss',dtt1.DateTime)  +''') and        '+#13+
            '                     (D58.TDATETIME <= '''+ formatdatetime('yyyy-mm-dd ',dtpk2.Date) + formatdatetime('hh:nn:ss',dtt2.DateTime)  +''') and     '+#13+
            '                     (D58.TTYPE <> 2) ' + LWhere;
      close;
      CommandText:= LSql;
      open;

   end;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select Rkey from data0419 where programe=''A_WZCX58.exe''';
    Open;
    if not IsEmpty then
     rkey419:= FieldByName('rkey').Value
    else
     begin
      ShowMessage('不存在'''+ form1.Caption +'''这个程序');
      Exit;
     end;
  end;
  Self.showField;
  DBGridEh1.FieldColumns['used_qty'].Visible:= False;
end;

procedure TForm1.showField;
var
  i,bool,addInt:Integer;
  addField:Boolean;
  TmpQuery:TADOQuery;
begin
  TmpQuery:= TADOQuery.Create(nil);
  try
    TmpQuery.Connection:= ADOConnection1;
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay '+
                ' from data0849 where D419_ptr= '+ IntToStr(rkey419) +' and D073_ptr= ' + rkey73;
      Open;
      if not IsEmpty then
      begin
        if ADOQuery1.RecordCount >= DBGridEh1.Columns.Count then           //没有增加字段，按数据库的数据调整排序，可见以及宽度
        begin
          Sort:='FieldOrder';
          First;
          while not Eof do
          begin
            loadField(ADOQuery1,DBGridEh1);       //加载字段
            Next;
          end;
        end
        else
        begin                                                  //增加了字段，把新加的字段加入数据库中
          addInt:= DBGridEh1.Columns.Count- ADOQuery1.RecordCount;     //存增加了多少个字段
          addField:=True;
          for i:=0 to DBGridEh1.Columns.Count-1 do
          begin
            First;
            while not Eof do
            begin
              if DBGridEh1.Columns[i].FieldName=FieldByName('FieldName').Value then
              begin
                addField:=False;
                Break;
              end;
              addField:=True;
              Next;
            end;
            if addField then
            begin
              if DBGridEh1.Columns[i].Visible then bool:=1
              else bool:=0;
              with TmpQuery do
              begin
                Close;
                SQL.Clear;
                SQL.Text:= SQL.Text+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                                      'values('+IntToStr(rkey419)+','+ rkey73+','+ QuotedStr(DBGridEh1.Columns[i].FieldName)+','+
                                      QuotedStr(DBGridEh1.Columns[i].Title.Caption)+','+ IntToStr(DBGridEh1.Columns.Count - addInt)+','+
                                      IntToStr(DBGridEh1.Columns[i].Width)+','+ IntToStr(bool)+ ',''frmMain'',''dbMain'')'+#13;
                ExecSQL;
              end;
              addInt:=addInt - 1;
              if addInt = 0 then Break;
            end;
          end;
          First;
          while not Eof do
          begin
            loadField(ADOQuery1,DBGridEh1);          //加载字段
            Next;
          end;
        end;
      end
      else
      begin
        Self.coltodb;                         //如果当前使用人员当前程序在849表没找到，则新增
      end;
    end;
  finally
    TmpQuery.Free;
  end
end;

procedure TForm1.loadField(tmp: TADOQuery; DbGrid: TDBGridEh);
var
  i:Integer;
begin
  with tmp do
  begin
    for i:=0 to DbGrid.Columns.Count-1 do
    begin
      if (FieldByName('FieldName').Value=DbGrid.Columns[i].FieldName) then
      begin
        if (FieldByName('IsDisplay').Value <> DbGrid.Columns[i].Visible) or (FieldByName('FieldWidth').Value <> DbGrid.Columns[i].Width) then
        begin
          DbGrid.Columns[i].Visible:= FieldByName('IsDisplay').Value;
          DbGrid.Columns[i].Width:= FieldByName('FieldWidth').Value;
        end;
        DbGrid.Columns[i].Index:= FieldByName('FieldOrder').Value ;
        Break;
      end;
    end;
  end;
end;

procedure TForm1.coltodb;
var
  i,bool:Integer;
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='delete from data0849 where D419_ptr='+ IntToStr(rkey419) +' and D073_ptr='+rkey73;
    ExecSQL;
  end;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    for i:=0 to DBGridEh1.Columns.Count-1 do
    begin
      if DBGridEh1.Columns[i].Visible then bool:=1
      else bool:=0;
      SQL.Text:= SQL.Text+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                            'values('+IntToStr(rkey419)+','+ rkey73+','+ QuotedStr(DBGridEh1.Columns[i].FieldName)+','+
                            QuotedStr(DBGridEh1.Columns[i].Title.Caption)+','+ IntToStr(DBGridEh1.Columns[i].Index)+','+
                            IntToStr(DBGridEh1.Columns[i].Width)+','+ IntToStr(bool)+ ',''frmMain'',''dbMain'')'+#13;

    end;
//    ShowMessage(SQL.Text);
    ExecSQL;
  end;

end;



procedure TForm1.DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i,tmp:Integer;
begin
  if MessageDlg('列顺序已经改变，是否保存排序？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FromIndex>ToIndex then
    begin
      tmp:=FromIndex;
      FromIndex:=ToIndex;
      ToIndex:=tmp;
    end;
    for i:= FromIndex to ToIndex do
    begin
      with ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0849 set fieldorder='+ IntToStr(i)+' where D419_ptr='+ IntToStr(rkey419) +' and D073_ptr='+rkey73 + ' and fieldname=' + QuotedStr(DBGridEh1.Columns[i].FieldName);
        ExecSQL;
      end;
    end;
  end;

end;

procedure TForm1.N1Click(Sender: TObject);
var
  LFrm: TfrmIN;
begin
  Lfrm:= TfrmIN.Create(Application);
  try
    LFrm.adsIN.Close;
    LFrm.adsIN.Parameters[0].Value:= ADS58WO_PTR.Value;
    LFrm.adsIN.Open;

    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.pmINPopup(Sender: TObject);
begin
  N1.Visible:= (ADS58.RecordCount >0) and (IsIn = False) ;
  N2.Visible:= (ADS58.RecordCount >0) and (IsIn = True) ;
end;
procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
  begin
      if Self.ADS58QTY_REJECT_1.Value > (Self.ADS58ISSUED_QTY.Value- Self.ADS58ORD_REQ_QTY.Value) then
       DBGridEh1.Canvas.Font.Color := clfuchsia
      else if Self.ADS58QTY_REJECT_1.Value > (Self.ADS58ISSUED_QTY.Value- Self.ADS58ORD_REQ_QTY.Value)*0.5 then
        begin
         DBGridEh1.Canvas.Font.Color :=clRed ;
        end;
       DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
procedure TForm1.N2Click(Sender: TObject);
begin
  if MessageDlg('确定删除此内层预报废吗？', mtConfirmation,[mbYes,mbNo],0) = mryes then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='delete from Data0058IN where rkey = ' + ADS58rkey.AsString;
      ExecSQL;
    end;
    BitBtn3Click(nil);
  end;
end;

end.
