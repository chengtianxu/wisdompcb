unit PasReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  DB, ADODB, Menus, ExtDlgs, ComCtrls, Grids, DBGridEh;

type
  TfrmReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    ds1: TDataSource;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    edt1: TEdit;
    ud1: TUpDown;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    chtR: TChart;
    Series1: TFastLineSeries;
    ehRate: TDBGridEh;
    adoqry: TADODataSet;
    btnExport: TBitBtn;
    adoList: TADODataSet;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure ehRateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    LListSql,LImageSql:string;
    procedure Init;
    procedure GetSql(ASDate,AEDate:TDate;AFactory,AMode,ALData:Integer);
  public
    { Public declarations }
    LWHoure,LMode,LData:Integer;
    LSDate,LEDate:TDateTime;
  end;

var
  frmReport: TfrmReport;

implementation

uses DateUtils,common,MyClass, DAMO;

{$R *.dfm}

procedure TfrmReport.GetSql(ASDate, AEDate: TDate; AFactory, AMode,
  ALData:Integer);
var
    LSql,LWeek,LWith,LSumType,LDate: string;
    LDelcare,LFieldStr,LNullFieldStr:string;
    LDateType,LDataStr,LSelect,LSelect2:string;
begin
  LWeek:='';
  LDelcare:= ' declare @W int ' ;
  case ALData of
    0:
    begin
      LSql:=' select  value1=stuff((select distinct '',''+ convert(varchar(max),QUOTENAME(FASSET_NAME)) '+#13+
						' FROM Y1417 where Y1417.warehouse_ptr = ' + IntToStr(AFactory) + ' FOR xml PATH('''')), 1, 1, '''')';
//      ShowMessage(LSql);
      LFieldStr:= MyDataClass.Get_Sql_Value(LSql);
      LSql:=' select  value1=stuff((select distinct '','' + ''isnull( '' + convert(varchar(max),QUOTENAME(FASSET_NAME)) + '',0) as '' + QUOTENAME(FASSET_NAME)' +#13+
						' FROM Y1417 where Y1417.warehouse_ptr = ' + IntToStr(AFactory) +' FOR xml PATH('''')), 1, 1, '''')';
      LNullFieldStr:= MyDataClass.Get_Sql_Value(LSql);
    end;
    1:
    begin
      LSql:=' select  value1=stuff((select distinct '',''+ convert(varchar(max),QUOTENAME(FASSET_DESC)) '+#13+
						' FROM Y1417 where Y1417.warehouse_ptr = ' + IntToStr(AFactory) +' FOR xml PATH('''')), 1, 1, '''')';
//      ShowMessage(LSql);
      LFieldStr:= MyDataClass.Get_Sql_Value(LSql);
      LSql:=' select  value1=stuff((select distinct '','' + ''isnull( '' + convert(varchar(max),QUOTENAME(FASSET_DESC)) + '',0) as '' + QUOTENAME(FASSET_DESC)' +#13+
						' FROM Y1417 where Y1417.warehouse_ptr = ' + IntToStr(AFactory) + ' FOR xml PATH('''')), 1, 1, '''')';
      LNullFieldStr:= MyDataClass.Get_Sql_Value(LSql);
    end;
    2:
    begin
      LSql:=' select  value1=stuff((select distinct '',''+ convert(varchar(max),QUOTENAME(DEPT_NAME)) '+#13+
						' FROM Y1417 INNER JOIN  '+#13+
						' DATA0034 ON Y1417.DEPT_PTR=DATA0034.RKEY where Y1417.warehouse_ptr = ' + IntToStr(AFactory) +' FOR xml PATH('''')), 1, 1, '''')';
      LFieldStr:= MyDataClass.Get_Sql_Value(LSql);
      LSql:=' select  value1=stuff((select distinct '','' + ''isnull( '' + convert(varchar(max),QUOTENAME(DEPT_NAME)) + '',0) as '' + QUOTENAME(DEPT_NAME)' +#13+
						' FROM Y1417 INNER JOIN  '+#13+
						' DATA0034 ON Y1417.DEPT_PTR=DATA0034.RKEY where Y1417.warehouse_ptr = ' + IntToStr(AFactory) + ' FOR xml PATH('''')), 1, 1, '''')';
      LNullFieldStr:= MyDataClass.Get_Sql_Value(LSql);
