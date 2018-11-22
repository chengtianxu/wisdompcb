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
    procedure nAddClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure nAuditClick(Sender: TObject);
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

uses DAMO, PasQuery, PasModify;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  mainrkey:= DM.adoMainrkey.Value;
  DM.adoMain.Close;
  DM.adoMain.CommandText:=mainSql + #13 + querySql;
  DM.adoMain.Parameters.ParamByName('startdate').Value:=lastdate;
  DM.adoMain.Parameters.ParamByName('enddate').Value:=today;
  DM.adoMain.Open;
  if preColumn.Title.SortMarker= smUpEh then DM.adoMain.Sort:=preColumn.FieldName
  else DM.adoMain.Sort:=preColumn.FieldName + ' DESC';
  if mainrkey>0 then DM.adoMain.Locate('rkey',mainrkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if  not DM.adoMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,frmMain.Caption);
end;
procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpkEndDate.Date:=today;
  frmQuery.dtpkStartDate.Date:= lastdate;
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    today:=frmQuery.dtpkEndDate.Date;
    lastdate:=frmQuery.dtpkStartDate.Date;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;
  frmMain.Caption:=Application.Title;
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
  today:=getsystem_date(DM.adoTime,1);
  lastdate:=IncMonth(today,-1);
  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('startdate').Value:= lastdate;
    Parameters.ParamByName('enddate').Value:= today;
    Open;
    IndexFieldNames:=preColumn.FieldName;
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
  end
  else
  begin
    DM.adoMain.Filter:='';
  end;
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.status:=1;
    if frmModify.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
      DM.adoMain.Locate('rkey',frmModify.rkey570,[]);
    end;
  finally
    frmModify.Free;
    DM.cds571.EmptyDataSet;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value <=0 then Exit;
  if DM.adoMainstatus.Value=1 then
  begin
    ShowMessage('审核过的记录不能修改');
    exit;
  end;
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.status:=2;
    frmModify.rkey570:=DM.adoMainrkey.Value;
    if frmModify.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmModify.Free;
    DM.cds571.EmptyDataSet;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value <=0 then Exit;
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.status:=3;
    frmModify.rkey570:=DM.adoMainrkey.Value;
    frmModify.ShowModal;
  finally
    frmModify.Free;
    DM.cds571.EmptyDataSet;
  end;
end;

procedure TfrmMain.nDeleteClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value>0  then
  begin
    if DM.adoMainstatus.Value=0 then
    begin
      if MessageDlg('你确定要删除选中记录吗？',mtWarning,[mbYes,mbNo],0)=mryes then
      begin
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='delete from data0570 where rkey='+ DM.adoMainrkey.AsString;
          ExecSQL;
        end;
//        with DM.adoTmp do        //有级联删除
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Text:='delete from data0571 where statistic_ptr='+ DM.adoMainrkey.AsString;
//          ExecSQL;
//        end;
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('已审核的记录不能删除！');
      Exit;
    end;
  end;
end;

procedure TfrmMain.nAuditClick(Sender: TObject);
begin
  if (DM.adoMainrkey.Value>0) and (DM.adoMainstatus.Value<>1) then
  begin
    if MessageDlg('你确定要审核选择的记录吗？',mtWarning,[mbYes,mbNo],0)=mryes then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0570 set status=1,authempl_ptr='+ user_ptr + ',auth_date='+
                   QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,0)))+ ' where rkey='+ DM.adoMainrkey.AsString;
        ExecSQL;
      end;
      btnRefreshClick(nil);
    end;
  end;
end;

end.
