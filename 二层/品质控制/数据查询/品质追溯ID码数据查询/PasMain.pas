unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,common, Buttons,DateUtils,DB , Grids, DBGridEh, Menus;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnField: TBitBtn;
    lbFilter: TLabel;
    edtFilter: TEdit;
    dbMain: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    N1: TMenuItem;
    nAudit: TMenuItem;
    btnReport: TBitBtn;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
    procedure dbMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFilterChange(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    today,lastdate:TDateTime;
    preColumn:TColumnEh;
    mainSql,querySql:string;
    procedure itemClick(Sender:TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO,PasQuery, PasQReq;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  if querySql = '' then querySql :=' and 1=0';
  mainrkey:= DM.adoMainrkey.Value;
  DM.adoMain.Close;
  DM.adoMain.CommandText:=mainSql + #13 + querySql;
  DM.adoMain.Open;
//  if preColumn.Title.SortMarker= smUpEh then DM.adoMain.Sort:=preColumn.FieldName
//  else DM.adoMain.Sort:=preColumn.FieldName + ' DESC';
  lbl2.Caption:= IntToStr(DM.adoMain.RecordCount);
  if mainrkey>0 then DM.adoMain.Locate('rkey',mainrkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if DM.adoMain.IsEmpty then Exit;
  if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
   Export_dbGridEH_to_Excel(dbMain,'ID码明细');
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpkStartDate.Date:= lastdate;
  frmQuery.dtpkEndDate.Date:= today;
  if frmQuery.ShowModal = mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    querySql:= querySql + ' and Y1408.T_DATE between ' + QuotedStr(FormatDateTime('YYYY-MM-DD ',frmQuery.dtpkStartDate.DateTime)
                + FormatDateTime('HH:MM:SS',frmQuery.dtpkStartTime.DateTime)) + ' and '
                + QuotedStr(FormatDateTime('YYYY-MM-DD ',frmQuery.dtpkEndDate.DateTime)
                + FormatDateTime('HH:MM:SS',frmQuery.dtpkEndTime.DateTime));
    today:= frmQuery.dtpkEndDate.Date;
    lastdate:= frmQuery.dtpkStartDate.Date;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.con1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;
  frmMain.Caption:=Application.Title;

  LongDateFormat := 'yyyy-MM-dd';
  ShortDateFormat := 'yyyy-MM-dd';
  LongTimeFormat := 'hh:nn:ss';
  ShortTimeFormat := 'hh:nn:ss';
  DateSeparator := '-';
  TimeSeparator := ':';

//  user_ptr:='3057';
//  vprev:='2';
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  item:TMenuItem;
  i:Integer;
begin
  preColumn:=dbMain.Columns[0];
  lbFilter.Caption:=preColumn.Title.Caption;
  mainSql:=DM.adoMain.CommandText;
  today:=getsystem_date(DM.adotmp,0);
  lastdate:=IncDay(today,-1);
  
  with DM.adoMain do
  begin
    Close;
      DM.adoMain.CommandText:= DM.adoMain.CommandText + ' and 1 = 0';
//    Parameters.ParamByName('startdate').Value:= lastdate;
//    Parameters.ParamByName('enddate').Value:= today;
    Open;
//    IndexFieldNames:=preColumn.FieldName;
    lbl2.Caption:= IntToStr(DM.adoMain.RecordCount);
  end;

  for i:=0 to dbMain.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=dbMain.Columns[i].Title.Caption;
    item.Checked:=dbMain.Columns[i].Visible;
    item.OnClick:=itemClick;
    PopupMenu1.Items.Add(item);
  end;
end;

procedure TfrmMain.itemClick(Sender: TObject);
var
  i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  for i:=0 to dbMain.Columns.Count do
  begin
    if (Sender as TMenuItem).Caption=dbMain.Columns[i].Title.Caption then
    begin
      dbMain.Columns[i].Visible:=(Sender as TMenuItem).Checked;
      Break;
    end;
  end;
end;

procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption<>preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoMain.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoMain.IndexFieldNames:=Column.FieldName;
  end;
end;

procedure TfrmMain.dbMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssAlt in Shift) then
  begin
    ShowMessage(DM.adoMain.CommandText);
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoMain.Filtered:=False;
    DM.adoMain.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
    DM.adoMain.Filtered:=True;
    lbl2.Caption:= IntToStr(DM.adoMain.RecordCount);
  end
  else
  begin
    DM.adoMain.Filter:='';
    lbl2.Caption:= IntToStr(DM.adoMain.RecordCount);
  end;
end;

procedure TfrmMain.btnReportClick(Sender: TObject);
begin
  try
    frmQRep:=TfrmQRep.Create(Application);
    frmQRep.ShowModal;
  finally
    frmQRep.Free;
  end;
end;

end.
