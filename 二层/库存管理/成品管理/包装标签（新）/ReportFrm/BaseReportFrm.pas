unit BaseReportFrm;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, ADODB, Grids,
  DBGridEh, Menus, Spin;

type
  TfrmBaseReportFrm = class(TForm)
    pnl1: TPanel;
    btnOK: TBitBtn;
    btnClose: TBitBtn;
    btnReset: TBitBtn;
    pnl2: TPanel;
    grp1: TGroupBox;
    rgLX: TRadioGroup;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    grp2: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl6: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl11: TLabel;
    edtBCBH: TEdit;
    edtXSDD: TEdit;
    edtSLSet: TEdit;
    edtJZ: TEdit;
    edtZXGG: TEdit;
    edtBZ: TEdit;
    edtBMCL: TEdit;
    edtMZ: TEdit;
    btnBCBH: TSpeedButton;
    btnXSDD: TSpeedButton;
    lbl3: TLabel;
    edtKHDM: TEdit;
    edtBQDM: TEdit;
    edtKGDM: TEdit;
    edtKHDD: TEdit;
    edtKHWL: TEdit;
    edtKHXH: TEdit;
    pnl3: TPanel;
    grp3: TGroupBox;
    lbl5: TLabel;
    lbl18: TLabel;
    edtQSXH: TEdit;
    edtBQSL: TEdit;
    btnSC: TSpeedButton;
    lbl19: TLabel;
    edtCPMS: TEdit;
    lbl20: TLabel;
    edtSLPCS: TEdit;
    lblKHMC: TLabel;
    lbl22: TLabel;
    lbl10: TLabel;
    lblPcsPerSet: TLabel;
    lbl21: TLabel;
    lblDDS: TLabel;
    lbl24: TLabel;
    lblYDY: TLabel;
    lbl26: TLabel;
    eh699: TDBGridEh;
    ads699: TADODataSet;
    ds1: TDataSource;
    intgrfldads699pack_ptr: TIntegerField;
    smlntfldads699order_no: TSmallintField;
    strngfldads699MANU_PART_NUMBER: TStringField;
    strngfldads699MANU_PART_DESC: TStringField;
    strngfldads699ANALYSIS_CODE_2: TStringField;
    strngfldads699PO_NUMBER: TStringField;
    strngfldads699description: TStringField;
    strngfldads699code: TStringField;
    intgrfldads699qty: TIntegerField;
    strngfldads699lotno: TStringField;
    strngfldads699notes: TStringField;
    strngfldads699barcode_id: TStringField;
    strngfldads699CaseNo: TStringField;
    edtSCZQ: TEdit;
    lblSaleCustName: TLabel;
    lbl123: TLabel;
    lbl27: TLabel;
    edt1: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBCBHClick(Sender: TObject);
    procedure btnXSDDClick(Sender: TObject);
    procedure edtBCBHExit(Sender: TObject);
    procedure edtXSDDExit(Sender: TObject);
    procedure edtSLSetExit(Sender: TObject);
    procedure btnSCClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure intgrfldads699qtyChange(Sender: TField);
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure eh699Columns2UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure rgLXClick(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  public
    { Private declarations }
    function GetBCBHInfo(AManu_Part_Number: string): Boolean; virtual;
    function GetXSDDInfo(ASOno: string; b: Boolean = False): Boolean; virtual;
    function GetPCSNumber(): Boolean;virtual;
    function CheckSCZQ: Boolean; virtual;
    function CommonCheck: Boolean;virtual;
    function ExtractBarID(PackNo: Integer; out outBarID: string): Boolean;virtual;
    function IncBQDM(AOldDM: string): string; virtual;
  public
    FCustCode: string;
    FSetW,FSetH: string;
    FSaleCustCode: string;
    FPcsWeight: Single;
    procedure ViewShow(Rkey698: Integer);virtual;
    { Public declarations }
  end;

implementation

uses
  DM, Pick_Item_Single, searchso, DateUtils, WZ_gUnit, StrUtils, HighPermitFrm;

{$R *.dfm}

procedure TfrmBaseReportFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edt1.Focused) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmBaseReportFrm.btnBCBHClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInPut: PDlgInput;
begin
  edtBCBH.SetFocus;
  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm1.con1;
  try
    LInPut.KeyField := 'MANU_PART_NUMBER';

    LInPut.Fields:= 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                       'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';

    LInPut.Sqlstr := ' SELECT D25.MANU_PART_NUMBER, D25.ANALYSIS_CODE_2, D25.MANU_PART_DESC , D10.CUST_CODE, D10.ABBR_NAME FROM Data0060 D60 ' +
                    ' INNER JOIN Data0010 D10 ON D60.CUSTOMER_PTR = D10.RKey ' +
                    ' INNER JOIN Data0025 D25 ON D60.CUST_PART_PTR = D25.RKey ' +
                    ' left join data0006 d06 on d06.bom_ptr = d25.rkey ' +
                    ' left join data0056 d56 on d56.wo_ptr = d06.rkey ' +
                    ' WHERE D10.CUST_CODE = ' + QuotedStr(FSaleCustCode) +' AND D25.PARENT_PTR IS NULL ';
    if edtBCBH.Text <> '' then
    begin
      LInPut.Sqlstr := LInPut.Sqlstr + ' AND D25.MANU_PART_NUMBER LIKE ' + QuotedStr('%'+edtBCBH.Text+'%');
    end;
      LInPut.Sqlstr := LInPut.Sqlstr + ' GROUP BY D25.MANU_PART_NUMBER ,D25.ANALYSIS_CODE_2, D25.MANU_PART_DESC , D10.CUST_CODE, D10.ABBR_NAME';

    LFrm.InitForm_New(LInPut);
    if LFrm.ShowModal = mrOK then
    begin
      edtBCBH.Text := LFrm.Get_Rslt;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBaseReportFrm.btnXSDDClick(Sender: TObject);
