unit CmpFrmNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGridEh, ADODB, ValEdit, Spin;

type
  TfrmCmpNew = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtOutID: TEdit;
    edtHWID: TEdit;
    cdsOur: TClientDataSet;
    grp1: TGroupBox;
    cbxcmpZQ: TCheckBox;
    cbxcmpBB: TCheckBox;
    cbxcmpSL: TCheckBox;
    cbxcmpKHDDH: TCheckBox;
    strngfldcds1HWPO: TStringField;
    eh1: TDBGridEh;
    strngfldcds1CmpValue: TStringField;
    cdsHW: TClientDataSet;
    strngfld1: TStringField;
    strngfld2: TStringField;
    dsour: TDataSource;
    dsHW: TDataSource;
    eh2: TDBGridEh;
    btnClear: TButton;
    btn2: TButton;
    lblNote: TLabel;
    cbxcmpKHXH: TCheckBox;
    cbbOurIDRegion: TComboBox;
    lbl3: TLabel;
    cbbHWIDRegion: TComboBox;
    lbl4: TLabel;
    conOurIDReg: TADOConnection;
    conHWIDRegion: TADOConnection;
    btnReset: TButton;
    lbl6: TLabel;
    lblShiJiPiPei: TLabel;
    btn1: TButton;
    conExcel: TADOConnection;
    adsExcel: TADODataSet;
    ads736: TADODataSet;
    dlgOpen1: TOpenDialog;
    cbbExcelVer: TComboBox;
    vl1: TValueListEditor;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    seCmpNum: TSpinEdit;
    btnChuKu: TButton;
    btn3: TButton;
    cbx1: TCheckBox;
    edtShipNo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtOutIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtHWIDKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
    procedure cbbOurIDRegionChange(Sender: TObject);
    procedure cbbHWIDRegionChange(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnChuKuClick(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure edtShipNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FCmpList: TStringList;
    function DecodeOurBar(ABarID: string): Boolean;
    function DecodeHWbar(ABar: string): Boolean;
    function CmpBar: Boolean;
    function SaveCmpToDB(ACmpRet: Boolean): Boolean;
    function CheckPackStatus(ABarID: string; out ErrMsg: string): Boolean;
    function Check737Exist(ABarID:string;out ErrMsg:string):Boolean;
  end;

implementation

uses
  MMSystem, DM, WZ_gUnit, CmpHisFrm;

{$R *.dfm}
const
  SZCON = 'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data Source=172.16.0.8';
  DGCON = 'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Source=172.18.0.8';
  MZZHCON = 'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Source=172.17.0.187';

procedure TfrmCmpNew.FormCreate(Sender: TObject);
begin
  cdsOur.CreateDataSet;
  cdsHW.CreateDataSet;
  FCmpList := TStringList.Create;
  cbx1Click(cbx1);
end;

procedure TfrmCmpNew.edtOutIDKeyPress(Sender: TObject; var Key: Char);
var
  LErrMsg: string;
begin
  if Key = #13 then
  begin
    if seCmpNum.Value = FCmpList.Count then
    begin
      sndPlaySound('ERROR.wav',SND_ASYNC);
      lblNote.Caption := LErrMsg;
      edtOutID.SelectAll;    
      ShowMessage('已经达到设置数量');
      Exit;
    end;
    lbl5.Caption := edtOutID.Text;
    if DecodeOurBar(edtOutID.Text) then
    begin
      if not CheckPackStatus(edtOutID.Text,LErrMsg) then
      begin
        sndPlaySound('ERROR.wav',SND_ASYNC);
        lblNote.Caption := LErrMsg;
        edtOutID.SelectAll;
        Exit;
      end;
      if (StrToInt(gUser.User_Permit) < 4) then
      begin
        if not Check737Exist(edtOutID.Text,LErrMsg) then
        begin
          sndPlaySound('ERROR.wav',SND_ASYNC);
          lblNote.Caption := LErrMsg;
          edtOutID.SelectAll;
          Exit;
        end;
      end;
      edtHWID.SetFocus;
      edtHWID.SelectAll;
      edtHWID.Text := '';
      lblNote.Caption := '';
    end else
    begin
      sndPlaySound('ERROR.wav',SND_ASYNC);
      lblNote.Caption := '本厂标签无效, 或者未入库。错误';
      edtOutID.SelectAll;
    end;

  end;
end;

function TfrmCmpNew.DecodeOurBar(ABarID: string): Boolean;
var
  rkey698,id699: string;
  ltmp: string;
  LQry: TADOQuery;
begin
  Result := False;
  if not conOurIDReg.Connected then
  begin
    case cbbOurIDRegion.ItemIndex of
      0: conOurIDReg.ConnectionString := DGCON;
      1: conOurIDReg.ConnectionString := SZCON;
      2: conOurIDReg.ConnectionString := MZZHCON;
    end;
    conOurIDReg.Open;
  end;

  while not cdsOur.IsEmpty do
    cdsOur.Delete;
  rkey698 := Copy(ABarID,1,Pos('-',ABarID)-1);
  id699 := Copy(ABarID,Pos('-',ABarID)+1,Length(ABarID)-Pos('-',ABarID)+1);
  LQry := TADOQuery.Create(Self);
  try
    //if not dm1.SqlOpen(conOurIDReg,LQry,'SELECT 1 FROM data0405 WHERE rkey698=' + rkey698 + ' AND id699=' + id699) then Exit;
    //if LQry.IsEmpty then exit;
    if not dm1.SqlOpen(conOurIDReg,LQry,'SELECT * FROM Data0699 WHERE pack_ptr=' + rkey698 + ' AND order_no=' + id699) then Exit;
    if LQry.IsEmpty then exit;

    ltmp := Trim(LQry.FieldByName('ANALYSIS_CODE_2').AsString);
    try
      cdsOur.AppendRecord(['订单号',LQry.FieldByName('PO_NUMBER').AsString]);
      cdsOur.AppendRecord(['型号',LQry.FieldByName('MANU_PART_DESC').AsString]);
      cdsOur.AppendRecord(['数量',LQry.FieldByName('qty').AsString]);
      cdsOur.AppendRecord(['版本',ltmp[Length(ltmp)]]);
      cdsOur.AppendRecord(['周期',LQry.FieldByName('lotno').AsString]);
      Result := True;
    except
      Result := False;
    end;
  finally
    LQry.Free;
  end;
end;

procedure TfrmCmpNew.edtHWIDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    lbl7.Caption := edtHWID.Text;
    if DecodeHWbar(edtHWID.Text) then
    begin
      if CmpBar then
      begin
        SaveCmpToDB(True);
        lblNote.Caption := '匹配通过';
        lblNote.Font.Color := clGreen;
        FCmpList.Add(edtOutID.Text);
        lblShiJiPiPei.Caption := IntToStr(FCmpList.Count);
        btnChuKu.Enabled := seCmpNum.Value = FCmpList.Count;
        sndPlaySound('PASS.wav',SND_ASYNC);
        if btnChuKu.Enabled then
        begin
          Sleep(2000); //刘鹏飞要求增加停顿时间
          if FileExists(ExtractFilePath(ParamStr(0))+'Alter.Wav') then
            sndPlaySound('Alter.Wav',SND_ASYNC);
        end;
        btnClearClick(nil);
      end else
      begin
        lblNote.Font.Color := clRed;
        SaveCmpToDB(False);
        sndPlaySound('ERROR.wav',SND_ASYNC);
      end;
      edtOutID.SetFocus;
      edtOutID.SelectAll;
      edtOutID.Text := '';      
    end else
    begin
      sndPlaySound('ERROR.wav',SND_ASYNC);
      lblNote.Caption := '数据库中没有找到该华为标签';
      edtHWID.SelectAll;
    end;
  end;
end;

function TfrmCmpNew.DecodeHWbar(ABar: string): Boolean;
var
  LQry: TADOQuery;
begin
  Result := False;
  if not conHWIDRegion.Connected then
  begin
    case cbbHWIDRegion.ItemIndex of
      0: conHWIDRegion.ConnectionString := DGCON;
      1: conHWIDRegion.ConnectionString := SZCON;
      2: conHWIDRegion.ConnectionString := MZZHCON;
    end;
    conHWIDRegion.Open;
  end;

  while not cdsHW.IsEmpty do
    cdsHW.Delete;
  LQry := TADOQuery.Create(Self);
  try
    if dm1.SqlOpen(conHWIDRegion,LQry,'select * from data0736 where barcode = '  + quotedstr(edtHWID.Text)) then
    begin
      if LQry.IsEmpty then
      begin
        Exit;
      end;
      try
        cdsHW.AppendRecord(['订单号',LQry.FieldByName('PONumber').AsString]);
        cdsHW.AppendRecord(['型号',LQry.FieldByName('Itemcode').AsString]);
        cdsHW.AppendRecord(['数量',LQry.FieldByName('PCSpercarton').AsString]);
        cdsHW.AppendRecord(['版本',LQry.FieldByName('ItemRevision').AsString]);
        cdsHW.AppendRecord(['周期',LQry.FieldByName('VendorLotNumber').AsString]);
        cdsHW.AppendRecord(['货单号',LQry.FieldByName('shipno').AsString]);
        Result := True;
      except
        Result := False;
      end;
    end else
      Exit;
  finally
    LQry.Free;
  end;
end;

function TfrmCmpNew.CmpBar: Boolean;
begin
  Result := False;
  if cbxcmpKHXH.Checked then
  begin
    cdsOur.Locate('CmpName','型号',[loCaseInsensitive]);
    cdsHW.Locate('CmpName','型号',[loCaseInsensitive]);
    if Trim(cdsOur.FieldByName('cmpvalue').AsString) <> Trim(cdsHW.fieldbyname('cmpvalue').AsString) then
    begin
      lblNote.Caption := '型号不匹配';
      Exit;
    end;
  end;

  if cbxcmpKHDDH.Checked then
  begin
    cdsOur.Locate('CmpName','订单号',[loCaseInsensitive]);
    cdsHW.Locate('CmpName','订单号',[loCaseInsensitive]);
    if Trim(cdsOur.FieldByName('cmpvalue').AsString) <> Trim(cdsHW.fieldbyname('cmpvalue').AsString) then
    begin
      lblNote.Caption := '订单号不匹配';
      Exit;
    end;
  end;

  if cbxcmpSL.Checked then
  begin
    cdsOur.Locate('CmpName','数量',[loCaseInsensitive]);
    cdsHW.Locate('CmpName','数量',[loCaseInsensitive]);
    if Trim(cdsOur.FieldByName('cmpvalue').AsString) <> Trim(cdsHW.fieldbyname('cmpvalue').AsString) then
    begin
      lblNote.Caption := '数量不匹配';
      Exit;
    end;
  end;

  if cbxcmpBB.Checked then
  begin
    cdsOur.Locate('CmpName','版本',[loCaseInsensitive]);
    cdsHW.Locate('CmpName','版本',[loCaseInsensitive]);  
    if Trim(cdsOur.FieldByName('cmpvalue').AsString) <> Trim(cdsHW.fieldbyname('cmpvalue').AsString) then
    begin
      lblNote.Caption := '版本号不匹配';
      Exit;
    end;
  end;

  if cbxcmpZQ.Checked then
  begin
    cdsOur.Locate('CmpName','周期',[loCaseInsensitive]);
    cdsHW.Locate('CmpName','周期',[loCaseInsensitive]);    
    if Trim(cdsOur.FieldByName('cmpvalue').AsString) <> Trim(cdsHW.fieldbyname('cmpvalue').AsString) then
    begin
      lblNote.Caption := '周期不匹配';
      Exit;
    end;
  end;



  if cbx1.Checked then
  begin
    cdsHW.Locate('CmpName','货单号',[loCaseInsensitive]);
    if Trim(edtShipNo.Text) <> Trim(cdsHW.fieldbyname('cmpvalue').AsString) then
    begin
      lblNote.Caption := '货单号不匹配';
      Exit;
    end;
  end;
  Result := True;        
end;

function TfrmCmpNew.SaveCmpToDB(ACmpRet: Boolean): Boolean;
var
  LSvrTime: TDateTime;
begin
  Result := True;
  dm1.SqlOpen(dm1.qry1,'select getdate() as nowtime');
  LSvrTime := dm1.qry1.fieldbyname('nowtime').AsDateTime;

  if dm1.SqlOpen(dm1.qry1,'select * from data0737 where 1=0') then
  begin
    dm1.qry1.Append;
    dm1.qry1.FieldByName('cmpDate').AsDateTime := LSvrTime;
    dm1.qry1.FieldByName('cmpUser').AsString := gUser.User_Ptr;
    if ACmpRet then
      dm1.qry1.FieldByName('cmpRet').AsInteger := 1
    else
    begin
      dm1.qry1.FieldByName('cmpRet').AsInteger := 0;
      if dm1.qry1.FindField('cmpErrmsg') <> nil then
        dm1.qry1.FieldByName('cmpErrMsg').AsString := lblNote.Caption;
    end;
    //本厂的标签信息
    dm1.qry1.FieldByName('ourBarID').AsString := edtOutID.Text;
    dm1.qry1.FieldByName('OurBarIDDB').AsString := cbbOurIDRegion.Items[cbbOurIDRegion.itemindex];
    if cbxcmpKHDDH.Checked then
    begin
      cdsOur.Locate('cmpname','订单号',[loCaseInsensitive]);
      dm1.qry1.FieldByName('OurCustomerPONumber').AsString := cdsOur.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpKHXH.Checked then
    begin
      cdsOur.Locate('cmpname','型号',[loCaseInsensitive]);
      dm1.qry1.FieldByName('OurManuPartDesc').AsString := cdsOur.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpSL.Checked then
    begin
      cdsOur.Locate('cmpname','数量',[loCaseInsensitive]);
      dm1.qry1.FieldByName('OurNumber').AsString := cdsOur.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpBB.Checked then
    begin
      cdsOur.Locate('cmpname','版本',[loCaseInsensitive]);
      dm1.qry1.FieldByName('OurVer').AsString := cdsOur.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpZQ.Checked then
    begin
      cdsOur.Locate('cmpname','周期',[loCaseInsensitive]);
      dm1.qry1.FieldByName('OurZQ').AsString := cdsOur.fieldbyname('cmpvalue').AsString;
    end;
    //下面是华为的标签信息
    dm1.qry1.FieldByName('HWBarCode').AsString := edtHWID.Text;
    dm1.qry1.FieldByName('HWBarCodeDB').AsString := cbbHWIDRegion.Items[cbbHWIDRegion.itemindex];
    if cbxcmpKHDDH.Checked then
    begin
      cdsHW.Locate('cmpname','订单号',[loCaseInsensitive]);
      dm1.qry1.FieldByName('HWPONumber').AsString := cdsHW.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpKHXH.Checked then
    begin
      cdsHW.Locate('cmpname','型号',[loCaseInsensitive]);
      dm1.qry1.FieldByName('HWCode').AsString := cdsHW.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpSL.Checked then
    begin
      cdsHW.Locate('cmpname','数量',[loCaseInsensitive]);
      dm1.qry1.FieldByName('HWNumber').AsString := cdsHW.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpBB.Checked then
    begin
      cdsHW.Locate('cmpname','版本',[loCaseInsensitive]);
      dm1.qry1.FieldByName('HWVer').AsString := cdsHW.fieldbyname('cmpvalue').AsString;
    end;
    if cbxcmpZQ.Checked then
    begin
      cdsHW.Locate('cmpname','周期',[loCaseInsensitive]);
      dm1.qry1.FieldByName('HWZQ').AsString := cdsHW.fieldbyname('cmpvalue').AsString;
    end;
    dm1.qry1.Post;
  end;
end;

procedure TfrmCmpNew.btnClearClick(Sender: TObject);
begin
  edtOutID.SetFocus;
  edtOutID.Text := '';
  edtHWID.Text := '';
  while not cdsOur.IsEmpty do
    cdsOur.Delete;

  while not cdsHW.IsEmpty do
    cdsHW.Delete;
end;

procedure TfrmCmpNew.cbbOurIDRegionChange(Sender: TObject);
begin
  conOurIDReg.Close;
end;

procedure TfrmCmpNew.cbbHWIDRegionChange(Sender: TObject);
begin
  conHWIDRegion.Close;
end;

procedure TfrmCmpNew.btn2Click(Sender: TObject);
begin
  with TfrmCmpHis.Create(Self) do
  begin
    try
      ShowModal;
    finally
      free;
    end;
  end;
end;

function TfrmCmpNew.CheckPackStatus(ABarID: string; out ErrMsg: string): Boolean;
var
  rkey698,id699: string;
  ltmp: string;
  LQry: TADOQuery;
begin
  Result := False;
  if not conOurIDReg.Connected then
  begin
    case cbbOurIDRegion.ItemIndex of
      0: conOurIDReg.ConnectionString := DGCON;
      1: conOurIDReg.ConnectionString := SZCON;
      2: conOurIDReg.ConnectionString := MZZHCON;
    end;
    conOurIDReg.Open;
  end;

  rkey698 := Copy(ABarID,1,Pos('-',ABarID)-1);
  id699 := Copy(ABarID,Pos('-',ABarID)+1,Length(ABarID)-Pos('-',ABarID)+1);
  LQry := TADOQuery.Create(Self);
  try
    if not dm1.SqlOpen(conOurIDReg,LQry,'SELECT LockStatus FROM Data0405 WHERE rkey698=' + rkey698 + ' AND id699=' + id699) then Exit;

    if FCmpList.IndexOf(edtOutID.Text) <> -1 then
    begin
      Result := False;
      ErrMsg := '本箱已经扫描过，请勿重新扫描';
      Exit;
    end;
//    if LQry.IsEmpty then
//    begin
//      Result := False;
//      ErrMsg := '库存中无此箱记录';
//      Exit;
//    end;
    if LQry.FieldByName('LockStatus').AsInteger = 1 then
    begin
      Result := False;
      ErrMsg := '本箱以被品质管控，请联系品质专项';
      Exit;
    end;
    Result := True;
  finally
    LQry.Free;
  end;
end;

procedure TfrmCmpNew.FormDestroy(Sender: TObject);
begin
  FCmpList.Free;
end;

procedure TfrmCmpNew.btnResetClick(Sender: TObject);
begin
  FCmpList.Clear;
  btnChuKu.Enabled := False;
  lblShiJiPiPei.Caption := IntToStr(FCmpList.Count);
end;

function TfrmCmpNew.Check737Exist(ABarID: string;
  out ErrMsg: string): Boolean;
var
  LQry: TADOQuery;
begin
  Result := False;
  if not conOurIDReg.Connected then
  begin
    case cbbOurIDRegion.ItemIndex of
      0: conOurIDReg.ConnectionString := DGCON;
      1: conOurIDReg.ConnectionString := SZCON;
      2: conOurIDReg.ConnectionString := MZZHCON;
    end;
    conOurIDReg.Open;
  end;
  LQry := TADOQuery.Create(Self);
  try
    if not dm1.SqlOpen(conOurIDReg,LQry,'SELECT Rkey,ourBarID FROM Data0737 WHERE ourBarID=''' + ABarID + ''' ') then Exit;
    if not LQry.IsEmpty then
    begin
      Result := False;
      ErrMsg := '本箱已经扫描过，不能反复扫描。权限4可';
      Exit;
    end;

    if not dm1.SqlOpen(conOurIDReg,LQry,'SELECT top 1 cmpRet FROM Data0737 order by rkey desc ') then Exit;
    if not LQry.IsEmpty then
    begin
      if LQry.FieldByName('cmpret').AsInteger <> 1 then
      begin
        Result := False;
        ErrMsg := '异常锁定，禁止操作。权限4解锁';
        Exit;
      end;

    end;
    Result := True;
  finally
    LQry.Free;
  end;
end;

procedure TfrmCmpNew.btn1Click(Sender: TObject);
var
  LConStr: string;
  i: Integer;
  LNowDate: TDateTime;
  Lkey,LValue: string;
  LShipNo: string;
begin
  if dlgOpen1.Execute then
  begin
    LShipNO := InputBox('请输入货单号','货单号','');
    dm1.OpenQry('select getdate() as NowTime');
    LNowDate := dm1.qry1.fieldbyname('NowTime').AsDateTime;
    dm1.con1.BeginTrans;
    try
      if cbbExcelVer.ItemIndex = 0 then
      begin
        LConStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Trim(dlgOpen1.FileName) +';Extended Properties=Excel 8.0;Persist Security Info=False';
      end else
      begin
        LConStr := 'Provider=Microsoft.ACE.OLEDB.12.0;Password="";Data Source='+dlgOpen1.FileName+';Extended Properties=''Excel 12.0;IMEX=1;HDR=YES'';Persist Security Info=True;';
      end;
      
//      ShowMessage(LConStr);
//      Exit;
      conExcel.Close;
      conExcel.ConnectionString := LConStr;
      conExcel.Open;

      adsExcel.Close;
      adsExcel.CommandText := 'select * from [sheet$]';
      adsExcel.Open;

      adsExcel.First;
      ads736.Close;
      ads736.Open;
      while not adsExcel.Eof do
      begin
        if dm1.SqlOpen(dm1.qry1,'select 1 from data0736 where barcode = ' + QuotedStr(adsExcel.fieldbyname(vl1.Values['Barcode']).AsString)) then
        begin
          if not dm1.qry1.IsEmpty then
          begin
            dm1.con1.RollbackTrans;
            ShowMessage('已经导入过本次数据，请勿重复导入 条码: ' + adsExcel.fieldbyname(vl1.Values['Barcode']).AsString + #13 + '导入失败');
            Exit;
          end;
        end else
        begin
          dm1.con1.RollbackTrans;
          ShowMessage('Excel第一列条码不能为空,导入失败 ' + adsExcel.fieldbyname(vl1.Values['Barcode']).AsString);
          Exit;
        end;

        if adsExcel.FieldByName('DATE(制造日期)').AsString <> adsExcel.FieldByName('M．Lot(供应商制造批次)').AsString then
        begin
//          dm1.con1.RollbackTrans;
//          ShowMessage('Mlot和Date不一致,错误');
//          Exit;
        end;

        ads736.Append;
        for i := 1 to vl1.Strings.Count do
        begin
          Lkey := Trim(vl1.Cells[0,I]);
          LValue := Trim(vl1.Cells[1,I]);
          if LValue <> '-1' then
          begin
            ads736.FieldByName(Lkey).AsString := adsExcel.fieldbyname(LValue).AsString;
          end;
        end;

        ads736.FieldByName('InPutDate').AsDateTime := LNowDate;
        ads736.FieldByName('InputUser').AsString := gUser.User_Ptr;
        if Trim(LShipNO) <> '' then
          ads736.FieldByName('shipno').AsString := LShipNO;
        ads736.Post;
        adsExcel.Next;
      end;
      dm1.con1.CommitTrans;
      ShowMessage('导入成功');
      //dm1.con1.RollbackTrans;
    finally
      if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
      conExcel.Close;
    end;
//    btnRefreshClick(btnRefresh);
  end;
end;

procedure TfrmCmpNew.btnChuKuClick(Sender: TObject);
var
  I: Integer;
  LNowTime: TDateTime;
  LRkey698,Lid699: string;
begin
  dm1.SqlOpen(dm1.qry1,'select getdate() as nowdatetime');
  LNowTime := dm1.qry1.fieldbyname('nowdatetime').AsDateTime;
  dm1.con1.BeginTrans;
  try
    for I := 0 to FCmpList.Count - 1 do
    begin
      if Trim(FCmpList[I]) = '' then Continue;
      LRkey698 := Copy(FCmpList[I],1,Pos('-',FCmpList[I])-1);
      Lid699 := Copy(FCmpList[I],Pos('-',FCmpList[I])+1,Length(FCmpList[I]) - Pos('-',FCmpList[I]));
      dm1.SqlOpen(DM1.qry1,'select * from data0405 where rkey698 = ' + IntToStr(StrToIntdef(LRkey698,0)) + ' and id699 = ' + IntToStr(StrToIntDef(Lid699,0)));
      if dm1.qry1.IsEmpty then
      begin
        //ShowMessage(FCmpList[I] + ' 不在库存记录中，本箱出库失败!');
        Continue;
      end;
      dm1.qry1.Edit;
      dm1.qry1.FieldByName('outuser').AsString := gUser.User_Ptr;
      dm1.qry1.FieldByName('outdatetime').AsDateTime := LNowTime;
      dm1.qry1.FieldByName('status').AsInteger := 1;
      dm1.qry1.Post;
    end;
    dm1.con1.CommitTrans;
    ShowMessage('操作成功');
  except
    if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
    ShowMessage('操作失败');
  end;
end;

procedure TfrmCmpNew.cbx1Click(Sender: TObject);
begin
  edtShipNo.Enabled := cbx1.Checked;
  seCmpNum.Enabled := not cbx1.Checked;
end;

procedure TfrmCmpNew.edtShipNoKeyPress(Sender: TObject; var Key: Char);
var
  LQry: TADOQuery;
begin
  if Key = #13 then
  begin
  LQry := TADOQuery.Create(Self);
  try
    LQry.Connection := DM1.con1;
    LQry.SQL.Text := 'select count(*) as no from data0736 where shipno = ' + QuotedStr(edtShipNo.Text);
    LQry.Open;
    seCmpNum.Value := LQry.fieldbyname('no').AsInteger;
    edtOutID.SetFocus;
  finally
    LQry.Free;
  end;
  end;
end;

end.
