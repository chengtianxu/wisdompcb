unit TimeQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, Buttons, Grids, DBGridEh,
  ExtCtrls;

type
  TFrm_TimeQuery = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BtnClose: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    StatusBar1: TStatusBar;
    ADS: TADODataSet;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    DBGridEh2: TDBGridEh;
    ADSDSDesigner: TDateTimeField;
    ADSDSDesigner2: TStringField;
    ADSDSDesigner3: TStringField;
    ADSDSDesigner4: TStringField;
    ADSDSDesigner6: TStringField;
    ADSDSDesigner7: TStringField;
    ADSDSDesigner8: TStringField;
    ADSDSDesigner9: TStringField;
    ADSDSDesigner10: TStringField;
    ADSDSDesigner11: TDateTimeField;
    ADSDSDesigner12: TDateTimeField;
    ADSDSDesigner13: TWideStringField;
    ADSDSDesigner14: TBCDField;
    ADSDSDesigner15: TBCDField;
    ADSDSDesigner16: TBCDField;
    ADSDSDesigner17: TStringField;
    ADSDSDesigner18: TStringField;
    ADSDSDesigner19: TStringField;
    ADSDSDesigner20: TDateTimeField;
    ADSDSDesigner21: TDateTimeField;
    ADSDSDesigner22: TDateTimeField;
    ADSDSDesigner23: TBCDField;
    ADSDSDesigner24: TBCDField;
    ADSDSDesigner25: TStringField;
    ADSDSDesigner5: TStringField;
    ADSDSDesigner26: TStringField;
    ADSDSDesigner28: TStringField;
    ADSDSDesigner27: TStringField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure ADSAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnQueryClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADSAfterOpen(DataSet: TDataSet);
  private
    sql_text :string;
    PreColumn:TColumnEh;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Frm_TimeQuery: TFrm_TimeQuery;

implementation

uses damo,common, QuerySetWorkquery, main, ColsDisplaySet_unt;

{$R *.dfm}

procedure TFrm_TimeQuery.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker = smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    ADS.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    ADS.IndexFieldNames := Column.FieldName+' DESC';
  end;

//  if(PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
//  begin
//    PreColumn.Title.Color := clBtnFace;
////    Column.Title.Color := clRed;
//    PreColumn := Column;
//  end
//  else

end;

procedure TFrm_TimeQuery.FormShow(Sender: TObject);
begin

  PreColumn:=DBGridEh1.Columns[1];
  if frm_main.clickNum = 0 then
  sql_text := ADS.CommandText;

  if frm_main.QueryClick =0 then
  begin
    frm_QuerySetWorkquery.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-1;
    frm_QuerySetWorkquery.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
    ADS.Close;
    ADS.CommandText := sql_text+frm_main.strsql+' and (计划保养时间 >= '+quotedstr(formatdatetime('YYYY-MM-DD',frm_QuerySetWorkquery.DateTimePicker1.Date))+
      ') and (计划保养时间 <='+ quotedstr(formatdatetime('YYYY-MM-DD',frm_QuerySetWorkquery.DateTimePicker2.Date))+')';
    ADS.Open;
  end
  else
  begin
    ADS.Close;
    ADS.CommandText := sql_text+frm_main.strsql;
    ADS.Open;
  end;
//  ShowMessage(sql_text);
//  ShowMessage(frm_main.strsql);
//  ShowMessage(IntToStr(frm_main.QueryClick));
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(ADS.RecNo)+'/总记录数:'+ IntToStr(ADS.RecordCount);
  ResetGridColumns(Self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);


end;

procedure TFrm_TimeQuery.BtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_TimeQuery.BtnExportToExcelClick(Sender: TObject);
begin
  if not ADS.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh2,self.Caption);
end;

procedure TFrm_TimeQuery.ADSAfterScroll(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(ADS.RecNo)+'/总记录数:'+ IntToStr(ADS.RecordCount);
end;

procedure TFrm_TimeQuery.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(ADS.CommandText);
end;

procedure TFrm_TimeQuery.BtnQueryClick(Sender: TObject);
var
  i:integer;
  ssql :string;
begin
//  frm_QuerySetWorkquery := Tfrm_QuerySetWorkquery.Create(Application);
  if frm_QuerySetWorkquery.ShowModal=mrok then
  begin
    ADS.Close;
    ADS.CommandText := sql_text;
    ssql :='';
    for i:=1 to frm_QuerySetWorkquery.SGrid1.RowCount-2 do
    ssql := ssql+ frm_QuerySetWorkquery.SGrid1.Cells[2,i];
    ADS.CommandText := ADS.CommandText+ssql+' and (计划保养时间 >= '+quotedstr(formatdatetime('YYYY-MM-DD',frm_QuerySetWorkquery.DateTimePicker1.Date))+
    ') and (计划保养时间 <='+ quotedstr(formatdatetime('YYYY-MM-DD',frm_QuerySetWorkquery.DateTimePicker2.Date))+')';
    ADS.Open;
    frm_main.strsql := ssql+' and (计划保养时间 >= '+quotedstr(formatdatetime('YYYY-MM-DD',frm_QuerySetWorkquery.DateTimePicker1.Date))+
    ') and (计划保养时间 <='+ quotedstr(formatdatetime('YYYY-MM-DD',frm_QuerySetWorkquery.DateTimePicker2.Date))+')';
  end;
  inc(frm_main.QueryClick);
end;

procedure TFrm_TimeQuery.BitBtn1Click(Sender: TObject);
begin
  show_ColsDisplaySet_frm (Self,DBGridEh2,StrToInt(rkey73)) ;
end;

procedure TFrm_TimeQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveColsInfo(Self,StrToInt(rkey73));
end;

procedure TFrm_TimeQuery.ADSAfterOpen(DataSet: TDataSet);
var
  TimeCons,StdTimecons,Accomplish:Real;

begin

  DBGridEh2.FieldColumns['保养消耗时间'].Footer.Value:='';
  DBGridEh2.FieldColumns['标准消耗时间'].Footer.Value:='';
  DBGridEh2.FieldColumns['达成率'].Footer.Value:='';
  TimeCons:=0;
  StdTimecons:=0;
  Accomplish:=0;

  with ADS do
  begin
    First;

    while not eof do
    begin

      if FieldByName('保养消耗时间').AsFloat>0 then
      TimeCons:=TimeCons+FieldByName('保养消耗时间').Value;

      if FieldByName('标准消耗时间').AsFloat>0 then
      StdTimecons:=StdTimecons+FieldByName('标准消耗时间').Value;

      if FieldByName('达成率').AsFloat>0 then
      Accomplish:=Accomplish+FieldByName('达成率').Value;

      Next;
    end;

    if TimeCons>0 then
    begin
      DBGridEh2.FieldColumns['保养消耗时间'].Footer.Value:= '合计：'+formatfloat('0.##',TimeCons) ;
    end;
    if StdTimecons>0 then
    begin
      DBGridEh2.FieldColumns['标准消耗时间'].Footer.Value:= '合计：'+formatfloat('0.##',StdTimecons) ;
    end;
    if  Accomplish>0 then
    begin

    Accomplish:=Accomplish*100/ads.RecordCount;
    DBGridEh2.FieldColumns['达成率'].Footer.Value:='平均：'+(formatfloat('0.##',Accomplish))+'%';
    end
  end;

end;

end.