var
  LFrm: Tsearchso_Form;
  LSql: string;
  lperFrm: TfrmHighPermit;
begin
  if gUser.User_Permit <> '4' then
  begin
    lperFrm := TfrmHighPermit.Create(Self);
    try
      if lperFrm.ShowModal <> mrok then
      begin
        Exit;
      end;
    finally
      lperFrm.Free;
    end;
  end;

  edtXSDD.SetFocus;
  LFrm := Tsearchso_Form.Create(Self);
  try
    LFrm.ADS60.Connection := DM1.con1;
    LSql := ' AND Data0010.CUST_CODE = ' + QuotedStr(FSaleCustCode);
    if edtBCBH.Text <> '' then LSql := LSql + ' AND Data0025.MANU_PART_NUMBER = '+ QuotedStr(edtBCBH.Text);
    LSql := LSql + ' order by data0060.SCH_DATE asc, data0060.sales_order asc ';
    //if edtXSDD.Text <> '' then LSql := LSql + ' AND Data0060.sales_order like '+ QuotedStr('%'+edtXSDD.Text+'%');
    LFrm.dtpk1.Date:= Date - 180;
    LFrm.dtpk2.Date:= Date;
    LFrm.ADS60.Close;
    LFrm.ads60.CommandText:= LFrm.ads60.CommandText + LSql;
    LFrm.ads60.Parameters[0].Value := Date - 180;
    LFrm.ads60.Parameters[1].Value := Date + 1;
    LFrm.ADS60.Open;
    if LFrm.ShowModal = mrOK then
    begin
      if edtBCBH.Text = '' then
      begin
        edtBCBH.Text := LFrm.ADS60MANU_PART_NUMBER.Value;
        GetBCBHInfo(edtBCBH.Text);
      end;
      edtXSDD.Text := LFrm.ADS60SALES_ORDER.AsString;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  finally
    LFrm.Free;
  end;
end;

function TfrmBaseReportFrm.GetBCBHInfo(AManu_Part_Number: string): Boolean;
var
  lsql: string;
begin
  Lsql := 'SELECT REPORT_UNIT_VALUE1,ANALYSIS_CODE_2,MANU_PART_DESC, set_qty,PRODUCT_NAME,set_lngth,set_width,packsize FROM Data0025 ' +
          ' LEFT JOIN Data0008 ON Data0025.PROD_CODE_PTR = Data0008.Rkey ' +
          //' inner join data0006 d06 on d06.bom_ptr = data0025.rkey ' +
          //' inner join data0056 d56 on d56.wo_ptr = d06.rkey ' +
          ' WHERE Manu_PART_NUMBER = ' + QuotedStr(AManu_Part_Number);
  Result := False;
  DM1.SqlOpen(Lsql);
  if DM1.qrytmp.IsEmpty then
  begin
    FPcsWeight := 0;
    ShowMessage('本厂编号错误, 或者无此型号的在线作业单');
    Exit;
  end else
  begin
    FPcsWeight := DM1.qrytmp.fieldbyname('REPORT_UNIT_VALUE1').AsFloat;
    edtKHWL.Text := DM1.qrytmp.FieldByName('ANALYSIS_CODE_2').AsString;
    edtKHXH.Text := DM1.qrytmp.FieldByName('MANU_PART_DESC').AsString;
    lblPcsPerSet.Caption := DM1.qrytmp.FieldByName('set_qty').AsString;
    edtBMCL.Text := DM1.qrytmp.fieldbyname('PRODUCT_NAME').AsString;
    FSetW := DM1.qrytmp.fieldbyname('set_lngth').AsString;
    FSetH := DM1.qrytmp.fieldbyname('set_width').AsString;
    if edtZXGG.Text = '' then
      edtZXGG.Text := DM1.qrytmp.fieldbyname('packsize').AsString;
    Result := True;
  end;
