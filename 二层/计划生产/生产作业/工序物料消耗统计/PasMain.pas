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
    PopupMenu3: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    db571: TDBGridEh;
    Panel3: TPanel;
    Label1: TLabel;
    btnReport: TBitBtn;
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
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    today,lastdate:TDateTime;
    preColumn:TColumnEh;
    mainSql,querySql:string;
    procedure itemClick(Sender:TObject);
    procedure ChangColumn(rkey569:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO, PasQuery, PasModify,ADODB, PasSelect, PasQReq;

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
  PopupMenu3.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpkEndDate.Date:=IncDay(today,-1);
  frmQuery.dtpkStartDate.Date:= lastdate;
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    today:=IncDay(frmQuery.dtpkEndDate.Date,1);
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

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  nAdd.Visible:=(vprev='2') or (vprev='4');
  nEdit.Visible:=(vprev='2') or (vprev='4');
  nDelete.Visible:=(vprev='2') or (vprev='4');
  nAudit.Visible:=(vprev='2') or (vprev='4');
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  if  not DM.adoMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,frmMain.Caption);
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  try
    frmSelect:=TfrmSelect.Create(Application);
    frmSelect.dtpke.Date:=getsystem_date(DM.adoTime,1);
    frmSelect.dtpks.Date:= IncMonth(frmSelect.dtpke.Date,-1);
    if frmSelect.ShowModal = mryes then
    begin
      ChangColumn(frmSelect.edtDept.Text);
      DM.ads571.Close;
//      DM.ads571.Parameters[0].Value:= QuotedStr(Trim(frmSelect.edtDept.Text));
//      DM.ads571.Parameters[1].Value:= DateToStr(frmSelect.dtpks.Date);
//      DM.ads571.Parameters[2].Value:= DateToStr(frmSelect.dtpke.Date);
      DM.ads571.Parameters.ParamByName('formula').Value:= frmSelect.edtDept.Text;
      DM.ads571.Parameters.ParamByName('warehouse').Value := IntToStr(Integer(frmSelect.cbbWH.Items.Objects[frmSelect.cbbWH.ItemIndex]));
      DM.ads571.Parameters.ParamByName('s').Value:= frmSelect.dtpks.Date;
      DM.ads571.Parameters.ParamByName('e').Value:= frmSelect.dtpke.Date;
      DM.ads571.Open;
      if  not DM.ads571.IsEmpty then
        Export_dbGridEH_to_Excel(db571,frmMain.Caption);
    end;
  finally
    frmSelect.Free;
  end;
end;

procedure TfrmMain.Label1Click(Sender: TObject);
begin
  ShowMessage('1权限只能查看'+ #13+
              '2权限可以新增、编辑但不能修改参数的值'+ #13+
              '4权限可以修改参数的值');
end;

procedure TfrmMain.ChangColumn(rkey569: string);
var
  i:Integer;
  tmp:TADOQuery;
begin
  tmp:=TADOQuery.Create(nil);
  tmp.Connection:=DM.ADOConnection1;
  with dm.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT TOP 1  PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PARA_PTR_3, PARA_PTR_4, '+
            ' PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9 '+ #13+
            ' FROM DBO.DATA0569 '+
            ' WHERE formula_number= ' + QuotedStr(rkey569) ;
    Open;
    for i:=0 to 9 do
      if not Fields[i].IsNull then
      begin
        db571.Columns[12+i].Visible:=True;
        with Tmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT PARAMETER_NAME,PARAMETER_DESC FROM DBO.DATA0278 '+ #13+
                    ' WHERE RKEY= ' + IntToStr(DM.adoTmp.Fields[i].AsInteger);
          Open;
          if not IsEmpty then
          begin
            db571.Columns[13+i].FieldName:=DM.ads571.Fields[14+i].FieldName;
            db571.Columns[13+i].Title.Caption:= tmp.Fields[1].Value;
            db571.Columns[13+i].Width:=80;
          end;
        end;
      end;
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
