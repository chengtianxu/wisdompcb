unit ZXKX2303Frm;

interface

uses
  Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, ADODB, 
  Menus, Grids, DBGridEh;

type
  TfrmZXKX2303 = class(TForm)
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
    edtSCZQ: TEdit;
    edtSLSet: TEdit;
    edtJZ: TEdit;
    edtZXGG: TEdit;
    edtBZ: TEdit;
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
    grp4: TGroupBox;
    cbxZXBMCL: TComboBox;
    dtpHKRQ: TDateTimePicker;
    cbxHKRQ: TCheckBox;
    Label1: TLabel;
    cbbDCB: TComboBox;
    lblSaleCustName: TLabel;
    lbl123: TLabel;
    rg1: TRadioGroup;
    mmo1: TMemo;
    ads699param1: TStringField;
    ads699param2: TStringField;
    ads699printfilename: TStringField;
    ads699incno: TIntegerField;
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
    procedure cbbDCBChange(Sender: TObject);
  private
    { Private declarations }
    function GetBCBHInfo(AManu_Part_Number: string): Boolean;
    function GetXSDDInfo(ASOno: string; b: Boolean = False): Boolean;
    function GetPCSNumber(): Boolean;
    function CheckSCZQ: Boolean;
    function CommonCheck: Boolean;
    function ExtractBarID(PackNo: Integer; out outBarID: string): Boolean;
    function IncBQDM(AOldDM: string): string;
    function GetZXBQInfo: Boolean;//取得中兴标签的信息
  public
    FCustCode: string;
    FSaleCustCode: string;
    procedure ViewShow(Rkey698: Integer);
    { Public declarations }
  end;

implementation

uses
  DM, Pick_Item_Single, searchso, DateUtils, WZ_gUnit, StrUtils, HighPermitFrm;

{$R *.dfm}

procedure TfrmZXKX2303.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmZXKX2303.btnBCBHClick(Sender: TObject);
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

procedure TfrmZXKX2303.btnXSDDClick(Sender: TObject);
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
    if edtXSDD.Text <> '' then LSql := LSql + ' AND Data0060.sales_order like '+ QuotedStr('%'+edtXSDD.Text+'%');
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
        GetZXBQInfo;
      end;
      edtXSDD.Text := LFrm.ADS60SALES_ORDER.AsString;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  finally
    LFrm.Free;
  end;
end;

function TfrmZXKX2303.GetBCBHInfo(AManu_Part_Number: string): Boolean;
var
  LSql: string;
begin
  Lsql := 'SELECT ANALYSIS_CODE_2,MANU_PART_DESC, set_qty,PRODUCT_NAME,set_lngth,set_width,packsize FROM Data0025 ' +
          ' LEFT JOIN Data0008 ON Data0025.PROD_CODE_PTR = Data0008.Rkey ' +
          //' inner join data0006 d06 on d06.bom_ptr = data0025.rkey ' +
          //' inner join data0056 d56 on d56.wo_ptr = d06.rkey ' +
          ' WHERE Manu_PART_NUMBER = ' + QuotedStr(AManu_Part_Number);
  Result := False;
  DM1.SqlOpen(Lsql);
  if DM1.qrytmp.IsEmpty then
  begin
    ShowMessage('本厂编号错误');
    Exit;
  end else
  begin
    edtKHWL.Text := DM1.qrytmp.FieldByName('ANALYSIS_CODE_2').AsString;
    edtKHXH.Text := DM1.qrytmp.FieldByName('MANU_PART_DESC').AsString;
    lblPcsPerSet.Caption := DM1.qrytmp.FieldByName('set_qty').AsString;
    if edtZXGG.Text = '' then
      edtZXGG.Text := DM1.qrytmp.fieldbyname('packsize').AsString;
    //edtBMCL.Text := DM1.qrytmp.fieldbyname('PRODUCT_NAME').AsString;
    Result := True;
  end;
end;

