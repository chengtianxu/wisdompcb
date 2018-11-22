unit Unit_online;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, StdCtrls, Spin, ComCtrls,
  ToolWin, Grids, DBGridEh, Buttons, ExtCtrls, DB, ImgList,ClipBrd,
  OleServer, Excel2000, ExcelXP,ComObj;

type
  TForm_online = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn8: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGridEh;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    DBGridEh2: TDBGridEh;
    TabSheet5: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SpinEdit1: TSpinEdit;
    Chart1: TChart;
    Series1: TBarSeries;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ImageList1: TImageList;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    precolumn1,precolumn2,precolumn3:Tcolumneh;
  public
    { Public declarations }
  end;

var
  Form_online: TForm_online;

implementation

uses damo,unit_report4, Unit_progress;
{$R *.dfm}

procedure TForm_online.SpeedButton1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TForm_online.BitBtn8Click(Sender: TObject);
begin
  try
  form_report4:=tform_report4.Create(application);
  form_report4.QRLabel1.Caption:='五洲电路板有限公司';
  form_report4.vdate.Caption:=dm.ADOQ444.fieldbyname('cut_date').asstring;
  form_report4.QuickRep1.Preview;
 finally
  form_report4.Free;
 end;
end;

procedure TForm_online.ToolButton3Click(Sender: TObject);
begin
 chart1.PreviousPage;
end;

procedure TForm_online.ToolButton4Click(Sender: TObject);
begin
 chart1.NextPage;
end;

procedure TForm_online.SpinEdit1Change(Sender: TObject);
begin
 chart1.MaxPointsPerPage:=strtoint(spinedit1.Text);
end;

procedure TForm_online.ToolButton1Click(Sender: TObject);
begin
   if messagedlg('确定要打印吗？',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   chart1.Print;
   Messagedlg('打印完毕！',mtinformation,[mbOk],0);
  end;
end;

procedure TForm_online.PageControl2Change(Sender: TObject);
begin
 self.Series1.Clear;
 dm.ADOD462b.First;
 while not dm.ADOD462b.Eof do
 begin
 Series1.Add(dm.ADOD462bamount.Value,dm.ADOD462bdept_code.Value);
 dm.ADOD462b.Next;
 end;
end;

procedure TForm_online.SpeedButton4Click(Sender: TObject);
var
//  eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  XLApp: Variant;
  aSheet : Variant;
  vleng:integer; //j,
  vstr:string;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then
   exit;
{  eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  eaapps1.worksheets.Add(null,null,2,null,0);
}
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
  Form_Progress.show;
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
      else Form_Progress.ProgressBar1.Position:=100;
    end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
//    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if dbgrid1.Columns.Count<=26
    then vstr:=chr(dbgrid1.Columns.Count+97)
  else begin
    vstr:=chr(strtoint(floattostr(int(dbgrid1.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(dbgrid1.Columns.Count-26*int(dbgrid1.Columns.Count/26)+96)));
  end;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='在线产品存货(明细)报告';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgrid1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='明细报告';

//------------//第二页
  Form_Progress.Label1.Caption :='正在汇总数据表(2)';
  Form_Progress.Label1.refresh;
  XLApp.WorkBooks[1].WorkSheets[2].Name := PageControl1.Pages[1].Caption;
  aSheet := XLApp.Workbooks[1].WorkSheets[2];
//  aSheet:=eaapps1.Worksheets[2];
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

//  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='按在线材料项目汇总分析';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('tdate').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(dbgrideh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='按在线材料项目汇总分析';

//----------------//第三页
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
//    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DbgridEh2.Columns.Count<=26
    then vstr:=chr(DbgridEh2.Columns.Count+97)
  else begin
    vstr:=chr(strtoint(floattostr(int(DbgridEh2.Columns.Count/26)+96)))
        +chr(strtoint(floattostr(DbgridEh2.Columns.Count-26*int(DbgridEh2.Columns.Count/26)+96)));
  end;

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
  asheet.Range['a4',vstr+inttostr(dbgrideh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
//  asheet.Name :='按类别汇总分析';
//  eaapps1.Visible[0]:=true;         // display Excel files
  XlApp.Visible := True;
  Form_Progress.free;

  dbgrid1.DataSource.DataSet.EnableControls;
  dbgrideh1.DataSource.DataSet.EnableControls;
  dbgrideh2.DataSource.DataSet.EnableControls;
end;

procedure TForm_online.DBGrid1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ados462.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ados462.IndexFieldNames:=column.FieldName;
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

procedure TForm_online.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adod462a.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adod462a.IndexFieldNames:=column.FieldName;
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

procedure TForm_online.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adod462b.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adod462b.IndexFieldNames:=column.FieldName;
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

procedure TForm_online.FormCreate(Sender: TObject);
begin
  precolumn1:=dbgrid1.Columns[0];
  precolumn2:=dbgrideh1.Columns[0];
  precolumn3:=dbgrideh2.Columns[0];
end;

procedure TForm_online.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
   case pagecontrol1.ActivePageIndex of
    0:dm.ados462.Filter:=precolumn1.FieldName+' like ''%'+trim(edit1.text)+'%''';
    1:dm.adod462a.Filter:=precolumn2.FieldName+' like ''%'+trim(edit1.text)+'%''';
    2:dm.adod462b.Filter:=precolumn3.FieldName+' like ''%'+trim(edit1.text)+'%''';
   end
  else
   case pagecontrol1.ActivePageIndex of
    0:dm.ados462.Filter:='';
    1:dm.adod462a.Filter:='';
    2:dm.adod462b.Filter:='';
   end;
end;

procedure TForm_online.PageControl1Change(Sender: TObject);
begin
  edit1.Text:='';
  case pagecontrol1.ActivePageIndex of
   0:label1.Caption:='搜索：'+precolumn1.Title.Caption;
   1:label1.Caption:='搜索：'+precolumn2.Title.Caption;
   2:label1.Caption:='搜索：'+precolumn3.Title.Caption;
  end;
end;

end.