end;

procedure TfrmBaseReportFrm.edtBCBHExit(Sender: TObject);
begin
  if edtBCBH.Text <> '' then
  begin
    if GetBCBHInfo(edtBCBH.Text) then
    begin
      edtXSDD.Text := DM1.GetXSDD(edtBCBH.Text, FSaleCustCode);
      GetXSDDInfo(edtXSDD.Text);
    end;
  end;
end;

function TfrmBaseReportFrm.GetXSDDInfo(ASOno: string;b: Boolean = False): Boolean;
begin
  Result := False;
//  if b then
//  begin
//    DM1.SqlOpen(' select D698.rkey from data0698 D698 INNER JOIN Data0060 D60 ON D698.SO_PTR = D60.Rkey where D60.SALES_ORDER = ' + QuotedStr(ASOno));
//    if not DM1.qrytmp.IsEmpty then
//    begin
//      ShowMessage('销售订单: ' + ASOno + ' 之前已经打印包装标签 ' + IntToStr(DM1.qrytmp.RecordCount) + ' 次');
//    end;
//  end;
  DM1.SqlOpen('SELECT D97.PO_NUMBER,D60.RKey,D60.REPUT_QTY,D60.PARTS_ORDERED FROM Data0060 D60 INNER JOIN Data0097 D97 ON D60.PURCHASE_ORDER_PTR = D97.RKey WHERE D60.SALES_ORDER = ' + QuotedStr(ASOno));
  if DM1.qrytmp.IsEmpty then
  begin
    ShowMessage('没有找到销售订单');
    Exit;
  end else
  begin
    lblDDS.Caption := IntToStr(DM1.qrytmp.FieldByName('PARTS_ORDERED').AsInteger);
    lblYDY.Caption := IntToStr(DM1.qrytmp.FieldByName('REPUT_QTY').AsInteger);
    edtKHDD.Text := DM1.qrytmp.FieldByName('PO_NUMBER').AsString;
    edtXSDD.Tag := DM1.qrytmp.FIeldByName('RKey').AsInteger;
    Result := True;
  end;
end;

procedure TfrmBaseReportFrm.edtXSDDExit(Sender: TObject);
begin
  if edtXSDD.Text <> '' then
    GetXSDDInfo(edtXSDD.Text, True);
end;

function TfrmBaseReportFrm.GetPCSNumber: Boolean;
begin
  Result := True;
  try
    edtSLPCS.Text := IntToStr(StrToInt(edtSLSet.Text) * StrToInt(lblPcsPerSet.Caption));
    //edtJZ.Text := FloatToStr(StrToInt(edtSLPCS.Text)* FPcsWeight);
  except
    Result := False;
  end;
end;

procedure TfrmBaseReportFrm.edtSLSetExit(Sender: TObject);
begin
  GetPCSNumber;
end;

procedure TfrmBaseReportFrm.btnSCClick(Sender: TObject);
var
  I: Integer;
  LBarID: string;
  tmpQSXH: string;
  LPackNO: Integer;
begin
  if not CommonCheck then Exit;

  //华为检查
