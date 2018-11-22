unit PasBadRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PasBadDetail,Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus, ComCtrls;

type
  TfrmBadRecord = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    lbl1: TLabel;
    edtFilter: TEdit;
    ehBadRecord: TDBGridEh;
    pmBadRecord: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NCheck: TMenuItem;
    NDelete: TMenuItem;
    N1: TMenuItem;
    NEnd: TMenuItem;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl2: TLabel;
    chk1: TCheckBox;
    lbl3: TLabel;
    procedure NAddClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure ehBadRecordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ehBadRecordTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure ehBadRecordDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dtp1Change(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure NCheckClick(Sender: TObject);
    procedure NDeleteClick(Sender: TObject);
    procedure pmBadRecordPopup(Sender: TObject);
    procedure NEndClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    mainsql:string;
     preColumn:TColumnEh;
     function getStatus:string;
     procedure LoadData(AForm:TfrmbadDetail);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBadRecord: TfrmBadRecord;

implementation

uses
   DAMO,common,DB,DateUtils;

{$R *.dfm}

procedure TfrmBadRecord.NAddClick(Sender: TObject);
var
   Lfrm:TfrmBadDetail;
begin
  Lfrm:= TfrmBadDetail.Create(Self);
  try
    Lfrm.EditType:= 0;
    if Lfrm.ShowModal=mrok then
    begin
      ShowMessage('保存成功！！');
      btnRefreshClick(nil);
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmBadRecord.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  mainrkey:= DM.adoBadRecordrkey.Value;
  DM.adoBadRecord.Close;
  DM.adoBadRecord.Open;
  if mainrkey>0 then DM.adoBadRecord.Locate('rkey',mainrkey,[]);
end;

procedure TfrmBadRecord.FormShow(Sender: TObject);
begin
  mainsql:= DM.adoBadRecord.CommandText;
  preColumn:=ehBadRecord.Columns[0];
  lbl1.Caption:=preColumn.Title.Caption;
  dtp2.Date:= common.getsystem_date(dm.adoTmp,1)+1;
  dtp1.Date:= IncMonth(dtp2.Date,-3);
  dm.adoBadRecord.Close;
  DM.adoBadRecord.CommandText:= mainsql + ' where QC_IQCBadRecord.DiscoverDate between ' +
          QuotedStr(DateToStr(dtp1.Date)) + ' and ' +  QuotedStr(DateToStr(dtp2.Date)) + getStatus;
  DM.adoBadRecord.Open;
end;

procedure TfrmBadRecord.btnExportClick(Sender: TObject);
begin
  if  not DM.adoBadRecord.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(ehBadRecord,'不良记录');
end;

procedure TfrmBadRecord.ehBadRecordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssAlt in Shift) then
  begin
    ShowMessage(DM.adoBadRecord.CommandText);
  end;
end;

