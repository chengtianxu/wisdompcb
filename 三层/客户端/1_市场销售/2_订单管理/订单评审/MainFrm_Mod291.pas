unit MainFrm_Mod291;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod291 = class(TfrmBaseMain)
    pnl1: TPanel;
    grpStatus: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    NAuth: TMenuItem;
    NUnAuth: TMenuItem;
    procedure chk1Click(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure NAuthClick(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure NUnAuthClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
  private
    LEDate:TDateTime;
    function GetStatusWhere:string;
    function GetDeptWhere:string;
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;

  end;

var
  frmMain_Mod291: TfrmMain_Mod291;

implementation

uses uCommFunc,System.DateUtils, DetailFrm_Mod291;

{$R *.dfm}

{ TfrmMain_Mod291 }

procedure TfrmMain_Mod291.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'DATA0060.ent_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',LEDate) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',LEDate+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod291.chk1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmMain_Mod291.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('so_oldnew').AsString = '新单' then
            ehMain.Canvas.Font.Color := clred;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain_Mod291.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
    LEDate:= gFunc.GetSvrDateTime(dtdate);
    FMainWhere:= ' AND DATA0060.quote_price = 0 AND DATA0060.ent_date BETWEEN '
          + QuotedStr(FormatDateTime('YYYY-MM-DD',LEDate))
          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1)));
  end;
  FWhere2:= GetStatusWhere;
  FWhere3:= GetDeptWhere;
  inherited;
end;

function TfrmMain_Mod291.GetDeptWhere: string;
var
  LCds:TClientDataSet;
  LSql:string;
begin
  Result:= '';
  LSql:=' SELECT DATA0005.employee_id,DATA0034.dept_name '+ #13+
        ' FROM DATA0005 ' + #13+
        '    INNER JOIN DATA0034 ON DATA0034.RKEY = DATA0005.employee_id '+ #13+
        ' WHERE DATA0005.RKEY = ' + gVar.rkey05;
  LCds:= TClientDataSet.Create(nil);
  try
    if NOT gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      ShowMessage('取得部门失败！');
      exit;
    end
    else
    begin
      Self.Caption:=  LCds.FieldByName('dept_name').AsString + Self.Caption;
      Result:= ' AND Data0090.dept_ptr = ' + LCds.FieldByName('employee_id').AsString;
    end;
  finally
    LCds.Free;
  end;
end;

function TfrmMain_Mod291.GetStatusWhere: string;
begin
  Result:='';
  if (chk1.Checked and chk2.Checked) then Result:= ''
  else if chk1.Checked then Result:= ' AND DATA0090.auth_date IS NULL '
  else if chk2.Checked then Result:= ' AND Data0090.auth_date IS NOT NULL';
end;

procedure TfrmMain_Mod291.NAuthClick(Sender: TObject);
var
  LFrm: TfrmDetail_Mod291;
begin
  inherited;
  LFrm:= TfrmDetail_Mod291.Create(nil);
  try
    LFrm.LDetailType := 0;    //评审
    LFrm.GetData(cdsMain.FieldByName('rkey90').AsInteger,cdsMain.FieldByName('rkey60').AsInteger
              ,cdsMain.FieldByName('rkey25').AsInteger,LEDate);
    if LFrm.cds90.Locate('dept_ptr',cdsMain.FieldByName('dept_ptr').AsString,[]) then
    begin
      if not (LFrm.cds90.FieldByName('auth_date').IsNull
             and LFrm.cds60.FieldByName('rma_ptr').IsNull) then
      begin
        ShowMessage('状态发生改变,可能其它人员操作,刷新后重试');
        exit;
      end;
    end;
    LFrm.InitFrm;
    if LFrm.ShowModal = mrOk then btnRefreshClick(nil)
    else
    begin
      if LFrm.LIsChang then
      begin
        LFrm.cds360.DisableControls;
        try
          LFrm.cds360.First;
          while not LFrm.cds360.Eof do LFrm.cds360.Delete;

          LFrm.cds360_2.First;
          while not LFrm.cds360_2.Eof do
          begin
            LFrm.cds360.Append;
            LFrm.cds360.FieldByName('so_ptr').Value:= LFrm.cds360_2.FieldByName('so_ptr').Value;
            LFrm.cds360.FieldByName('quantity').Value:= LFrm.cds360_2.FieldByName('quantity').Value;
            LFrm.cds360.FieldByName('sch_date').Value:= LFrm.cds360_2.FieldByName('sch_date').Value;
            LFrm.cds360.FieldByName('planned_qty').Value:= LFrm.cds360_2.FieldByName('planned_qty').Value;
            LFrm.cds360.Post;
            LFrm.cds360_2.Next
          end;
          if not gSvrIntf.IntfPostDataByTable('data0360',LFrm.cds360.Delta) then
          begin
            ShowMessage('完工计划退回失败,请联系管理员');
            Exit;
          end;
        finally
          LFrm.cds360.EnableControls;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod291.NUnAuthClick(Sender: TObject);
var
  LFrm: TfrmDetail_Mod291;
begin
  inherited;
  LFrm:= TfrmDetail_Mod291.Create(nil);
  try
    LFrm.LDetailType := 1;    //取消评审
    LFrm.GetData(cdsMain.FieldByName('rkey90').AsInteger,cdsMain.FieldByName('rkey60').AsInteger
              ,cdsMain.FieldByName('rkey25').AsInteger,LEDate);
    if LFrm.cds60.FieldByName('quote_price').Value
            <> cdsMain.FieldByName('quote_price').Value then
    begin
      ShowMessage('评审状态发生改变,可能其它人员操作,刷新后重试!');
      Exit;
    end;

    LFrm.InitFrm;
    if LFrm.ShowModal = mrOk then btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod291.pmMainPopup(Sender: TObject);
begin
  inherited;
  NAuth.Enabled:=(not cdsMain.IsEmpty) and cdsMain.FieldByName('auth_date').IsNull;
  NUnAuth.Enabled:= (not cdsMain.IsEmpty) and (not cdsMain.FieldByName('auth_date').IsNull);
end;

end.
