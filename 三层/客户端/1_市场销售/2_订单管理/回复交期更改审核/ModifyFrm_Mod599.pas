unit ModifyFrm_Mod599;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit,
  Vcl.ComCtrls, RzDTP, RzDBDTP, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Data.DB, Datasnap.DBClient, Vcl.Menus;

type
  TfrmModify_Mod599 = class(TfrmBaseEdit)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    edtOrder: TRKeyRzBtnEdit;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dtpDate: TRzDBDateTimePicker;
    DBGridEh1: TDBGridEh;
    cds174: TClientDataSet;
    ds174: TDataSource;
    cds175: TClientDataSet;
    ds175: TDataSource;
    pm175: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NDel: TMenuItem;
    procedure edtOrderButtonClick(Sender: TObject);
    procedure NAddClick(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDetailType:Integer;     //0新增    1编辑
    procedure GetData(ARkey174:Integer);
  end;

var
  frmModify_Mod599: TfrmModify_Mod599;

implementation

uses uCommFunc,uBaseSinglePickListFrm, DateFrm_Mod599,System.DateUtils;

{$R *.dfm}

{ TForm1 }

procedure TfrmModify_Mod599.GetData(ARkey174: Integer);
var
  LSql174,LSql175:string;
begin
  LSql174:= cds174.CommandText + ' WHERE Data0174.rkey = ' + IntToStr(ARkey174);
  LSql175:= cds175.CommandText + ' WHERE rkey174 = ' + IntToStr(ARkey174);
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql174,LSql175]),[cds174,cds175]) then
  begin
    ShowMessage('取得数据失败，请重试');
    Exit;
  end;
  if (not cds174.IsEmpty) and cds174.FieldByName('IDKey').IsNull then
  begin
    cds174.Edit;
    cds174.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
    cds174.Post;
  end;

  cds175.DisableControls;
  try
    if not cds175.IsEmpty then
    begin
      cds175.First;
      while not cds175.Eof do
      begin
        if cds175.FieldByName('D174_IDKey').AsString = '' then
        begin
          cds175.Edit;
          cds175.FieldByName('D174_IDKey').Value:= cds174.FieldByName('IDKey').Value;
          cds175.Post;
        end;
        cds175.Next;
      end;
    end;
  finally
    cds175.EnableControls;
  end;

end;

procedure TfrmModify_Mod599.NAddClick(Sender: TObject);
var
  LFrm:TfrmDate_Mod599;
  LSchDate:TStringList;
  LRowNO:Integer;
begin
  inherited;
  LFrm:= TfrmDate_Mod599.Create(nil);
  LSchDate:= TStringList.Create;
  cds175.DisableControls;
  try
    LRowNO:= cds175.RecNo;
    cds175.Last;
    if DayOfTheWeek(cds175.FieldByName('finish_Date').AsDateTime) = 6 then
      LFrm.dtpDate.DateTime :=  cds175.FieldByName('finish_Date').AsDateTime + 2
    else
      LFrm.dtpDate.DateTime :=  cds175.FieldByName('finish_Date').AsDateTime + 1;

    cds175.First;
    while not cds175.Eof do
    begin
      LSchDate.Add(cds175.FieldByName('finish_Date').AsString);
      cds175.Next;
    end;
    cds175.RecNo:= LRowNO;

    if LFrm.ShowModal = mrOk then
    begin
      if LSchDate.IndexOf(DateToStr(LFrm.dtpDate.Date)) <> -1 then
      begin
        ShowMessage('完工日期已经存在');
        exit;
      end;
      if StrToInt(Trim(LFrm.edtQty.Text)) >= cds175.FieldByName('finish_quantity').AsInteger then
      begin
        ShowMessage('新完工数量不能大于等于原完工数量！');
        exit;
      end;
      cds175.Edit;
      cds175.FieldByName('finish_quantity').Value:= cds175.FieldByName('finish_quantity').Value - StrToInt(Trim(LFrm.edtQty.Text));
      cds175.Post;

      cds175.Append;
      cds175.FieldByName('D174_IDKey').Value:= cds174.FieldByName('IDKey').Value;
      cds175.FieldByName('finish_quantity').Value:= StrToInt(Trim(LFrm.edtQty.Text));
      cds175.FieldByName('finish_Date').Value:= LFrm.dtpDate.Date;
      cds175.Post;

