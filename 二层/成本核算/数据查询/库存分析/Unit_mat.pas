unit Unit_mat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine,
  Chart, Spin, ToolWin, Grids, DBGridEh, ImgList, Series,ClipBrd,
  OleServer, Excel2000, ExcelXP,ComObj;

type
  TForm_mat = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn8: TBitBtn;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SpinEdit1: TSpinEdit;
    Chart1: TChart;
    Series1: TBarSeries;
    ImageList1: TImageList;
    DBGridEh3: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh3TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    precolumn1,precolumn2,precolumn3:Tcolumneh;
  public
    { Public declarations }
  end;

  PreTitle=record
    ColIndex:Integer;
  end;

var
  Form_mat: TForm_mat;

implementation

uses damo, Unit_report3, Unit_progress,main,common;
{$R *.dfm}

procedure TForm_mat.SpeedButton1Click(Sender: TObject);
begin
   SELF.Close;
end;

procedure TForm_mat.BitBtn8Click(Sender: TObject);
begin
 try
  form_report3:=tform_report3.Create(application);
  form_report3.QRLabel1.Caption:='五洲电路板有限公司';
  form_report3.vdate.Caption:=dm.ADOQ444.fieldbyname('cut_date').asstring;
  form_report3.QuickRep1.Preview;
 finally
  form_report3.Free;
 end;
end;

procedure TForm_mat.ToolButton4Click(Sender: TObject);
begin
 chart1.NextPage;
end;

procedure TForm_mat.ToolButton3Click(Sender: TObject);
begin
  chart1.PreviousPage;
end;

procedure TForm_mat.SpinEdit1Change(Sender: TObject);
begin
  chart1.MaxPointsPerPage:=strtoint(spinedit1.Text);
end;

