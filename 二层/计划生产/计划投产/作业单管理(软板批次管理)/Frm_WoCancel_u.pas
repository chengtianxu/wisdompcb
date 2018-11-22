unit Frm_WoCancel_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, DBClient,
  Provider, ADODB, ComCtrls;

type
  TFrm_WoCancel = class(TForm)
    Panel1: TPanel;
    labelKey: TLabel;
    btnRefresh: TSpeedButton;
    BtClose: TBitBtn;
    BitBtn2: TBitBtn;
    edtKey: TEdit;
    BtOk: TSpeedButton;
    Grd: TDBGridEh;
    DS: TDataSource;
    CDS: TClientDataSet;
    ADODS_tmp: TADODataSet;
    ADODS_tmpSel: TBooleanField;
    ADODS_tmpWORK_ORDER_NUMBER: TStringField;
    ADODS_tmpCUT_NO: TStringField;
    ADODS_tmpMANU_PART_NUMBER: TStringField;
    ADODS_tmpMANU_PART_DESC: TStringField;
    ADODS_tmpintime: TDateTimeField;
    ADODS_tmpEmployee_name: TStringField;
    ADODS_tmpQTY_BACKLOG: TFloatField;
    ADODS_tmpPANELS: TIntegerField;
    ADODS_tmpstep: TSmallintField;
    ADODS_tmpbom_ptr: TIntegerField;
    DtPrdvd: TDataSetProvider;
    ADODS_tmprkey: TIntegerField;
    Label2: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    ADODS_tmpquan_sch: TFloatField;
    procedure BtCloseClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure GrdTitleClick(Column: TColumnEh);
    procedure edtKeyChange(Sender: TObject);
    procedure dtpStartDateChange(Sender: TObject);
  private
    vColumn:TColumnEh;
    procedure savVal;
  public
  class procedure init;
    { Public declarations }
  end;

  
implementation
{$R *.dfm}

uses DM;


class procedure TFrm_WoCancel.init;
begin
  with TFrm_WoCancel.Create(nil) do
  try
    vColumn:=Grd.Columns[1];
    labelKey.Caption:=vColumn.Title.Caption;
    ADODS_Tmp.close;
    ADODS_Tmp.CommandText:='exec WO_Split;2';
    ADODS_Tmp.Open;
    CDS.Data:=DtPrdvd.Data;
    vColumn:=Grd.Columns[1];
    dtpStartDate.Date:=sysdate-60;
    dtpEndDate.Date:=sysdate+2;
    showmodal;
  finally
    free;
  end;
end;

procedure TFrm_WoCancel.savVal;
var sW,sW1:string;
    i:integer;
    label L;
