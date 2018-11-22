unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Math, Grids, DBGridEh, Mask,
  DBCtrls, DBCtrlsEh;

const sqltext = 'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG from data0004 where RKEY = 29';

type
  TfrmDetail = class(TForm)
    pnlTools: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    pnlClient: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    btnLookCust: TBitBtn;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btnLookPO: TBitBtn;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    btnLookShip: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label8: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBText2: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    Edit6: TEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure btnLookPOClick(Sender: TObject);
    procedure btnLookShipClick(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit7ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    IsPost: Byte;
    ReturnQnty: Single;
    procedure Update_04(v_seed: string);
    procedure SetEnable;
  public
    { Public declarations }
  end;

var
  frmDetail: TfrmDetail;

implementation

uses common, Browse, damo, FindPO, FindShip, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure TfrmDetail.btnSaveClick(Sender: TObject);
var
  i: integer;
  iComponent: TComponent;
begin
  IsPost:= 1;
  for i:= 0 to ComponentCount - 1 do
  begin
    iComponent:= Components[i];
    if iComponent.Tag <> 100 then Continue;
    if iComponent is TDBEdit then
    begin
      if (iComponent as TDBEdit).Text = '' then
      begin
        ShowMessage((iComponent as TDBEdit).Hint+'不能为空!');
        if (iComponent as TDBEdit).CanFocus then
          (iComponent as TDBEdit).SetFocus;
        Abort;
      end;
    end;
  end;

  dm.ADOConn.BeginTrans;
  try
    dm.aq98.UpdateBatch();
    if frmBrowse.YY = 1 then
    begin
      if frmBrowse.OpenQuery(dm.aqTmp,[],sqltext) then
      begin
        if dm.aqTmp.FieldValues['seed_flag'] <> 1 then
          Update_04(trim(DBEdit1.Text));
      end;
    end;

    //更新WZCP0063中的退货数
    ReturnQnty:= dm.aq98QTY_AUTH.AsCurrency - ReturnQnty;
    frmBrowse.OpenQuery(dm.aqTmp,[CurrToStr(ReturnQnty),dm.aq98SO_SHIP_PTR.AsString],
    'Update t63 Set returen_qty = t63.returen_qty + :Qnty'+#13+
    'From WZCP0063 t63 INNER JOIN Data0098 t98 ON t63.rkey= t98.SO_SHIP_PTR'+#13+
    'Where t98.SO_SHIP_PTR = :rkey63',1);

    dm.ADOConn.CommitTrans;
    ModalResult:= mrok;
    MessageDlg('保存成功!',  mtInformation, [mbOK], 0);
  except
    on E: Exception do
    begin
      dm.ADOConn.RollbackTrans;
      MessageDlg(E.Message+#13+#13+'保存失败!',  mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmDetail.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmDetail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsPost = 1 then Exit;
  if frmBrowse.YY <> 3 then
  begin
    if messagedlg('你确定不保存退出吗?', mtconfirmation, [mbyes, mbno],0) = mryes then
    begin
      if dm.aq98.State in [dsInsert, dsEdit] then dm.aq98.Cancel;
      self.ModalResult:= mrCancel;
    end
    else
      CanClose:= False;
  end;
end;

procedure TfrmDetail.FormActivate(Sender: TObject);
begin
  SetEnable;
  if frmBrowse.YY = 1 then  //新增
  begin
    dm.aq98.Append;
    dm.aq98.FieldByName('NOTE_PAD_PTR').AsInteger:= 1;
    dm.aq98.FieldByName('AUTH_BY_EMPL_PTR').AsString:= USERRKEY;
    dm.aq98.FieldByName('RMA_DATE').AsDateTime:= getsystem_date(dm.aqTmp,0);
    dm.aq98.FieldByName('sys_date').AsDateTime:= getsystem_date(dm.aqTmp,0);//系统退货日期
    dm.aq98.FieldByName('RMA_STATUS').AsInteger:= 1;//1:未提交
    dm.aq98.FieldByName('QTY_AUTH').AsCurrency:= 0;
    dm.aq98.FieldByName('CUSTOMER_PTR').AsInteger:= 0;
    dm.aq98.FieldByName('SO_PTR').AsInteger:= 0;
    if frmBrowse.OpenQuery(dm.aqTmp,[],sqltext) then
    begin
      if dm.aqTmp.FieldValues['seed_flag'] <> 1 then  //1:手动输入
        DBEdit1.Text:= dm.aqTmp.FieldByName('SEED_VALUE').Value;
      if dm.aqTmp.FieldValues['seed_flag'] = 4 then   //4:系统计算且不可修改
        DBEdit1.Enabled:= False
      else
        DBEdit1.Enabled:= True;
    end;
  end;
  if frmBrowse.YY = 2 then  //编辑
    if not (dm.aq98.State in [dsInsert, dsEdit]) then dm.aq98.Edit;
    
  ReturnQnty:= dm.aq98.FieldByName('QTY_AUTH').AsCurrency;  //记录修改前的退货数
end;

procedure TfrmDetail.Update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  frmBrowse.OpenQuery(dm.aqTmp,[],sqltext);
  v_length := length(v_seed);
  for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
  begin
    v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed:= copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
    dm.aqTmp.Edit; //使前缀不变后缀加1
    dm.aqTmp.FieldValues['SEED_VALUE']:= new_seed;
    dm.aqTmp.Post;
    break;
  end
  else
  if i=1 then //如果第一位仍然是数字
  begin
    v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
    new_seed := copy(v_last,2,v_length);
    dm.aqTmp.Edit;
    dm.aqTmp.FieldValues['SEED_VALUE']:= new_seed;
    dm.aqTmp.Post;
  end;
end;

procedure TfrmDetail.btnLookCustClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(Application);
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'abbr_name/简称/125';
    InputVar.Sqlstr :=
    'SELECT CUST_CODE, CUSTOMER_NAME,'+#13+
    'abbr_name, RKEY FROM dbo.Data0010'+#13+
    'order by cust_code';
    inputvar.InPut_value:= DBEdit2.Text;
    inputvar.KeyField:= 'CUST_CODE';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      dm.aq98CUSTOMER_PTR.AsInteger:= StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['RKEY']));
      dm.aq98SO_PTR.AsInteger:= 0;
      dm.aq98SO_SHIP_PTR.AsInteger:= 0;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.btnLookPOClick(Sender: TObject);