//  if Length(edtKGDM.Text) <> 6 then
//  begin
//    ShowMessage('客供代码必须为6位');
//    Exit;
//  end;
//  if Length(Trim(edtKHXH.Text)) <> 8 then
//  begin
//    ShowMessage('客户型号必须为8位');
//    Exit;
//  end;

  case rgLX.ItemIndex of
    0: //内箱
    begin
      if (Length(edtQSXH.Text) <> 7) or (StrToIntDef(copy(edtQSXH.Text,1,4),-1) < 0 ) or (StrToIntDef(copy(edtQSXH.Text,6,2),-1) <0) then
      begin
        ShowMessage('内箱的起始箱号为7位,如:0001-01');
        Exit;
      end;
    end;
    1: //外箱
    begin
      if (Length(edtQSXH.Text) <> 4) or (StrToIntDef(edtQSXH.Text,-1) < 0) then
      begin
        ShowMessage('外箱的起始箱号为4位,如:0001');
        Exit;
      end;
    end;
  end;

  //这里根据不同客户增加起始箱号检查
  rgLX.Enabled := False;
  edtBCBH.Enabled := False;
  edtXSDD.Enabled := False;

//  seYear.Enabled := False;
//  seMoth.Enabled := False;
  btnBCBH.Enabled := False;
  btnXSDD.Enabled := False;
  //edtQSXH.Enabled := False;
  if ads699.Active = False then
  begin
    ads699.Parameters[0].Value := -1;
    ads699.Open;
  end;
  for I := 0 to StrToInt(edtBQSL.Text) - 1 do
  begin
    ads699.Append;
    ads699.FieldByName('order_no').Value := ads699.RecordCount+1;
    ads699.FieldByName('MANU_PART_NUMBER').Value := edtBCBH.Text;
    ads699.FieldByName('MANU_PART_DESC').Value := Trim(edtKHXH.Text);
    ads699.FieldByName('ANALYSIS_CODE_2').Value := edtKHWL.Text;
    ads699.FieldByName('PO_NUMBER').Value := edtKHDD.Text;
    ads699.FieldByName('description').Value := edtCPMS.Text;
    ads699.FieldByName('code').Value := edtKGDM.Text;
    ads699.FieldByName('qty').Value := edtSLPCS.Text;
    ads699.FieldByName('lotno').Value := edtSCZQ.Text;//Format('%.2d',[seYear.Value]) + Format('%.2d',[seMoth.Value]);
    ads699.FieldByName('notes').Value := edtBZ.Text;

    case rgLX.ItemIndex of
      0: LPackNO := StrToInt(copy(edtQSXH.Text,6,2)) + i;
      1: LPackNO :=  i;
    else
      LPackNO := I ;
    end;

    if ExtractBarID(LPackNO,LBarID) then
    begin
      ads699.FieldByName('barcode_id').Value := LBarID
    end else
    begin
      ads699.Close;
      Exit;
    end;

    case rgLX.ItemIndex of
      0://内箱
      begin
        ads699.FieldByName('CaseNo').Value := Format('%.4d',[StrToInt(copy(edtQSXH.Text,1,4))]) + '-' + Format('%.2d',[StrToInt(copy(edtQSXH.Text,6,2)) + I]);
        tmpQSXH := Format('%.4d',[StrToInt(copy(edtQSXH.Text,1,4))]) + '-' + Format('%.2d',[StrToInt(copy(edtQSXH.Text,6,2)) + I + 1]);
      end;
      1://外箱
      begin
        ads699.FieldByName('CaseNo').Value := Format('%.4d',[StrToInt(edtQSXH.Text)+I]);
        tmpQSXH := Format('%.4d',[StrToInt(copy(edtQSXH.Text,1,4))+I + 1]);
      end;
    end;
  end;
  edtQSXH.Text := tmpQSXH;

end;

function TfrmBaseReportFrm.CommonCheck: Boolean;
begin
  Result := False;
  if not GetBCBHInfo(edtBCBH.Text) then Exit;
  if not GetXSDDInfo(edtXSDD.Text) then Exit;
  if not CheckSCZQ then Exit;
  if not GetPCSNumber or (StrToInt(edtSLPCS.Text) <= 0) then
  begin
    ShowMessage('PCS数量不正确');
    Exit;
  end;
  if StrToIntDef(edtBQSL.Text,0) = 0 then
  begin
    ShowMessage('标签数量不正确');
    Exit;
  end;
  Result := True;
end;

