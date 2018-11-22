unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, Grids, DBGridEh, ExtCtrls, ADODB, Menus,
  ImgList,DateUtils;

type
  TfrmMain = class(TForm)
    adoConn: TADOConnection;
    aqBrowse: TADOQuery;
    aspExec: TADOStoredProc;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    dsBrowse: TDataSource;
    UpDown1: TUpDown;
    edtYear: TEdit;
    Label1: TLabel;
    aqBrowseFromRKEY: TAutoIncField;
    aqBrowseToRKEY: TIntegerField;
    aqBrowseFromDate: TDateTimeField;
    aqBrowseToDate: TDateTimeField;
    aqBrowseOP_DATE: TDateTimeField;
    aqBrowseEMPLOYEE_NAME: TStringField;
    aqBrowseNO: TAutoIncField;
    pm: TPopupMenu;
    N1: TMenuItem;
    aqBrowseCLOSED: TBooleanField;
    aqTmp: TADOQuery;
    N3: TMenuItem;
    imgList: TImageList;
    N2: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure edtYearChange(Sender: TObject);
    procedure pmPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);  //结算
    procedure N2Click(Sender: TObject);  //删除
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);  //查询
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;


implementation

uses common, query, wait;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
//{$IFDEF Release}
  if not App_init_2(adoConn) then
  begin
    showmsg('程序启动失败，请联系管理员！',1);
    Application.Terminate;
  end;

//{$ENDIF}
//{$IFDEF Debug}
{
  adoConn.Connected:= False;
  adoConn.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='1597';
  user_ptr:='3';
}
//{$ENDIF}
  self.caption:= Application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmMain.edtYearChange(Sender: TObject);
begin
  with aqBrowse do
  begin
    close;
    Parameters.ParamByName('Y').Value:= edtYear.Text;
    open;
  end;
end;

procedure TfrmMain.pmPopup(Sender: TObject);
var
  i:Byte;
begin
  if aqBrowse.RecordCount>0 then
  begin
    if aqBrowse.FieldByName('CLOSED').AsBoolean then
    begin
      N1.Enabled:= False;
      N2.Enabled:= True;
      N3.Enabled:= True;
      N4.Enabled:= True;
    end
    else
    begin
      N1.Enabled:= True;
      N2.Enabled:= False;
      N3.Enabled:= False;
      N4.Enabled:= False;
    end;
  end
  else
  begin
    for i:=0 to pm.Items.Count-1 do
      pm.Items[i].Enabled:=False;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Abort;
  end;
  if MessageBox(Handle, '确定要结算吗?', '警告', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    try
      frmWait:=TfrmWait.Create(Application);
      frmWait.Label1.Caption:='正在结算,请稍等!';
      frmWait.Show;
      frmWait.Update;
      frmWait.Animate1.CommonAVI:=aviFindComputer;
      frmWait.Animate1.Active:=True;
      Application.ProcessMessages;
      with aspExec do
      begin
        Close;
        Parameters.ParamByName('@B_162_PTR').Value:= aqBrowse.FieldByName('FromRKEY').AsInteger;
        Parameters.ParamByName('@E_162_PTR').Value:= aqBrowse.FieldByName('ToRKEY').AsInteger;
        Parameters.ParamByName('@OP_BY').Value:= strtoint(common.user_ptr);
        ExecProc;
      end;
      frmWait.Close;
      frmWait.Free;
      edtYearChange(nil);
      Showmessage('结算完成');
    except
      on E:Exception do
      Showmessage(E.Message);
    end;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  if StrToInt(vprev) <> 4 then
  begin
    MessageDlg('对不起!您没有该权限',mtinformation,[mbok],0);
    Abort;
  end;
  if MessageBox(Handle, '确定要删除吗?此操作将不可恢复', '警告', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    try
      with aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Delete From Data0140 Where B_162_PTR='+aqBrowse.FieldByName('FromRKEY').AsString+' AND E_162_PTR='+aqBrowse.FieldByName('ToRKEY').AsString);
        ExecSQL;
      end;
      edtYearChange(nil);
      Showmessage('删除成功');
    except
      on E:Exception do
      Showmessage(E.Message);
    end;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  try
    with TfrmQuery.Create(Application) do
    begin
      Application.ProcessMessages;
      InitForm((Sender as TMenuItem).Tag,
          aqBrowse.FieldByName('FromRKEY').AsInteger,
          aqBrowse.FieldByName('ToRKEY').AsInteger);
      Show;
    end;
  except
    on E:Exception do
    begin
      Showmessage(E.Message);
      frmWait.Close;
      frmWait.Free;
    end;
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
 UpDown1.Position:=yearof(date());
end;

end.
