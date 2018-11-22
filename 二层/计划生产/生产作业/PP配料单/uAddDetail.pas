unit uAddDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB;

type
  TfrmAddDetail = class(TForm)
    Label1: TLabel;
    edt06: TEdit;
    Label2: TLabel;
    edt17: TEdit;
    Label3: TLabel;
    edtmanuf_qty: TEdit;
    Label4: TLabel;
    edtpp_quota: TEdit;
    Label5: TLabel;
    edtpanel_qty: TEdit;
    Label6: TLabel;
    edtpanel_ln: TEdit;
    Label7: TLabel;
    edtpanel_wd: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cbbPP_TYP: TComboBox;
    cbbpp_rc: TComboBox;
    cbbpp_tg: TComboBox;
    procedure edtmanuf_qtyKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtpp_quotaChange(Sender: TObject);
    procedure edtpanel_lnKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbPP_TYPDropDown(Sender: TObject);
  private
    vType: Byte;
    WO: string;
  public
    iIES_PARAMETER_VALUE2,iIES_PARAMETER_VALUE3: string;
    procedure Init(Tag: Byte; WORK_ORDER_NUMBER: string);
  end;

var
  frmAddDetail: TfrmAddDetail;

implementation

uses uDM, Pick_Item_Single, ConstVar, Pick_Item_Single_Other;

{$R *.dfm}