procedure TfrmBaseReportFrm.btnResetClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TEdit) then
    begin
      if (Self.Components[I] AS TEdit).Name <> 'edtBZ' then
      begin
        (Self.Components[I] AS TEdit).Text := '';
        (Self.Components[I] AS TEdit).Enabled := True;
      end;
    end;
  end;
  edtCPMS.Text := '印制板';
  btnBCBH.Enabled := True;
  btnXSDD.Enabled := True;
  rgLX.Enabled := True;
  lblDDS.Caption := '0';
  lblYDY.Caption := '0';
  ads699.Close;
  
  DM1.SqlOpen('SELECT CUSTOMER_NAME,ANALYSIS_CODE2 FROM Data0010 WHERE CUST_CODE = ' + QuotedStr(FSaleCustCode));
  if not DM1.qrytmp.IsEmpty then
    lblSaleCustName.Caption := DM1.qrytmp.FieldValues['CUSTOMER_NAME']
  else
    lblSaleCustName.Caption := '';  

  DM1.SqlOpen('SELECT CUSTOMER_NAME,ANALYSIS_CODE2 FROM Data0010 WHERE CUST_CODE = ' + QuotedStr(FCustCode));
  if DM1.qrytmp.IsEmpty then
  begin
    ShowMessage('没有相关客户信息');
    Exit;
  end;
  edtKHDM.Text := FCustCode;
  lblKHMC.Caption := DM1.qrytmp.FieldByName('CUSTOMER_NAME').AsString;
  edtKGDM.Text := DM1.qrytmp.FieldByName('ANALYSIS_CODE2').AsString;
  DM1.SqlOpen('select SEED_VALUE,seed_flag,table_name,datename(week,getdate()) as Nowweek, datename(year,getdate()) as NowYear  from data0004  where rkey = 74');
  if DM1.qrytmp.IsEmpty then
  begin
    edtBQDM.Text := '00001';
  end else
  begin
    edtBQDM.Text := DM1.qrytmp.FieldByName('SEED_VALUE').AsString;
  end;
  edtSCZQ.Text:=copy(dm1.qrytmp.FieldByName('NowYear').AsString,3,2) + dm1.qrytmp.FieldByName('Nowweek').AsString;
//  seYear.Value := StrToInt(copy(dm1.qrytmp.FieldByName('NowYear').AsString,3,2));
//  seMoth.Value := dm1.qrytmp.FieldByName('Nowweek').AsInteger;

end;

function TfrmBaseReportFrm.ExtractBarID(PackNo: Integer;
  out outBarID: string): Boolean;
begin
//  Result := False;
//  outBarID := '';
//  outBarID := edtKGDM.Text + Trim(edtKHXH.Text) + 'V' + Trim(edtKHWL.Text)[Length(Trim(edtKHWL.Text))] +
//    Format('%.4d',[StrToInt(edtSLPCS.Text)]) + edtSCZQ.Text;
//  case rgLX.ItemIndex of
//    0://内箱
//    begin
//      outBarID := outBarID + Format('%.2d',[StrToInt(copy(edtQSXH.Text,1,4))]) + Format('%.2d',[PackNo]);
//    end;
//    1://外箱
//    begin
//      outBarID := outBarID + Format('%.4d',[StrToInt(copy(edtQSXH.Text,1,4))+ PackNo]);
//    end;
//  end;
//  if Length(outBarID) <> 30 then
//  begin
//    ShowMessage('华为技术条形码长度不足30位错误');
//    Exit;
//  end;
  Result := True;
end;


procedure TfrmBaseReportFrm.intgrfldads699qtyChange(Sender: TField);
begin
  if ads699.FieldByName('qty').AsInteger <= 0 then
  begin
    ShowMessage('数量不能小于等于0');
  end;
end;


function TfrmBaseReportFrm.CheckSCZQ: Boolean;
begin
  Result := False;
//  if StrToIntDef(edtSCZQ.Text,-1) = -1 then
//  begin
//    ShowMessage('生产周期不正确，请重新输入4位有效数字');
//    Exit;
//  end;
  if Length(edtSCZQ.Text) <> 4 then
  begin
    ShowMessage('生产周期不正确，请重新输入4位有效数字');
    Exit;
  end;
  Result := True;
end;

procedure TfrmBaseReportFrm.btnOKClick(Sender: TObject);
var
  LSql: string;
  LPcsCount: Integer;