procedure TfrmZXKX2303.edtBCBHExit(Sender: TObject);
begin
  if edtBCBH.Text <> '' then
  begin
    if GetBCBHInfo(edtBCBH.Text) then
    begin
      GetZXBQInfo;
      edtXSDD.Text := DM1.GetXSDD(edtBCBH.Text, FSaleCustCode);
      GetXSDDInfo(edtXSDD.Text);
    end;
  end;
end;

function TfrmZXKX2303.GetXSDDInfo(ASOno: string;b: Boolean = False): Boolean;
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

procedure TfrmZXKX2303.edtXSDDExit(Sender: TObject);
begin
  if edtXSDD.Text <> '' then
    GetXSDDInfo(edtXSDD.Text, True);
end;

function TfrmZXKX2303.GetPCSNumber: Boolean;
var
  LPcsPerSet: Integer;
begin
  Result := False;
  try
    LPcsPerSet := StrToInt(lblPcsPerSet.Caption);
    LPcsPerSet := LPcsPerSet - cbbDCB.ItemIndex;
    if LPcsPerSet <= 0 then
    begin
      ShowMessage('SET中PCS数必须大于叉板数');
      Exit;
    end;
    edtSLPCS.Text := IntToStr(StrToInt(edtSLSet.Text) * LPcsPerSet);
    Result := true;
  except
    Result := True;
  end;
end;

procedure TfrmZXKX2303.edtSLSetExit(Sender: TObject);
begin
  GetPCSNumber;
end;

procedure TfrmZXKX2303.btnSCClick(Sender: TObject);
var
  I: Integer;
  LBarID: string;
  tmpQSXH: string;
begin
  if not CommonCheck then Exit;


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
  edtSCZQ.Enabled := False;
  btnBCBH.Enabled := False;
  btnXSDD.Enabled := False;
  //edtQSXH.Enabled := False;
  cbxZXBMCL.Enabled := False;
  cbbDCB.Enabled := False;
  cbxHKRQ.Enabled := False;
  dtpHKRQ.Enabled := False;
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
    ads699.FieldByName('lotno').Value := edtSCZQ.Text;
    ads699.FieldByName('notes').Value := edtBZ.Text;

    if ExtractBarID(I,LBarID) then
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

function TfrmZXKX2303.CommonCheck: Boolean;
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

procedure TfrmZXKX2303.btnResetClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TEdit) then
    begin
      (Self.Components[I] AS TEdit).Text := '';
      (Self.Components[I] AS TEdit).Enabled := True;
    end;
  end;
  edtCPMS.Text := '印制板';
  btnBCBH.Enabled := True;
  btnXSDD.Enabled := True;
  rgLX.Enabled := True;
  cbxZXBMCL.Enabled := True;
  cbbDCB.Enabled := True;
  cbxHKRQ.Enabled := True;
  dtpHKRQ.Enabled := True;
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
  edtSCZQ.Text := copy(dm1.qrytmp.FieldByName('NowYear').AsString,3,2) + Format('%.2d',[dm1.qrytmp.FieldByName('Nowweek').AsInteger]);

end;

function TfrmZXKX2303.ExtractBarID(PackNo: Integer;
  out outBarID: string): Boolean;
begin
  outBarID := '';
  Result := True;
end;


procedure TfrmZXKX2303.intgrfldads699qtyChange(Sender: TField);
begin
  if ads699.FieldByName('qty').AsInteger <= 0 then
  begin
    ShowMessage('数量不能小于等于0');
  end;
end;


function TfrmZXKX2303.CheckSCZQ: Boolean;
begin
  Result := False;
  if StrToIntDef(edtSCZQ.Text,-1) = -1 then
  begin
    ShowMessage('生产周期不正确，请重新输入4位有效数字');
    Exit;
  end;
  if Length(edtSCZQ.Text) <> 4 then
  begin
    ShowMessage('生产周期不正确，请重新输入4位有效数字');
    Exit;
  end;
  Result := True;
end;

