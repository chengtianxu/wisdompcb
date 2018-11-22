unit uDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, Mask, DBCtrls, DBCtrlsEh, Menus,
  Grids, DBGridEh, cxControls, cxContainer, cxEdit, cxImage, cxDBEdit,
  ComCtrls, Math;

type
  TfrmDetail = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnPrint: TBitBtn;
    DBGridEh1: TDBGridEh;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    DBGridEh2: TDBGridEh;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    DBText2: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Splitter1: TSplitter;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Panel6: TPanel;
    RadioGroup1: TRadioGroup;
    cxDBImage1: TcxDBImage;
    DBMemo1: TDBMemo;
    N6: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure DBGridEh1Columns4EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridEh1Columns5EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);    
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    YY: Byte;   {1新增、2编辑、3检查}
    IsPost: Byte;
  public
    function CalcPP(PP_WD: Double): Double;
    procedure Init(OP: Byte);
  end;

var
  frmDetail: TfrmDetail;
  
implementation

uses uDM, common, uChooseWO, uAddDetail, uBrowse, Pick_Item_Single, ConstVar, Pick_Item_Single_Other, uBatchAddDetail;

{$R *.dfm}

{ TfrmDetail }

procedure TfrmDetail.Init(OP: Byte);
begin
  YY:= OP;
end;

procedure TfrmDetail.FormActivate(Sender: TObject);
var
  i,j: Integer;
begin
  if YY = 1 then  //新增
  begin
    dm.aq731.Append;
    dm.aq731.FieldByName('RKEY').AsInteger:= 0;
    dm.aq731.FieldByName('rkey25').AsInteger:=dm.aspBuild.FieldByName('rkey25').AsInteger;
    dm.aq731.FieldByName('dept_ptr').AsInteger:=dm.aspBuild.FieldByName('dept_ptr').AsInteger;
    dm.aq731.FieldByName('lam2').AsString:=dm.aspBuild.FieldByName('lam2').AsString;
    dm.aq731.FieldByName('lam_ty_gp').AsString:=dm.aspBuild.FieldByName('lam_ty_gp').AsString;
    dm.aq731.FieldByName('TTYPE').AsInteger:=dm.aspBuild.FieldByName('TTYPE').AsInteger;
    dm.aq731.FieldByName('manuf_qty').AsInteger:=dm.aspBuild.FieldByName('manuf_qty').AsInteger;
    dm.aq731.FieldByName('empl_ptr').AsString:=USERRKEY;
    dm.aq731.FieldByName('creare_date').AsDatetime:=getsystem_date(dm.aqTmp,0);
    dm.aqTmp.Recordset:= dm.aspBuild.NextRecordset(i);
    dm.aqTmp.First;
    for i:=0 to dm.aqTmp.RecordCount-1 do
    begin
      dm.aq732.Append;
      dm.aq732.FieldByName('rkey731').AsInteger:=0;
      dm.aq732.FieldByName('rkey06').AsInteger:=dm.aqTmp.FieldByName('RKEY06').AsInteger;
      dm.aq732.FieldByName('manuf_qty').AsInteger:=dm.aqTmp.FieldByName('manuf_qty').AsInteger;
      dm.aq732.FieldByName('pp_quota').AsInteger:=dm.aqTmp.FieldByName('pp_quota').AsInteger;
      dm.aq732.FieldByName('panel_qty').AsInteger:=dm.aqTmp.FieldByName('panel_qty').AsInteger;
      dm.aq732.FieldByName('panel_ln').AsFloat:=dm.aqTmp.FieldByName('panel_ln').AsFloat;
      dm.aq732.FieldByName('panel_wd').AsFloat:=dm.aqTmp.FieldByName('panel_wd').AsFloat;
      dm.aq732.FieldByName('PP_TYP').AsString:=dm.aqTmp.FieldByName('PP_TYP').AsString;
      dm.aq732.FieldByName('pp_rc').AsString:=dm.aqTmp.FieldByName('pp_rc').AsString;
      dm.aq732.FieldByName('pp_tg').AsString:=dm.aqTmp.FieldByName('pp_tg').AsString;
      dm.aqTmp.Next;
    end;
  end;
  if YY = 2 then  //编辑
  begin
    if not (dm.aq731.State in [dsInsert, dsEdit]) then dm.aq731.Edit;
    if not (dm.aq732.State in [dsInsert, dsEdit]) then dm.aq732.Edit;
  end;
  if DBRadioGroup1.ItemIndex=0 then
  begin
    DBGridEh1.Columns[7].ReadOnly:=True;
    DBGridEh1.Columns[7].Color:=clScrollBar;
  end
  else
  begin
    DBGridEh1.Columns[7].ReadOnly:=False;
    DBGridEh1.Columns[7].Color:=clWindow;
  end;

  for j:= 0 to pm1.Items.Count - 1 do
  begin
    if pm1.Items[j].Tag<>1 then
      pm1.Items[j].Visible:= YY <> 3;
  end;