begin
  LPcsCount := 0;
  if (not ads699.Active) or ads699.IsEmpty then
  begin
    ShowMessage('没有要保存的数据');
    Exit;
  end;
  DM1.SqlOpen('select SEED_VALUE,seed_flag,table_name,getdate() as nowtime  from data0004  where rkey = 74');
  if DM1.qrytmp.IsEmpty then
  begin
    edtBQDM.Text := '00001';
  end else
  begin
    edtBQDM.Text := DM1.qrytmp.FieldByName('SEED_VALUE').AsString;
  end;
  
  LSql := ' select d25.manu_part_number from data0025 d25 ' +
    ' inner join data0006 d06 on d06.bom_ptr = d25.rkey ' +
    ' where d06.PROD_STATUS in (3,5) and ' +
    ' ((abs(d25.set_lngth - ' + FSetW + ') <= 2 and abs(d25.set_width - ' + FSetH + ') <= 2 ) or ' +
    ' (abs(d25.set_lngth - ' + FSetH + ') <= 2 and abs(d25.set_width - ' + FSetW + ') <= 2 )) and ' +
    ' d25.manu_part_number <> ' + QuotedStr(edtBCBH.Text) +
    ' group by d25.manu_part_number ' ;
  DM1.SqlOpen(LSql);
  if not DM1.qrytmp.IsEmpty then
  begin
    LSql := ' 当前在线有相似料号，交货板长宽相差 2mm ： ' + #13;
    DM1.qrytmp.First;
    while not DM1.qrytmp.Eof do
    begin
      LSql := LSql + DM1.qrytmp.fieldbyname('manu_part_number').AsString + ' , ';
      DM1.qrytmp.Next;
    end;
    LSql := LSql + #13 + ' 请注意混板 ';
    ShowMessage(LSql);
  end;

  DM1.con1.BeginTrans;
  try
  try
    //标签代码+1
    if not DM1.SqlExec('UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncBQDM(edtBQDM.Text)) + ' WHERE RKey = 74') then
    begin
      ShowMessage('标签代码更新失败');
      Exit;
    end;

    //总计的数量
    ads699.First;
    while not ads699.Eof do
    begin
      LPcsCount := LPcsCount + ads699.FieldByName('qty').AsInteger;
      ads699.Next;
    end;

    //超过订单的数量则禁止保存
//    if LPcsCount + StrToIntDef(lblYDY.Caption,0) > StrToIntDef(lblDDS.Caption,0) then
//    begin
//      ShowMessage('打印数量已经超过订单数，禁止保存，请用高级权限清空打印数!');
//      Exit;
//    end;

{
    //0= 失败,1=通过，2=有回复交期更早的，3=同交期有订单号在前的，4=打印超过订单数量
    case Tsearchso_Form.CheckPOOrder(edtBCBH.Text,edtXSDD.Text) of
      0:
      begin
        //ModalResult := mrOk;
      end;
      1:
      begin
        //ModalResult := mrOk;
      end;
      2:
      begin
        if gUser.User_Permit <> '4' then
        begin
          ShowMessage('有回复交期更早的订单，普通权限禁止打印，如需打印请用高级权限');
          Exit;
        end; //else
          //ModalResult := mrOk;
      end;
      3:
      begin
        if gUser.User_Permit <> '4' then
        begin
          ShowMessage('有靠前的订单号没打印，普通权限禁止打印，如需打印请用高级权限');
          Exit;
        end;// else
          //ModalResult := mrOk;
      end;
      4:
      begin
        if gUser.User_Permit <> '4' then
        begin
          ShowMessage('该订单已经打印标签数量已经超出，普通权限禁止打印，如需打印请用高级权限');
          Exit;
        end;// else
          //ModalResult := mrOk;
      end;
    end;
}




    //新增标签
    LSql := ' INSERT INTO Data0698(pack_number,so_ptr,description,code,qty,lotno,v_date,empl_ptr,pack_item,type,surface,netWeight,grossWeight,caseSpec) ' +
    ' VALUES(' + QuotedStr(edtBQDM.Text) + ',' + IntToStr(edtXSDD.Tag) + ',' + QuotedStr(edtCPMS.Text) + ',' +  QuotedStr(edtKGDM.Text) + ',' + IntToStr(LPcsCount) + ',' +
    QuotedStr(edtSCZQ.Text) + ',getdate(),' + gUser.User_Ptr + ',' + edtBQSL.Text + ',' +  QuotedStr(rgLX.Items[rgLX.ItemIndex]) + ',' +
    QuotedStr(edtBMCL.Text) + ',' + QuotedStr(edtJZ.Text) + ',' + QuotedStr(edtMZ.Text) + ',' + QuotedStr(edtZXGG.Text) +
    ')';
    if not DM1.SqlExec(LSql) then
    begin
      ShowMessage('保存失败');
      Exit;
    end;
    DM1.SqlOpen('SELECT MAX(RKey) AS RKey698 FROM Data0698');
    ads699.First;
    while not ads699.Eof do
    begin
      ads699.Edit;
      ads699.FieldByName('pack_ptr').Value := DM1.qrytmp.FieldByName('RKey698').AsInteger;
      ads699.Post;
      ads699.Next;
    end;
    ads699.UpdateBatch(arAll);

    //销售订单中以打印数增加
    if rgLX.ItemIndex = 1 then
    begin
      if not DM1.SqlExec('UPDATE Data0060 SET REPUT_QTY = ' + IntToStr(StrToIntDef(lblYDY.Caption,0)+ LPcsCount) + ' WHERE RKey = ' + IntToStr(edtXSDD.Tag)) then
      begin
        ShowMessage('更新销售订单已经打印数字失败');
        Exit;
      end;
    end;

    //修改25表的纸箱规格
    DM1.SqlExec('update data0025 set packsize = ' + QuotedStr(edtZXGG.Text) + ' where manu_part_number = ' + QuotedStr(edtBCBH.Text));

    DM1.con1.CommitTrans;
    ModalResult := mrOk;
  except
    ShowMessage('保存失败');
    Exit;
  end;
  finally
    if DM1.con1.InTransaction then DM1.con1.RollbackTrans;
  end;
end;

procedure TfrmBaseReportFrm.ViewShow(Rkey698: Integer);
var
  I: Integer;
begin
  btnResetClick(nil);
  ads699.Close;
  ads699.Parameters[0].Value := Rkey698;
  ads699.Open;
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I] is TEdit then
    begin
      (Self.Components[I] as TEdit).Enabled := False;
    end;
  end;
  btnSC.Enabled := False;
  eh699.ReadOnly := True;
  btnOK.Enabled := False;
  btnReset.Enabled := False;
  btnBCBH.Enabled := False;
  btnXSDD.Enabled := False;
  rgLX.Enabled := False;
  edtKHDM.Text := FCustCode;
  edtBQDM.Text := DM1.adsFrmMain.FieldByName('pack_number').AsString;
  edtKGDM.Text := DM1.adsFrmMain.FIeldByName('code').AsString;

  btnClose.Enabled := True;
  edtBCBH.Text := DM1.adsFrmMain.FieldByName('MANU_PART_NUMBER').AsString;
  edtXSDD.Text := DM1.adsFrmMain.FieldByName('SALES_ORDER').AsString;
