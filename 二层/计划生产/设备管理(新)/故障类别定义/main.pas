unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGridEh, Menus;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    BtnClose: TBitBtn;
    BtnRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    PreColumn:TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

uses damo,common, FaultTypeSet, FaultName;

{$R *.dfm}

procedure TFrm_main.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_main.BtnRefreshClick(Sender: TObject);
var
  rkey845:integer;
begin
  rkey845 := DM.ADS845rkey.Value;
  dm.ADS845.Close;
  dm.ADS845.Prepared;
  dm.ADS845.Open;
  if rkey845>0 then
  dm.ADS845.Locate('rkey',rkey845,[]);
end;

procedure TFrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS845.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_main.FormCreate(Sender: TObject);
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
// vprev := '3';
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  PreColumn :=DBGridEh1.Columns[0];
  DM.ADS845.Open;
  DM.ADS846.Open;

  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS845.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS845.RecordCount);
end;

procedure TFrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Chr(key)='V')and (ssalt in shift) then
  ShowMessage(DM.ADS845.CommandText);
end;

procedure TFrm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Chr(key)='V') and (ssalt in shift) then
  ShowMessage(DM.ADS846.CommandText);
end;



procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS845.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS845.IndexFieldNames:=Column.FieldName+' DESC';
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_FaultTypeSet := Tfrm_FaultTypeSet.Create(Application);
    frm_FaultTypeSet.v_status := 0;
    if frm_FaultTypeSet.ShowModal =mrok then
    begin
      DM.ADS845.Close;
      DM.ADS845.Open;
      dm.ADS845.Locate('rkey',frm_FaultTypeSet.rkey845,[]);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    frm_FaultTypeSet.Free;
  end;
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_FaultTypeSet := Tfrm_FaultTypeSet.Create(Application);
    frm_FaultTypeSet.v_status := 1;
    if frm_FaultTypeSet.ShowModal =mrok then
    begin
      BtnRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    frm_FaultTypeSet.Free;
  end;
end;

procedure TFrm_main.N3Click(Sender: TObject);
var
  num1: Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if MessageDlg('您确删除该预算代码吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      num1 :=0;
      DM.ADOConnection1.BeginTrans;
      with dm.tmp do
      begin
        Close;
        SQL.Text :='delete data0846 where D845_ptr='+dm.ADS845rkey.AsString;
        ExecSQL;
        close;
        sql.Text:='delete data0845 where rkey='+dm.ADS845rkey.AsString ;
        if ExecSQL>0 then
        begin
          num1 :=1;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      if num1=1 then
      begin
        common.ShowMsg('删除操作成功！',1);
        self.BtnRefreshClick(Sender);
      end;
    except
      on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('该故障类别被设备代码定义引用，不能删除');
//        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_FaultName := Tfrm_FaultName.Create(Application);
    frm_FaultName.v_status := 0;
    if frm_FaultName.ShowModal =mrok then
    begin
      DM.ADS846.Close;
      DM.ADS846.Open;
      dm.ADS846.Locate('rkey',frm_FaultName.rkey846,[]);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    frm_FaultName.Free;
  end;
end;

procedure TFrm_main.N5Click(Sender: TObject);
var
  rkey846:Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_FaultName := Tfrm_FaultName.Create(Application);
    frm_FaultName.v_status := 1;
    if frm_FaultName.ShowModal =mrok then
    begin
      rkey846 := DM.ADS846rkey.Value;
      DM.ADS846.Close;
      DM.ADS846.Open;
      dm.ADS846.Locate('rkey',rkey846,[]);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    frm_FaultName.Free;
  end;
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if MessageDlg('您确删除该预算代码吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      with dm.tmp do
      begin
        Close;
        SQL.Text :='delete data0846 where rkey='+dm.ADS846rkey.AsString;
        if ExecSQL>0 then
        begin
          ShowMessage('删除操作成功');
          DM.ADS846.Close;
          DM.ADS846.Open;
        end;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('该故障名称已被设备维修申请引用，不能删除');
//        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_main.PopupMenu2Popup(Sender: TObject);
begin
  N4.Enabled :=  (strtoint(vprev) in [2,4]) and (not DM.ADS845.IsEmpty);
  N5.Enabled := (not DM.ADS846.IsEmpty) and (strtoint(vprev) in [2,4]);
  N6.Enabled := (not DM.ADS846.IsEmpty) and (strtoint(vprev) in [2,4]);
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled :=  (strtoint(vprev) in [2,4]);
  N2.Enabled := (not DM.ADS845.IsEmpty) and (strtoint(vprev) in [2,4]);
  N3.Enabled := (not DM.ADS845.IsEmpty) and (strtoint(vprev) in [2,4]);
end;

end.