end;

procedure TfrmDetail.SpeedButton1Click(Sender: TObject);
var
  i,j: integer;
begin
  with TfrmChooseWO.Create(Application) do
  begin
    Init(DBRadioGroup1.ItemIndex);
    edtBCBH.Text:=DBEdit8.Text;
    edtBCBH.Enabled:=True;
    btn1.Enabled:=True;
    ShowModal;
    if ModalResult=mrOk then
    begin
//      if dm.aq731.FieldByName('rkey25').AsInteger<>dm.aspBuild.FieldByName('rkey25').AsInteger then  //如果重新选择新的本厂编号
//      begin
        dm.aq732.First;
        while not dm.aq732.Eof do
        begin
          if dm.aq732.FieldByName('qg_flag').AsBoolean then
          begin
            Showmessage('PP已切割,不允许该操作');
            Abort;
          end;
          dm.aq732.Next;
        end;
//      end;
      if not (dm.aq731.State in[dsInsert, dsEdit]) then dm.aq731.Edit;
      dm.aq731.FieldByName('rkey25').AsInteger:=dm.aspBuild.FieldByName('rkey25').AsInteger;
      dm.aq731.FieldByName('dept_ptr').AsInteger:=dm.aspBuild.FieldByName('dept_ptr').AsInteger;
      dm.aq731.FieldByName('lam2').AsString:=dm.aspBuild.FieldByName('lam2').AsString;
      dm.aq731.FieldByName('lam_ty_gp').AsString:=dm.aspBuild.FieldByName('lam_ty_gp').AsString;
      dm.aq731.FieldByName('TTYPE').AsInteger:=dm.aspBuild.FieldByName('TTYPE').AsInteger;
      dm.aq731.FieldByName('manuf_qty').AsInteger:=dm.aspBuild.FieldByName('manuf_qty').AsInteger;
      dm.aq732.First;
      for i:=0 to dm.aq732.RecordCount-1 do
      begin
        dm.aq732.Delete;
        dm.aq732.Next;
      end;
      dm.aqTmp.Recordset:= dm.aspBuild.NextRecordset(i);
      dm.aqTmp.First;
      for j:=0 to dm.aqTmp.RecordCount-1 do
      begin
        if not dm.aq732.Locate('rkey06;PP_TYP',VarArrayOf([dm.aqTmp.FieldByName('RKEY06').AsInteger,dm.aqTmp.FieldByName('PP_TYP').AsString]),[]) then
        begin
          dm.aq732.Append;
          dm.aq732.FieldByName('rkey731').AsInteger:=dm.aq731.FieldByName('rkey').AsInteger;
          dm.aq732.FieldByName('rkey06').AsInteger:=dm.aqTmp.FieldByName('RKEY06').AsInteger;
          dm.aq732.FieldByName('manuf_qty').AsInteger:=dm.aqTmp.FieldByName('manuf_qty').AsInteger;
          dm.aq732.FieldByName('pp_quota').AsInteger:=dm.aqTmp.FieldByName('pp_quota').AsInteger;
          dm.aq732.FieldByName('panel_qty').AsInteger:=dm.aqTmp.FieldByName('panel_qty').AsInteger;
          dm.aq732.FieldByName('panel_ln').AsFloat:=dm.aqTmp.FieldByName('panel_ln').AsFloat;
          dm.aq732.FieldByName('panel_wd').AsFloat:=dm.aqTmp.FieldByName('panel_wd').AsFloat;
          dm.aq732.FieldByName('PP_TYP').AsString:=dm.aqTmp.FieldByName('PP_TYP').AsString;
          dm.aq732.FieldByName('pp_rc').AsString:=dm.aqTmp.FieldByName('pp_rc').AsString;
          dm.aq732.FieldByName('pp_tg').AsString:=dm.aqTmp.FieldByName('pp_tg').AsString;
        end;
        dm.aqTmp.Next;
      end;   
    end;
  end;
