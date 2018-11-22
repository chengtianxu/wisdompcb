unit sumqryehfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, ADODB, Grids,
  DBGridEh, PasDM, TeEngine, Series, TeeProcs, Chart, DbChart;

type
  Tfrmqrysumeh = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    lbl1: TLabel;
    cbbgptype: TComboBox;
    lbl3: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    eh1: TDBGridEh;
    ads1: TADODataSet;
    ds1: TDataSource;
    strngfldads1EMPLOYEE_NAME: TStringField;
    intgrfldads1CountNum: TIntegerField;
    ads1SumXiShu: TFloatField;
    dbcht1: TDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    procedure btn2Click(Sender: TObject);
    procedure cbbgptypeChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetQryData;
  end;


implementation

uses
  common;

{$R *.dfm}

procedure Tfrmqrysumeh.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrmqrysumeh.GetQryData;
var
  LTimeField: string;
  LGroupField: string;
  LSelect: string;
begin
  LSelect := 'SELECT d05.EMPLOYEE_NAME,COUNT(*) as CountNum, SUM(d538.QAE_XiShu) AS SumXiShu FROM DATA0538 d538 ';
  case cbbgptype.ItemIndex of
    0:
    begin
      LTimeField := 'd538.YS_EDN_DATE';
      LGroupField := 'd538.YS_USER_PTR';
    end;
    1:
    begin
      LTimeField := 'd538.CAM_EDN_DATE';
      LGroupField := 'd538.CAM_USER_PTR';
    end;
    2:
    begin
      LTimeField := 'd538.QAE_END_DATE';
      LGroupField := 'd538.QAE_USER_PTR';
    end;
  else
    LTimeField := 'd538.YS_EDN_DATE';
  end;

  ads1.Close;
  ads1.CommandText := LSelect + ' INNER JOIN data0005 d05 ON ' + LGroupField + ' = d05.RKEY ' +
                      ' where ' + LTimeField + ' between :t1 and :t2 ' +
                      ' group by d05.EMPLOYEE_NAME order by d05.EMPLOYEE_NAME';
  ads1.Parameters.ParamByName('t1').Value := dtp1.DateTime;
  ads1.Parameters.ParamByName('t2').Value := dtp2.DateTime;
  ads1.Open;
end;

procedure Tfrmqrysumeh.cbbgptypeChange(Sender: TObject);
begin
  GetQryData;
end;

procedure Tfrmqrysumeh.btn1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(eh1,self.Caption) ;
end;

procedure Tfrmqrysumeh.eh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else
  if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end ;

end;

end.
