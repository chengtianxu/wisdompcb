unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, ExtCtrls, Buttons, DB, ADODB, DM,
  ComCtrls, Menus;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExprotToExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnFields: TBitBtn;
    edtFilter: TLabeledEdit;
    pnl2: TPanel;
    ehFrmMain: TDBGridEh;
    ads817: TADODataSet;
    ds817: TDataSource;
    pnl3: TPanel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    pm1: TPopupMenu;
    nNew: TMenuItem;
    nPostStock: TMenuItem;
    nPostFirst: TMenuItem;
    nPostSec: TMenuItem;
    nModiy: TMenuItem;
    ads817BillNO: TStringField;
    ads817CUser: TIntegerField;
    ads817CTime: TDateTimeField;
    ads817ToUser: TStringField;
    ads817ToAddress: TStringField;
    ads817ToPhone: TStringField;
    ads817OutDoor: TIntegerField;
    ads817Items: TStringField;
    ads817TranCode: TStringField;
    ads817PayType: TIntegerField;
    ads817TrantNote: TStringField;
    ads817TestWeight: TBCDField;
    ads817TestMoney: TBCDField;
    ads817RealWeight: TBCDField;
    ads817RealMoney: TBCDField;
    ads817RealWeightUser: TIntegerField;
    ads817PackCount: TIntegerField;
    ads817StocPasskUser: TIntegerField;
    ads817StockPassTime: TDateTimeField;
    ads817FstPassUser: TIntegerField;
    ads817FstPassTime: TDateTimeField;
    ads817FstPassNote: TStringField;
    ads817SecPassUser: TIntegerField;
    ads817SecPassTime: TDateTimeField;
    ads817SecPassNote: TStringField;
    ads817BillSaveUser: TIntegerField;
    ads817BillSaveTime: TDateTimeField;
    ads817Status: TIntegerField;
    ads817DEPT_NAME: TStringField;
    ads817cusername: TStringField;
    ads817StockPassName: TStringField;
    ads817fstPassName: TStringField;
    ads817SecPassName: TStringField;
    ads817BillSaveName: TStringField;
    ads817TranName: TStringField;
    btn1: TButton;
    ads817CustName: TStringField;
    nDele: TMenuItem;
    nView: TMenuItem;
    pmColumVisable: TPopupMenu;
    ads817traneasyname: TStringField;
    N1: TMenuItem;
    cbxViewAll: TCheckBox;
    btn2: TBitBtn;
    pmDesRpt: TPopupMenu;
    N2: TMenuItem;
    DHL1: TMenuItem;
    N3: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    nPrint: TMenuItem;
    N5: TMenuItem;
    DHL2: TMenuItem;
    N6: TMenuItem;
    N12: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    ads817SendPhone: TStringField;
    pm2: TPopupMenu;
    pm3: TPopupMenu;
    nStockPass: TMenuItem;
    nBillSave: TMenuItem;
    nInPutWeight: TMenuItem;
    nN18: TMenuItem;
    nN15: TMenuItem;
    nView2: TMenuItem;
    nPassConfig: TMenuItem;
    nSet818: TMenuItem;
    rgStatus: TRadioGroup;
    nN5: TMenuItem;
    btn3: TSpeedButton;
    ads817speedtype: TIntegerField;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure nNewClick(Sender: TObject);
    procedure nPostStockClick(Sender: TObject);
    procedure nPostFirstClick(Sender: TObject);
    procedure nPostSecClick(Sender: TObject);
    procedure nModiyClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure nDeleClick(Sender: TObject);
    procedure btnFieldsClick(Sender: TObject);
    procedure cbxViewAllClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure nInPutWeightClick(Sender: TObject);
    procedure nView2Click(Sender: TObject);
    procedure nPassConfigClick(Sender: TObject);
    procedure nBillSaveClick(Sender: TObject);
    procedure nSet818Click(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
    procedure pm3Popup(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure ehFrmMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    LMainSql: string;
    procedure GetMainFrmData;
    procedure ColumMenuItemClick(MuItem: TObject);
    procedure SndMsg(APrimt: Integer);
    function GetRptName(ATag: Integer): string;
    procedure PrintRpt(ATag: Integer);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  WZ_gUnit, DateUtils, TranCmpFrm, AddNewBillFrm, StockPassFrm, SaveBillFrm,
  ViewFrm;


{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.GetMainFrmData;
//状态：0原始状态，1-等仓库确认，2仓库已经确认。3-等第一次审核，4-第一次审核通过，
//5-等第二次审核，6-第二次审核通过，7-等前台收单，8-前台已经收单完成，9-一审不同意，10-二审不同意
var
  LWhere: string;
begin
  case StrToInt(gUser.User_Permit) of
    1: //业务员
    begin
      LWhere := ' Where cuser = ' + gUser.User_Ptr;
    end;
    2: //仓库,前台
    begin
      if cbxViewAll.Checked then
        LWhere := ' Where (1=1) '
      else
        LWhere :=  ' Where Status in (1,7) ';
    end;
    3: //1次审核用
    begin
      case rgStatus.ItemIndex of
        0:
        begin
          LWhere := ' Where Status =3 ';
        end;
        1:
        begin
          LWhere := ' Where Status =4 ';
        end;
        2:
        begin
          LWhere := ' Where Status =9 ';
        end;
        3:
        begin
          LWhere := ' Where (1=1) ';
        end;
      end;
    end;
    4: //2次审核用
    begin
      case rgStatus.ItemIndex of
        0:
        begin
          LWhere := ' Where Status =5 ';
        end;
        1:
        begin
          LWhere := ' Where Status =6 ';
        end;
        2:
        begin
          LWhere := ' Where Status =10 ';
        end;
        3:
        begin
          LWhere := ' Where (1=1) ';
        end;
      end;
    end;
  end;
  ads817.Close;
  ads817.CommandText := LMainSql + LWhere + ' and ctime between ' + QuotedStr(WZ_gUnit.gDateTimeToStr(dtp1.DateTime)) +
                        ' and ' + QuotedStr(gDateTimeToStr(dtp2.DateTime)) + ' order by ctime desc';
  ads817.Open;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  LMainSql := ads817.CommandText;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  I: Integer;
  LItem: TMenuItem;
begin
  dm1.SqlOpen('select getdate() as NowDatetime');
  dtp1.DateTime := IncDay(DM1.qrytmp.fieldbyname('NowDatetime').AsDateTime,-3);
  dtp2.DateTime := IncDay(DM1.qrytmp.fieldbyname('NowDatetime').AsDateTime,1);
  GetMainFrmData;
  ehFrmMainTitleClick(ehFrmMain.Columns[0]);

  for I := 0 to ehFrmMain.Columns.Count - 1 do
  begin
    LItem := TMenuItem.Create(Self);
    LItem.Caption := ehFrmMain.Columns[I].Title.Caption;
    LItem.Checked := ehFrmMain.Columns[I].Visible;
    LItem.OnClick := ColumMenuItemClick;
    pmColumVisable.Items.Add(LItem);
  end;

  case StrToInt(gUser.User_Permit) of
    1: ehFrmMain.PopupMenu := pm1;
    2:
    begin
      ehFrmMain.PopupMenu := pm2;
      cbxViewAll.Visible := True;
    end;
    3,4:
    begin
      ehFrmMain.PopupMenu := pm3;
      rgStatus.Visible := True;
    end;
  end;
end;

procedure TfrmMain.dtp1Change(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmMain.ehFrmMainTitleClick(Column: TColumnEh);
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

procedure TfrmMain.edtFilterChange(Sender: TObject);
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

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmMain.btnExprotToExcelClick(Sender: TObject);
begin
  WZ_gUnit.Export_dbGridEH_to_Excel(ehFrmMain,'快递信息');
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  //状态：0原始状态，1-等仓库确认，2仓库已经确认。3-等第一次审核，4-第一次审核通过，
  //5-等第二次审核，6-第二次审核通过，7-等前台收单，8-前台已经收单完成 ,9-一审不同意，10-二审不同意
  //
  nPostStock.Enabled := ads817.FieldByName('status').AsInteger = 0;
  nPostFirst.Enabled := ads817.FieldByName('status').AsInteger = 0;

  nPostFirst.Enabled := ads817.FieldByName('status').AsInteger = 2;

  nPostSec.Enabled := ads817.FieldByName('status').AsInteger = 4;

  nModiy.Enabled := not (ads817.FieldByName('status').AsInteger in [4,5,6,8,9,10]);
  nDele.Enabled := not (ads817.FieldByName('status').AsInteger in [4,5,6,8,9,10]);

end;

procedure TfrmMain.nNewClick(Sender: TObject);
var
  LFrm: TfrmAddNewBill;
begin
  LFrm := TfrmAddNewBill.Create(Self);
  try
    ads817.Append;
    ads817.FieldByName('outdoor').AsInteger := 0;
    ads817.FieldByName('paytype').AsInteger := 0;
    if LFrm.ShowModal = mrok then
    begin
      frmMain.ads817.Post;
      ads817.Requery();
    end else
      frmMain.ads817.Cancel;
  finally
      if ads817.State in [dsedit,dsinsert] then ads817.Cancel;
    LFrm.Free;
  end;
  btnRefreshClick(btnRefresh);
end;

procedure TfrmMain.nPostStockClick(Sender: TObject);
var
  Lsql: string;
begin
  LSql := 'select status from data0817 where BillNo = ' + QuotedStr(ads817.fieldbyname('BillNo').AsString);
  dm1.SqlOpen(LSql);
  if dm1.qrytmp.FieldByName('status').AsInteger >= 2 then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  if MessageBox(Handle,'是否确认次操作','提示',MB_YESNO) = IDYES then
  begin
    ads817.Edit;
    ads817.FieldByName('status').AsInteger := 1;
    ads817.Post;
  end;
end;

procedure TfrmMain.nPostFirstClick(Sender: TObject);
var
  LSql: string;
begin
  LSql := 'select status from data0817 where BillNo = ' + QuotedStr(ads817.fieldbyname('BillNo').AsString);
  dm1.SqlOpen(LSql);
  if dm1.qrytmp.FieldByName('status').AsInteger >= 4 then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  if ads817.FieldByName('RealWeight').AsFloat <= 0 then
  begin
    ShowMessage('必须提交仓库填写实际重量');
    Exit;
  end;
  if MessageBox(Handle,'是否确认次操作','提示',MB_YESNO) = IDYES then
  begin
    ads817.Edit;
    ads817.FieldByName('status').AsInteger := 3;
    ads817.Post;
    SndMsg(3);
  end;

end;

procedure TfrmMain.nPostSecClick(Sender: TObject);
var
  Lsql: string;
begin
  LSql := 'select status from data0817 where BillNo = ' + QuotedStr(ads817.fieldbyname('BillNo').AsString);
  dm1.SqlOpen(LSql);
  if dm1.qrytmp.FieldByName('status').AsInteger >= 6 then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  if ads817.FieldByName('RealWeight').AsFloat <= 0 then
  begin
    ShowMessage('必须提交仓库填写实际重量');
    Exit;
  end;  
  if MessageBox(Handle,'是否确认次操作','提示',MB_YESNO) = IDYES then
  begin
  ads817.Edit;
  ads817.FieldByName('status').AsInteger := 5;
  ads817.Post;
  SndMsg(4);
  end;
end;

procedure TfrmMain.nModiyClick(Sender: TObject);
var
  LFrm: TfrmAddNewBill;
begin
  LFrm := TfrmAddNewBill.Create(Self);
  try
    ads817.Edit;
    if LFrm.ShowModal = mrok then
    begin
      ads817.Post;
      ads817.Requery();
    end else
      ads817.Cancel;
  finally
    if ads817.State in [dsedit,dsinsert] then ads817.Cancel;
    LFrm.Free;
  end;
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  if gUser.User_Permit = '1' then
    gUser.User_Permit := '2' else
  if gUser.User_Permit = '2' then
    gUser.User_Permit := '3' else
  if gUser.User_Permit = '3' then
    gUser.User_Permit := '4' else
  if gUser.User_Permit = '4' then
    gUser.User_Permit := '1';
  ShowMessage('Now Right = ' + gUser.User_Permit);
  FormShow(Self);
end;

procedure TfrmMain.nDeleClick(Sender: TObject);
begin
  if MessageBox(Handle,'是否确认次操作','提示',MB_YESNO) = IDYES then
  begin
  if ads817.FieldByName('status').AsInteger <> 8 then
  begin
    dm1.SqlExec('delete from data0817 where billno = ' + QuotedStr(ads817.fieldbyname('billno').AsString));
    ads817.Requery();
  end;
  end;
end;

procedure TfrmMain.btnFieldsClick(Sender: TObject);
begin
  pmColumVisable.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TfrmMain.ColumMenuItemClick(MuItem: TObject);
var
  I: Integer;
  LItem: TMenuItem;
begin
  LItem := TMenuItem(MuItem);
  LItem.Checked := not LItem.Checked;
  if LItem.Checked then
  begin
    for I := 0 to ehFrmMain.Columns.Count - 1 do
    begin
      if ehFrmMain.Columns[I].Title.Caption = LItem.Caption then
      begin
        ehFrmMain.Columns[I].Visible := LItem.Checked;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmMain.cbxViewAllClick(Sender: TObject);
begin
  btnRefreshClick(btnRefresh);
end;

procedure TfrmMain.SndMsg(APrimt: Integer);
var
  Lsql: string;
  LnowTime: TDateTime;
  LRkey14: string;
begin
  DM1.SqlOpen('select getdate() as nowtime');
  LnowTime := dm1.qrytmp.fieldbyname('nowtime').AsDateTime;

 DM1.qrytmp.Close;
 DM1.qrytmp.SQL.Clear;
 dm1.qrytmp.SQL.Add('select * from data0014 where rkey = -1');
 DM1.qrytmp.Open;
 DM1.qrytmp.Append;
 DM1.qrytmp.FieldByName('MESSAGE').AsString :=  '有一张快递单需要您审批 '; ;
 DM1.qrytmp.FieldByName('senddate').AsDateTime := LnowTIme;
 DM1.qrytmp.FieldByName('whosend').AsString := gUser.User_Longin_Ptr;
 DM1.qrytmp.Post;
 lrkey14 := DM1.qrytmp.fieldbyname('rkey').AsString;

  Lsql :=' INSERT INTO data0314 (emp_ptr,d14_ptr) ' +
  ' SELECT d73.RKEY,' + LRkey14 + ' FROM data0074 d74 ' +
          ' INNER JOIN Data0419 d419 ON d419.RKEY = d74.FUNCTION_ID ' +
          ' INNER JOIN Data0073 d73 ON d73.RKEY = d74.USER_PTR  '+
          ' WHERE d419.DESCRIPTION = '+ QuotedStr('快递申请与审批') + ' AND ' +
          ' d74.USER_RIGHTS =  ' + IntToStr(APrimt);
  dm1.SqlExec(Lsql);
end;

procedure TfrmMain.btn2Click(Sender: TObject);
begin
  pmDesRpt.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
  LFileName: string;
begin
  LFileName := GetRptName((Sender as TMenuItem).Tag);
  with dm1.prprt1 do
  begin
    Reset;
    Template.FileName :=
        stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
          LFileName;
    Template.LoadFromFile;
    SaveAsTemplate := True;
  end;
  dm1.ppDesigner1.ShowModal;
end;

function TfrmMain.GetRptName(ATag: Integer): string;
begin
  case ATag of
    0: Result := 'SFRpt.rtm';
    1: Result := 'DHLRpt.rtm';
    2: Result := 'KYRpt.rtm';
    3: Result := 'Other1.rtm';
    4: Result := 'Other2.rtm';
    5: Result := 'Other3.rtm';
  end;
end;

procedure TfrmMain.PrintRpt(ATag: Integer);
var
  LFileName: string;
begin
  LFileName := GetRptName(ATag);
  with dm1.prprt1 do
  begin
    Reset;
    Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        LFileName;
    Template.LoadFromFile;
    SaveAsTemplate:=false;
  end;
  dm1.adsRpt.Close;
  dm1.adsRpt.Parameters[0].Value := ads817.fieldbyname('BillNO').Value;
  dm1.adsRpt.Open;
  dm1.prprt1.Print;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  PrintRpt((Sender as TMenuItem).Tag);
end;

procedure TfrmMain.nInPutWeightClick(Sender: TObject);
var
  LFrm: TfrmStockPass;
begin
  LFrm := TfrmStockPass.Create(Self);
  try
    LFrm.mmoNote.Text := ads817.FieldByName('TrantNote').AsString;
    LFrm.edtPackCount.Text := ads817.fieldbyname('PackCount').AsString;
    LFrm.edtRealWeight.Text := ads817.fieldbyname('realweight').AsString;
    if LFrm.ShowModal = mrOK then
    begin
      ads817.Edit;
      ads817.FieldByName('RealWeight').AsString := LFrm.edtRealWeight.Text;
      ads817.FieldByName('PackCount').AsString := LFrm.edtPackCount.Text;
      ads817.FieldByName('TrantNote').AsString := LFrm.mmoNote.Text;
      ads817.FieldByName('RealWeightUser').AsString := gUser.User_Ptr;

      //仓库输入
      if (Sender as TMenuItem).Tag = 1 then
      begin
        ads817.FieldByName('StocPasskUser').AsString := gUser.User_Ptr;
        ads817.FieldByName('StockPassTime').AsDateTime := dm1.GetSvrTime;
        ads817.FieldByName('status').AsInteger := 2;      
      end;

      ads817.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.nView2Click(Sender: TObject);
var
  LFrm: TfrmView;
begin
  LFrm := TfrmView.Create(Self);
  LFrm.btn1.Top := LFrm.btn1.Top - 50;
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.nPassConfigClick(Sender: TObject);
var
  LFrm: TfrmView;
begin
  LFrm := TfrmView.Create(Self);
  try
    LFrm.grp1.Visible := True;
    if LFrm.ShowModal = mrok then
    begin
      case StrToInt(gUser.User_Permit) of
        3://副总经理
        begin
          ads817.Edit;
//          if LFrm.rbOK.Checked then
//            ads817.FieldByName('status').AsInteger := 4
//          else
//            ads817.FieldByName('status').AsInteger := 9;
          ads817.FieldByName('FstPassUser').AsString := gUser.User_Ptr;
          ads817.FieldByName('FstPassTime').AsDateTime := dm1.GetSvrTime;
          ads817.Post;
        end;
        4://总经理
        begin
          ads817.Edit;
          if LFrm.rbOK.Checked then
            ads817.FieldByName('status').AsInteger := 6
          else
            ads817.FieldByName('status').AsInteger := 10;
          ads817.FieldByName('SecPassUser').AsString := gUser.User_Ptr;
          ads817.FieldByName('SecPassTime').AsDateTime := dm1.GetSvrTime;
          ads817.Post;        
        end;
      end;
    end;
    btnRefreshClick(btnRefresh);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.nBillSaveClick(Sender: TObject);
var
  Lfrm: TfrmSaveBill;
begin
  Lfrm := TfrmSaveBill.Create(Self);
  try
    Lfrm.mmoNote.Text := ads817.FieldByName('TrantNote').AsString;
    if Lfrm.ShowModal = mrok then
    begin
      ads817.Edit;
      ads817.FieldByName('status').AsInteger := 8;
      ads817.FieldByName('BillSaveUser').AsString := gUser.User_Ptr;
      ads817.FieldByName('BillSaveTime').AsDateTime := dm1.GetSvrTime;
      ads817.FieldByName('RealMoney').AsString := Lfrm.edtRealMoney.Text;
      ads817.FieldByName('TrantNote').AsString := Lfrm.mmoNote.Text;
      ads817.Post;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.nSet818Click(Sender: TObject);
var
  LFrm: TfrmTranBaseInfo;
begin
  LFrm := TfrmTranBaseInfo.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.rgStatusClick(Sender: TObject);
begin
  btnRefreshClick(btnRefresh);
end;

procedure TfrmMain.pm2Popup(Sender: TObject);
begin
  nStockPass.Enabled := ads817.FieldByName('status').AsInteger in [1,4,6];
  nBillSave.Enabled := not (ads817.FieldByName('status').AsInteger in [1,3,5,9,10]);
end;

procedure TfrmMain.pm3Popup(Sender: TObject);
begin
  nPassConfig.Enabled := False;
  if gUser.User_Permit = '3' then
    nPassConfig.Enabled := True;//ads817.FieldByName('status').AsInteger = 3;
  if gUser.User_Permit = '4' then
    nPassConfig.Enabled := True;//ads817.FieldByName('status').AsInteger = 5;
end;

procedure TfrmMain.btn3Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := ' 1：业务员 ' + #13 +
          ' 2：前台，仓库' + #13 +
          ' 3：副总经理' + #13 +
          ' 4：总经理';
  ShowMessage(LStr);
end;

procedure TfrmMain.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (not Column.Field.DataSet.FieldByName('active').AsBoolean) then
//  begin
//    TDBGridEh(Sender).Canvas.Font.Color := clGrayText;
//  end;
  if (Column.Field.DataSet.FieldByName('status').AsInteger = 9) or (Column.Field.DataSet.FieldByName('status').AsInteger = 10) then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clRed;
  end;
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