procedure TfrmBadRecord.ehBadRecordTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker= smUpEh then
   begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoBadRecord.IndexFieldNames:=Column.FieldName + ' DESC';
   end
  else
   begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoBadRecord.IndexFieldNames:=Column.FieldName;
   end;

  if (Column.Title.Caption<>preColumn.Title.Caption) and
     (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbl1.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    edtFilter.Text:='';
    preColumn:=Column;
  end;

end;

procedure TfrmBadRecord.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoBadRecord.Filtered:=False;
    DM.adoBadRecord.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
    DM.adoBadRecord.Filtered:=True;
  end
  else
  begin
    DM.adoBadRecord.Filter:='';
  end;
end;

procedure TfrmBadRecord.ehBadRecordDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.adoBadRecordstatus.Value = 1 then
     ehBadRecord.Canvas.Font.Color := clred;
  ehBadRecord.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmBadRecord.dtp1Change(Sender: TObject);
begin
  dm.adoBadRecord.Close;
  DM.adoBadRecord.CommandText:= mainsql + ' where QC_IQCBadRecord.DiscoverDate between ' +
          QuotedStr(DateToStr(dtp1.Date)) + ' and ' +  QuotedStr(DateToStr(dtp2.Date))
          + getStatus;
  DM.adoBadRecord.Open;
end;

procedure TfrmBadRecord.chk1Click(Sender: TObject);
begin
  dm.adoBadRecord.Close;
  DM.adoBadRecord.CommandText:= mainsql + ' where QC_IQCBadRecord.DiscoverDate between ' +
          QuotedStr(DateToStr(dtp1.Date)) + ' and ' +  QuotedStr(DateToStr(dtp2.Date))
          + getStatus;
  DM.adoBadRecord.Open;
end;

function TfrmBadRecord.getStatus: string;
begin
  Result:='';
  if not chk1.Checked then
    Result:= ' AND QC_IQCBadRecord.Status= 0';
end;

procedure TfrmBadRecord.NEditClick(Sender: TObject);
var
   Lfrm:TfrmBadDetail;
begin
  Lfrm:= TfrmBadDetail.Create(Self);
  try
    Lfrm.EditType:= 1;
    LoadData(Lfrm);
    if Lfrm.ShowModal=mrok then
    begin
      ShowMessage('保存成功！！');
      btnRefreshClick(nil);
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmBadRecord.LoadData(AForm: TfrmbadDetail);
begin
  AForm.edtCode.Text:= DM.adoBadRecordCODE.AsString;
  AForm.edtCode.Tag:= DM.adoBadRecordrkey23.AsInteger;
  AForm.lbl3.Caption:= DM.adoBadRecordSUPPLIER_NAME.AsString;
  AForm.edtINVT.Text:= DM.adoBadRecordINV_PART_NUMBER.AsString;
  AForm.edtINVT.Tag:= DM.adoBadRecordrkey17.AsInteger;
  AForm.lbl4.Caption:= DM.adoBadRecordINV_PART_DESCRIPTION.AsString;
  AForm.dtpk1.Date:= DM.adoBadRecordDiscoverDate.AsDateTime;
  AForm.edtQuan.Text:= DM.adoBadRecordBadQuantity.AsString;
  AForm.edtBatch.Text:= DM.adoBadRecordBatchNO.AsString;
  AForm.edtTracert.Text:= DM.adoBadRecordUSER_FULL_NAME.AsString;
  AForm.edtTracert.Tag:= DM.adoBadRecordTrancertMen.AsInteger;
  AForm.chkReport.Checked:= DM.adoBadRecordIsReport.AsBoolean;
  AForm.chkClose.Checked:= DM.adoBadRecordIsClose.AsBoolean;
  AForm.mmo1.Lines.Text:= DM.adoBadRecordBadRemark.AsString;
  AForm.mmo2.Lines.Text:= DM.adoBadRecordResult.AsString;
end;

procedure TfrmBadRecord.NCheckClick(Sender: TObject);
var
   Lfrm:TfrmBadDetail;
begin
  Lfrm:= TfrmBadDetail.Create(Self);
  try
    Lfrm.EditType:= 2;
    LoadData(Lfrm);
    if Lfrm.ShowModal=mrok then
    begin
      ShowMessage('保存成功！！');
      btnRefreshClick(nil);
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmBadRecord.NDeleteClick(Sender: TObject);
begin
  if MessageDlg('确定要删除记录吗？',mtWarning,[mbYes,mbNo],0) = mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:='DELETE FROM QC_IQCBadRecord where rkey= '+ DM.adoBadRecordrkey.AsString;
      ExecSQL;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmBadRecord.pmBadRecordPopup(Sender: TObject);
begin
  NEdit.Enabled:= (DM.adoBadRecordrkey.AsInteger>0) and ((vprev='2') or (vprev='4')) and (dm.adoBadRecordStatus.AsInteger = 0);
  NCheck.Enabled:=  DM.adoBadRecordrkey.AsInteger>0;
  NDelete.Enabled:= (DM.adoBadRecordrkey.AsInteger>0) and ((vprev='2') or (vprev='4')) and (dm.adoBadRecordStatus.AsInteger = 0);
  NEnd.Enabled:= (DM.adoBadRecordrkey.AsInteger>0) and (vprev='4') and (DM.adoBadRecordStatus.AsInteger=0);
end;

procedure TfrmBadRecord.NEndClick(Sender: TObject);
begin
  if MessageDlg('确定要完成此记录吗？',mtWarning,[mbYes,mbNo],0) = mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'update QC_IQCBadRecord set status=1,modidate=getdate(),IsClose= ''true'' where rkey='
      + DM.adoBadRecordrkey.AsString ;
//      ShowMessage(SQL.Text);
      ExecSQL;
      ShowMessage('记录已完成！');
      btnRefreshClick(nil);
    end;
  end;
end;

procedure TfrmBadRecord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.adoBadRecord.Close;
  DM.adoBadRecord.CommandText:= mainsql;
end;

end.