//      cds175.RecNo:= 1;
//      if cds175.FieldByName('finish_Date').Value <> cds174.FieldByName('newReply_Date').Value then
//      begin
//        cds174.Edit;
//        cds174.FieldByName('newReply_Date').Value:= cds175.FieldByName('finish_Date').Value;
//        cds174.Post;
//      end;
    end;
  finally
    cds175.EnableControls;
    LFrm.Free;
    LSchDate.Free;
  end;
end;

procedure TfrmModify_Mod599.NDelClick(Sender: TObject);
var
  LQty:Integer;
begin
  inherited;
  if cds175.RecordCount = 1 then
  begin
    ShowMessage('最后一条完工日期不能删除！');
    Exit;
  end;
  if MessageDlg('确定删除此完工计划吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    LQty:= cds175.FieldByName('quantity').AsInteger;
    cds175.Delete;
    cds175.RecNo:= 1;
    cds175.Edit;
    cds175.FieldByName('quantity').Value:= cds175.FieldByName('quantity').Value + LQty;
    cds175.Post;

//    if cds175.FieldByName('finish_Date').Value <> cds174.FieldByName('newReply_Date').Value then
//    begin
//      cds174.Edit;
//      cds174.FieldByName('newReply_Date').Value:= cds175.FieldByName('finish_Date').Value;
//      cds174.Post;
//    end;
  end;
end;

procedure TfrmModify_Mod599.NEditClick(Sender: TObject);
var
  LFrm:TfrmDate_Mod599;
  LSchDate:TStringList;
  LDate:TDateTime;
  LRowNO:Integer;
begin
  inherited;
  LFrm:= TfrmDate_Mod599.Create(nil);
  LSchDate:= TStringList.Create;
  cds175.DisableControls;
  try
    LRowNO:= cds175.RecNo;
    LFrm.dtpDate.DateTime :=  cds175.FieldByName('finish_Date').AsDateTime;
    LFrm.edtQty.Text:= cds175.FieldByName('finish_quantity').AsString;
    LDate:= cds175.FieldByName('finish_Date').AsDateTime;
    cds175.EnableControls;
    try
      cds175.First;
      while not cds175.Eof do
      begin
        if LDate <> cds175.FieldByName('finish_Date').AsDateTime then
          LSchDate.Add(cds175.FieldByName('finish_Date').AsString);
        cds175.Next;
      end;
      cds175.RecNo:= LRowNO;
    finally
      cds175.EnableControls;
    end;

    if LFrm.ShowModal = mrOk then
    begin
      if LSchDate.IndexOf(DateToStr(LFrm.dtpDate.Date)) <> -1 then
      begin
        ShowMessage('完工日期已经存在');
        exit;
      end;
      cds175.Edit;
      cds175.FieldByName('finish_Date').Value:= LFrm.dtpDate.Date;
      cds175.FieldByName('finish_quantity').Value:= StrToInt(Trim(LFrm.edtQty.Text));
      cds175.Post;

      cds175.RecNo:= 1;
      if cds175.FieldByName('finish_Date').Value <> cds174.FieldByName('newReply_Date').Value then
      begin
        cds174.Edit;
        cds174.FieldByName('newReply_Date').Value:= cds175.FieldByName('finish_Date').Value;
        cds174.Post;
      end;
    end;
  finally
    cds175.EnableControls;
    LFrm.Free;
    LSchDate.Free;
  end;
end;

procedure TfrmModify_Mod599.btnSaveClick(Sender: TObject);
var
  LQty:Integer;
  LDataPost:OleVariant;
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if cds174.IsEmpty then Exit;

  if FDetailType = 0 then  //新增
  begin
    LSql:= 'select 1 from data0174 where status=0 and so_ptr= ' + cds174.FieldByName('so_ptr').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
      begin
        if not LCds.IsEmpty then
        begin
          ShowMessage('已有该订单的申请未审核');
          exit;
        end;
      end
      else
      begin
        ShowMessage('取得数据失败，请重试');
        exit;
      end;
    finally
      LCds.Free;
    end;
  end;

  if FDetailType = 1 then  //编辑
  begin
    LSql:= 'select 1 from data0174 where status = 1 and rkey ' + cds174.FieldByName('rkey').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
      begin
        if not LCds.IsEmpty then
        begin
          ShowMessage('状态发生改变，可能多人同时操作');
          exit;
        end;
      end
      else
      begin
        ShowMessage('取得数据失败，请重试');
        exit;
      end;
    finally
      LCds.Free;
    end;
  end;
  
  LQty:= 0;
  cds175.DisableControls;
  try
    cds175.First;
    while not cds175.Eof do
    begin
      LQty:= LQty + cds175.FieldByName('finish_quantity').AsInteger;
      cds175.Next;
    end;
  finally
    cds175.EnableControls;
  end;
  if LQty <> cds174.FieldByName('PARTS_ORDERED').AsInteger then
  begin
    ShowMessage('完成数量不等于订单数量,请编辑相等!');
    Exit;
  end;

  LDataPost:= VarArrayCreate([0,1],varVariant);
  if cds174.ChangeCount > 0 then LDataPost[0]:= cds174.Delta;
  if cds175.ChangeCount > 0 then LDataPost[1]:= cds175.Delta;
  if gSvrIntf.IntfPostModData('公共基础',599,LDataPost,0) then
  begin
    ShowMessage('保存成功');
    if cds174.ChangeCount > 0 then cds174.MergeChangeLog ;
    if cds175.ChangeCount > 0 then cds175.MergeChangeLog;
    ModalResult:= mrOk;
  end
  else
  begin
    ShowMessage('保存失败，请重试');
  end;
end;

procedure TfrmModify_Mod599.edtOrderButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
  LSql:string;
  LCds360:TClientDataSet;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(599,StrToInt(edtOrder.DisplayPickID));
    if LFrm.ShowModal= mrOk then
    begin
      cds174.Edit;
      cds174.FieldByName('so_ptr').Value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cds174.FieldByName('proposer').Value:= StrToInt(gVar.rkey05);
      cds174.FieldByName('proposer_Date').Value:= gFunc.GetSvrDateTime(dtdate);
      cds174.FieldByName('oldReply_Date').Value:= LFrm.cdsPick.FieldByName('SCH_DATE').Value;
      cds174.FieldByName('newReply_Date').Value:= LFrm.cdsPick.FieldByName('SCH_DATE').Value;
      cds174.FieldByName('status').Value:= 0;
      cds174.FieldByName('planned_FLAG').Value:= 'N';
      cds174.FieldByName('IDKey').Value:= gFunc.CreateIDKey;

      cds174.FieldByName('PARTS_ORDERED').Value:= LFrm.cdsPick.FieldByName('PARTS_ORDERED').Value;
      cds174.FieldByName('set_ordered').Value:= LFrm.cdsPick.FieldByName('set_ordered').Value;
      cds174.FieldByName('ORIG_REQUEST_DATE').Value:= LFrm.cdsPick.FieldByName('ORIG_REQUEST_DATE').Value;
      cds174.FieldByName('ORIG_SCHED_SHIP_DATE').Value:= LFrm.cdsPick.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
//      cds174.FieldByName('SCH_DATE').Value:= LFrm.cdsPick.FieldByName('SCH_DATE').Value;
      cds174.Post;

      LSql:='SELECT rkey,quantity, sch_date from data0360 where so_ptr = '
                      + IntToStr(LFrm.cdsPick.FieldByName('rkey').Value);
      LCds360:= TClientDataSet.Create(nil);
      try
        if not gSvrIntf.IntfGetDataBySql(LSql,LCds360) then exit;
        if not LCds360.IsEmpty then
        begin
          LCds360.First;
          while not LCds360.Eof do
          begin
            cds175.Append;
            cds175.FieldByName('finish_Date').Value:= LCds360.FieldByName('sch_date').Value;
            cds175.FieldByName('finish_quantity').Value:= LCds360.FieldByName('quantity').Value;
            cds175.FieldByName('D174_IDKey').Value:= cds174.FieldByName('IDKey').Value;
            cds175.Post;
            LCds360.Next;
          end;
        end;
      finally
        LCds360.Free;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
