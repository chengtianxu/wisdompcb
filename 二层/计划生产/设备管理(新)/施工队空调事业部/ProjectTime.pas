unit ProjectTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGridEh, DB,
  ADODB;

type
  Tfrm_ProjectTime = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    BtnFieldsVisable: TBitBtn;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label2: TLabel;
    dteEnd: TDateTimePicker;
    dteBegin: TDateTimePicker;
    dteBeginTime: TDateTimePicker;
    dteEndTime: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Edit2: TEdit;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    ADS835: TADODataSet;
    ADS835DSDesigner: TStringField;
    ADS835DSDesigner2: TStringField;
    ADS835DSDesigner3: TStringField;
    ADS835DSDesigner4: TStringField;
    ADS835DSDesigner5: TStringField;
    ADS835DSDesigner6: TStringField;
    ADS835DSDesigner7: TStringField;
    ADS835DSDesigner8: TDateTimeField;
    ADS835DSDesigner9: TStringField;
    ADS835DSDesigner10: TDateTimeField;
    ADS835DSDesigner11: TIntegerField;
    ADS835DSDesigner12: TBCDField;
    ADS835DSDesigner13: TBCDField;
    ADS835DSDesigner14: TBCDField;
    ADS835DSDesigner15: TDateTimeField;
    ADS835DSDesigner16: TStringField;
    ADS835DSDesigner17: TStringField;
    ADS835DSDesigner18: TStringField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADS835AfterScroll(DataSet: TDataSet);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BtnFieldsVisableClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dteBeginExit(Sender: TObject);
    procedure dteBeginCloseUp(Sender: TObject);
    procedure dteBeginTimeChange(Sender: TObject);
    procedure dteEndExit(Sender: TObject);
    procedure dteEndCloseUp(Sender: TObject);
    procedure dteEndTimeChange(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BtnQueryClick(Sender: TObject);
  private
    sql_text :string;
    
    procedure timeChange();
    { Private declarations }
  public
    

    { Public declarations }
  end;

var
  frm_ProjectTime: Tfrm_ProjectTime;

implementation

uses damo,common, ColsDisplaySet_unt, Main, QueryProjectTime;

{$R *.dfm}

procedure Tfrm_ProjectTime.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(ADS835.CommandText);
end;

procedure Tfrm_ProjectTime.ADS835AfterScroll(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(ADS835.RecNo)+'/总记录数:'+ IntToStr(ADS835.RecordCount);
end;

procedure Tfrm_ProjectTime.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_ProjectTime.BtnExportToExcelClick(Sender: TObject);
begin
  if not ADS835.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_ProjectTime.BtnFieldsVisableClick(Sender: TObject);
begin
  show_ColsDisplaySet_frm (Self,DBGridEh1,StrToInt(rkey73)) ;
end;

procedure Tfrm_ProjectTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveColsInfo(Self,StrToInt(rkey73));
  Frm_Main.dteBegin := dteBegin.Date;
  Frm_Main.dteEnd := dteEnd.Date;
  Frm_Main.dteBeginTime := dteBeginTime.Time;
  Frm_Main.dteEndTime := dteEndTime.Time;
end;

procedure Tfrm_ProjectTime.FormShow(Sender: TObject);
begin

//  PreColumn:=DBGridEh1.Columns[0];
  if frm_main.clickNum = 0 then
  sql_text := ADS835.CommandText;

  if frm_main.QueryClick =0 then
  begin
    dteBegin.Date := common.getsystem_date(dm.tmp,0)-30;
    dteBeginTime.Time := common.getsystem_date(DM.tmp,0);
    dteEnd.Date := common.getsystem_date(DM.tmp,0);
    dteEndTime.Time := common.getsystem_date(DM.tmp,0);
    ADS835.Close;
    ADS835.CommandText := sql_text+ 'and (Data0835.AdmiTime>='+ QuotedStr(DateToStr(dteBegin.Date)+
    FormatDateTime(' HH:mm:ss',dteBeginTime.Time))+' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date)+
    FormatDateTime(' HH:mm:ss',dteEndTime.Time)) +') and DateDiff(day,data0835.AdmiTime	,data0835.CompTime)>='+ Edit2.Text;
    ADS835.Open;
  end
  else
  begin
    dteBegin.Date := Frm_Main.dteBegin;
    dteBeginTime.Time := Frm_Main.dteBeginTime;
    dteEnd.Date := Frm_Main.dteEnd;
    dteEndTime.Time := Frm_Main.dteEndTime;
    ADS835.Close;
    ADS835.CommandText := sql_text+frm_main.strsql+'and (Data0835.AdmiTime>='+ QuotedStr(DateToStr(dteBegin.Date)+
       FormatDateTime(' HH:mm:ss',dteBeginTime.Time))+' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date)+
       FormatDateTime(' HH:mm:ss',dteEndTime.Time)) +') and DateDiff(day,data0835.AdmiTime	,data0835.CompTime)>='+ Edit2.Text;
    ADS835.Open;
  end;
