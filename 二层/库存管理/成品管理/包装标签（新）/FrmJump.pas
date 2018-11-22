unit FrmJump;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmJmp = class(TForm)
    btnOK: TButton;
    lbl2: TLabel;
    lbl4: TLabel;
    btnBCBH: TSpeedButton;
    btnXSDD: TSpeedButton;
    lblDDS: TLabel;
    lbl24: TLabel;
    lblYDY: TLabel;
    lbl26: TLabel;
    edtBCBH: TEdit;
    edtXSDD: TEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    procedure edtBCBHExit(Sender: TObject);
    procedure edtXSDDExit(Sender: TObject);
    procedure btnBCBHClick(Sender: TObject);
    procedure btnXSDDClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FOrgCust: string;
    FCustCode: string;
    constructor Create(AOwner: TComponent; ACust_Code: string);reintroduce;
    function GetBCBHInfo(AManu_Part_Number: string): Boolean;
    function GetXSDDInfo(ASOno: string; b: Boolean = False): Boolean;
    function GetOrgCust(Abbrname: string): Boolean;
  end;

implementation

uses DM,Pick_Item_Single,searchso,HighPermitFrm, WZ_gUnit;

{$R *.dfm}

procedure TfrmJmp.edtBCBHExit(Sender: TObject);
begin
  if edtBCBH.Text <> '' then
  begin
    if GetBCBHInfo(edtBCBH.Text) then
    begin
      edtXSDD.Text := DM1.GetXSDD(edtBCBH.Text, FCustCode);
      GetXSDDInfo(edtXSDD.Text);
    end;
  end;
end;

procedure TfrmJmp.edtXSDDExit(Sender: TObject);
begin
  if edtXSDD.Text <> '' then
    GetXSDDInfo(edtXSDD.Text, True);
end;

procedure TfrmJmp.btnBCBHClick(Sender: TObject);
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
                    ' WHERE D10.CUST_CODE = ' + QuotedStr(FCustCode) +' AND D25.PARENT_PTR IS NULL ';
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

procedure TfrmJmp.btnXSDDClick(Sender: TObject);
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
    LSql := ' AND Data0010.CUST_CODE = ' + QuotedStr(FCustCode);
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

function TfrmJmp.GetBCBHInfo(AManu_Part_Number: string): Boolean;
var
  lsql: string;
begin
  Lsql := 'SELECT ANALYSIS_CODE_2,MANU_PART_DESC,ORIG_CUSTOMER, set_qty,PRODUCT_NAME,set_lngth,set_width FROM Data0025 ' +
          ' LEFT JOIN Data0008 ON Data0025.PROD_CODE_PTR = Data0008.Rkey ' +
          //' inner join data0006 d06 on d06.bom_ptr = data0025.rkey ' +
          //' inner join data0056 d56 on d56.wo_ptr = d06.rkey ' +
          ' WHERE Manu_PART_NUMBER = ' + QuotedStr(AManu_Part_Number);
  Result := False;
  DM1.SqlOpen(Lsql);
  if DM1.qrytmp.IsEmpty then
  begin
    ShowMessage('本厂编号错误, 或者无此型号的在线作业单');
    Exit;
  end else
  begin
    if dm1.qrytmp.FieldByName('ORIG_CUSTOMER').AsString = '' then
    begin
      ShowMessage('没有关联原客户');
      Exit;
    end else
      GetOrgCust(dm1.qrytmp.FieldByName('ORIG_CUSTOMER').AsString);
//    edtKHWL.Text := DM1.qrytmp.FieldByName('ANALYSIS_CODE_2').AsString;
//    edtKHXH.Text := DM1.qrytmp.FieldByName('MANU_PART_DESC').AsString;
//    lblPcsPerSet.Caption := DM1.qrytmp.FieldByName('set_qty').AsString;
//    edtBMCL.Text := DM1.qrytmp.fieldbyname('PRODUCT_NAME').AsString;
//    FSetW := DM1.qrytmp.fieldbyname('set_lngth').AsString;
//    FSetH := DM1.qrytmp.fieldbyname('set_width').AsString;
    Result := True;
  end;
end;

function TfrmJmp.GetXSDDInfo(ASOno: string; b: Boolean): Boolean;
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
//    edtKHDD.Text := DM1.qrytmp.FieldByName('PO_NUMBER').AsString;
//    edtXSDD.Tag := DM1.qrytmp.FIeldByName('RKey').AsInteger;
    Result := True;
  end;
end;

constructor TfrmJmp.Create(AOwner: TComponent; ACust_Code: string);
begin
  inherited Create(AOwner);
  FCustCode := ACust_Code;
end;

function TfrmJmp.GetOrgCust(Abbrname: string): Boolean;
var
  LSql: string;
begin
  Result := False;
  FOrgCust := '';
  LSql := 'select cust_Code, CUSTOMER_NAME from data0010 where abbr_name = ' + QuotedStr(Abbrname);
  if DM1.SqlOpen(LSql) then
  begin
    if not DM1.qrytmp.IsEmpty then
    begin
      lbl6.Caption := DM1.qrytmp.FieldValues['CUSTOMER_NAME'];
      lbl10.Caption := DM1.qrytmp.FieldValues['cust_Code'];
      FOrgCust := DM1.qrytmp.FieldValues['cust_Code'];
      Result := true;
    end;
  end;
end;

procedure TfrmJmp.FormShow(Sender: TObject);
var
  LSql: string;
begin
  LSql := 'select cust_Code, CUSTOMER_NAME from data0010 where cust_code = ' + QuotedStr(FCustCode);
  if DM1.SqlOpen(LSql) then
  begin
    if not DM1.qrytmp.IsEmpty then
    begin
      lbl5.Caption := DM1.qrytmp.FieldValues['CUSTOMER_NAME'];
      lbl8.Caption := DM1.qrytmp.FieldValues['cust_Code'];
    end;
  end;
end;

procedure TfrmJmp.btnOKClick(Sender: TObject);
begin
  if not GetBCBHInfo(edtBCBH.Text) then Exit;
  if not GetXSDDInfo(edtXSDD.Text) then Exit;
  if FOrgCust = '' then
  begin
    ShowMessage('没有关联原客户');
    exit;
  end;
  ModalResult := mrOk;
end;

end.
