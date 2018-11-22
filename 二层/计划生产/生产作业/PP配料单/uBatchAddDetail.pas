unit uBatchAddDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB;

type
  TfrmBatchAddDetail = class(TForm)
    Label2: TLabel;
    edt17: TEdit;
    Label4: TLabel;
    edtpp_quota: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton2: TSpeedButton;
    cbbPP_TYP: TComboBox;
    cbbpp_rc: TComboBox;
    cbbpp_tg: TComboBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbPP_TYPDropDown(Sender: TObject);
    procedure edtpp_quotaKeyPress(Sender: TObject; var Key: Char);
  private
    vType: Byte;
    vLS: string;
  public
    iIES_PARAMETER_VALUE2,iIES_PARAMETER_VALUE3: string;
    procedure Init(Tag: Byte; LS: string);
  end;

var
  frmBatchAddDetail: TfrmBatchAddDetail;

implementation

uses uDM, Pick_Item_Single, ConstVar, Pick_Item_Single_Other;

{$R *.dfm}

procedure TfrmBatchAddDetail.Init(Tag: Byte; LS: string);
begin
  vType:= Tag;
  vLS:= LS;
end;

procedure TfrmBatchAddDetail.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single_Other := TfrmPick_Item_Single_Other.Create(application);
  try
    InputVar.Fields := 'INV_PART_NUMBER/材料编号/170,INV_PART_DESCRIPTION/品名规格/251,ABBR_NAME/供应商简称/100,SUPPLIER2/原供应商/80,'+
                       'IES_PARAMETER_VALUE1/PP型号/50,IES_PARAMETER_VALUE2/半固化片宽(英寸)/110,IES_PARAMETER_VALUE3/半固化片长(米)/95,'+
                       'IES_PARAMETER_VALUE4/树脂含量%/65,IES_PARAMETER_VALUE5/TG值/50,IES_PARAMETER_VALUE6/是否无卤素/65,QUAN_ON_HAND_1/当前数量(卷)/80,QUAN_ON_HAND_2/当前数量(米)/80';

    InputVar.Sqlstr :=
    'SELECT t17.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,t17.INV_NAME,t17.INV_DESCRIPTION,t23.ABBR_NAME,t22.SUPPLIER2,'+#13+
    't17.IES_PARAMETER_VALUE1,t17.IES_PARAMETER_VALUE2,t17.IES_PARAMETER_VALUE3,t17.IES_PARAMETER_VALUE4,t17.IES_PARAMETER_VALUE5,t17.IES_PARAMETER_VALUE6,'+#13+
    'SUM(t730.QUAN_ON_HAND_1) AS QUAN_ON_HAND_1,SUM(t730.QUAN_ON_HAND_2) AS QUAN_ON_HAND_2'+#13+
    'FROM Data0017 t17 INNER JOIN Data0496 t496 ON t17.GROUP_PTR=t496.RKEY'+#13+
    'INNER JOIN Data0730 t730 ON t17.RKEY=t730.D017_PTR'+#13+
    'INNER JOIN Data0192 t192 ON t496.RKEY=t192.CLOSE_HOURTH'+#13+
    'INNER JOIN Data0207 t207 ON t730.D207_PTR=t207.RKEY'+#13+
    'INNER JOIN Data0022 t22 ON t207.D0022_PTR=t22.RKEY'+#13+
    'INNER JOIN Data0456 t456 ON t22.GRN_PTR=t456.RKEY'+#13+
    'INNER JOIN Data0023 t23 ON t456.SUPP_PTR=t23.RKEY'+#13+
    'WHERE ((t730.QUAN_ON_HAND_1>0) or (t730.QUAN_ON_HAND_2>0))'+#13+
    'AND t17.IES_PARAMETER_VALUE5='''+dm.aq732.FieldByName('pp_tg').AsString+''''+#13+
    'AND t17.IES_PARAMETER_VALUE6='''+vLS+''''+#13+
    'GROUP BY t17.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,t17.INV_NAME,t17.INV_DESCRIPTION,t23.ABBR_NAME,t22.SUPPLIER2,'+#13+
    't17.IES_PARAMETER_VALUE1,t17.IES_PARAMETER_VALUE2,t17.IES_PARAMETER_VALUE3,t17.IES_PARAMETER_VALUE4,t17.IES_PARAMETER_VALUE5,t17.IES_PARAMETER_VALUE6'+#13+
    'ORDER BY t17.INV_PART_NUMBER';
    inputvar.InPut_value:='';
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single_Other.InitForm_New(InputVar,vLS,False,nil);
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

procedure TfrmBatchAddDetail.BitBtn1Click(Sender: TObject);
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

procedure TfrmBatchAddDetail.FormShow(Sender: TObject);
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

  cbbpp_tg.Text:=dm.aq732.FieldByName('pp_tg').AsString;
  cbbpp_tg.Enabled:= False;
end;

procedure TfrmBatchAddDetail.cbbPP_TYPDropDown(Sender: TObject);
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

procedure TfrmBatchAddDetail.edtpp_quotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['0'..'9',#8]) then Key:=#0;
end;

end.
