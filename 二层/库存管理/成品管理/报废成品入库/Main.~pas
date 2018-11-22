unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitQuit: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BitQuery: TBitBtn;
    BitFieldsVisable: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure BitQuitClick(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitFieldsVisableClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitQueryClick(Sender: TObject);
  private
     PreColumn:TColumnEh;
     sql_text,ssql:string;
     procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,common,DB, Storage, QuerySet;

{$R *.dfm}

procedure Tfrm_main.BitQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_main.BitRefreshClick(Sender: TObject);
var
  rkey416:integer;
begin
  rkey416 := DM.ADS416rkey.Value;
  dm.ADS416.Close;
  dm.ADS416.Prepared;
  dm.ADS416.Open;
  if rkey416>0 then
  dm.ADS416.Locate('rkey',rkey416,[]);
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
// rkey73:='2551';
// user_ptr := '3054';
// vprev := '4'
end;

procedure Tfrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end;
  end
  else
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
  end;
  sql_text:=DM.ADS416.CommandText;
  frmQuerySet.DateTimePicker1.Date := common.getsystem_date(DM.tmp,0)-7;
  frmQuerySet.DateTimePicker2.Date := common.getsystem_date(DM.tmp,0);
  DM.ADS416.Close;
  DM.ADS416.CommandText := DM.ADS416.CommandText + ' and (data0416.sys_date >='+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0416.sys_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
  DM.ADS416.Open;
  DM.ADS53.Open;
end;

procedure Tfrm_main.BitFieldsVisableClick(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS416.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS416.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS416.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
  edit1.SetFocus;
end;

procedure Tfrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS416.CommandText);
end;

procedure Tfrm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS53.CommandText);
end;

procedure Tfrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_Storage:=Tfrm_Storage.Create(Application);
    frm_Storage.v_status:=0;
    if frm_Storage.ShowModal=mrok then
    begin
      dm.ADS416.Close;
      dm.ADS416.Open;
      dm.ADS416.Locate('rkey',frm_Storage.rkey416,[]);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    frm_Storage.Free;
  end;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  frm_Storage:=Tfrm_Storage.Create(Application);
  frm_Storage.v_status:=1;
  frm_Storage.ShowModal;
end;

procedure Tfrm_main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else  

  if MessageDlg('您确定要删除该入库记录吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try

      with dm.tmp do
      begin
        Close;
        SQL.Text :='select rkey from data0416 where  sys_date<(SELECT ISNULL(MAX(dbo.Data0444.TDATE), 0) FROM  dbo.Data0451  '+
        ' INNER JOIN dbo.Data0444 ON dbo.Data0451.END_DATE = dbo.Data0444.CUT_DATE) and rkey='+dm.ADS416rkey.AsString;
        Open;
        if RecNo>0 then
        begin
          ShowMessage('核算日期大于入仓日期，不能删除');
          Exit;
        end;
        DM.ADOConnection1.BeginTrans;
        DM.ADS53.First;

       Close;
       SQL.Text := 'update data0058 set if_stock =0 from data0058 inner join data0053 on data0058.rkey=data0053.rkey58'+
          ' where data0053.NPAD_PTR='+ DM.ADS416rkey.AsString;
       ExecSQL;

       Close;
       SQL.Text :=
         ' update data0025 set QTY_ON_HAND=QTY_ON_HAND-derivedtbl_1.qty '+
         ' FROM         dbo.Data0025 INNER JOIN'+
         '                 (SELECT  CUST_PART_PTR, SUM(QTY_ON_HAND) AS qty'+
         '                   FROM   dbo.Data0053' +
         '                   WHERE  (NPAD_PTR = '+DM.ADS416rkey.AsString+')'+
         '                   GROUP BY CUST_PART_PTR) AS derivedtbl_1 ON dbo.Data0025.RKEY = derivedtbl_1.CUST_PART_PTR';
       ExecSQL;

        Close;
        SQL.Text :='delete data0416 where rkey='+ DM.ADS416rkey.AsString;
        if ExecSQL>0 then
        begin
          DM.ADOConnection1.CommitTrans;
          common.ShowMsg('删除操作成功！',1);
          self.BitRefreshClick(Sender);
        end;

      end;

    except
     on E: Exception do
     begin
       DM.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
     end;
    end;
  end;
end;

procedure Tfrm_main.BitQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS416.Close;
    dm.ADS416.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS416.CommandText := sql_text+ssql+' and (data0416.sys_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0416.sys_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
    dm.ADS416.Open;
  end;
  
end;

end.