begin
  frmFindPO := TfrmFindPO.Create(Application);
  try
    if frmFindPO.ShowModal = mrok then
    begin
      dm.aq98SO_PTR.AsInteger:= dm.aqFindPOrkey.AsInteger;
      dm.aq98SO_SHIP_PTR.AsInteger:= 0;
      if DBEdit2.Text = '' then dm.aq98CUSTOMER_PTR.AsInteger:= dm.aqFindPORKEY10.AsInteger;
    end;
  finally
    frmFindPO.Free;
  end;
end;

procedure TfrmDetail.btnLookShipClick(Sender: TObject);
begin
  frmFindShip := TfrmFindShip.Create(Application);
  try
    if frmFindShip.ShowModal = mrok then
    begin
      dm.aq98SO_SHIP_PTR.AsInteger:= dm.aqFindShiprkey.AsInteger;
      if DBEdit2.Text = '' then dm.aq98CUSTOMER_PTR.AsInteger:= dm.aqFindShipRKEY10.AsInteger;
      if DBEdit3.Text = '' then dm.aq98SO_PTR.AsInteger:= dm.aqFindShiprkey70.AsInteger;
    end;
  finally
    frmFindShip.Free;
  end;
end;

procedure TfrmDetail.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((frmBrowse.YY = 1) and (key = #8)) then
  begin
    dm.aq98CUSTOMER_PTR.AsInteger:= 0;
    dm.aq98SO_PTR.AsInteger:= 0;
    dm.aq98SO_SHIP_PTR.AsInteger:= 0;
  end;
end;

procedure TfrmDetail.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if ((frmBrowse.YY = 1) and (key = #8)) then
  begin
    dm.aq98SO_PTR.AsInteger:= 0;
    dm.aq98SO_SHIP_PTR.AsInteger:= 0;
  end;
end;

procedure TfrmDetail.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if ((frmBrowse.YY = 1) and (key = #8)) then dm.aq98SO_SHIP_PTR.AsInteger:= 0;
end;

procedure TfrmDetail.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  if Edit6.Text = '' then
  begin
    ShowMessage('请先选择出仓单!');
    if btnLookShip.CanFocus then
      btnLookShip.SetFocus;
    Abort;
  end;
  if Pos('.',DBEdit7.Text)>0 then  //只允许输入一次小数点
  begin
    if Key = '.' then
      Key:= #0;
  end;
  if ((DBEdit7.Text = '') and (Key = '.')) then Key:= #0;  //第一位不允许输入小数点
  if not (Key in['0'..'9','.',#8]) then Key:= #0;
end;

procedure TfrmDetail.DBEdit7Exit(Sender: TObject);
begin
  if Edit6.Text = '' then Exit;
  if DBEdit7.Text = '' then Exit;
  try
    if StrToCurr(DBEdit7.Text) > StrToCurr(Edit6.Text) then
      Raise Exception.Create('退货数量不允许大于可退货数量!');
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      DBEdit7.SetFocus;
      dm.aq98QTY_AUTH.AsCurrency:= StrToCurr(Edit6.Text);
      Abort;
    end;
  end;
end;

procedure TfrmDetail.SetEnable;
begin
  if frmBrowse.YY = 1 then
  begin
    btnLookCust.Enabled:= True;
    btnLookPO.Enabled:= True;
    btnLookShip.Enabled:= True;
  end
  else
  begin
    btnLookCust.Enabled:= False;
    btnLookPO.Enabled:= False;
    btnLookShip.Enabled:= False;
  end;
end;

procedure TfrmDetail.FormShow(Sender: TObject);
begin
  frmBrowse.OpenQuery(dm.aqInfo,[dm.aq98SO_SHIP_PTR.AsString]);
  if frmBrowse.YY = 1 then
    Edit6.Text:= CurrToStr(dm.aqInfoquantity.AsCurrency - dm.aqInforeturen_qty.AsCurrency)
  else
    Edit6.Text:= CurrToStr(dm.aqInfoquantity.AsCurrency - dm.aqInforeturen_qty.AsCurrency + dm.aq98.FieldByName('QTY_AUTH').AsCurrency);

  frmBrowse.OpenQuery(dm.aq70,[dm.aq98SO_PTR.AsString]);
  frmBrowse.OpenQuery(dm.aq10,[dm.aq98CUSTOMER_PTR.AsString]);
end;

procedure TfrmDetail.DBEdit7ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Handled:= True;  //屏蔽右键菜单
end;

end.
