unit Frm_back_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh , ADODB,
  DBClient, TConnect, Provider;

type
  TFrm_back = class(TForm)
    Panel1: TPanel;
    BtBack: TBitBtn;
    BtCancel: TBitBtn;
    Grd1: TDBGridEh;
    ds251: TDataSource;
    qry251: TADOQuery;
    qry251manu_part_number: TStringField;
    qry251manu_part_desc: TStringField;
    qry251REPORT_UNIT_VALUE1: TBCDField;
    qry251WORK_ORDER_NUMBER: TStringField;
    qry251ctime: TDateTimeField;
    qry251cpcs: TIntegerField;
    qry251cpnl: TIntegerField;
    qry251cuser: TStringField;
    qry251ABBR_NAME: TStringField;
    qry251sales_order: TStringField;
    qry251PO_NUMBER: TStringField;
    qry251ouser: TStringField;
    qry251otime: TDateTimeField;
    qry251status: TIntegerField;
    qry251BKNote: TStringField;
    qry251rkey251: TAutoIncField;
    qry251rkey60: TIntegerField;
    qry251wo_ptr: TIntegerField;
    cds251: TClientDataSet;
    qry251checked: TBooleanField;
    dsp1: TDataSetProvider;
    cds251manu_part_number: TStringField;
    cds251manu_part_desc: TStringField;
    cds251REPORT_UNIT_VALUE1: TBCDField;
    cds251WORK_ORDER_NUMBER: TStringField;
    cds251ctime: TDateTimeField;
    cds251cpcs: TIntegerField;
    cds251cpnl: TIntegerField;
    cds251cuser: TStringField;
    cds251ABBR_NAME: TStringField;
    cds251sales_order: TStringField;
    cds251PO_NUMBER: TStringField;
    cds251ouser: TStringField;
    cds251otime: TDateTimeField;
    cds251status: TIntegerField;
    cds251BKNote: TStringField;
    cds251rkey251: TAutoIncField;
    cds251rkey60: TIntegerField;
    cds251wo_ptr: TIntegerField;
    cds251checked: TBooleanField;
    edtFilter: TLabeledEdit;
    procedure BtBackClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FHotColumn: TColumnEh;
    procedure GetData;
  public

  end;

implementation

uses DM_u ;

{$R *.dfm}

procedure TFrm_back.BtBackClick(Sender: TObject);
var
  LSelArr: array of Integer;
  lsql : string;
  I: Integer;
  LNowTime: TDateTime;
begin
  if dm.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能操作');
    Exit;
  end;
  if messagedlg('确定退回所选记录吗?'+ #13,mtconfirmation,[mbYes,mbNo],0) = mrNo then exit;
  SetLength(LSelArr,0);
  cds251.Filter := 'checked = 1';
  cds251.Filtered := True;
  cds251.DisableControls;
  cds251.First;
  try
    while not cds251.Eof do
    begin
      if cds251.FieldByName('checked').AsBoolean then
      begin
        SetLength(LSelArr,Length(LSelArr)+1);
        LSelArr[High(lselarr)] := cds251.fieldbyname('rkey251').AsInteger;
      end;
      cds251.Next;
    end;
    if Length(LSelArr) = 0 then
    begin
      ShowMessage('请选择退回的记录');
      Exit;
    end;
    GetData;
    cds251.Filtered := False;
    DM.con1.BeginTrans;
    for I := 0 to Length(LSelArr) - 1 do
    begin
      if cds251.Locate('rkey251',LSelArr[I],[]) then
      begin
        LNowTime := dm.GetServerDatetime;
        //251
        LSql := 'select * from data0251 where rkey =' + cds251.fieldbyname('rkey251').AsString;
        if dm.SqlOpen(LSql) then
        begin
          dm.qrytmp.Edit;
          dm.qrytmp.FieldByName('ouser_ptr').AsString := user_ptrCaption;
          dm.qrytmp.FieldByName('otime').AsDateTime := LNowTime;
          dm.qrytmp.FieldByName('status').AsInteger := 3;
          dm.qrytmp.Post;
        end;

        //56
        LSql := 'select * from data0056 where wo_ptr = ' + cds251.fieldbyname('wo_ptr').AsString;
        if dm.SqlOpen(LSql) then
        begin
          dm.qrytmp.Edit;
          dm.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger := dm.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger - cds251.fieldbyname('cpcs').AsInteger;
          dm.qrytmp.FieldByName('TO_BE_CANCD').AsInteger := dm.qrytmp.FieldByName('TO_BE_CANCD').AsInteger - cds251.fieldbyname('cpnl').AsInteger;;
          dm.qrytmp.FieldByName('QTY_BACKLOG').AsInteger := dm.qrytmp.FieldByName('QTY_BACKLOG').AsInteger + cds251.fieldbyname('cpcs').AsInteger;
          dm.qrytmp.FieldByName('PANELS').AsInteger := dm.qrytmp.FieldByName('PANELS').AsInteger + cds251.fieldbyname('cpnl').AsInteger;;
          dm.qrytmp.Post;
        end;

        //60
        LSql := 'select REPUT_APPR_BY from data0060 where rkey = ' + IntToStr(cds251.fieldbyname('rkey60').AsInteger);
        if dm.SqlOpen(LSql) then
        begin
          if not dm.qrytmp.IsEmpty then
          begin
            dm.qrytmp.Edit;
            dm.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger := dm.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger - cds251.fieldbyname('cpcs').AsInteger;;
            dm.qrytmp.Post;
          end;
        end;
      end;
    end;
    dm.con1.CommitTrans;
    ModalResult := mrOk;
  finally
    if DM.con1.InTransaction then
    begin
      DM.con1.RollbackTrans;
      ShowMessage('退回失败');
    end;
    cds251.EnableControls;
  end;
end;


procedure TFrm_back.Grd1TitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;
  edtFilter.SetFocus;
end;

procedure TFrm_back.edtFilterChange(Sender: TObject);
var
  LCds: TClientDataSet;
  tmpstr,sFilter: string;
begin
  LCds := TClientDataSet(FHotColumn.Field.DataSet);
  //if LCds.IsEmpty then Exit;
  tmpstr:= trim(edtFilter.Text);
  if tmpstr = '' then
    LCds.Filtered := False
  else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      LCds.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      LCds.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        LCds.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      LCds.Filter := sFilter;
      LCds.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      LCds.Filter := FHotColumn.Field.FieldName + sFilter;
      LCds.Filtered:= true;
    end;    
  end;
end;

procedure TFrm_back.GetData;
begin
  qry251.Close;
  qry251.Open;
  cds251.Data := dsp1.Data;
end;

procedure TFrm_back.FormShow(Sender: TObject);
begin
  GetData;
  Grd1TitleClick(Grd1.Columns[1]);

end;

end.