procedure TfrmZXKX2303.btnOKClick(Sender: TObject);
var
  LSql: string;
  LPcsCount: Integer;
  tmpS: string;
  LIncNo: Integer;
  d: string;

  LReg: string;
  LRegHeader: string;
begin
    LReg := DM1.GetServerRegion;
    LRegHeader := '0';
    if LReg = '深圳' then
      LRegHeader := '2';

    if LReg = '梅州' then
      LRegHeader := '4';

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
  DM1.con1.BeginTrans;
  try
  try
    //标签代码+1
    if not DM1.SqlExec('UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncBQDM(edtBQDM.Text)) + ' WHERE RKey = 74') then
    begin
      ShowMessage('标签代码更新失败');
      Exit;
    end;

    //生成REEL ID
    DM1.SqlOpen('SELECT CONVERT(varchar(100), GETDATE(), 112) as d,CONVERT(varchar(100), GETDATE(), 23) as n');
    if length(DM1.qrytmp.FieldByName('d').AsString) <> 8 then
    begin
      DM1.con1.RollbackTrans;
      ShowMessage('REALID 日期不是6位，错误' + DM1.qrytmp.FieldByName('d').AsString);
    end;
    d :=  RightStr(dm1.qrytmp.FieldByName('d').AsString,6);
    //n := DM1.qrytmp.fieldbyname('n').AsString;
    DM1.SqlOpen(mmo1.Lines.Text);
    if DM1.qrytmp.IsEmpty then
      LIncNo := 0
    else
    begin
    if DM1.qrytmp.FieldByName('newIncNo').AsInteger = 1 then
      LIncNo := 0
    else
      LIncNo := DM1.qrytmp.fieldbyname('incNo').AsInteger;
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
    LSql := ' INSERT INTO Data0698(pack_number,so_ptr,description,code,qty,lotno,v_date,empl_ptr,pack_item,type,surface,netWeight,grossWeight,caseSpec,notes,flag) ' +
    ' VALUES(' + QuotedStr(edtBQDM.Text) + ',' + IntToStr(edtXSDD.Tag) + ',' + QuotedStr(edtCPMS.Text) + ',' +  QuotedStr(edtKGDM.Text) + ',' + IntToStr(LPcsCount) + ',' +
    QuotedStr(edtSCZQ.Text) + ',getdate(),' + gUser.User_Ptr + ',' + edtBQSL.Text + ',' +  QuotedStr(rgLX.Items[rgLX.ItemIndex]) + ',' +
    QuotedStr(cbxZXBMCL.Text) + ',' + QuotedStr(edtJZ.Text) + ',' + QuotedStr(edtMZ.Text) + ',' + QuotedStr(edtZXGG.Text) + ',';

    if (cbbDCB.ItemIndex > 0) and (cbbDCB.ItemIndex < StrToInt(lblPcsPerSet.Caption)) then
      tmpS :=  ';' + cbbDCB.Items[cbbDCB.ItemIndex] +';' ;
    if cbxHKRQ.Checked then
      tmpS := tmpS + ';@' + FormatDateTime('YYYY-MM-DD',dtpHKRQ.DateTime) + '@;';
    LSql := LSql + QuotedStr(tmpS) + ',' + IntToStr(rg1.ItemIndex) + ')';
    
    if not DM1.SqlExec(LSql) then
    begin
      ShowMessage('保存失败');
      Exit;
    end;
    DM1.SqlOpen('SELECT MAX(RKey) AS RKey698 FROM Data0698');
    ads699.First;
    while not ads699.Eof do
    begin
      LIncNo := LIncNo + 1;
      ads699.Edit;
      ads699.FieldByName('pack_ptr').Value := DM1.qrytmp.FieldByName('RKey698').AsInteger;

      ads699.FieldByName('incNo').AsInteger := LIncNo;
      ads699.FieldByName('printfilename').AsString := '2303';
      ads699.FieldByName('barcode_id').AsString :=
        '40003301' + d + LRegHeader + RightStr('000000' + IntToStr(LIncNo),5);
        //ads699.FieldByName('param2').AsInteger := cbx1.ItemIndex;
      //ads699.FieldByName('param1').AsString := n;

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

procedure TfrmZXKX2303.ViewShow(Rkey698: Integer);
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
  edtSCZQ.Text := DM1.adsFrmMain.FieldByName('lotno').AsString;
  edtSLPCS.Text := DM1.adsFrmMain.FieldByName('qty').AsString;
  edtJZ.Text := DM1.adsFrmMain.FieldByName('netWeight').AsString;
  edtMZ.Text := DM1.adsFrmMain.FieldByName('grossWeight').AsString;
  edtZXGG.Text := DM1.adsFrmMain.FieldByName('caseSpec').AsString;
  edtBZ.Text := ads699.FieldByName('notes').AsString;
  //edtBMCL.Text := DM1.adsFrmMain.FieldByName('surface').AsString;
  edtCPMS.Text := DM1.adsFrmMain.FieldByName('description').AsString;
  edtBQSL.Text := DM1.adsFrmMain.FieldByName('pack_item').AsString;
  GetBCBHInfo(edtBCBH.Text);
  GetZXBQInfo;
  GetXSDDInfo(edtXSDD.Text);
  edtSLSet.Text := '';//IntToStr(DM1.adsFrmMain.FieldByName('qty').AsInteger div StrToInt(lblPcsPerSet.Caption));
  if DM1.adsFrmMain.FieldByName('type').AsString = '内箱' then
    rgLX.ItemIndex := 0
  else
    rgLX.ItemIndex := 1;

end;

procedure TfrmZXKX2303.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmZXKX2303.IncBQDM(AOldDM: string): string;
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

procedure TfrmZXKX2303.eh699Columns2UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin

  if StrToIntDef(Value,-1) <= 0 then
  begin
    ShowMessage('数量不正确');
    Abort;
  end;
end;

function TfrmZXKX2303.GetZXBQInfo: Boolean;
var
  LSql: string;
  BMType: Integer;//1=喷锡，2=防氧化，3=沉金，4=防氧化+沉金
begin
  BMType := 0;
  LSql := ' SELECT DEPT_NAME,green_flag FROM Data0034 D34' +
    ' INNER JOIN Data0038 D38 ON D38.DEPT_PTR = D34.RKey ' +
    ' INNER JOIN Data0025 D25 ON D25.RKey = D38.SOURCE_PTR ' +
    ' WHERE D25.MANU_PART_NUMBER = ' + QuotedStr(edtBCBH.Text);
  if DM1.SqlOpen(LSql) then
  begin
      //喷锡
      DM1.qrytmp.First;
      while not DM1.qrytmp.Eof do
      begin
        if Pos('喷锡', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0 then
        begin
          BMType := 1;
          Break;
        end;
        DM1.qrytmp.Next;
      end;

      //抗氧化
      DM1.qrytmp.First;
      while not DM1.qrytmp.Eof do
      begin
        if (Pos('抗氧化', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0) or
          (Pos('防氧化', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0) or
          (Pos('OSP', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0) then
        begin
          BMType := 2;
          Break;
        end;
        DM1.qrytmp.Next;
      end;

      //沉金
      DM1.qrytmp.First;
      while not DM1.qrytmp.Eof do
      begin
        if (Pos('沉金', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0) or
          (Pos('化学金', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0) or
          (Pos('化金', DM1.qrytmp.FieldByName('DEPT_NAME').AsString) > 0) then
        begin
          if BMType = 2 then
            BMType := 4
          else
            BMType := 3;
          Break;
        end;
        DM1.qrytmp.Next;
      end;

      cbxZXBMCL.ItemIndex := BMType-1;           
  end;
  Result := True;
end;

procedure TfrmZXKX2303.cbbDCBChange(Sender: TObject);
begin
  if cbbDCB.ItemIndex <> 0 then
  begin
    edtBZ.Text := edtBZ.Text + ' ' + cbbDCB.Items[cbbDCB.ItemIndex]
  end;
end;

end.
