unit PrintFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, StdCtrls, ExtCtrls, Buttons, DM, DB,
  ADODB, Menus, ppStrtch, ppMemo, ppBarCod, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppEndUsr;

type
  TfrmPrint = class(TForm)
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExprotToExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnFields: TBitBtn;
    edtFilter: TLabeledEdit;
    btn1: TButton;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    ehFrmMain: TDBGridEh;
    ads736: TADODataSet;
    ds736: TDataSource;
    pm1: TPopupMenu;
    nEXCEL1: TMenuItem;
    nN1: TMenuItem;
    nN2: TMenuItem;
    dlgOpen1: TOpenDialog;
    conExcel: TADOConnection;
    adsExcel: TADODataSet;
    ds1: TDataSource;
    eh1: TDBGridEh;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBBarCode1: TppDBBarCode;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppDBBarCode2: TppDBBarCode;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBBarCode3: TppDBBarCode;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppDBText9: TppDBText;
    ppLabel8: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel9: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppDBText10: TppDBText;
    ppDBBarCode4: TppDBBarCode;
    ppLabel10: TppLabel;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel2: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel14: TppLabel;
    ppDBText17: TppDBText;
    ppLabel15: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    adsSinglePrint: TADODataSet;
    dsSinglePrint: TDataSource;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    cbx1: TCheckBox;
    ppDesigner1: TppDesigner;
    cbxExcelVer: TComboBox;
    mniOQC1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure nEXCEL1Click(Sender: TObject);
    procedure nN1Click(Sender: TObject);
    procedure nN2Click(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniOQC1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FHotColumn: TColumnEh;
    LMainSql: string;
    FPrintmsg: string;
    procedure GetMainFrmData;    
  end;


implementation

uses
  DateUtils, WZ_gUnit;

{$R *.dfm}

procedure TfrmPrint.FormCreate(Sender: TObject);
begin
  LMainSql := ads736.CommandText;
end;

procedure TfrmPrint.FormShow(Sender: TObject);
begin
  dm1.SqlOpen(dm1.qry1,'select getdate() as NowDatetime');
  dtp1.DateTime := DM1.qry1.fieldbyname('NowDatetime').AsDateTime;
  dtp2.DateTime := DM1.qry1.fieldbyname('NowDatetime').AsDateTime;
  GetMainFrmData;
  ehFrmMainTitleClick(ehFrmMain.Columns[1]);
end;

procedure TfrmPrint.GetMainFrmData;
var
  LAddSql: string;
begin
  if cbx1.Checked then
    LAddSql := ' and PrintNum <= 0 ';
  ads736.Close;
  ads736.CommandText := LMainSql + ' where inputdate between ' + QuotedStr(WZ_gUnit.gDateTimeToStr(DateOf(dtp1.DateTime) + TimeOf(dtp3.DateTime))) +
                        ' and ' + QuotedStr(gDateTimeToStr(DateOf(dtp2.DateTime)+ TimeOf(dtp4.DateTime))) + LAddSql + ' order by inputdate desc';
  ads736.Open;
end;

procedure TfrmPrint.ehFrmMainTitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;

  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else
  if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end ;
end;

procedure TfrmPrint.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehFrmMain.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TfrmPrint.btnRefreshClick(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmPrint.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrint.btnExprotToExcelClick(Sender: TObject);
begin
  WZ_gUnit.Export_dbGridEH_to_Excel(ehFrmMain,'标签信息');
end;

procedure TfrmPrint.dtp1Change(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmPrint.nEXCEL1Click(Sender: TObject);
var
  LConStr: string;
  i,j: Integer;
  LNowDate: TDateTime;
  LShipNO: string;
  LField: TField;
begin
  if dlgOpen1.Execute then
  begin
    LShipNO := InputBox('请输入货单号','货单号','');
    dm1.OpenQry('select getdate() as NowTime');
    LNowDate := dm1.qry1.fieldbyname('NowTime').AsDateTime;
    dm1.con1.BeginTrans;
    try
      if cbxExcelVer.ItemIndex = 0 then
      begin
        LConStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Trim(dlgOpen1.FileName) +';Extended Properties=Excel 8.0;Persist Security Info=False';
      end else
      begin
        LConStr := 'Provider=Microsoft.ACE.OLEDB.12.0;Password="";Data Source='+dlgOpen1.FileName+';Extended Properties=''Excel 12.0;IMEX=1;HDR=YES'';Persist Security Info=True;';
      end;
      //LConStr := 'Provider=Microsoft.ACE.OLEDB.12.0;Password="";Data Source='+dlgOpen1.FileName+';Extended Properties=''Excel 12.0;IMEX=1;HDR=YES'';Persist Security Info=True;';
      //LConStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Trim(dlgOpen1.FileName) +';Extended Properties=Excel 8.0;Persist Security Info=False';
      conExcel.Close;
      conExcel.ConnectionString := LConStr;
      conExcel.Open;

      adsExcel.Close;
      adsExcel.CommandText := 'select * from [Sheet1$]';
      adsExcel.Open;

      while not adsExcel.Eof do
      begin
        if dm1.SqlOpen(dm1.qry1,'select 1 from data0736 where barcode = ' + QuotedStr(adsExcel.Fields[0].AsString)) then
        begin
          if not dm1.qry1.IsEmpty then
          begin
            dm1.con1.RollbackTrans;
            ShowMessage('已经导入过本次数据，请勿重复导入 条码: ' + adsExcel.Fields[0].AsString + #13 + '导入失败');
            Exit;
          end;
        end else
        begin
          dm1.con1.RollbackTrans;
          ShowMessage('Excel第一列条码不能为空,导入失败');
          Exit;
        end;
        ads736.Append;
        for i := 0 to adsExcel.FieldList.Count - 1 do
        begin
//          for J := 0 to ads736.Fields.Count - 1 do
//          begin
//            if UpperCase(ads736.Fields[j].FieldName) = UpperCase(adsExcel.Fields[i].FieldName) then
//            begin
//              ads736.Fields[j].Value := adsExcel.Fields[i].Value;
//            end;
//          end;
//          ads736.FieldByName(adsExcel.Fields[I].FieldName).Value :=
          if UpperCase(ads736.Fields[i+1].FieldName) <> 'SHIPNO' then
            ads736.Fields[I+1].Value := adsExcel.Fields[i].Value;
        end;
        ads736.FieldByName('InPutDate').AsDateTime := LNowDate;
        ads736.FieldByName('InputUser').AsString := gUser.User_Ptr;
        if Trim(LShipNO) <> '' then
          ads736.FieldByName('shipno').AsString := LShipNO;
        ads736.Post;
        adsExcel.Next;
      end;
      dm1.con1.CommitTrans;
    finally
      if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
      conExcel.Close;
    end;
    btnRefreshClick(btnRefresh);
  end;
end;

procedure TfrmPrint.nN1Click(Sender: TObject);
begin
  FPrintmsg := '';


  if ads736.FieldByName('PrintNum').AsInteger >= 1 then
  begin
    if ads736.FieldByName('OQC_Pass').AsInteger = 0 then
    begin
      ShowMessage('请先OQC解锁');
      Exit;
    end;

    FPrintmsg := InputBox('说明','请说明','');
    if FPrintmsg = '' then
    begin
      ShowMessage('请输入打印原因');
      Exit;
    end;

  end;


  adsSinglePrint.Close;
  adsSinglePrint.Parameters[0].Value := ads736.fieldbyname('rkey').AsInteger;
  adsSinglePrint.Open;
  ppDBPipeline1.DataSource := dsSinglePrint;

  ppReport1.Reset;
  ppReport1.Template.FileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+ '021645.rtm';
  ppReport1.Template.LoadFromFile;
  ppreport1.SaveAsTemplate:=false;

  ppReport1.Print;
  btnRefreshClick(btnRefresh);
end;

procedure TfrmPrint.nN2Click(Sender: TObject);
begin
  ads736.DisableControls;
  ads736.First;
  while not ads736.eof do
  begin
    FPrintmsg := '';
    if ads736.FieldByName('PrintNum').AsInteger >= 1 then
    begin
      if ads736.FieldByName('OQC_Pass').AsInteger = 0 then
      begin
        ShowMessage('请先OQC解锁');
        Exit;
      end;

      FPrintmsg := InputBox('说明','请说明','');
      if FPrintmsg = '' then
      begin
        ads736.EnableControls;
        ShowMessage('请输入打印原因');
        Exit;
      end else
      begin
        Break;
      end;

    end;
    ads736.Next;
  end;


  ads736.First;
  ppDBPipeline1.DataSource := ds736;

  ppReport1.Reset;
  ppReport1.Template.FileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+ '021645.rtm';
  ppReport1.Template.LoadFromFile;
  ppreport1.SaveAsTemplate:=false;

  ppReport1.Print;
  btnRefreshClick(btnRefresh);
  ads736.EnableControls;
end;

procedure TfrmPrint.ppReport1PrintingComplete(Sender: TObject);
var
  LNowTime: TDateTime;
begin
  dm1.OpenQry('select getdate() as NowTime');
  LNowTime := dm1.qry1.fieldbyname('NowTime').AsDateTime;
  with TADODataSet(ppDBPipeline1.DataSource.DataSet) do
  begin
    First;
    while not Eof do
    begin
      Edit;
      FieldByName('Print05Ptr').AsString := gUser.User_Ptr;
      FieldByName('LastPrintDate').AsDateTime := LNowTime;
      FieldByName('PrintNum').AsInteger := TADODataSet(ppDBPipeline1.DataSource.DataSet).FieldByName('PrintNum').AsInteger + 1;
      FieldByName('PrintBakeNote').AsString := FieldByName('PrintBakeNote').AsString + FPrintmsg;
      Post;
      Next;
    end;
  end;
end;

procedure TfrmPrint.btnSearchClick(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll]) + '021645.rtm';
  ppReport1.Template.LoadFromFile;
  ppreport1.SaveAsTemplate:=True; 

  ppDesigner1.ShowModal;
end;

procedure TfrmPrint.pm1Popup(Sender: TObject);
begin
  mniOQC1.Enabled := gUser.User_Permit = '5';
  //mniOQC1.Enabled := True;
end;

procedure TfrmPrint.mniOQC1Click(Sender: TObject);
begin
  ads736.DisableControls;
  try
  ads736.First;
  while not ads736.Eof do
  begin
    ads736.Edit;
    ads736.FieldByName('OQC_Pass').AsInteger := 1;
    ads736.Post;
    ads736.Next;
  end;
  finally
    ads736.EnableControls;
  end;

end;

end.