//            ShowMessage(LSql);
    end;
    3:
    begin
      LSql:=' select  value1=stuff((select distinct '',''+ convert(varchar(max),QUOTENAME(ABBR_NAME)) '+#13+
						' FROM Y1417 INNER JOIN  '+#13+
						' DATA0015 ON Y1417.warehouse_ptr=DATA0015.RKEY where Y1417.warehouse_ptr = ' + IntToStr(AFactory) +
            ' FOR xml PATH('''')), 1, 1, '''')';
      LFieldStr:= MyDataClass.Get_Sql_Value(LSql);
      LSql:=' select  value1=stuff((select distinct '','' + ''isnull( '' +convert(varchar(max),QUOTENAME(ABBR_NAME))+ '',0) as '' + QUOTENAME(ABBR_NAME)' +#13+
						' FROM Y1417 INNER JOIN  '+#13+
						' DATA0015 ON Y1417.warehouse_ptr=DATA0015.RKEY where Y1417.warehouse_ptr = ' + IntToStr(AFactory) +
            ' FOR xml PATH('''')), 1, 1, '''')';
      LNullFieldStr:= MyDataClass.Get_Sql_Value(LSql);
    end;
  end;
  if AMode = 1 then
    LWeek:='SELECT @W=datepart(week, dateadd(dd,-7,min(T_DATE))) FROM Y1408  ' + #13 +
           '     WHERE dbo.Y1408.T_DATE between ' + QuotedStr(DateToStr(ASDate)) + ' and ' + QuotedStr(DateToStr(AEDate));
  LWith:=  ' ;with CTE as(     ' + #13 +
           '   SELECT     dbo.Y1417.FASSET_NAME, dbo.Y1417.FASSET_DESC, dbo.Y1417.DEPT_PTR, dbo.Data0015.ABBR_NAME ' + #13 +
           '         , dbo.Y1417.warehouse_ptr,dbo.y1408.T_Date, dbo.Data0034.DEPT_NAME,dbo.Y1417.IsDouble   ' + #13 +
           '         , Sum(case when dbo.Y1417.Scan_QTY = 2 then  0.5 else 1.0 end) as total   ' + #13 +
           '         , Sum(case when dbo.Y1406.WORK_ORDER_NUMBER is null then 0 else 1 end) as GoodCount  ' + #13 +
           '   FROM         dbo.Data0015 INNER JOIN   ' + #13 +
           '                 dbo.Y1408 INNER JOIN    ' + #13 +
           '                 dbo.Y1417 ON dbo.Y1408.Y1417_RKEY = dbo.Y1417.RKEY ON dbo.Data0015.RKEY = dbo.Y1417.warehouse_ptr INNER JOIN  ' + #13 +
           '                 dbo.Data0034 ON dbo.Y1417.DEPT_PTR = dbo.Data0034.RKEY LEFT OUTER JOIN  ' + #13 +
           '                 dbo.Y1406 ON dbo.Y1408.Y1406_RKEY = dbo.Y1406.rkey  ' + #13 +
           '   WHERE (dbo.Y1408.T_DATE between ' + QuotedStr(DateToStr(ASDate)) + ' and ' + QuotedStr(DateToStr(AEDate)) + ')  ' + #13 +
           '    AND (dbo.Y1417.warehouse_ptr = ' + IntToStr(AFactory) +')  ' + #13 +
           '   group by dbo.Y1417.FASSET_NAME, dbo.Y1417.FASSET_DESC, dbo.Y1417.DEPT_PTR,dbo.Y1417.IsDouble  ' + #13 +
           '         , dbo.Y1417.warehouse_ptr,dbo.y1408.T_Date, dbo.Data0015.ABBR_NAME, dbo.Data0034.DEPT_NAME ' + #13 +
           '   )  ';
  case AMode of
    0:
    begin
      LDateType:= 'convert(varchar(12),T_Date,23) as SumDay';
      LDate:= ' convert(varchar(12),T_Date,23) ';
      LDataStr:= ' SumDay';
    end;
    1:
    begin
      LDateType:= '''第''+ cast(DATEPART(WEEK,T_Date) - @W as varchar(4))+ ''周'' AS SumWeek';
      LDate:=  '''第''+ cast(DATEPART(WEEK,T_Date) - @W as varchar(4))+ ''周''';
      LDataStr:= ' SumWeek';
    end;
    2:
    begin
      LDateType:= 'datepart(yy,T_Date)*100+datepart(mm,T_Date) AS SumYear';
      LDate:=  'datepart(yy,T_Date)*100+datepart(mm,T_Date)';
      LDataStr:= ' SumYear';
    end;
  end;
  case ALData of
    0: LSumType:= 'FASSET_NAME';
    1: LSumType:= 'FASSET_DESC';
    2: LSumType:= 'DEPT_NAME';
    3: LSumType:= 'ABBR_NAME';
  end;
  LSelect:= ' Select '+ LDataStr + ' as [时间],' + LNullFieldStr + ' From ( ' + #13 +
            ' Select ' + LSumType + ',' + LDateType + #13+
            '  ,cast(sum(GoodCount)*100.0/sum(total) as decimal(6,2)) as Rate ' + #13 +
            '  From CTE ' + #13 +
            ' group by ' + LSumType + ',' + LDate + #13+
            ' ) C pivot (sum(c.rate) FOR ' + LSumType + ' IN ( ' + LFieldStr + ')) D' + #13 +
            ' Order by ' + LDataStr;
  LSelect2:=' Select ' + LSumType + ' as 模式,' + LDate + ' as 时间  ,sum(GoodCount) as 识别成功数,round(sum(total),0) as 采集总数 ' + #13+
            '  ,cast(sum(GoodCount)*100.0/round(sum(total),0) as decimal(6,2)) as 识别率 ' + #13 +
            '  From CTE ' + #13 +
            ' group by ' + LSumType + ', ' + LDate ;
  LImageSql:= LDelcare + #13 + LWeek + #13 + LWith + #13 + LSelect;
  LListSql:= LDelcare + #13 + LWeek + #13 + LWith + #13 + LSelect2 + #13+
             ' order by ' + LSumType + ', ' + LDate ;
//  ShowMessage(LListSql);
//  ShowMessage(LImageSql);
end;


procedure TfrmReport.FormShow(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  try
    GetSql(LSDate,LEDate,LWHoure,LMode,LData);
    with adoList do
    begin
      Close;
      CommandText:= LListSql;
      Open;
    end;
    ehRate.Columns[0].Width:= 150;
    ehRate.Columns[1].Width:= 80;
    ehRate.Columns[2].Width:= 80;
    ehRate.Columns[3].Width:= 80;
    ehRate.Columns[4].Width:= 80;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmReport.btn5Click(Sender: TObject);
begin
 IF chtR.View3DOptions.Zoom<100 THEN
    chtR.View3DOptions.Zoom := chtR.View3DOptions.Zoom + 5;
end;

procedure TfrmReport.btn6Click(Sender: TObject);
begin
  IF chtR.View3DOptions.Zoom>1 THEN
    chtR.View3DOptions.Zoom := chtR.View3DOptions.Zoom - 5;
end;

procedure TfrmReport.btn4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
   chtR.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');
end;

procedure TfrmReport.btn3Click(Sender: TObject);
begin
  if PrintDialog1.Execute then chtR.Print;
end;

procedure TfrmReport.btn1Click(Sender: TObject);
begin
  chtR.PreviousPage;
end;

procedure TfrmReport.btn2Click(Sender: TObject);
begin
  chtR.NextPage;
end;

procedure TfrmReport.edt1Change(Sender: TObject);
begin
  chtR.MaxPointsPerPage:=ud1.Position;
end;

procedure TfrmReport.FormCreate(Sender: TObject);
begin
  MyDataClass:= TMyDataClass.Create(DM.con1);
end;

procedure TfrmReport.FormDestroy(Sender: TObject);
begin
  MyDataClass.Free;
end;

procedure TfrmReport.Init;
var
  i:Integer;
  LSeries:TFastLineSeries;
begin

  with adoqry do
  begin
    Close;
    CommandText:= LImageSql;
//    ShowMessage(CommandText);
    Open;

    For i:=0 to chtR.SeriesList.Count - 1 do
    begin
      chtR.SeriesList.Delete(i);
    end;
    for i:= 0 to ehRate.Columns.Count - 1 do
    begin
      ehRate.Columns[i].Width:= 90;
    end;

    for i:=1 to FieldCount-1 do
    begin
      First;
      LSeries:= TFastLineSeries.Create(Self);
      LSeries.VertAxis:= aBothVertAxis;
//        LSeries.Marks.Visible:= True;
//        LSeries.Marks.Style:= smsValue;
      LSeries.LinePen.Width:= 2;
      chtR.AddSeries(LSeries);
      while not Eof do
      begin
        LSeries.Add(Fields[i].Value,Fields[0].AsString);
        Next;
      end;
      LSeries.Title:= Fields[i].FieldName;
    end;
    chtR.View3D:= False;
    chtR.Legend.Alignment:= laRight;
    chtr.Legend.Visible:=True;    
  end;
end;

procedure TfrmReport.btnExportClick(Sender: TObject);
begin
  if adoqry.IsEmpty then Exit;
  if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
   Export_dbGridEH_to_Excel(ehRate,'ID码识别率');
end;

procedure TfrmReport.pgc1Change(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  try
    if pgc1.ActivePageIndex = 0 then
    begin
      pnl1.Visible:= False;
      btnExport.Visible:= True;
    end
    else
    begin
      if adoqry.IsEmpty then
        Self.Init;
      pnl1.Visible:= True;
      btnExport.Visible:= False;
    end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmReport.ehRateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssAlt in Shift) then
  begin
    ShowMessage(adoqry.CommandText);
  end;
end;

end.