//  ShowMessage(sql_text);
//  ShowMessage(frm_main.strsql);
//  ShowMessage(IntToStr(frm_main.QueryClick));
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(ADS835.RecNo)+'/总记录数:'+ IntToStr(ADS835.RecordCount);
  ResetGridColumns(Self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);
end;

procedure Tfrm_ProjectTime.timeChange();
begin
  if Frm_Main.QueryClick = 0 then
  begin
    ADS835.Close;
    ADS835.CommandText := sql_text+ 'and (Data0835.AdmiTime>='+ QuotedStr(DateToStr(dteBegin.Date)+
    FormatDateTime(' HH:mm:ss',dteBeginTime.Time))+' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date)+
    FormatDateTime(' HH:mm:ss',dteEndTime.Time)) +') and DateDiff(day,data0835.AdmiTime	,data0835.CompTime)>='+ Edit2.Text;
    ADS835.Open;
  end
  else
  begin
    ADS835.Close;
    ADS835.CommandText := sql_text+frm_main.strsql+'and (Data0835.AdmiTime>='+ QuotedStr(DateToStr(dteBegin.Date)+
       FormatDateTime(' HH:mm:ss',dteBeginTime.Time))+' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date)+
       FormatDateTime(' HH:mm:ss',dteEndTime.Time)) +') and DateDiff(day,data0835.AdmiTime	,data0835.CompTime)>='+ Edit2.Text;
    ADS835.Open;
  end;
end;

procedure Tfrm_ProjectTime.dteBeginExit(Sender: TObject);
begin
  timeChange();
end;

procedure Tfrm_ProjectTime.dteBeginCloseUp(Sender: TObject);
begin
  Edit2.SetFocus;
end;

procedure Tfrm_ProjectTime.dteBeginTimeChange(Sender: TObject);
begin
 timeChange();
end;

procedure Tfrm_ProjectTime.dteEndExit(Sender: TObject);
begin
 timeChange();
end;

procedure Tfrm_ProjectTime.dteEndCloseUp(Sender: TObject);
begin
  Edit2.SetFocus;
end;

procedure Tfrm_ProjectTime.dteEndTimeChange(Sender: TObject);
begin
 timeChange();
end;

procedure Tfrm_ProjectTime.Edit2Exit(Sender: TObject);
begin
 timeChange();
end;

procedure Tfrm_ProjectTime.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker = smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    ADS835.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    ADS835.IndexFieldNames := Column.FieldName+' DESC';
  end;

//  if(PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
//  begin
//
//    PreColumn := Column;
//  end
end;

procedure Tfrm_ProjectTime.BtnQueryClick(Sender: TObject);
var
  i:integer;
  ssql :string;
begin
//  frm_QuerySetWorkquery := Tfrm_QuerySetWorkquery.Create(Application);
  if frm_ProjectTimequery.ShowModal=mrok then
  begin
    ADS835.Close;
    ADS835.CommandText := sql_text;
    ssql :='';
    for i:=1 to frm_ProjectTimequery.SGrid1.RowCount-2 do
    ssql := ssql+ frm_ProjectTimequery.SGrid1.Cells[2,i];
    ADS835.CommandText := ADS835.CommandText+ssql+ 'and (Data0835.AdmiTime>='+ QuotedStr(DateToStr(dteBegin.Date)+
       FormatDateTime(' HH:mm:ss',dteBeginTime.Time))+' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date)+
       FormatDateTime(' HH:mm:ss',dteEndTime.Time)) +') and DateDiff(day,data0835.AdmiTime	,data0835.CompTime)>='+ Edit2.Text;
    ADS835.Open;
    frm_main.strsql := ssql{+'and (Data0835.AdmiTime>='+ QuotedStr(DateToStr(dteBegin.Date)+
       FormatDateTime(' HH:mm:ss',dteBeginTime.Time))+' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date)+
       FormatDateTime(' HH:mm:ss',dteEndTime.Time)) +') and DateDiff(day,data0835.AdmiTime	,data0835.CompTime)>='+ Edit2.Text};
  end;
  inc(Frm_Main.QueryClick);

end;



end.
