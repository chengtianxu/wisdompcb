unit Edit_Data0506;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, ComCtrls, ToolWin, ImgList, ADODB,
  Provider, DBClient, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  DBGridEh, Menus,ComObj;
type
  TfrmEdit_Data0506 = class(TForm)
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    btnNew: TToolButton;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    btnDelete: TToolButton;
    btnExit: TToolButton;
    ToolButton2: TToolButton;
    cdsTmp: TClientDataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    dspDetail: TDataSetProvider;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label46: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    SpeedButton5: TSpeedButton;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    adsDetailrkey: TAutoIncField;
    adsDetailTTYPE: TSmallintField;
    adsDetailPARAMETER_PTR: TIntegerField;
    adsDetailSOURCE_PTR: TIntegerField;
    adsDetailTValue: TStringField;
    adsDetailSEQ_NO: TSmallintField;
    adsDetailDoc_Flag: TStringField;
    adsDetailflow_spfc_flag: TStringField;
    adsDetailoutp_spfc_flag: TStringField;
    adsDetailafter_flag: TStringField;
    adsDetailMO: TStringField;
    adsDetailformula: TStringField;
    adsDetailParamDesc: TStringField;
    adsDetailDataType: TStringField;
    aqParams: TADOQuery;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    adsDetailParamCode: TStringField;
    ImageList2: TImageList;
    labelDeptName: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    edtDeptCode: TEdit;
    N5: TMenuItem;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBMemo2: TDBMemo;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox10: TDBCheckBox;
    Label11: TLabel;
    DBMemo3: TDBMemo;
    N6: TMenuItem;
    N7: TMenuItem;
    qrytemp: TADOQuery;
    procedure btnNewClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cdsDetailBeforeEdit(DataSet: TDataSet);
    procedure btnExitClick(Sender: TObject);
    procedure cdsDetailBeforeInsert(DataSet: TDataSet);
    procedure cdsMasterAfterScroll(DataSet: TDataSet);
    procedure cdsMasterAfterOpen(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure adsDetailCalcFields(DataSet: TDataSet);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure edtDeptCodeExit(Sender: TObject);
    procedure edtDeptCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtDeptCodeChange(Sender: TObject);
    procedure adsDetailPARAMETER_PTRValidate(Sender: TField);
    procedure adsDetailBeforePost(DataSet: TDataSet);
    procedure adsDetailNewRecord(DataSet: TDataSet);
    procedure adsMasterNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N5Click(Sender: TObject);
    procedure adsDetailAfterDelete(DataSet: TDataSet);
    procedure adsDetailPARAMETER_PTRChange(Sender: TField);
    function Pick_IES_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant;
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    BillNo: string; EnterMode: byte;
    MaxSeqNO: integer;
    tmpCode: string;
    function Check_Before_Post: boolean;
    function ReSet_Seq_NO(DataSet: TDataSet): boolean;
    function Inc_Seq_By_Batch(DataSet: TDataSet; MinNO: integer): boolean;
  public
    { Public declarations }
    procedure Enter(pEnterMode: byte; pBillNO: string);
  end;

var
  frmEdit_Data0506: TfrmEdit_Data0506;

implementation
uses Main_062, Common,MyClass,PickEngNote,ConstVar;
{$R *.dfm}

procedure TfrmEdit_Data0506.btnNewClick(Sender: TObject);
begin
  adsMaster.Append;
end;

procedure TfrmEdit_Data0506.dsMasterStateChange(Sender: TObject);
begin
  btnSave.Enabled := adsMaster.State in dsEditModes;
  BtnCancel.Enabled := btnSave.Enabled;
//  btnExit.Enabled := adsMaster.State = dsBrowse;
  btnDelete.Enabled := adsMaster.State = dsBrowse;
end;

procedure TfrmEdit_Data0506.btnCancelClick(Sender: TObject);
begin
  adsMaster.Cancel;
  adsDetail.CancelUpdates;
end;

procedure TfrmEdit_Data0506.btnDeleteClick(Sender: TObject);
var
   pBillNo: string;
  Sqlstr: string;
begin
  if adsMaster.IsEmpty then exit;
  if Msg_Dlg_Ask('确定删除数据吗？', '提示', 1) then
  begin
    pBillNo := adsMaster.FieldbyName('rKey').Asstring;
    Sqlstr := 'delete from data0506 where  ttype=3 and source_ptr=' + adsMaster.fieldbyName('rKey').AsString +
      ' delete from data0034 where rKey=' + adsMaster.fieldbyName('rKey').AsString;
    if not MydataClass.ExecSql(sqlstr) then
      ShowMsg('删除失败', 1)
    else
      MyDataClass.OpenDataSetByPara(pBillNo, adsMaster);
  end;
end;

procedure TfrmEdit_Data0506.btnSaveClick(Sender: TObject);
var
  pBillNo: widestring;
begin
  if Check_Before_Post then
  begin
    try
      if not adsMaster.Connection.InTransaction then
        adsMaster.Connection.BeginTrans;

       adsMaster.FieldByName('LAST_UPDT').Value:= Common.getsystem_date(qrytemp,0) ;
       
      if adsDetail.State in dseditModes then
        adsDetail.Post;

      if adsMaster.State in dseditModes then
        adsMaster.Post;

      adsMaster.UpdateBatch(arAll);
      pBillNO := adsMaster.FieldByName('rKey').AsString;
      if not MyDataClass.UpdateValueToField(adsDetail, adsMaster.FieldByName('rKey').value, 'source_ptr') then
      begin
        ShowMsg('取主表的关键字数值出错', 1);
        abort;
      end;

      adsDetail.UpdateBatch(arAll);
      adsMaster.Connection.CommitTrans;
      close;
//      MyDataClass.OpenDataSetByPara(pBillNo,adsMaster);
    except
      adsMaster.Connection.RollbackTrans;
      ShowMsg('保存失败', 1);
    end;
  end;
end;

procedure TfrmEdit_Data0506.Enter(pEnterMode: byte; pBillNO: string);
begin
  BillNo := pBillNO;
  EnterMode := pEnterMode;
  if EnterMode <> em_browse then
    adsMaster.LockType := ltBatchOptimistic
  else
    adsMaster.LockType := ltReadOnly;
  adsDetail.LockType := adsMaster.LockType;
  if enterMode = em_browse then
    caption := caption + ' [浏览] '
  else
   if enterMode = em_Add then
    caption := caption + ' [新增] '
   else
    if enterMode = em_Edit then
     caption := caption + ' [修改] ';

  SpeedButton1.Enabled := adsMaster.LockType = ltBatchOptimistic;
  aqParams.Close;
  aqParams.Open;

  MyDataClass.OpenDataSetByPara(BillNo, adsMaster);
//  edtDeptCode.Text :=adsMaster
  adsDetail.Sort := 'SEQ_NO ASC';
  ShowModal;
end;

procedure TfrmEdit_Data0506.cdsDetailBeforeEdit(DataSet: TDataSet);
begin
  if EnterMode = em_browse then abort;
  adsMaster.Edit;
end;

procedure TfrmEdit_Data0506.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEdit_Data0506.cdsDetailBeforeInsert(DataSet: TDataSet);
begin
  adsMaster.Edit;
  dspDetail.DataSet := adsDetail;
  cdsTmp.Data := dspDetail.Data;
  dspDetail.DataSet := nil;
end;

procedure TfrmEdit_Data0506.cdsMasterAfterScroll(DataSet: TDataSet);
var QryTmp: TAdoQuery;
begin
  if DataSet.FieldByName('rKey').AsString = '' then
    MyDataClass.OpenDataSetByPara('-100', adsDetail)
  else
    MyDataClass.OpenDataSetByPara(DataSet.FieldByName('rKey').value, adsDetail);
  if DataSet.FieldByName('Big_dept_ptr').AsString = '' then exit;
  QryTmp := TAdoQuery.Create(nil);
  try
    QryTmp.Connection := adsMaster.Connection;
    QryTmp.SQL.Clear;
    QryTmp.Sql.Add('select Dept_Code,Dept_Name from data0034 where rkey=' + DataSet.FieldByName('Big_dept_ptr').AsString);
    QryTmp.open;
    if not QryTmp.IsEmpty then
    begin
      edtDeptCode.Text := QryTmp.fieldByName('Dept_Code').AsString;
      labelDeptName.Caption := QryTmp.fieldByName('Dept_Name').AsString;
    end;
  finally
    QryTmp.close;
    QryTmp.free;
  end;
  tmpCode := DataSet.Fieldbyname('DEPT_CODE').AsString;
end;

procedure TfrmEdit_Data0506.cdsMasterAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    MyDataClass.OpenDataSetByPara(DataSet.fieldByName('rkey').Value, adsDetail);
end;

procedure TfrmEdit_Data0506.N1Click(Sender: TObject);
var
  tmpStr: string;
begin
  tmpstr := VarAsType(Self.Pick_IES_Eng_Param('', adsDetail.Connection, 1), varString);
  if tmpstr = '' then exit;
  MaxSeqNO := Get_Max_SeqNo(adsDetail, 'seq_no');

  dspDetail.DataSet := adsDetail;
  cdsTmp.Data := dspDetail.Data;
  dspDetail.DataSet := nil;

  adsDetail.Append;
  adsDetail.FieldByName('Seq_No').Value := MaxSeqNo + 1;
  adsDetail.FieldByName('PARAMETER_PTR').Value := tmpstr;
end;

procedure TfrmEdit_Data0506.N2Click(Sender: TObject);
var
  tmpStr: string;
  SeqNO: integer;
begin
  tmpstr := VarAsType(Self.Pick_IES_Eng_Param('', adsDetail.Connection, 1), varString);
  if tmpstr = '' then exit;
  if adsDetail.IsEmpty then
    SeqNo := 1
  else
  begin
    SeqNO := adsDetail.FieldByName('Seq_No').Asinteger;
    if not Inc_Seq_By_Batch(adsDetail, SeqNo) then
    begin
      ShowMsg('更新序号出错!', 1);
      abort;
    end;
  end;
  adsDetail.Insert;
  adsDetail.FieldByName('PARAMETER_PTR').Value := tmpstr;
  adsDetail.FieldByName('Seq_No').Value := SeqNo;
  adsDetail.Post;
end;

procedure TfrmEdit_Data0506.N3Click(Sender: TObject);
begin
  if adsDetail.IsEmpty then exit;
  adsDetail.Delete;
end;

function TfrmEdit_Data0506.Check_Before_Post: boolean;
var
  bk, msg: string;
begin
  result := true;
  if trim(DBEdit1.Text) = '' then
  begin
    result := false;
    ShowMsg('工序代码不能为空', 1);
  end
  else if trim(DBEdit2.Text) = '' then
  begin
    result := false;
    ShowMsg('工序名称不能为空', 1);
  end
  else if trim(edtDeptCode.Text) = '' then
  begin
    result := false;
    ShowMsg('部门不能为空', 1);
  end;
  dspDetail.DataSet := adsDetail;
  cdsTmp.Data := dspDetail.Data;
  dspDetail.DataSet := nil;
  bk := adsDetail.Bookmark;
  try
    adsDetail.DisableControls;
    adsDetail.First;
    while not adsDetail.Eof do begin
      if adsDetail.FieldByName('seq_no').AsString = '' then
      begin
        result := false;
        showmsg('序号不能为空,请检查', 1);
        break;
      end
      else
      begin
        cdsTmp.Filtered := false;
        cdsTmp.Filter := 'Seq_No=' + adsDetail.FieldByName('seq_no').AsString;
        cdsTmp.Filtered := true;
        if cdsTmp.RecordCount > 1 then
        begin
          result := false;
          showmsg('序号:' + adsDetail.FieldByName('seq_no').AsString + ' 不能重复,请检查', 1);
          break;
        end;
      end;
      if trim(adsDetail.FieldByName('Formula').AsString) <> '' then
        if not Formula_Check(adsDetail.FieldByName('Formula').AsString, adsMaster.Connection, msg) then
        begin
          result := false;
          showmsg('公式设置不正确,请检查', 1);
          break;
        end;
      adsDetail.next;
    end;
  finally
    adsDetail.Bookmark := bk;
    adsDetail.EnableControls;
    cdsTmp.Filtered := false;
  end;
end;

procedure TfrmEdit_Data0506.CheckBox1Click(Sender: TObject);
begin
  if enterMode <> em_browse then
    adsMaster.Edit;
end;

procedure TfrmEdit_Data0506.adsDetailCalcFields(DataSet: TDataSet);
var
  tmp: integer;
begin
//  if DataSet.FieldByName('PARAMETER_PTR').IsNull then exit;
  tmp := adsDetail.FieldByName('PARAMETER_PTR').Asinteger;
  if aqParams.Locate('rKey', tmp, []) then
  begin
    adsDetail.FieldByName('ParamCode').Value := aqParams.fieldByName('Parameter_Name').Value;
    adsDetail.FieldByName('ParamDesc').Value := aqParams.fieldByName('Parameter_Desc').Value;
    adsDetail.FieldByName('DataType').Value := aqParams.fieldByName('DataType').Value;
  end
  else
  begin
    adsDetail.FieldByName('ParamCode').Value := '';
    adsDetail.FieldByName('ParamDesc').Value := '';
    adsDetail.FieldByName('DataType').Value := '';
  end;
end;

procedure TfrmEdit_Data0506.dsMasterDataChange(Sender: TObject;
  Field: TField);
var QryTmp: TAdoQuery;
begin
  if (Field = nil) or (trim(Field.AsString) = '') then exit;
  if uppercase(Field.FieldName) = Uppercase('BIG_DEPT_PTR') then
  begin
    QryTmp := TAdoQuery.Create(nil);
    try
      QryTmp.Connection := adsMaster.Connection;
      QryTmp.SQL.Clear;
      QryTmp.Sql.Add('select Dept_Code,Dept_Name from data0034 where rkey=' + Field.AsString);
      QryTmp.open;
      if not QryTmp.IsEmpty then
      begin
        edtDeptCode.Text := QryTmp.fieldByName('Dept_Code').AsString;
        labelDeptName.Caption := QryTmp.fieldByName('Dept_Name').AsString;
      end;
    finally
      QryTmp.close;
      QryTmp.free;
    end;
  end;
  if dsMaster.State in dsEditModes then
  begin
    if (Field = nil) or (trim(Field.AsString) = '') then exit;
    if uppercase(Field.FieldName) = Uppercase('DEPT_CODE') then
    begin
      if uppercase(tmpCode) <> uppercase(Field.AsString) then
        if MyDataClass.IsExists('select rkey from data0034 where DEPT_CODE=' + QuotedStr(trim(Field.Asstring))) then
        begin
          ShowMsg('工序代码不能重复，请重新输入', 1);
          Field.Value := NULL;
          DBEdit1.SetFocus;
        end;
    end;
  end;
end;

procedure TfrmEdit_Data0506.SpeedButton1Click(Sender: TObject);
var
  Tmpstr: string;
begin
  Tmpstr := VarAsType(Pick_Department(adsMaster.FieldByName('BIG_DEPT_PTR').Asinteger, adsMaster.Connection, 1), varString);
  if Tmpstr <> '' then
  begin
    adsMaster.Edit;
    adsMaster.FieldByName('BIG_DEPT_PTR').Value := Tmpstr;
  end;
end;

procedure TfrmEdit_Data0506.PopupMenu1Popup(Sender: TObject);
begin
  if EnterMode = em_Browse then abort;
end;

procedure TfrmEdit_Data0506.edtDeptCodeExit(Sender: TObject);
var
  tmpStr: string;
  QryTmp: TAdoQuery;
begin
  if enterMode = em_browse then exit;
//  if trim(edtDeptCode.text)='' then exit;
  tmpstr := trim(edtDeptCode.text); //VarAsType(MyDataClass.Get_Sql_Value('select rkey from data0034 where Dept_Code='+QuotedStr(trim(edtDeptCode.text))),varString);
  if tmpstr <> '' then
  begin
    QryTmp := TAdoQuery.Create(nil);
    try
      QryTmp.Connection := adsMaster.Connection;
      QryTmp.SQL.Clear;
      QryTmp.Sql.Add('select rKey,Dept_Code,Dept_Name from data0034 where Dept_Code=' + QuotedStr(tmpstr));
      QryTmp.open;
      if not QryTmp.IsEmpty then
      begin
        if EnterMode <> em_browse then
        begin
          adsMaster.Edit;
          adsMaster.FieldByName('BIG_Dept_Ptr').Value := QryTmp.fieldByName('rKey').Value;
        end;
//        edtDeptCode.Text :=adsMaster.fieldByName('Dept_Code').AsString;
        labelDeptName.Caption := QryTmp.fieldByName('Dept_Name').AsString;
      end
      else
      begin
        ShowMsg('部门输入错误,请重新输入', 1);
        edtDeptCode.SetFocus;
        abort;
      end;
    finally
      QryTmp.close;
      QryTmp.free;
    end;
  end
  else
  begin
    ShowMsg('部门不能为空,请重新输入', 1);
    abort;
  end;
end;

procedure TfrmEdit_Data0506.edtDeptCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if EnterMode = em_Browse then abort;
end;

procedure TfrmEdit_Data0506.edtDeptCodeChange(Sender: TObject);
begin
  if EnterMode = em_Browse then abort;
  adsMaster.Edit;
end;

procedure TfrmEdit_Data0506.adsDetailPARAMETER_PTRValidate(Sender: TField);
begin
  if Sender.IsNull then exit;
  if cdsTmp.Locate('PARAMETER_PTR', Sender.Value, []) then
  begin
    ShowMsg('参数不能重复，请重新输入', 1);
    Sender.Value := null;
    adsDetail.Delete;
    abort;
  end;
end;

procedure TfrmEdit_Data0506.adsDetailBeforePost(DataSet: TDataSet);
begin
  if adsDetail.FieldByName('PARAMETER_PTR').Asstring = '' then
  begin
    ShowMsg('参数不能为空', 1);
    abort;
  end
  else if adsDetail.FieldByName('SEQ_NO').Asstring = '' then
  begin
    ShowMsg('序号不能为空', 1);
    abort;
  end;
end;

procedure TfrmEdit_Data0506.adsDetailNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('TTYPE').Value := 3;
  DataSet.FieldByName('Doc_Flag').Value := 'Y';
end;

procedure TfrmEdit_Data0506.adsMasterNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ttype').Value := 1;
  DataSet.FieldByName('ACTIVE_FLAG').Value := 0;
  DataSet.FieldByName('OUT_SOURCE').Value := 0;
  DataSet.FieldByName('PCS_AS_UNIT').Value := 0;
  DataSet.FieldByName('IS_COST_DEPT').Value := 0;
  DataSet.FieldByName('QTY_EQP_LIMIT').Value := 0;
  DataSet.FieldByName('SPEC_FLAG').Value := 0;
  DataSet.FieldByName('output_flag').Value := 0;
  DataSet.FieldByName('wage_flag').Value := 0;
  DataSet.FieldByName('ppc_status').Value := 0;
  DataSet.FieldByName('ALLOW_SPLIT_LOTS').Value := 'N';
  DataSet.FieldByName('BARCODE_ENTRY_FLAG').Value := 'N';
  DataSet.FieldByName('Permit_split_lot').Value := 0;
  DataSet.FieldByName('VISIBLE_IN_MI').Value := 0;
  DataSet.FieldByName('PPC_CYCLE_TIME').Value :=0;
end;

procedure TfrmEdit_Data0506.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain_062.Tmp_Field_Value := trim(DBEdit1.Text);
end;

procedure TfrmEdit_Data0506.SpeedButton5Click(Sender: TObject);
var i, j: integer;
begin
  if enterMode = em_browse then exit;
  with TfrmPickEngNote.Create(Application) do
  try
    if Showmodal = mrok then
    begin
      adsMaster.edit;
      i := DBMemo1.SelStart;
      j := DBMemo1.CaretPos.y;
      DBMemo1.Lines[j] := copy(DBMemo1.Lines[j], 1, i) + trim(AdoQuery1.fieldbyname('prod_rout_inst').asstring)
        + copy(DBMemo1.Lines[j], i + 1, length(DBMemo1.Lines[j]) - i);
      DBMemo1.SelStart := i + length(trim(AdoQuery1.fieldbyname('prod_rout_inst').asstring));
      adsMaster.Fieldbyname('DEF_ROUT_INST').asstring := DBMemo1.Text;
    end;
  finally
    Free;
  end;
end;

procedure TfrmEdit_Data0506.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_DELETE) then
    abort;
  if Key = VK_Insert then
    abort;
  if Key = VK_DOWN then
  begin
    Key := 0;
    TDBGridEH(Sender).DataSource.DataSet.Next
  end