//  seYear.Visible := False;
//  seMoth.Visible := False;
//  lbl23.Visible := False;
//  lbl25.Visible := False;
  edtSCZQ.Text := DM1.adsFrmMain.FieldByName('lotno').AsString;
  edtSCZQ.Visible := True;
  edtSLPCS.Text := DM1.adsFrmMain.FieldByName('qty').AsString;
  edtJZ.Text := DM1.adsFrmMain.FieldByName('netWeight').AsString;
  edtMZ.Text := DM1.adsFrmMain.FieldByName('grossWeight').AsString;
  edtZXGG.Text := DM1.adsFrmMain.FieldByName('caseSpec').AsString;
  edtBZ.Text := ads699.FieldByName('notes').AsString;
  edtBMCL.Text := DM1.adsFrmMain.FieldByName('surface').AsString;
  edtCPMS.Text := DM1.adsFrmMain.FieldByName('description').AsString;
  edtBQSL.Text := DM1.adsFrmMain.FieldByName('pack_item').AsString;
  GetBCBHInfo(edtBCBH.Text);
  GetXSDDInfo(edtXSDD.Text);
  edtSLSet.Text := '';//IntToStr(DM1.adsFrmMain.FieldByName('qty').AsInteger div StrToInt(lblPcsPerSet.Caption));
  if DM1.adsFrmMain.FieldByName('type').AsString = '内箱' then
    rgLX.ItemIndex := 0
  else
    rgLX.ItemIndex := 1;

end;

procedure TfrmBaseReportFrm.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmBaseReportFrm.IncBQDM(AOldDM: string): string;
var
  I: Integer;
  nIndex: Integer;
  tmps: string;
begin
  nIndex := -1;
  for I := 1 to Length(AOldDM) do
  begin
    if AOldDM[I] in ['0'..'9'] then
    begin
      if nIndex = -1 then nIndex := I-1;
      tmps := tmps + AOldDM[I];
    end else
    begin
      nIndex := -1;
      tmps := '';
    end;
  end;
  if nIndex = -1 then
    Result := AOldDM + Format('%.1d',[StrToIntDef(tmps,1)+1])
  else
    Result := Copy(AOldDM,1,nIndex) + Format('%.1d',[StrToIntDef(tmps,1)+1]);
