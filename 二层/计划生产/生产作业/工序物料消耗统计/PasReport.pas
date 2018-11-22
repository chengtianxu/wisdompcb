unit PasReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  DB, ADODB, Menus, ExtDlgs, ComCtrls;

type
  TfrmReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    chtR: TChart;
    qry1: TADOQuery;
    ds1: TDataSource;
    Series1: TBarSeries;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    Series2: TBarSeries;
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    edt1: TEdit;
    ud1: TUpDown;
    cbbData: TComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure cbbDataChange(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    function GetUnit(AFormula:string):string;
  public
    { Public declarations }
    LWHoure,LMode,LData:Integer;
    LSDate,LEDate:TDateTime;
    LFormula:string;
  end;

var
  frmReport: TfrmReport;

implementation

uses DAMO,DateUtils;

{$R *.dfm}

procedure TfrmReport.Init;
var
  LSelect,LWhere,LWhereP,LUnit:string;
  LGroup,LOrder,LSum,LModeStr:string;
  LPList,LStr:TStringList;
  i:Integer;
begin
  LPList:=TStringList.Create;
  LStr:= TStringList.Create;
  try
  LStr.CommaText:='理论消耗,实际消耗,理论与实际消耗,理论与实际比例(百分比),生产面积(含板边)(平米)' ;
  LPList.CommaText:='theory_result,expend_QUANTITY,pnl_totalsqrt';
  case LData of
    0: LSum:= ' SUM( ' + LPList[0] + ')';
    1: LSum:= ' SUM( ' + LPList[1] + ')';
    2: LSum:= ' SUM( ' + LPList[0] + '),SUM(' + LPList[1] + ')';
    3: LSum:= ' SUM( ' + LPList[1] + ')/SUM(' + LPList[0] + ')*100';
    4: LSum:= ' SUM( isnull(' + LPList[2] + ',0))';
  end;

  case LMode of
    0:
      begin
        LSelect:='SELECT convert(varchar(12),start_date,23) as SDate,';
        LWhere:=' FROM DATA0570 WHERE ttype=0 and start_date >= ' + QuotedStr(DateToStr(LSDate))
              + ' and start_date < ' + QuotedStr(DateToStr(IncDay(LEDate)));
        LGroup:=' GROUP BY convert(varchar(12),start_date,23)';
        LOrder:=' ORDER BY convert(varchar(12),start_date,23)';
      end;
    1:
      begin
        LSelect:='declare @W int  '+ #13 +
                 ' select @W=datepart(week, dateadd(dd,-7,min(start_date))) FROM DATA0570  ' + #13 +
                 ' WHERE ttype=0 and start_date >= '+ QuotedStr(DateToStr(LSDate)) +' and start_date < '+ QuotedStr(DateToStr(IncDay(LEDate))) + #13 +
                 ' SELECT ''第''+ cast(DATEPART(WEEK,start_date) - @W as varchar(4))+ ''周'' AS SWeek ,';
        LWhere:=' FROM DATA0570 WHERE ttype=0 and start_date >= ' + QuotedStr(DateToStr(LSDate))
              + ' and start_date < ' + QuotedStr(DateToStr(IncDay(LEDate)));
        LGroup:=' GROUP BY DATEPART(WEEK,start_date) - @W ,''第''+ cast(DATEPART(WEEK,start_date) - @W as varchar(4))+ ''周''';
        LOrder:=' ORDER BY DATEPART(WEEK,start_date) - @W  ';
      end;
    2:
      begin
        LSelect:='SELECT datepart(yy,start_date)*100+datepart(mm,start_date) AS SYear,';
        LWhere:=' FROM DATA0570 WHERE ttype=0 and start_date >= ' + QuotedStr(DateToStr(LSDate))
              + ' and start_date < ' + QuotedStr(DateToStr(IncDay(LEDate)));
        LGroup:=' GROUP BY datepart(yy,start_date)*100+datepart(mm,start_date)';
        LOrder:=' ORDER BY datepart(yy,start_date)*100+datepart(mm,start_date)';
      end;

  end;

  LWhereP:= ' AND warehouse_ptr = ' + IntToStr(LWHoure) +
            ' AND formula_number = ' + QuotedStr(LFormula);

  if LData<3 then LUnit:= GetUnit(LFormula);

    with qry1 do
    begin
      Close;
      SQL.Text:= LSelect+ LSum + #13 + LWhere+ LWhereP + #13 + LGroup + #13 + LOrder;
//      ShowMessage(SQL.Text);
      Open;
      First;
      if LData=2 then
      begin
        while not Eof do
        begin
          Series1.Add(Fields[1].Value,Fields[0].AsString);
          Series2.Add(Fields[2].Value,Fields[0].AsString);
          Next;
        end;
        chtR.Series[0].Title:='理论消耗';
        chtR.Series[1].Title:='实际领料';
        chtr.Legend.Visible:=True;
      end
      else
      begin
        while not Eof do
        begin
          Series1.Add(Fields[1].Value,Fields[0].AsString);
          Next;
        end;
        chtR.Series[0].Title:= LStr[LData];
        chtR.Series[1].Title:= '无';
        chtr.Legend.Visible:=False;
      end;
    end;
    case LMode of
      0: LModeStr:='按日';
      1: LModeStr:='按周';
      2: LModeStr:='按月';
    end;

    chtR.LeftAxis.Title.Caption:=LStr[LData];
    if LData<3 then chtR.LeftAxis.Title.Caption:= chtR.LeftAxis.Title.Caption + '(' + LUnit + ')';
    frmReport.chtR.Title.Text.Text:= LModeStr + '汇总' + LStr[LData];
  finally

  end;
end;

procedure TfrmReport.FormShow(Sender: TObject);
begin
  cbbData.ItemIndex:=LData;
  Self.Init;
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

procedure TfrmReport.cbbDataChange(Sender: TObject);
begin
  Series1.Clear;
  Series2.Clear;
  LData:= cbbData.ItemIndex;
  Self.Init;
end;

function TfrmReport.GetUnit(AFormula: string): string;
begin
  Result:='';
  with DM.adoTmp do
  begin
    Close;
    SQL.Text:=' SELECT TOP 1 DATA0002.UNIT_NAME  '+#13+
              '  FROM DATA0017  INNER JOIN  '+#13+
              '        DATA0155 ON DATA0155.INVT_PTR=DATA0017.RKEY INNER JOIN '+#13+
              '        DATA0136 ON DATA0136.RKEY=DATA0155.control_ptr	INNER JOIN   '+#13+
              '        DATA0569 ON DATA0569.formula_number=DATA0136.Formula_ptr INNER JOIN   '+#13+
              '        DATA0002 ON DATA0017.PURCH_UNIT_PTR=DATA0002.RKEY '+#13+
              '  WHERE DATA0136.IsFormula=1 AND DATA0569.FORMULA_NUMBER= '+ QuotedStr(AFormula);
    Open;
    if not IsEmpty then
      Result:= FieldByName('UNIT_NAME').AsString;
  end;
end;

end.