end;

function TfrmEdit_Data0506.ReSet_Seq_NO(DataSet: TDataSet): boolean;
var
  i: integer;
  BookMark: Tbookmark;
begin
  try
    try
      BookMark := DataSet.GetBookmark;
      DataSet.EnableControls;
      DataSet.First;
      while not DataSet.Eof do begin
  //      if DataSet.FieldByName('SEQ_NO').AsInteger >= MinSeqNo  then
        DataSet.edit;
        DataSet.FieldByName('SEQ_NO').AsInteger := DataSet.RecNo;
        DataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        DataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    DataSet.FreeBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

function TfrmEdit_Data0506.Inc_Seq_By_Batch(DataSet: TDataSet;
  MinNO: integer): boolean;
var
  i: integer;
  BookMark: Tbookmark;
  sSort: string;
begin
  try
    sSort := (DataSet as TCustomAdoDataSet).Sort;
    (DataSet as TCustomAdoDataSet).Sort := '';
    try
      BookMark := DataSet.GetBookmark;
      DataSet.EnableControls;
      DataSet.First;
      while not DataSet.Eof do begin
        if DataSet.FieldByName('SEQ_NO').AsInteger >= MinNo then
        begin
          DataSet.edit;
          DataSet.FieldByName('SEQ_NO').AsInteger := DataSet.FieldByName('SEQ_NO').AsInteger + 1;
        end;
        DataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        DataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    (DataSet as TCustomAdoDataSet).Sort := sSort;
    DataSet.FreeBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