end;

procedure TfrmBaseReportFrm.eh699Columns2UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  tmpS: string;
  tmpBar: string;
begin
  if StrToIntDef(Value,-1) <= 0 then
  begin
    ShowMessage('数量不正确');
    Abort;
  end;
  tmpS := ads699.FieldByName('barcode_id').AsString;
  tmpBar := Copy(tmpS,1,16) + Format('%.4d',[StrToInt(Value)]) + RightStr(tmpS,10);
  if Length(tmpBar) <> 30 then
  begin
    ShowMessage('数量不正确');
    Abort;
  end;
  ads699.FieldByName('barcode_id').AsString := tmpBar;
end;

procedure TfrmBaseReportFrm.rgLXClick(Sender: TObject);
begin
  lbl27.Visible := rgLX.ItemIndex = 1;
  edt1.Visible := rgLX.ItemIndex = 1;
  if rgLX.ItemIndex = 1 then
    edt1.SetFocus;
end;

procedure TfrmBaseReportFrm.edt1KeyPress(Sender: TObject; var Key: Char);
var
  L698Rkey: string;
  L699NO: string;
  LB: Boolean;
  I: Integer;
  LSql: string;
begin
  LB := False;
  if Key = #13 then
  begin
    for I := 1 to Length(edt1.Text) do
    begin
      if edt1.Text[I] <> '-' then
        L698Rkey := L698Rkey + edt1.Text[I]
      else
        Break;
    end;
    for I := 1 to Length(edt1.Text) do
    begin
      if LB then
        L699NO := L699NO + edt1.Text[I];
      if edt1.Text[I] = '-' then
        LB := True;
    end;    
    //判断是否内箱
    DM1.SqlOpen('select * from data0698 where rkey = ' + L698Rkey);
    if DM1.qrytmp.FieldByName('type').AsString <> '内箱' then
    begin
      ShowMessage('必须扫描内箱标签');
      edt1.Text := '';
      Exit;
    end;
    //判断是否相同
    LSql := 'select d60.sales_order,d25.manu_part_number from data0060 d60 ' +
            ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
            ' where d60.rkey = ' + DM1.qrytmp.fieldbyname('so_ptr').AsString;
    DM1.SqlOpen(LSql);
    if edtXSDD.Text <> '' then
    begin
      if edtXSDD.Text <> DM1.qrytmp.fieldbyname('sales_order').AsString then
      begin
        ShowMessage('扫描的内箱不一致');
        edt1.Text := '';
        Exit;
      end else
      begin
        DM1.SqlOpen('select qty from data0699 where pack_ptr = ' + L698Rkey + ' and order_no =' + L699NO);
        edtSLPCS.Text := IntToStr(StrToIntDef(edtSLPCS.Text,0) + DM1.qrytmp.FieldByName('qty').AsInteger);
        edtSLSet.Text := IntToStr(StrToInt(edtSLPCS.Text) div StrToInt(lblPcsPerSet.Caption));
      end;
    end else
    begin
      edtBCBH.Text := DM1.qrytmp.fieldbyname('manu_part_number').AsString;
      edtXSDD.Text := DM1.qrytmp.fieldbyname('sales_order').AsString;
      GetBCBHInfo(edtBCBH.Text);
      edtXSDDExit(edtXSDD);
      DM1.SqlOpen('select lotno,qty from data0699 where pack_ptr = ' + L698Rkey + ' and order_no =' + L699NO);
      edtSLPCS.Text := IntToStr(StrToIntDef(edtSLPCS.Text,0) + DM1.qrytmp.FieldByName('qty').AsInteger);
      edtSLSet.Text := IntToStr(StrToInt(edtSLPCS.Text) div StrToInt(lblPcsPerSet.Caption));
//      seYear.Value := StrToInt(Copy(dm1.qrytmp.fieldbyname('lotno').AsString,1,2));
//      seMoth.Value := StrToInt(Copy(dm1.qrytmp.fieldbyname('lotno').AsString,3,2));
      edtSCZQ.Text := Copy(dm1.qrytmp.fieldbyname('lotno').AsString,1,2) + Copy(dm1.qrytmp.fieldbyname('lotno').AsString,3,2);
    end;
    edt1.Text := '';
  end;
end;

end.
