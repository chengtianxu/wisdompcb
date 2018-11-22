unit Unit_wip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Spin, ImgList, ToolWin,
  TeeProcs, TeEngine, Chart, DBGridEh, Grids, DBGrids, Series, DB, TeeFunci,
  Excel2000, OleServer,ClipBrd, ExcelXP,ComObj, Menus;

type
  TForm_wip = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    BitBtn8: TBitBtn;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGridEh2: TDBGridEh;
    Chart1: TChart;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SpinEdit1: TSpinEdit;
    Series1: TBarSeries;
    TeeFunction1: TAverageTeeFunction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    eh1: TDBGridEh;
    DataS448: TDataSource;
    DataS448a: TDataSource;
    DataS448b: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    n2: TMenuItem;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure n2Click(Sender: TObject);
  private
    { Private declarations }
    precolumn1,precolumn2,precolumn3:Tcolumneh;
  public
    FD444rkey: string;
    v_tdate:TDateTime;
    { Public declarations }
  end;

var
  Form_wip: TForm_wip;

implementation
uses damo,main, Unit_report0,unit_progress,Unit_lot, common, unit_changepcs;

{$R *.dfm}

procedure TForm_wip.SpeedButton1Click(Sender: TObject);
begin
 self.close;
end;

procedure TForm_wip.SpinEdit1Change(Sender: TObject);
begin
 self.Chart1.MaxPointsPerPage:=strtoint(spinedit1.Text);
end;

procedure TForm_wip.ToolButton4Click(Sender: TObject);
begin
 chart1.NextPage;
end;

procedure TForm_wip.ToolButton3Click(Sender: TObject);
begin
 chart1.PreviousPage;
end;

procedure TForm_wip.PageControl2Change(Sender: TObject);
begin
 self.Series1.Clear;
 dm.ADOD448b.First;
 while not dm.ADOD448b.Eof do
 begin
  form_wip.Series1.Add(dm.ADOD448btotal_cost.Value,dm.ADOD448bprod_code.Value);
  dm.ADOD448b.Next;
 end;
end;

procedure TForm_wip.DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
   if (dm.ADOD448asales_amount.Value)<=0 then
   begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color:=clred;
   end;
end;

procedure TForm_wip.DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
   if (dm.ADOD448bsales_amount.Value)<=0 then
   begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color:=clred;
   end;
end;

procedure TForm_wip.BitBtn8Click(Sender: TObject);
begin
 try
  form_report0:=Tform_report0.Create(application);
  form_report0.QRLabel1.Caption:='五洲电路板有限公司';
  form_report0.vdate.Caption:=dm.ADOQ444.fieldbyname('cut_date').asstring;
  form_report0.QuickRep1.Preview;
 finally
  form_report0.Free;
 end;
end;