procedure TForm_mat.ToolButton1Click(Sender: TObject);
begin
  if messagedlg('确定要打印吗？',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   chart1.Print;
   Messagedlg('打印完毕！',mtinformation,[mbOk],0);
  end;
end;

procedure TForm_mat.PageControl2Change(Sender: TObject);
begin
 self.Series1.Clear;
 dm.ADOD445.First;
 while not dm.ADOD445.Eof do
 begin
  Series1.Add(dm.ADOD445amount.Value,dm.ADOD445group_name.Value);
  dm.ADOD445.Next;
 end;
end;

procedure TForm_mat.SpeedButton4Click(Sender: TObject);
var
 // eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  XLApp: Variant;
  Sheet : Variant;
  vleng:integer;
  vstr:string;

  iCount, jCount, v_cloumn: Integer;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
 { eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  }

   if pagecontrol1.ActivePageIndex=0 then
 begin
  if DBGrid1.DataSource.DataSet.IsEmpty then exit;
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
  DBGrid1.DataSource.DataSet.DisableControls;
  DBGrid1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        DBGrid1.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          DBGrid1.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    DBGrid1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet1.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;//form1.SGrid1.Cells[1,form1.sgrid1.row];
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  sheet.cells[3,1]:='导出时间:'+t;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  DBGrid1.DataSource.DataSet.First;
  DBGrid1.DataSource.DataSet.EnableControls;
 end;



 if pagecontrol1.ActivePageIndex=1 then
 begin
  if DBGridEh3.DataSource.DataSet.IsEmpty then exit;
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
  DBGridEh3.DataSource.DataSet.DisableControls;
  DBGridEh3.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to DBGridEh3.Columns.Count - 1 do
    if DBGridEh3.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        DBGridEh3.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not DBGridEh3.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to DBGridEh3.Columns.Count - 1 do
      if DBGridEh3.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          DBGridEh3.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    DBGridEh3.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet2.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;//form1.SGrid1.Cells[1,form1.sgrid1.row];
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  sheet.cells[3,1]:='导出时间:'+t;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  DBGridEh3.DataSource.DataSet.First;
  DBGridEh3.DataSource.DataSet.EnableControls;
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
  sheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;//form1.SGrid1.Cells[1,form1.sgrid1.row];
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  sheet.cells[3,1]:='导出时间:'+t;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  DBGridEh2.DataSource.DataSet.First;
  DBGridEh2.DataSource.DataSet.EnableControls;
 end;



 {
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

  XLApp.SheetsInNewWorkbook := 3;
  XLApp.WorkBooks.Add;

  Application.CreateForm(TForm_Progress, Form_Progress);

 // eaapps1.Workbooks.Add(xlWBATWorksheet,0);
//  eaapps1.worksheets.Add(null,null,2,null,0);

  Form_Progress.show;
  //--------------//第一页
  Form_Progress.Label1.Caption :='正在生成明细数据表';
  Form_Progress.Label1.refresh;

  XLApp.WorkBooks[1].WorkSheets[1].Name := PageControl1.Pages[0].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[1];
//  aSheet:=eaapps1.Worksheets[1];
  dbgrid1.DataSource.DataSet.DisableControls;
  s:=#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to Dbgrid1.Columns.Count-1 do
      s:=s+Dbgrid1.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    Dbgrid1.DataSource.DataSet.First;
    while not Dbgrid1.DataSource.DataSet.Eof do
    begin
     s:=inttostr(Dbgrid1.DataSource.DataSet.RecNo)+#9;
     for y:=0 to Dbgrid1.Columns.Count-1 do
     begin
      s1:=Dbgrid1.Columns.Items[y].Field.text;
      s:=s+s1+#9;
     end;
     tsList.Add(s);
     Dbgrid1.DataSource.DataSet.Next;
         
     if Dbgrid1.DataSource.DataSet.RecordCount div 100>0 then //进度条
      Form_Progress.ProgressBar1.Position:=Dbgrid1.DataSource.DataSet.RecNo
        div (Dbgrid1.DataSource.DataSet.RecordCount div 100)
     else
      Form_Progress.ProgressBar1.Position:=100;
    end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
   // eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if dbgrid1.Columns.Count<=26
    then vstr:=chr(dbgrid1.Columns.Count+97)  //得出相应的ascii码的字符
  else begin
    vstr:=chr(strtoint(floattostr(int(dbgrid1.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(dbgrid1.Columns.Count-26*int(dbgrid1.Columns.Count/26)+96)));
  end;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='在库存存货(明细)报告';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;//form1.SGrid1.Cells[1,form1.sgrid1.row];
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgrid1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='库存存货明细报告';

  //---------------//第二页
  Form_Progress.Label1.Caption :='正在汇总数据表(2)';
  Form_Progress.Label1.refresh;

  XLApp.WorkBooks[1].WorkSheets[2].Name := PageControl1.Pages[1].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[2];

  //aSheet:=eaapps1.Worksheets[2];
  dbgrideh3.DataSource.DataSet.DisableControls;
  s:=#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DbgridEh3.Columns.Count-1 do
      s:=s+DbgridEh3.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DbgridEh3.DataSource.DataSet.First;
    while not DbgridEh3.DataSource.DataSet.Eof do
      begin
        s:=inttostr(Dbgrideh3.DataSource.DataSet.RecNo)+#9;
        for y:=0 to Dbgrideh3.Columns.Count-1 do
          begin
            s1:=DbgridEh3.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DbgridEh3.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
   // eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if dbgrideh3.Columns.Count<=26
    then vstr:=chr(dbgrideh3.Columns.Count+97)
  else
   begin
    vstr:=chr(strtoint(floattostr(int(dbgrideh3.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(dbgrideh3.Columns.Count-26*int(dbgrideh3.Columns.Count/26)+96)));
   end;

//  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='按材料项目汇总分析';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;//form1.SGrid1.Cells[1,form1.sgrid1.row];
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgridEh3.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
 // asheet.Name :='按材料项目汇总分析';

  //---------------------//第三页
  Form_Progress.Label1.Caption :='正在汇总数据表(3)';
  Form_Progress.Label1.refresh;
//aSheet:=eaapps1.Worksheets[3];

  XLApp.WorkBooks[1].WorkSheets[3].Name := PageControl1.Pages[2].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[3];

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
   // eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DbgridEh2.Columns.Count<=26
    then vstr:=chr(DbgridEh2.Columns.Count+97)
  else
   begin
    vstr:=chr(strtoint(floattostr(int(DbgridEh2.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(DbgridEh2.Columns.Count-26*int(DbgridEh2.Columns.Count/26)+96)));
   end;

 // eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='按类别汇总分析';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;//form1.SGrid1.Cells[1,form1.sgrid1.row];
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='按类别汇总分析';

 // eaapps1.Visible[0]:=true;         // display Excel files
   XlApp.Visible := True;
  Form_Progress.free;

  dbgrid1.DataSource.DataSet.EnableControls;
  dbgrideh3.DataSource.DataSet.EnableControls;
  dbgrideh2.DataSource.DataSet.EnableControls;     }
end;

procedure TForm_mat.DBGrid1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adoQ445.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adoQ445.IndexFieldNames:=column.FieldName;
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

procedure TForm_mat.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
   case pagecontrol1.ActivePageIndex of
    0:dm.adoQ445.Filter:=precolumn1.FieldName+' like ''%'+trim(edit1.text)+'%''';
    1:dm.adoS445.Filter:=precolumn2.FieldName+' like ''%'+trim(edit1.text)+'%''';
    2:dm.adoD445.Filter:=precolumn3.FieldName+' like ''%'+trim(edit1.text)+'%''';
   end
  else
   case pagecontrol1.ActivePageIndex of
    0:dm.adoQ445.Filter:='';
    1:dm.adoS445.Filter:='';
    2:dm.adoD445.Filter:='';
   end;
end;

procedure TForm_mat.DBGridEh3TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adoS445.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adoS445.IndexFieldNames:=column.FieldName;
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

procedure TForm_mat.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adoD445.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adoD445.IndexFieldNames:=column.FieldName;
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

procedure TForm_mat.FormCreate(Sender: TObject);
begin
  precolumn1:=dbgrid1.Columns[0];
  precolumn2:=dbgrideh3.Columns[0];
  precolumn3:=dbgrideh2.Columns[0];
end;

procedure TForm_mat.PageControl1Change(Sender: TObject);
begin
  edit1.Text:='';
  case pagecontrol1.ActivePageIndex of
   0:label1.Caption:='搜索：'+precolumn1.Title.Caption;
   1:label1.Caption:='搜索：'+precolumn2.Title.Caption;
   2:label1.Caption:='搜索：'+precolumn3.Title.Caption;
  end;
end;

end.