procedure TfrmEdit_Data0506.N5Click(Sender: TObject);
begin
  if not ReSet_Seq_NO(adsDetail) then
  begin
    ShowMsg('更新序号失败!', 1);
    abort;
  end;
end;

procedure TfrmEdit_Data0506.adsDetailAfterDelete(DataSet: TDataSet);
begin
  if not ReSet_Seq_NO(adsDetail) then
  begin
    ShowMsg('更新序号失败!', 1);
    abort;
  end;
end;

procedure TfrmEdit_Data0506.adsDetailPARAMETER_PTRChange(Sender: TField);
begin
  if Sender.IsNull then exit;
  if aqParams.Locate('rKey', Sender.AsInteger, []) then
  begin
    if aqParams.FieldByName('Status3').Asinteger = 1 then
      adsDetail.FieldByName('flow_spfc_flag').Value := 'Y';
  end;
end;

function TfrmEdit_Data0506.Pick_IES_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择制程参数，picktype:1。返回参数rkey，2。返回参数名称
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Parameter_Name/参数名称,Parameter_desc/描述,category_name/参数类别';
  FDlgInput.Sqlstr := ' select rkey,PARAMETER_NAME,parameter_desc,case category_ptr ' +
    ' when 2 then '+'''全局参数'''+
    ' when 3 then '+'''制程参数'''+
    ' end as category_name'+
    ' from Data0278 ' +
    ' where category_ptr=3' +
    ' order by parameter_name';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Parameter_Name';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