begin
  sW:='';
  sW1:='';
  CDS.Filter:='Sel=1';
  CDS.Filtered:=true;
  CDS.First;
  i:=0;
  Dmcon.ADOConnection1.BeginTrans;
  try
    while not CDS.Eof do
    begin
      Dmcon.tmpQry.Close;
      Dmcon.tmpQry.SQL.Text:='select top 1 rkey from data0056 where wo_ptr='+CDS.fieldbyname('rkey').AsString+
                             ' and step=(select min(data0038.step_number) from data0038 '+
                             'inner join data0034 on data0038.dept_ptr=data0034.rkey '+
                             'where data0038.source_ptr='+CDS.fieldbyname('Bom_ptr').AsString+' and data0034.barcode_entry_flag=''Y'')' ;
      Dmcon.tmpQry.Open;       //最小在线工序步骤不存在，说明已过数到其他工序
      if Dmcon.tmpQry.IsEmpty then
      begin
        if sW='' then sW:=CDS.fieldbyname('WORK_ORDER_NUMBER').AsString else sW:=sW+','+CDS.fieldbyname('WORK_ORDER_NUMBER').AsString;
      end else begin
        Dmcon.tmpQry.Close;
        Dmcon.tmpQry.SQL.Text:='select top 1 rkey from data0058 where wo_ptr='+CDS.fieldbyname('rkey').AsString;
        Dmcon.tmpQry.Open;
        if not Dmcon.tmpQry.IsEmpty then
          sW:=sW+CDS.fieldbyname('WORK_ORDER_NUMBER').AsString
        else begin
          Dmcon.tmpQry.Close;
          Dmcon.tmpQry.SQL.Text:='delete from data0048 where wo_ptr='+CDS.fieldbyname('rkey').AsString;
          Dmcon.tmpQry.ExecSQL;

          Dmcon.tmpQry.SQL.Text:='update data0492 set waitfor_release=IsNULL(waitfor_release,0)+'+cds.fieldbyname('quan_sch').AsString+
                                 ',WIP_Qty=ISNULL(WIP_QTY,0)-'+CDS.fieldbyname('quan_sch').AsString+
                                 ' FROM dbo.Data0006 INNER JOIN dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO where Data0006.rKey='+CDS.fieldbyname('rkey').AsString;
          Dmcon.tmpQry.ExecSQL;

          Dmcon.tmpQry.Close;
          Dmcon.tmpQry.SQL.Text:='update data0006 set prod_status = 2,release_date=null where rKey='+CDS.fieldbyname('rkey').AsString;
          Dmcon.tmpQry.ExecSQL;

          Dmcon.tmpQry.Close;
          Dmcon.tmpQry.SQL.Text:='delete from data0056 where wo_ptr='+CDS.fieldbyname('rkey').AsString;
          if Dmcon.tmpQry.ExecSQL=0 then
          begin
            Dmcon.ADOConnection1.RollbackTrans;
            showmessage('取消发放失败,多人同时取消操作...');
            CDS.Filtered:=false;
            btnRefreshClick(nil);
            exit;
          end;
          inc(i);
          if sW1='' then
            sW1:=CDS.fieldbyname('WORK_ORDER_NUMBER').AsString
          else
            sW1:=sW1+','+CDS.fieldbyname('WORK_ORDER_NUMBER').AsString;
          if i mod 2=0 then sW1:=sW1+#13;
        end;
      end;
      CDS.Next;
    end;
    Dmcon.ADOConnection1.CommitTrans;

    btnRefreshClick(nil);
    CDS.Filtered:=false;
    if sW1<>'' then sW1:='以下工单已成功取消：'+#13+sW1;
    if sW<>''  then sW1:=sW1+#13+'以下工单已在生产中或已不在线,不能取消:'+#13+sW;
    if sW1<>'' then showmessage(sW1);
  except
    Dmcon.ADOConnection1.RollbackTrans;
    showmessage('取消发放失败,请与管理员联系...');
    CDS.Filtered:=false;
    btnRefreshClick(nil);
  end;

end;

procedure TFrm_WoCancel.BtCloseClick(Sender: TObject);
begin
  modalresult:=mrcancel;
end;

procedure TFrm_WoCancel.BtOkClick(Sender: TObject);
begin
  savVal;
end;

procedure TFrm_WoCancel.btnRefreshClick(Sender: TObject);
begin
  ADODS_Tmp.close;
  ADODS_Tmp.CommandText:='exec WO_Split;2';
  ADODS_Tmp.Open;
  if CDS.IndexName<>'' then CDS.DeleteIndex(CDS.IndexName);
  CDS.Close;
  CDS.Data:=DtPrdvd.Data;
end;

procedure TFrm_WoCancel.GrdTitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  vColumn.Title.Color:=clBtnFace;
  vColumn := Column;
  vColumn.Title.Color:=clred;
  labelKey.Caption := Column.Title.Caption;

  if TClientDataSet(Column.Field.DataSet).IsEmpty then exit;
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(Column.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(Column.Field.DataSet).IndexName:='';
    TClientDataSet(Column.Field.DataSet).DeleteIndex(OldIndex);
  end;
  if Column.Title.SortMarker = smDownEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixPrimary]);
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
    Column.Title.SortMarker := smNoneEh
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixDescending]);
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smDownEh;
  end;

  edtKey.Visible:=not (Column.Field.DataType  in [ftDate, ftDateTime]);
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  labelKey.Visible:= edtKey.Visible;


  dtpStartDate.Visible:=(Column.Field.DataType  in [ftDate, ftDateTime]);
  dtpEndDate.Visible:=dtpStartDate.Visible;
  Label2.Visible:=dtpStartDate.Visible;
  if Label2.Visible then dtpStartDateChange(nil);
end;

procedure TFrm_WoCancel.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
begin
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    CDS.Filtered:= false
  else begin
    if (vColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      CDS.Filter := vColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      CDS.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := vColumn.Field.FieldName+'>='+TmpStr;
      CDS.Filter := sFilter;
      CDS.Filtered:= true;
    end;
  end;
end;

procedure TFrm_WoCancel.dtpStartDateChange(Sender: TObject);
begin
  if vColumn.Field.DataType in [ftDate, ftDateTime] then
  begin
    CDS.Filter := vColumn.Field.FieldName+'>='''+datetimetostr(dtpStartDate.date)+''' and '+
                  vColumn.Field.FieldName+'<='''+datetimetostr(dtpEndDate.date)+'''';
    CDS.Filtered:= true;
  end;
end;

end.