procedure TForm_wip.SpeedButton4Click(Sender: TObject);
var
  //eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  XLApp: Variant;
  aSheet : Variant;
  vleng:integer;
  
  vstr:string;
  iCount, jCount, v_cloumn: Integer;
  Sheet: Variant;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  {eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;}

   if pagecontrol1.ActivePageIndex=0 then
 begin
  if eh1.DataSource.DataSet.IsEmpty then exit;
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := tabsheet1.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[tabsheet1.Caption];
  eh1.DataSource.DataSet.DisableControls;
  eh1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to eh1.Columns.Count - 1 do
    if eh1.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        eh1.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not eh1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to eh1.Columns.Count - 1 do
      if eh1.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          eh1.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    eh1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet1.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  sheet.cells[3,1]:='导出时间:'+t;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  eh1.DataSource.DataSet.First;
  eh1.DataSource.DataSet.EnableControls;
 end;

   if pagecontrol1.ActivePageIndex=1 then
 begin
  if DBGridEh1.DataSource.DataSet.IsEmpty then exit;
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := tabsheet2.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[tabsheet2.Caption];
  DBGridEh1.DataSource.DataSet.DisableControls;
  DBGridEh1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to DBGridEh1.Columns.Count - 1 do
    if DBGridEh1.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        DBGridEh1.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not DBGridEh1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to DBGridEh1.Columns.Count - 1 do
      if DBGridEh1.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          DBGridEh1.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    DBGridEh1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet2.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  sheet.cells[3,1]:='导出时间:'+t;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  DBGridEh1.DataSource.DataSet.First;
  DBGridEh1.DataSource.DataSet.EnableControls;
 end;


  if pagecontrol1.ActivePageIndex=2 then
 begin
  if DBGridEh2.DataSource.DataSet.IsEmpty then exit;
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := tabsheet3.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[tabsheet3.Caption];
  DBGridEh2.DataSource.DataSet.DisableControls;
  DBGridEh2.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to DBGridEh2.Columns.Count - 1 do
    if DBGridEh2.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        DBGridEh2.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not DBGridEh2.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to DBGridEh2.Columns.Count - 1 do
      if DBGridEh2.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          DBGridEh2.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    DBGridEh2.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet3.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  sheet.cells[3,1]:='导出时间:'+t;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  DBGridEh2.DataSource.DataSet.First;
  DBGridEh2.DataSource.DataSet.EnableControls;
 end;











 { if not VarIsEmpty(XLApp) then
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

  XLApp.SheetsInNewWorkbook := 3;
  XLApp.WorkBooks.Add;

  Application.CreateForm(TForm_Progress, Form_Progress);
 // eaapps1.Workbooks.Add(xlWBATWorksheet,0);
 // eaapps1.worksheets.Add(null,null,2,null,0);
  Form_Progress.show;

  //---------------//第一页
  Form_Progress.Label1.Caption :='正在生成明细数据表';
  Form_Progress.Label1.refresh;
//  aSheet:=eaapps1.Worksheets[1];
  XLApp.WorkBooks[1].WorkSheets[1].Name := PageControl1.Pages[0].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[1];

  eh1.DataSource.DataSet.DisableControls;
  s:=#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to eh1.Columns.Count-1 do
      s:=s+eh1.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    eh1.DataSource.DataSet.First;
    while not eh1.DataSource.DataSet.Eof do
      begin
        s:=inttostr(eh1.DataSource.DataSet.RecNo)+#9;
        for y:=0 to eh1.Columns.Count-1 do
          begin
            s1:=eh1.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        eh1.DataSource.DataSet.Next;
        if eh1.DataSource.DataSet.RecordCount div 100>0 then //进度条
          Form_Progress.ProgressBar1.Position:=eh1.DataSource.DataSet.RecNo
            div (eh1.DataSource.DataSet.RecordCount div 100)
        else Form_Progress.ProgressBar1.Position:=100;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
  //  eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if eh1.Columns.Count<=26
    then vstr:=chr(eh1.Columns.Count+97)
  else begin
    vstr:=chr(strtoint(floattostr(int(eh1.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(eh1.Columns.Count-26*int(eh1.Columns.Count/26)+96)));
  end;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='在制品存货(明细)报告';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(eh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='明细报告';

  //--------------------//第二页
  Form_Progress.Label1.Caption :='正在汇总数据表(2)';
  Form_Progress.Label1.refresh;
  XLApp.WorkBooks[1].WorkSheets[2].Name := PageControl1.Pages[1].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[2];
 // aSheet:=eaapps1.Worksheets[2];
  dbgrideh1.DataSource.DataSet.DisableControls;
  s:=#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DbgridEh1.Columns.Count-1 do
      s:=s+DbgridEh1.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DbgridEh1.DataSource.DataSet.First;
    while not DbgridEh1.DataSource.DataSet.Eof do
      begin
        s:=inttostr(Dbgrideh1.DataSource.DataSet.RecNo)+#9;
        for y:=0 to Dbgrideh1.Columns.Count-1 do
          begin
            s1:=DbgridEh1.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DbgridEh1.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
//    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if dbgrideh1.Columns.Count<=26
    then vstr:=chr(dbgrideh1.Columns.Count+97)
  else begin
    vstr:=chr(strtoint(floattostr(int(dbgrideh1.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(dbgrideh1.Columns.Count-26*int(dbgrideh1.Columns.Count/26)+96)));
  end;

 // eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='按产品汇总分析';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgridEh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='按产品汇总分析';

  //------------//第三页
  Form_Progress.Label1.Caption :='正在汇总数据表(3)';
  Form_Progress.Label1.refresh;
  XLApp.WorkBooks[1].WorkSheets[3].Name := PageControl1.Pages[2].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[3];
  //  aSheet:=eaapps1.Worksheets[3];
  dbgrideh2.DataSource.DataSet.DisableControls;
  s:=#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DbgridEh2.Columns.Count-1 do
      s:=s+DbgridEh2.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DbgridEh2.DataSource.DataSet.First;
    while not DbgridEh2.DataSource.DataSet.Eof do
      begin
        s:=inttostr(Dbgrideh2.DataSource.DataSet.RecNo)+#9;
        for y:=0 to Dbgrideh2.Columns.Count-1 do
          begin
            s1:=DbgridEh2.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          vleng:=trunc(500*(dbgrideh2.DataSource.DataSet.RecNo/dbgrideh2.DataSource.DataSet.RecordCount));
          form_progress.ProgressBar1.Position:=vleng;
          end;
        tsList.Add(s);
        DbgridEh2.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
  //  eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DbgridEh2.Columns.Count<=26  then
    vstr:=chr(DbgridEh2.Columns.Count+97)
  else
    vstr:=chr(strtoint(floattostr(int(DbgridEh2.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(DbgridEh2.Columns.Count-26*int(DbgridEh2.Columns.Count/26)+96)));

//  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='按类别汇总分析';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='按类别汇总分析';
//  eaapps1.Visible[0]:=true;         // display Excel files
  XlApp.Visible := True;
  Form_Progress.free;

  eh1.DataSource.DataSet.EnableControls;
  dbgrideh1.DataSource.DataSet.EnableControls;
  dbgrideh2.DataSource.DataSet.EnableControls; }
end;

procedure TForm_wip.ToolButton2Click(Sender: TObject);
begin
 if messagedlg('确定要打印吗？',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   chart1.Print;
   Messagedlg('打印完毕！',mtinformation,[mbOk],0);
  end;
end;

procedure TForm_wip.N1Click(Sender: TObject);
begin
 try
  Form_lot:=tForm_lot.Create(application);
  Form_lot.vttype1:=0;
  Form_lot.ADO410_16.close;

   Form_lot.ADO410_16.CommandText:=Form_lot.ADO410_16.CommandText+
   ' and data0451.ACTUAL_FM_DATE<'+
   QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',v_tdate));

  Form_lot.ADO410_16.Parameters.ParamByName('rkey06').Value:=dm.ADOD448wo_ptr.Value;

  Form_lot.ADO410_16.Open;
  Form_lot.ShowModal;
 finally
  Form_lot.ADO410_16.close;
  Form_lot.Free;
 end;
end;

procedure TForm_wip.eh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adod448.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adod448.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn1.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn1.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn1:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm_wip.FormCreate(Sender: TObject);
begin
  precolumn1:=eh1.Columns[0];
  precolumn2:=dbgrideh1.Columns[0];
  precolumn3:=dbgrideh2.Columns[0];
end;

procedure TForm_wip.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
   case pagecontrol1.ActivePageIndex of
    0:dm.adod448.Filter:=precolumn1.FieldName+' like ''%'+trim(edit1.text)+'%''';
    1:dm.adod448a.Filter:=precolumn2.FieldName+' like ''%'+trim(edit1.text)+'%''';
    2:dm.adod448b.Filter:=precolumn3.FieldName+' like ''%'+trim(edit1.text)+'%''';
   end
  else
   case pagecontrol1.ActivePageIndex of
    0:dm.adod448.Filter:='';
    1:dm.adod448a.Filter:='';
    2:dm.adod448b.Filter:='';
   end;
end;

procedure TForm_wip.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adod448a.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adod448a.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn2.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn2.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn2:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm_wip.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adod448b.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adod448b.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn3.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn3.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn3:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm_wip.PageControl1Change(Sender: TObject);
begin
  edit1.Text:='';
  case pagecontrol1.ActivePageIndex of
   0:label1.Caption:='搜索：'+precolumn1.Title.Caption;
   1:label1.Caption:='搜索：'+precolumn2.Title.Caption;
   2:label1.Caption:='搜索：'+precolumn3.Title.Caption;
  end;
end;

procedure TForm_wip.PopupMenu1Popup(Sender: TObject);
begin
  with dm.tmp do
  begin
   close;
   sql.Text:='select CLOSED from data0444 where rkey = ' + FD444rkey;
   Open;
  end;
  n2.Enabled := (vprev = '4') and (dm.tmp.FieldByName('CLOSED').AsString = 'Y')
end;

procedure TForm_wip.n2Click(Sender: TObject);
var
  LFrm: TfrmChangePcsPrice;
begin
  LFrm := TfrmChangePcsPrice.Create(Self);
  try
    LFrm.FD444rkey := FD444rkey;
    LFrm.edt1.Text := dm.ADOD448.fieldbyname('std_matl_cost_per_pcs').AsString;
    LFrm.edt2.Text := dm.ADOD448.fieldbyname('std_ovhd_cost_per_pcs').AsString;
    LFrm.FType := 'WIP';
    if LFrm.ShowModal = mrok then
    begin
      dm.tmp.Close;
      dm.tmp.SQL.Text := 'select MATL_CST_IN_WIP_CLOSED,OVHD_CST_IN_WIP_CLOSED,OVHD_CST_IN_SFG_CLOSED,MATL_CST_IN_SFG_CLOSED from data0444 where rkey = ' + fd444rkey;
      dm.tmp.Open;
      Edit2.Text := dm.tmp.fieldbyname('MATL_CST_IN_WIP_CLOSED').AsString;
      Edit3.Text := dm.tmp.fieldbyname('OVHD_CST_IN_WIP_CLOSED').AsString;
      Edit4.Text := dm.tmp.fieldbyname('OVHD_CST_IN_SFG_CLOSED').AsString;
      Edit5.Text := dm.tmp.fieldbyname('MATL_CST_IN_SFG_CLOSED').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
