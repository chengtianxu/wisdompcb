unit PasAllPause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TFrmAllPause = class(TForm)
    Panel5: TPanel;
    d34Rkey: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    edtHour: TEdit;
    procedure edtHourKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAllPause: TFrmAllPause;

implementation

uses common,pasOnlineQuery,PasPublic, PasDM;

{$R *.dfm}

procedure TFrmAllPause.edtHourKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
  if (Key=#13) then BitBtn2.SetFocus;
end;

procedure TFrmAllPause.BitBtn2Click(Sender: TObject);
var Sqlstr2:string;
    tmpAdo:TADOQuery;
    i,iSum:Integer;
begin
  if (Trim(edtHour.Text)='') then
  begin
    ShowMsg('请确定暂停小时数！',1);
    Exit;
  end;
  if (MessageBox(Handle,PAnsiChar('所有当前在线工序将会暂停【'+edtHour.Text+'】小时数,'+#13+' 确定全部工序暂停吗?'),'暂停全部工序提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
  try
    screen.Cursor:=crHourGlass;
    Sqlstr2:='';
    DM.ADOQuery4.DisableControls;
    DM.ADOQuery4.Close;
    DM.ADOQuery4.SQL.Text:=FrmOnlineQuery.SQLTxt;
    DM.ADOQuery4.Prepared;
    DM.ADOQuery4.Open;
    DM.ADOQuery4.RecordCount;
    if (not DM.ADOQuery4.IsEmpty) then
    begin
      try
        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=DM.ADOConnection1 ;
        iSum:=0;
        DM.ADOQuery4.First;
        for i :=0  to DM.ADOQuery4.RecordCount-1 do
        begin
          if (DM.ADOQuery4.FieldByName('是否派工').AsString='是') then
          begin
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='update dbo.data0056 set FLOW_NO=:FLOW_NO where WO_PTR=:WO_PTR';
            tmpAdo.Parameters.ParamByName('FLOW_NO').Value:=StrToFloat(edtHour.Text);
            tmpAdo.Parameters.ParamByName('WO_PTR').Value:=DM.ADOQuery4.FieldByName('RKey').AsString;
            tmpAdo.ExecSQL;
            iSum:=iSum+1;
            DM.ADOQuery4.Next;
          end;
        end;
        DM.ADOQuery4.First;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
        tmpAdo:=nil;
      end;
    end;
  finally
    DM.ADOQuery4.EnableControls;
  end;
  try
    Sqlstr2:='';
    DM.ADOQuery4.DisableControls;
    DM.ADOQuery4.Close;
    DM.ADOQuery4.SQL.Text:=FrmOnlineQuery.SQLTxt;
    DM.ADOQuery4.Prepared;
    DM.ADOQuery4.Open;
  finally
    DM.ADOQuery4.EnableControls;
  end;
  screen.Cursor:=crDefault;
  if (iSum>0) then
  begin
    ShowMsg('工序批量暂停成功！',1);
  end;
  modalresult:=mrok;
end;

end.