procedure TfrmAddDetail.edtmanuf_qtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['0'..'9',#8]) then Key:=#0;
end;

procedure TfrmAddDetail.Init(Tag: Byte; WORK_ORDER_NUMBER: string);
begin
  vType:= Tag;
  WO:=WORK_ORDER_NUMBER;
  if vType=0 then //zhengchang
  begin
    edtmanuf_qty.Enabled:=False;
    edtmanuf_qty.Color:=clScrollBar;
  end
  else
  if vType=1 then
  begin
    edtmanuf_qty.Enabled:=True;
    edtmanuf_qty.Color:=clWindow;
  end;
end;

procedure TfrmAddDetail.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/130,MANU_PART_NUMBER/本厂编号/110,PANELS/PNL数量/80';
    InputVar.Sqlstr :=
    'SELECT t6.RKEY,t6.WORK_ORDER_NUMBER,t25.MANU_PART_NUMBER,t6.PANELS,t6.panel_ln,t6.panel_wd'+#13+
    'FROM Data0025 t25 INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR'+#13+
    'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'+#13+
    'INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'+#13+
    'WHERE t6.PROD_STATUS IN(2,3,4)'+#13+
    'AND t34.TTYPE=1 AND t34.DEPT_NAME LIKE ''%压%'''+#13+
    'AND ISNULL(t6.ENGG_PROD_FLAG,0)= '+IntToStr(vType)+#13+
    'AND t25.MANU_PART_NUMBER = '''+WO+''''+#13+
    'ORDER BY t6.WORK_ORDER_NUMBER';
    inputvar.InPut_value:='';
    inputvar.KeyField:='WORK_ORDER_NUMBER';
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt06.Tag:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsInteger;
      edt06.Text:= frmPick_Item_Single.adsPick.FieldByName('WORK_ORDER_NUMBER').AsString;
      edtmanuf_qty.Text:= frmPick_Item_Single.adsPick.FieldByName('PANELS').AsString;
      edtpanel_ln.Text:= frmPick_Item_Single.adsPick.FieldByName('panel_ln').AsString;
      edtpanel_wd.Text:= frmPick_Item_Single.adsPick.FieldByName('panel_wd').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmAddDetail.edtpp_quotaChange(Sender: TObject);
begin
  if ((edtmanuf_qty.Text<>'') and (edtpp_quota.Text<>'')) then
    edtpanel_qty.Text:=inttostr(strtoint(edtmanuf_qty.Text)*strtoint(edtpp_quota.Text));
end;

procedure TfrmAddDetail.edtpanel_lnKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not (Key in['0'..'9','.',#8]) then Key:=#0;
end;

procedure TfrmAddDetail.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single_Other := TfrmPick_Item_Single_Other.Create(application);
  try
    InputVar.Fields := 'INV_PART_NUMBER/材料编号/170,INV_PART_DESCRIPTION/品名规格/251,'+
                       'IES_PARAMETER_VALUE1/PP型号/50,IES_PARAMETER_VALUE2/半固化片宽(英寸)/110,IES_PARAMETER_VALUE3/半固化片长(米)/95,'+
                       'IES_PARAMETER_VALUE4/树脂含量%/65,IES_PARAMETER_VALUE5/TG值/50,QUAN_ON_HAND_1/当前数量(卷)/80,QUAN_ON_HAND_2/当前数量(米)/80';

    InputVar.Sqlstr :=
    'SELECT t17.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,t17.INV_NAME,t17.INV_DESCRIPTION,'+#13+
    't17.IES_PARAMETER_VALUE1,t17.IES_PARAMETER_VALUE2,t17.IES_PARAMETER_VALUE3,t17.IES_PARAMETER_VALUE4,t17.IES_PARAMETER_VALUE5,'+#13+
    't730.QUAN_ON_HAND_1,t730.QUAN_ON_HAND_2'+#13+
    'FROM Data0017 t17 INNER JOIN Data0496 t496 ON t17.GROUP_PTR=t496.RKEY'+#13+
    'INNER JOIN Data0730 t730 ON t17.RKEY=t730.D017_PTR'+#13+
    'INNER JOIN Data0192 t192 ON t496.RKEY=t192.CLOSE_HOURTH'+#13+
    'WHERE ((t730.QUAN_ON_HAND_1>0) or (t730.QUAN_ON_HAND_2>0))'+#13+
    'ORDER BY t17.INV_PART_NUMBER';
    inputvar.InPut_value:='';
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single_Other.InitForm_New(InputVar);
    if frmPick_Item_Single_Other.ShowModal=mrok then
    begin
      edt17.Tag:= frmPick_Item_Single_Other.adsPick.FieldByName('RKEY').AsInteger;
      edt17.Text:= frmPick_Item_Single_Other.adsPick.FieldByName('INV_PART_NUMBER').AsString;
      iIES_PARAMETER_VALUE2:= frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE2').AsString;
      iIES_PARAMETER_VALUE3:= frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE3').AsString;
    end;
  finally
    frmPick_Item_Single_Other.adsPick.Close;
    frmPick_Item_Single_Other.Free;
  end;
end;

procedure TfrmAddDetail.BitBtn1Click(Sender: TObject);
var
  i: Integer;
  iComponent: TComponent;
begin
  for i:= 0 to ComponentCount - 1 do
  begin
    iComponent:= Components[i];
    if iComponent.Tag <> 1 then Continue;
    if iComponent is TEdit then
    begin
      if (iComponent as TEdit).Text = '' then
      begin
        ShowMessage((iComponent as TEdit).Hint+'不能为空!');
        if (iComponent as TEdit).CanFocus then
          (iComponent as TEdit).SetFocus;
        Abort;
      end;
    end;  
    if iComponent is TComboBox then
    begin
      if (iComponent as TComboBox).Text = '' then
      begin
        ShowMessage((iComponent as TComboBox).Hint+'不能为空!');
        if (iComponent as TComboBox).CanFocus then
          (iComponent as TComboBox).SetFocus;
        Abort;
      end;
    end;
  end;
  ModalResult:= mrOK;
end;

procedure TfrmAddDetail.FormShow(Sender: TObject);
var
  i: Integer;
  iComponent: TComponent;
begin
  for i:= 0 to ComponentCount - 1 do  //给Edit.Hint赋值Label.Caption
  begin
    iComponent:= Components[i];
    if iComponent is TLabel then
    begin
      (iComponent as TLabel).FocusControl.Hint:= (iComponent as TLabel).Caption;
    end;
  end;
  iIES_PARAMETER_VALUE2:='0';
  iIES_PARAMETER_VALUE3:='0';
end;

procedure TfrmAddDetail.cbbPP_TYPDropDown(Sender: TObject);
begin
  (Sender AS TComboBox).Items.Clear;
  with dm.aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT t338.TVALUE FROM Data0338 t338 INNER JOIN Data0278 t278 ON t338.PARAMETER_PTR=t278.RKEY');
    SQL.Add('WHERE t278.PARAMETER_DESC = '''+(Sender AS TComboBox).Hint+'''');
    SQL.Add('ORDER BY t338.SEQUENCE_NO');
    Open;
    while not Eof do
    begin
      (Sender AS TComboBox).Items.Add(FieldByName('TVALUE').AsString);
      Next;
    end;
  end; 
end;

end.