procedure TfrmEdit_Data0506.N7Click(Sender: TObject);
var
 sqlstr:string;
begin
if adsDetail.IsEmpty then exit;
if enterMode = em_Add then ShowMsg('新增模式下不允许该操作',1)
else
if Msg_Dlg_Ask('确定要把当前参数加到现有所有产品工序中吗？','提示',2) then
  begin
   sqlstr:=
   'INSERT INTO Data0494 '+
   '(PARAMETER_PTR, custpart_ptr, step_number, seq_no, Doc_Flag, after_flag'+
   ',flow_spfc_flag,outp_spfc_flag)'+#13+
   'SELECT '+adsDetailPARAMETER_PTR.AsString+' AS PARAMETER_PTR, data0038.source_ptr, data0038.step_number,'+
   adsDetailSEQ_NO.AsString+' AS seq_no, '+quotedstr(adsDetailDoc_Flag.Value)+' AS Doc_Flag,'+
   QuotedStr(adsDetailafter_flag.Value)+' AS after_flag,'+QuotedStr(adsDetailflow_spfc_flag.Value)+
   ' AS flow_spfc_flag,'+QuotedStr(adsDetailoutp_spfc_flag.Value)+' AS outp_spfc_flag'+#13+
   'from data0038 where Data0038.DEPT_PTR = '+adsMaster.fieldbyName('rKey').AsString+#13+
   'and not exists(select data0494.PARAMETER_PTR from data0494'+#13+
   'where data0494.custpart_ptr=data0038.source_ptr and data0494.step_number=data0038.step_number'+#13+
   'and data0494.PARAMETER_PTR='+adsDetailPARAMETER_PTR.AsString+')';
   Screen.Cursor:= crSQLWait;
    if MydataClass.ExecSql(sqlstr) then
      ShowMsg('插入操作成功', 1)
    else
     ShowMsg('插入操作失败!!!', 1);
   Screen.Cursor:= crDefault;
  end;
end;

end.

