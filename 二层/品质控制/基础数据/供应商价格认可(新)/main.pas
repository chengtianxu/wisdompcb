unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DateUtils;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExportToExcel: TBitBtn;
    btnQuery: TBitBtn;
    btnFieldsVisable: TBitBtn;
    lbl1: TLabel;
    edt1: TEdit;
    dbgrid1: TDBGridEh;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    btn1: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure btnFieldsVisableClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    sql_text:string;
    PreColumn: TColumnEh;
    presort : string;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd (var Message : TMessage);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  damo,DB,common, price_info, QuerySet;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  rkey28:integer;
begin
  presort:=DM.aqmain.Sort;
  rkey28:=DM.aqmainRKEY.Value;
  dm.aqmain.Close;
  dm.aqmain.Prepared;
  dm.aqmain.Open;
  DM.aqmain.Sort:=presort;
  if rkey28>0 then
  dm.aqmain.Locate('rkey',rkey28,[]);
end;

procedure TfrmMain.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
 if not app_init_2(DM.con1) then
  begin
    showmsg('程序起动失败请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;
{  dm.con1.Open;
  rkey73:='851';
  user_ptr := '963';
  vprev := '4';   }
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TfrmMain.dbgrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.aqmain.SQL.Text);
end;

procedure TfrmMain.dbgrid1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker = smDownEh then
  begin
    column.Title.SortMarker := smUpEh;
    dm.aqmain.Sort := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.aqmain.Sort:=Column.FieldName+' DESC';
  end;
  if (PreColumn.FieldName<>column.FieldName)  and
  (column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbl1.Caption:=column.Title.Caption+':';
    edt1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edt1.SetFocus;
end;

procedure TfrmMain.item_click(sender: TObject);
var
  i: Integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrid1.FieldCount - 1 do
    if dbgrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrid1.Columns[i].Visible := true;
      break;
    end;
  end
  else
  begin
    for i := 0 to dbgrid1.FieldCount - 1 do
    if dbgrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrid1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  PreColumn := dbgrid1.Columns[0];

  for i:=1 to dbgrid1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrid1.Columns[i-1].Title.Caption ;
    if (i = 5) and ((vprev = '1') or (vprev = '3'))   then
    begin
      dbgrid1.Columns[i-1].Visible:= False;
      item.Enabled:= False;
    end;
    item.Checked := dbgrid1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.pm2.Items.Add(item) ;
  end;
  sql_text:=dm.aqmain.SQL.Text;
  DM.aqmain.Close;
  DM.aqmain.SQL.Text :=DM.aqmain.SQL.Text+'and Data0028.AVL_FLAG='+QuotedStr('N');
  DM.aqmain.Open;
  dm.aqmain.Sort := dbgrid1.Columns[0].FieldName;
  dbgrid1.Columns[0].Title.SortMarker:=smUpEh;
  with frmQuerySet do
  begin
    sgrid1.Cells[0,sgrid1.RowCount-1]:='认可标记';
    sgrid1.Cells[1,sgrid1.RowCount-1]:=' = '+'未认可';
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and Data0028.AVL_FLAG='+QuotedStr('N');
    sgrid1.RowCount:=sgrid1.RowCount+1;
    ListBox3Click(Sender);
  end;
end;

procedure TfrmMain.edt1Change(Sender: TObject);
begin
  if trim(edt1.Text)<> '' then
  DM.aqmain.Filter := PreColumn.FieldName+' like ''%'+trim(edt1.Text)+'%'''
  else
  DM.aqmain.Filter := '';
end;

procedure TfrmMain.btnExportToExcelClick(Sender: TObject);
begin
  if not dm.aqmain.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.dbgrid1,self.Caption);
end;

procedure TfrmMain.btnFieldsVisableClick(Sender: TObject);
begin
  pm2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  if DM.aqmain.IsEmpty then
  n1.Enabled:=false
  else
  n1.Enabled:=true;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  if DM.aqmain.IsEmpty then Exit;
   if (vprev = '1') or (vprev = '3')  then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;
  frmEdit:=tfrmedit.Create(application);
  try
    dm.qryFile.Close;
    dm.qryFile.Parameters[0].Value := DM.aqmainRKEY.Value;
    dm.qryFile.open;
    if frmEdit.ShowModal=mrok then
    begin
      case  frmEdit.ComboBox1.ItemIndex of
      0:
      begin
        DM.aq3.Close;
        DM.aq3.SQL.Text :='update data0028 set data0028.AVL_FLAG='+ QuotedStr('Y')+',data0028.EDI_OUT_FORCST='+common.rkey73+
        ',data0028.TDATE=getdate() where Data0028.rkey='+dm.aqmainRKEY.AsString ;
        DM.aq3.ExecSQL;
        btnRefreshClick(Sender);
      end;
      1:
      begin
        DM.aq3.Close;
        DM.aq3.SQL.Text := 'update data0028 set data0028.AVL_FLAG='+ QuotedStr('N')+
        ',data0028.EDI_OUT_FORCST=0 where Data0028.rkey='+dm.aqmainRKEY.AsString;
        DM.aq3.ExecSQL;
        btnRefreshClick(Sender);
      end;
      2:
      begin
      DM.aq3.Close;
       DM.aq3.SQL.Text :='update data0028 set data0028.AVL_FLAG='+ QuotedStr('T')+',data0028.EDI_OUT_FORCST='+common.rkey73+
       ',data0028.TDATE=getdate() where Data0028.rkey='+dm.aqmainRKEY.AsString ;
       DM.aq3.ExecSQL;
       btnRefreshClick(Sender);
      end;
      end;
    end;
  finally
   frmEdit.Free;
  end;
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:integer;
begin
  presort := dm.aqmain.Sort;
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.aqmain.Close;
    dm.aqmain.SQL.Text:=sql_text;
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    dm.aqmain.SQL.Text:=dm.aqmain.SQL.Text+ frmQuerySet.SGrid1.Cells[2,i];
    dm.aqmain.Open;
    dm.aqmain.Sort :=  presort;
{    dm.aqmain.Sort := dbgrid1.Columns[0].FieldName;
    dbgrid1.Columns[0].Title.SortMarker:=smUpEh;
    PreColumn.Title.Color := clBtnFace;
    dbgrid1.Columns[0].Title.Color := clred;
    PreColumn := dbgrid1.Columns[0];  }
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
  LFrm:TfrmEdit;
begin
  if DM.aqmain.IsEmpty then Exit;
  LFrm:= TfrmEdit.Create(nil);
  try
    dm.qryFile.Close;
    dm.qryFile.Parameters[0].Value := DM.aqmainRKEY.Value;
    dm.qryFile.open;

    LFrm.ComboBox1.Enabled:= False;
    if (vprev = '1') or (vprev = '3') then
    begin
      LFrm.pg1.ActivePageIndex:= 1;
      LFrm.Label18.Visible:= False;
      LFrm.DBEdit15.Visible:=False;
    end;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  ShowMessage('1、权限1与3只能查看(不包括价格)与附件，不能认可;'+#13+
              '2、权限2与4可以认可与查看附件。');
end;

end.
