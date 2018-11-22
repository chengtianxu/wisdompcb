unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, common, DB , Grids, DBGridEh, Menus;

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
    nImport: TMenuItem;
    N2: TMenuItem;
    nAudit: TMenuItem;
    Panel3: TPanel;
    lbHelp: TLabel;
    mniN3: TMenuItem;
    sg1: TStringGrid;
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
    procedure nImportClick(Sender: TObject);
    procedure nAuditClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure lbHelpClick(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
  private
    preColumn:TColumnEh;
    today,lastday:TDateTime;
    mainSql,querySql:string;
    procedure itemClick(Sender:TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO, PasQuery,DateUtils, PasModify, PasImport;

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
//  DM.adoMain.CommandText:=mainSql + #13 + querySql;
//  DM.adoMain.Parameters.ParamByName('From').Value:=lastday;
//  DM.adoMain.Parameters.ParamByName('To').Value:=today;
  DM.adoMain.Open;
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
  frmQuery.dtpkTo.Date:= IncDay(today,-1);
  frmQuery.dtpkFrom.Date:= lastday;
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    today:=IncDay(frmQuery.dtpkTo.Date,1);
    lastday:=frmQuery.dtpkFrom.Date;
    DM.adoMain.Close;
    DM.adoMain.CommandText:=mainSql + #13 + querySql;
    DM.adoMain.Parameters.ParamByName('From').Value:=lastday;
    DM.adoMain.Parameters.ParamByName('To').Value:=today;
    DM.adoMain.Open;
  end;
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then                //05
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
    Exit;
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
  mainSql:=dm.adoMain.CommandText;
  today:=IncDay(getsystem_date(DM.adoTmp,1),1);
  lastday:= IncMonth(today,-1);
  
  with dm.adoMain do
  begin
    close;
    Parameters.ParamByName('From').Value:=lastday;
    Parameters.ParamByName('To').Value:=today;
    open;
  end;

  for i:=0 to dbMain.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=dbMain.Columns[i].Title.Caption;
    item.Checked:=dbMain.Columns[i].Visible;
    item.OnClick:=itemClick;
    PopupMenu1.Items.Add(item);
  end;

  sg1.Cells[0,0]:= '房间编号';
  sg1.Cells[1,0]:= '当月度数';
  with dm.adoTmp do
  begin
    close;
    SQL.Text:= 'select R_name from Bedroommsg order by R_name';
    open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        sg1.Cells[0,RecNo]:= FieldByName('R_name').AsString;
        sg1.RowCount:= sg1.RowCount  + 1;
        Next;
      end;
    end;
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
    frmModyfy:=TfrmModyfy.Create(Application);
    frmModyfy.status:=1;
    if frmModyfy.ShowModal=mryes then
    begin
      DM.adoMain.Close;
//      DM.adoMain.Parameters.ParamByName('From').Value:=lastday;
//      DM.adoMain.Parameters.ParamByName('To').Value:=today;
      DM.adoMain.Open;
      DM.adoMain.Locate('rkey',frmModyfy.irkey,[]);
    end;
  finally
    frmModyfy.Free;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value>0  then
  begin
    try
      frmModyfy:=TfrmModyfy.Create(Application);
      frmModyfy.status:=2;
      if frmModyfy.ShowModal=mryes then
      begin
        btnRefreshClick(nil);
      end;
    finally
      frmModyfy.Free;
    end;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value>0 then
  begin
    try
      frmModyfy:=TfrmModyfy.Create(Application);
      frmModyfy.status:=3;
      frmModyfy.ShowModal;
    finally
      frmModyfy.Free;
    end;
  end;
end;

procedure TfrmMain.nDeleteClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  if dm.adoMainrkey.Value>0 then
  begin
    if MessageDlg('你确定要永久删除选择的记录吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
    begin
      try
        for i:=0 to dbMain.SelectedRows.Count-1 do
        begin
          dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
          strRkey:= IntToStr(dm.adoMainrkey.Value)+','+ strRkey;
        end;
        strRkey:=Copy(strRkey,0,Length(strRkey)-1);
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from Bedroom_equipment_record where rkey in (' + strRkey +')');
          ExecSQL;
        end;
      except
        ShowMessage('删除失败！');
      end;
      DM.adoMain.Close;
      DM.adoMain.Open;
    end;
  end;
end;

procedure TfrmMain.nImportClick(Sender: TObject);
begin
  try
    frmImport:=TfrmImport.Create(Application);
    if frmImport.ShowModal=mryes then
    begin
      dm.adoMain.Close;
      DM.adoMain.Open;
    end;
  finally
    frmImport.Free;
  end;
end;

procedure TfrmMain.nAuditClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';

  if MessageDlg('你确定要复核选中的所有记录吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
  begin
    try
      for i:=0 to dbMain.SelectedRows.Count-1 do
      begin
        dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
        strRkey:= IntToStr(dm.adoMainrkey.Value)+','+ strRkey;
      end;
      strRkey:=Copy(strRkey,0,Length(strRkey)-1);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update bedroom_equipment_record set ischecked=1 where rkey in (' + strRkey +')');
        ExecSQL;
      end;
    except

    end;
  end;
  Self.btnRefreshClick(nil);
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  nAdd.Enabled:= (vprev='2') or (vprev='4');
  nEdit.Enabled:=((vprev='2') or (vprev='4')) and (DM.adoMainischecked.Value=False);
  nDelete.Enabled:=((vprev='2') or (vprev='4')) and (DM.adoMainischecked.Value=False);
  nImport.Enabled:=(vprev='2') or (vprev='4');
  nAudit.Enabled:= ((vprev='2') or (vprev='4')) and (DM.adoMainischecked.Value=False);
end;

procedure TfrmMain.lbHelpClick(Sender: TObject);
begin
  ShowMessage('1、只有权限2和4才可以新增、编辑、删除与导入。'#13+
              '2、只能编辑或删除或复核未复核的记录。');
end;

procedure TfrmMain.mniN3Click(Sender: TObject);
begin
  Export_Grid_to_Excel(sg1,Application.Title);
end;

end.