end;

procedure TfrmDetail.RadioGroup1Click(Sender: TObject);
begin
  cxDBImage1.Properties.Stretch:= RadioGroup1.ItemIndex=1;
end;

procedure TfrmDetail.btnSaveClick(Sender: TObject);
var
  ipanel_qty: Integer;
  ipp_quota_len: Double;
  RKEY06S: String;
begin
  IsPost:= 1;
  ipanel_qty:= 0;
  ipp_quota_len:= 0;
  RKEY06S:= '';
  with dm.aq732 do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if FieldByName('rkey17').IsNull then
        begin
          Showmessage('请选择材料');
          Abort;
        end;
        ipanel_qty:= ipanel_qty+FieldByName('panel_qty').AsInteger;
        ipp_quota_len:= ipp_quota_len+FieldByName('pp_quota_len').AsFloat;
        if RKEY06S='' then RKEY06S:= FieldByName('rkey06').AsString
        else
          RKEY06S:= RKEY06S+','+FieldByName('rkey06').AsString;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  if DBRadioGroup1.ItemIndex=0 then
  begin
    if RKEY06S<>'' then
    begin
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT t6.WORK_ORDER_NUMBER FROM DATA0732 t732 INNER JOIN Data0006 t6 ON t732.rkey06=t6.RKEY');
        SQL.Add('WHERE t732.rkey731<>'+dm.aq731.FieldByName('rkey').AsString);
        SQL.Add('AND t732.rkey06 IN('+RKEY06S+')');
        Open;
      end;
      if dm.aqTmp.RecordCount<>0 then
      begin
        Showmessage('存在PP已配料的作业单:'+dm.aqTmp.FieldByName('WORK_ORDER_NUMBER').AsString+',如还需配料请新增补料配料单');
        Abort;
      end;
    end;
  end;
  dm.adoConn.BeginTrans;
  try
    if not (dm.aq731.State in[dsInsert, dsEdit]) then dm.aq731.Edit;
    dm.aq731.FieldByName('panel_qty').AsInteger:=ipanel_qty;
    dm.aq731.FieldByName('pp_quota_len').AsFloat:=ipp_quota_len;
    dm.aq731.UpdateBatch();
    with dm.aq732 do
    begin
      DisableControls;
      try
        if YY = 1 then
        begin
          First;
          while not Eof do
          begin
            if not (State in [dsEdit]) then Edit;
            FieldByName('rkey731').Value:= dm.aq731rkey.Value;
            Next;
          end;
        end;
        UpdateBatch();
      finally
        EnableControls;
      end;
    end;
    if DBRadioGroup1.ItemIndex=0 then
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE t6 SET ENGG_PROD_FLAG=1');
      SQL.Add('FROM Data0006 t6 INNER JOIN DATA0732 t732 ON t6.RKEY=t732.rkey06');
      SQL.Add('WHERE ISNULL(t6.ENGG_PROD_FLAG,0)=0');
      SQL.Add('AND t732.rkey731='+dm.aq731.FieldByName('rkey').AsString);
      ExecSQL;
    end;
    dm.adoConn.CommitTrans;
    ModalResult:= mrok;
  except
    on E:Exception do
    begin
      Showmessage(E.Message+#13+'请重试!');
      dm.aq731.CancelBatch();
      dm.aq732.CancelBatch();
      if dm.adoConn.InTransaction then dm.adoConn.RollbackTrans;
    end;
  end;
end;

procedure TfrmDetail.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmDetail.btnPrintClick(Sender: TObject);
begin
//
end;

procedure TfrmDetail.DBGridEh1Columns4EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/110,MANU_PART_NUMBER/本厂编号/110,MANU_PART_DESC/客户型号/251';
    InputVar.Sqlstr :=
    'SELECT t6.RKEY,t6.WORK_ORDER_NUMBER,t25.MANU_PART_NUMBER,t25.MANU_PART_DESC,t6.PANELS'+#13+
    'FROM Data0025 t25'+#13+
    'INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR'+#13+
    'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'+#13+
    'INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'+#13+
    'WHERE t6.PROD_STATUS IN(2,3,4)'+#13+
    'AND t34.TTYPE=1 AND t34.DEPT_NAME LIKE ''%压%'''+#13+
    'AND ISNULL(t6.ENGG_PROD_FLAG,0)= '+IntToStr(DBRadioGroup1.ItemIndex)+#13+
    'AND t25.MANU_PART_NUMBER = '''+DBEdit8.Text+''''+#13+
    'ORDER BY t25.MANU_PART_NUMBER';
    inputvar.InPut_value:=dm.aq732.FieldByName('WORK_ORDER_NUMBER').AsString;
    inputvar.KeyField:='WORK_ORDER_NUMBER';
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not (dm.aq732.State in[dsInsert, dsEdit]) then dm.aq732.Edit;
      dm.aq732.FieldByName('rkey06').AsInteger:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsInteger;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.DBGridEh1Columns5EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  InputVar: PDlgInput;
  vPP_TYP,vpp_rc,vLS: string;
begin
  frmPick_Item_Single_Other := TfrmPick_Item_Single_Other.Create(application);
  try
    if DBCheckBox1.Checked then
      vLS:= '是'
    else
      vLS:= '否';
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
    inputvar.InPut_value:=dm.aq732.FieldByName('INV_PART_NUMBER').AsString;
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := DM.adoConn;
    
    frmPick_Item_Single_Other.InitForm_New(InputVar,vLS);
    case frmPick_Item_Single_Other.ShowModal of
     mrok:
     begin
      if not (dm.aq732.State in[dsInsert, dsEdit]) then dm.aq732.Edit;
      dm.aq732.FieldByName('rkey17').AsInteger:= frmPick_Item_Single_Other.adsPick.FieldByName('RKEY').AsInteger;
      dm.aq732.FieldByName('pp_quota_len').AsFloat:= CalcPP(25.4*frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE2').AsFloat);
      if frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE3').AsFloat-2<>0 then
        dm.aq732.FieldByName('pp_quota_roll').AsFloat:= dm.aq732.FieldByName('pp_quota_len').AsFloat/(frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE3').AsFloat-2)
      else
        dm.aq732.FieldByName('pp_quota_roll').AsFloat:= 0;
     end;
     mrYes:
     begin
      with dm.aq732 do
      begin
        vPP_TYP:= FieldByName('PP_TYP').AsString;
        vpp_rc:= FieldByName('pp_rc').AsString;
        DisableControls;
        try
          First;
          while not Eof do
          begin
            if ((vPP_TYP=FieldByName('PP_TYP').AsString) and (vpp_rc=FieldByName('pp_rc').AsString)) then
            begin
              if not (State in[dsInsert, dsEdit]) then Edit;
              FieldByName('rkey17').AsInteger:= frmPick_Item_Single_Other.adsPick.FieldByName('RKEY').AsInteger;
              FieldByName('pp_quota_len').AsFloat:= CalcPP(25.4*frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE2').AsFloat);
              if frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE3').AsFloat-2<>0 then
                FieldByName('pp_quota_roll').AsFloat:= FieldByName('pp_quota_len').AsFloat/(frmPick_Item_Single_Other.adsPick.FieldByName('IES_PARAMETER_VALUE3').AsFloat-2)
              else
                FieldByName('pp_quota_roll').AsFloat:= 0;
            end;
            Next;
          end;
        finally
          EnableControls;
        end;
      end;
     end;
    end;
  finally
    frmPick_Item_Single_Other.adsPick.Close;
    frmPick_Item_Single_Other.Free;
  end;
end;

procedure TfrmDetail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsPost = 1 then Exit;
  if YY <> 3 then
  begin
    if messagedlg('你确定不保存退出吗?', mtconfirmation, [mbyes, mbno],0) = mryes then
    begin
      if dm.aq731.State in [dsInsert, dsEdit] then dm.aq731.Cancel;
      if dm.aq732.State in [dsInsert, dsEdit] then dm.aq732.Cancel;
      self.ModalResult:= mrCancel;
    end
    else
      CanClose:= False;
  end;
end;

procedure TfrmDetail.N2Click(Sender: TObject);
begin
  if not dm.aq732.Active then Exit;
  if not (dm.aq732.State in[dsInsert, dsEdit]) then dm.aq732.Edit;
end;

procedure TfrmDetail.N3Click(Sender: TObject);
begin
  if not dm.aq732.Active then Exit;
  if dm.aq732.FieldByName('qg_flag').AsBoolean then
  begin
    Showmessage('PP已切割,不允许删除');
    Exit;
  end;
  if YY=2 then  //删除明细不保存会导致t6.ENGG_PROD_FLAG错误,正确的写法是进入该界面时先把所有作业单存到变量中,最后保存时再根据情况变更t6.ENGG_PROD_FLAG
  begin
    if DBRadioGroup1.ItemIndex=0 then
    begin
      if dm.aq732.FieldByName('rkey').AsString<>'' then
        frmBrowse.OpenQuery(dm.aqTmp, [dm.aq732.FieldByName('rkey').AsString],
                 'UPDATE t6 SET ENGG_PROD_FLAG=0 FROM Data0006 t6 INNER JOIN DATA0732 t732 ON t6.RKEY=t732.rkey06 WHERE t6.ENGG_PROD_FLAG=1 AND t732.rkey= :RKEY732',1);
    end;
  end;
  dm.aq732.Delete;
end;

procedure TfrmDetail.N4Click(Sender: TObject);
var
  i: integer;
begin
  with TfrmChooseWO.Create(Application) do
  begin
    Init(DBRadioGroup1.ItemIndex);
    edtBCBH.Text:=DBEdit8.Text;
    edtBCBH.Enabled:=False;
    btn1.Enabled:=False;
    ShowModal;
    if ModalResult=mrOk then
    begin
      dm.aqTmp.Recordset:= dm.aspBuild.NextRecordset(i);
      dm.aqTmp.First;
      for i:=0 to dm.aqTmp.RecordCount-1 do
      begin
        if not dm.aq732.Locate('rkey06;PP_TYP',VarArrayOf([dm.aqTmp.FieldByName('RKEY06').AsInteger,dm.aqTmp.FieldByName('PP_TYP').AsString]),[]) then
        begin
          dm.aq732.Append;
          dm.aq732.FieldByName('rkey731').AsInteger:=dm.aq731.FieldByName('rkey').AsInteger;
          dm.aq732.FieldByName('rkey06').AsInteger:=dm.aqTmp.FieldByName('RKEY06').AsInteger;
          dm.aq732.FieldByName('manuf_qty').AsInteger:=dm.aqTmp.FieldByName('manuf_qty').AsInteger;
          dm.aq732.FieldByName('pp_quota').AsInteger:=dm.aqTmp.FieldByName('pp_quota').AsInteger;
          dm.aq732.FieldByName('panel_qty').AsInteger:=dm.aqTmp.FieldByName('panel_qty').AsInteger;
          dm.aq732.FieldByName('panel_ln').AsFloat:=dm.aqTmp.FieldByName('panel_ln').AsFloat;
          dm.aq732.FieldByName('panel_wd').AsFloat:=dm.aqTmp.FieldByName('panel_wd').AsFloat;
          dm.aq732.FieldByName('PP_TYP').AsString:=dm.aqTmp.FieldByName('PP_TYP').AsString;
          dm.aq732.FieldByName('pp_rc').AsString:=dm.aqTmp.FieldByName('pp_rc').AsString;
          dm.aq732.FieldByName('pp_tg').AsString:=dm.aqTmp.FieldByName('pp_tg').AsString;
        end;                                                                             
        dm.aqTmp.Next;
      end;
    end;
  end;
end;

procedure TfrmDetail.N5Click(Sender: TObject);
begin
  with TfrmAddDetail.Create(Application) do
  begin
    Init(DBRadioGroup1.ItemIndex,DBEdit8.Text);
    ShowModal;
    if ModalResult=mrOk then
    begin
      if not dm.aq732.Locate('rkey06;rkey17',VarArrayOf([edt06.Tag,edt17.Tag]),[]) then
      begin
        dm.aq732.Append;
        dm.aq732.FieldByName('rkey731').AsInteger:=dm.aq731.FieldByName('rkey').AsInteger;
        dm.aq732.FieldByName('rkey06').AsInteger:=edt06.Tag;
        dm.aq732.FieldByName('rkey17').AsInteger:=edt17.Tag;
        dm.aq732.FieldByName('manuf_qty').AsString:=edtmanuf_qty.Text;
        dm.aq732.FieldByName('pp_quota').AsString:=edtpp_quota.Text;
        dm.aq732.FieldByName('panel_qty').AsString:=edtpanel_qty.Text;
        dm.aq732.FieldByName('panel_ln').AsString:=edtpanel_ln.Text;
        dm.aq732.FieldByName('panel_wd').AsString:=edtpanel_wd.Text;
        dm.aq732.FieldByName('PP_TYP').AsString:=cbbPP_TYP.Text;
        dm.aq732.FieldByName('pp_rc').AsString:=cbbpp_rc.Text;
        dm.aq732.FieldByName('pp_tg').AsString:=cbbpp_tg.Text;

        dm.aq732.FieldByName('pp_quota_len').AsFloat:= CalcPP(25.4*strtofloat(iIES_PARAMETER_VALUE2));
        if strtofloat(iIES_PARAMETER_VALUE3)-2<>0 then
          dm.aq732.FieldByName('pp_quota_roll').AsFloat:= dm.aq732.FieldByName('pp_quota_len').AsFloat/(strtofloat(iIES_PARAMETER_VALUE3)-2)
        else
          dm.aq732.FieldByName('pp_quota_roll').AsFloat:= 0;
      end
      else
      begin
        Showmessage('该作业单已存在,不能重复添加');
      end;
    end;
  end;
end;

procedure TfrmDetail.N6Click(Sender: TObject);
type
  TOnChange = procedure(Sender: TField) of object;
  TBatchInfo= Record
    RKEY06: Integer;
    panel_ln: Double;
    panel_wd: Double;
    manuf_qty: Integer;
  End;
var
  BAT: Array of TBatchInfo;
  i: integer;
  NoFind: Boolean;
  vOnChange7,vOnChange8:TOnChange;
begin
  SetLength(BAT,1);
  with dm.aq732 do
  begin
    DisableControls;
    try
      First;
      BAT[0].RKEY06:=FieldByName('rkey06').AsInteger;
      BAT[0].panel_ln:=FieldByName('panel_ln').AsFloat;
      BAT[0].panel_wd:=FieldByName('panel_wd').AsFloat;
      BAT[0].manuf_qty:=FieldByName('manuf_qty').AsInteger;
      while not Eof do
      begin
        NoFind:= True;
        for i:=0 to length(BAT)-1 do
        begin
          if FieldByName('rkey06').AsInteger=BAT[i].RKEY06 then
            NoFind:= False;
        end;
        if NoFind then
        begin
          SetLength(BAT,length(BAT)+1);
          BAT[length(BAT)-1].RKEY06:=FieldByName('rkey06').AsInteger;
          BAT[length(BAT)-1].panel_ln:=FieldByName('panel_ln').AsFloat;
          BAT[length(BAT)-1].panel_wd:=FieldByName('panel_wd').AsFloat;
          BAT[length(BAT)-1].manuf_qty:=FieldByName('manuf_qty').AsInteger;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end; 
  with TfrmBatchAddDetail.Create(Application) do
  begin
    if DBCheckBox1.Checked then
      Init(DBRadioGroup1.ItemIndex,'是')
    else
      Init(DBRadioGroup1.ItemIndex,'否');
    ShowModal;
    if ModalResult=mrOk then
    begin
      vOnChange7:=dm.aq732.Fields[7].OnChange;
      vOnChange8:=dm.aq732.Fields[8].OnChange;
      dm.aq732.Fields[7].OnChange:=nil;
      dm.aq732.Fields[8].OnChange:=nil;
      for i:=0 to length(BAT)-1 do
      begin
        if not dm.aq732.Locate('rkey06;rkey17',VarArrayOf([BAT[i].RKEY06,edt17.Tag]),[]) then
        begin
          dm.aq732.Append;
          dm.aq732.FieldByName('rkey731').AsInteger:=dm.aq731.FieldByName('rkey').AsInteger;
          dm.aq732.FieldByName('rkey06').AsInteger:=BAT[i].RKEY06;
          dm.aq732.FieldByName('rkey17').AsInteger:=edt17.Tag;
          dm.aq732.FieldByName('manuf_qty').AsInteger:=BAT[i].manuf_qty;
          dm.aq732.FieldByName('pp_quota').AsString:=edtpp_quota.Text;
          dm.aq732.FieldByName('panel_qty').AsInteger:=BAT[i].manuf_qty*StrToInt(edtpp_quota.Text);
          dm.aq732.FieldByName('panel_ln').AsFloat:=BAT[i].panel_ln;
          dm.aq732.FieldByName('panel_wd').AsFloat:=BAT[i].panel_wd;
          dm.aq732.FieldByName('PP_TYP').AsString:=cbbPP_TYP.Text;
          dm.aq732.FieldByName('pp_rc').AsString:=cbbpp_rc.Text;
          dm.aq732.FieldByName('pp_tg').AsString:=cbbpp_tg.Text;

          dm.aq732.FieldByName('pp_quota_len').AsFloat:= CalcPP(25.4*strtofloat(iIES_PARAMETER_VALUE2));
          if strtofloat(iIES_PARAMETER_VALUE3)-2<>0 then
            dm.aq732.FieldByName('pp_quota_roll').AsFloat:= dm.aq732.FieldByName('pp_quota_len').AsFloat/(strtofloat(iIES_PARAMETER_VALUE3)-2)
          else
            dm.aq732.FieldByName('pp_quota_roll').AsFloat:= 0;
        end;
//        else
//        begin
//          Showmessage('该作业单已存在,不能重复添加');
//        end;
      end;
      dm.aq732.Fields[7].OnChange:=vOnChange7;
      dm.aq732.Fields[8].OnChange:=vOnChange8;
    end;
  end;
end;

function TfrmDetail.CalcPP(PP_WD: Double): Double;  //计算PP配额总长度(米)
begin
  Result:= 0;
  if not dm.aq732.Active then Exit;
  try
    Result:= ceil(dm.aq732.FieldByName('panel_qty').AsInteger/Round(PP_WD/dm.aq732.FieldByName('panel_ln').AsFloat))
            *(dm.aq732.FieldByName('panel_wd').AsFloat+0.5)/1000.00;
  except
    Showmessage('计算PP配额总长度出错,请检查计算参数是否完整');
  end;
end;

end.
