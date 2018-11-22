unit Editfrm_Mod83;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Grids, DBCtrlsEh, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.Menus, Data.DB,
  Datasnap.DBClient,adodb,System.Math,System.ZLib;

type
  TAfterAppendEvent_Mod83 = procedure of object;
  TMem = record
     fileName:string[255];
     bWhere:boolean;
  end;
  TLog = record
     TRANS_TYPE: integer;
     TRANS_DESCRIPTION: string[255];
     FROM_STRING: string[255];
     TO_STRING: string[255];
  end;
  TfrmEdit_mod83 = class(TfrmBaseEdit)
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PM20: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    OpenDialog1: TOpenDialog;
    TreeView1: TTreeView;
    HeaderControl1: THeaderControl;
    Notebook1: TNotebook;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Bevel2: TBevel;
    Label116: TLabel;
    Label117: TLabel;
    RkyCustName: TRKeyRzBtnEdit;
    RkyAbbrname: TRKeyRzBtnEdit;
    RkyState: TRKeyRzBtnEdit;
    RkyPhone: TRKeyRzBtnEdit;
    RkyTelex: TRKeyRzBtnEdit;
    RkyEmail: TRKeyRzBtnEdit;
    RkyZip: TRKeyRzBtnEdit;
    RkyFax: TRKeyRzBtnEdit;
    RkySalesman: TRKeyRzBtnEdit;
    RkyCountry: TRKeyRzBtnEdit;
    RkyCurrency: TRKeyRzBtnEdit;
    RkyCustcode: TRKeyRzBtnEdit;
    DbmmAddress: TDBMemo;
    RkyCustName2: TRKeyRzBtnEdit;
    DbchFzgkf: TDBCheckBox;
    Dbrdstatus: TDBRadioGroup;
    RkyWeb: TRKeyRzBtnEdit;
    RkyDeveloper: TRKeyRzBtnEdit;
    RkyOrdersuper: TRKeyRzBtnEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Bevel1: TBevel;
    RkyMainPro: TRKeyRzBtnEdit;
    RkyLegal: TRKeyRzBtnEdit;
    RkyLegaltel: TRKeyRzBtnEdit;
    RkyLegalphone: TRKeyRzBtnEdit;
    RkyNature: TRKeyRzBtnEdit;
    RkyQtyStaff: TRKeyRzBtnEdit;
    RkyFund: TRKeyRzBtnEdit;
    RkyMonthsale: TRKeyRzBtnEdit;
    RkyPcbuse: TRKeyRzBtnEdit;
    RkyFixedAssets: TRKeyRzBtnEdit;
    RkyOldsupp: TRKeyRzBtnEdit;
    RkyAllocation: TRKeyRzBtnEdit;
    DcbxAssets: TDBComboBox;
    DbckSfzc: TDBCheckBox;
    RkyCheckdate: TRKeyRzBtnEdit;
    DbdtBegindate: TDBDateTimeEditEh;
    DdtActivedate: TDBDateTimeEditEh;
    DbckJsfs: TDBCheckBox;
    DbckAqjh: TDBCheckBox;
    DbrdWorktype: TDBRadioGroup;
    Dbckbaojia: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label72: TLabel;
    Label75: TLabel;
    Label118: TLabel;
    RkyPayment: TRKeyRzBtnEdit;
    RkyCashcount: TRKeyRzBtnEdit;
    RkyCountDays: TRKeyRzBtnEdit;
    RkyPaydays: TRKeyRzBtnEdit;
    RkyLimtpaydays: TRKeyRzBtnEdit;
    RkyCreditline: TRKeyRzBtnEdit;
    RkyHprice: TRKeyRzBtnEdit;
    ComboBox1: TComboBox;
    DbckFhbz: TDBCheckBox;
    RkyAccounts: TRKeyRzBtnEdit;
    DbrdInvoiceEnd: TDBRadioGroup;
    DbckIntax: TDBCheckBox;
    DbckYszltz: TDBCheckBox;
    Dbckhdfhxd: TDBCheckBox;
    DbcbInvoicetype: TDBComboBox;
    RkyApplymoney: TRKeyRzBtnEdit;
    RkyApprovemoney: TRKeyRzBtnEdit;
    GroupBox2: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    RkySalesremark: TRKeyRzBtnEdit;
    RkyMaketremark: TRKeyRzBtnEdit;
    RkyFinanceremark: TRKeyRzBtnEdit;
    RkyHeadremark: TRKeyRzBtnEdit;
    RkyComment1: TRKeyRzBtnEdit;
    RkyComment4: TRKeyRzBtnEdit;
    RkyComment7: TRKeyRzBtnEdit;
    RkyComment10: TRKeyRzBtnEdit;
    RkyComment2: TRKeyRzBtnEdit;
    RkyComment5: TRKeyRzBtnEdit;
    RkyComment8: TRKeyRzBtnEdit;
    RkyComment11: TRKeyRzBtnEdit;
    RkyComment3: TRKeyRzBtnEdit;
    RkyComment6: TRKeyRzBtnEdit;
    RkyComment9: TRKeyRzBtnEdit;
    RkyComment12: TRKeyRzBtnEdit;
    DBDateTimeEh3: TDBDateTimeEditEh;
    DBDateTimeEh4: TDBDateTimeEditEh;
    DBDateTimeEh5: TDBDateTimeEditEh;
    DBDateTimeEh6: TDBDateTimeEditEh;
    GroupBox3: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    RkyLastInvoice: TRKeyRzBtnEdit;
    RkyLastOrder: TRKeyRzBtnEdit;
    RkyFirstInvoice: TRKeyRzBtnEdit;
    RkyFirstOrder: TRKeyRzBtnEdit;
    GroupBox4: TGroupBox;
    Label71: TLabel;
    Label73: TLabel;
    Label52: TLabel;
    Label74: TLabel;
    SGrid: TStringGrid;
    RkyBbname: TRKeyRzBtnEdit;
    RkyPackcode: TRKeyRzBtnEdit;
    RkyManucode: TRKeyRzBtnEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Bevel8: TBevel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    RkyContactphone1: TRKeyRzBtnEdit;
    RkyContactemail1: TRKeyRzBtnEdit;
    RkyContactemail2: TRKeyRzBtnEdit;
    RkyContact2: TRKeyRzBtnEdit;
    RkyContactphone2: TRKeyRzBtnEdit;
    RkyContact3: TRKeyRzBtnEdit;
    RkyContactemail3: TRKeyRzBtnEdit;
    RkyContactphone3: TRKeyRzBtnEdit;
    RkyContact4: TRKeyRzBtnEdit;
    RkyContactemail4: TRKeyRzBtnEdit;
    RkyContactphone4: TRKeyRzBtnEdit;
    RkyContact5: TRKeyRzBtnEdit;
    RkyContactemail5: TRKeyRzBtnEdit;
    RkyContactphone5: TRKeyRzBtnEdit;
    RkyContact6: TRKeyRzBtnEdit;
    RkyContactemail6: TRKeyRzBtnEdit;
    RkyContactphone6: TRKeyRzBtnEdit;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label101: TLabel;
    Memo1: TMemo;
    RkyPlanDays: TRKeyRzBtnEdit;
    Memo2: TMemo;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label51: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    RkyShipDetAddress: TRKeyRzBtnEdit;
    RkyShipstate: TRKeyRzBtnEdit;
    RkyShipzip: TRKeyRzBtnEdit;
    RkyShipcontact: TRKeyRzBtnEdit;
    RkyShipphone: TRKeyRzBtnEdit;
    RkyShipFax: TRKeyRzBtnEdit;
    RkyShipEmail: TRKeyRzBtnEdit;
    RkyShipWeb: TRKeyRzBtnEdit;
    DbchMraddress: TDBCheckBox;
    RkyShipWay: TRKeyRzBtnEdit;
    RkyShiptqdays: TRKeyRzBtnEdit;
    RkyBeginaddress: TRKeyRzBtnEdit;
    RkyEndaddress: TRKeyRzBtnEdit;
    Label113: TLabel;
    Label114: TLabel;
    BtnUpload: TSpeedButton;
    Label115: TLabel;
    eh20: TDBGridEh;
    RkyDocname: TRKeyRzBtnEdit;
    DbmmRemark: TDBMemo;
    DbdtDocdate: TDBDateTimeEditEh;
    ds10: TDataSource;
    cds10: TClientDataSet;
    ds20: TDataSource;
    cds20: TClientDataSet;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    N8: TMenuItem;
    ds12: TDataSource;
    cds12: TClientDataSet;
    cds04: TClientDataSet;
    cds248: TClientDataSet;
    cdstmp: TClientDataSet;
    cds318: TClientDataSet;
    cds248_2: TClientDataSet;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PM20Popup(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BtnUploadClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    note_index:byte;
    RKEY10: integer;
    Fmem :array[0..19] of  TMem;
    FLog :array[0..8] of TLog;

    procedure update_04(v_seed:string;ttype:byte);  //对04表的关联处理
    procedure getdata83;
    procedure gethistory;
    function check_before_save:boolean;
  public
    { Public declarations }
    FsModid:Integer;
    FEditType: Integer;//新建0,复制1,检查2,编辑3
    FAfterAppend: TAfterAppendEvent_Mod83;
    procedure Append10;
    procedure Init;
    procedure GetData(ARkey: string);
    procedure UnPackStream(var CompressedStream: TMemoryStream);
    procedure PackStream(var CompressedStream: TMemoryStream);
  end;

var
  frmEdit_mod83: TfrmEdit_mod83;
  spec_note_:tstringlist; //客户特别要求记事本
  note_var:tstringlist;
  v_edit:boolean;
const
  TmpFileDir = 'c:\tmp\';

implementation
 uses
 System.StrUtils, System.DateUtils,uCommFunc,EditfrmAddr_Mod83,
 Winapi.ShellAPI,uBaseSinglePickListFrm,UserFrm_Mod83;
{$R *.dfm}

procedure TfrmEdit_mod83.btnCloseClick(Sender: TObject);
begin
  inherited;
 Close;
end;

procedure TfrmEdit_mod83.btnSaveClick(Sender: TObject);
var
 LPostData: OleVariant;
 M: TMemoryStream;
    i,j:Integer;
 Lsql248,Lsql248_2,Lsql318:string;
begin
  if not check_before_save then Exit;
  cds10.Edit;//客户信用等级,客户特殊要求,一般记事本保存
  cds10.FieldByName('CREDIT_RATING').Value:=combobox1.ItemIndex+1;
  cds10.FieldByName('Remark').AsString:=Memo2.Text;
  cds10.FieldByName('RemarkSpec').AsString:=Memo1.Text;
  cds10.Post;
  case FEditType of
    0,1: //新增或复制
    begin
     if cds04.FieldValues['seed_flag']<>1 then
      self.update_04(trim(RkyCustcode.Text),0);                                                                 //end
    end;
    3: //编辑增加修改记录
    begin
    if not cds10.Active then cds10.Active:= True;
    if cds10.FieldByName('RKEY').AsInteger <> RKEY10 then
     cds10.Locate('RKEY',RKEY10,[]);
     Lsql318:='select * from data0318 where rkey=0';
    if not gSvrIntf.IntfGetDataBySql(Lsql318,cds318) then Exit;
    FLog[0].TO_STRING:= cds10.FieldByName('CUST_CODE').AsString;
    FLog[1].TO_STRING:= cds10.FieldByName('CUSTOMER_NAME').AsString;
    FLog[2].TO_STRING:= cds10.FieldByName('ABBR_NAME').AsString;
    FLog[3].TO_STRING:= cds10.FieldByName('FED_TAX_ID_NO').AsString;
    FLog[4].TO_STRING:= cds10.FieldByName('CREDIT_RATING').AsString;
    FLog[5].TO_STRING:= cds10.FieldByName('CREDIT_LIMIT').AsString;
    FLog[6].TO_STRING:= cds10.FieldByName('COD_FLAG').AsString;
    FLog[7].TO_STRING:= cds10.FieldByName('INVOICE_NOTE_PAD_PTR').AsString;
    FLog[8].TO_STRING:= cds10.FieldByName('SALES_DISCOUNT').AsString;
    for j:= 0 to 8 do
    begin
      if FLog[j].FROM_STRING<>FLog[j].TO_STRING then
      begin
       cds318.Append;
       cds318.FieldByName('WORK_ORDER_PTR').AsInteger:=RKEY10;
       cds318.FieldByName('TRANS_TYPE').AsInteger:=FLog[j].TRANS_TYPE;
       cds318.FieldByName('TRANS_DESCRIPTION').AsString:=FLog[j].TRANS_DESCRIPTION;
       cds318.FieldByName('FROM_STRING').AsString:=FLog[j].FROM_STRING;
       cds318.FieldByName('TO_STRING').AsString:=FLog[j].TO_STRING;
       cds318.FieldByName('USER_PTR').AsString:=gVar.rkey73;
       cds318.FieldByName('TRANS_DATE').Value:=gFunc.GetSvrDateTime;
       cds318.FieldByName('PROGRAM_SOURCE').AsInteger:=135;
       cds318.Post;
      end;
    end;
    end;
  end;
  begin//客户文档处理
    cds20.First;
    while not cds20.Eof do
    begin
      cds20.Edit;
      if FEditType<2 then //新增
      cds20.FieldByName('Ptr_IDKey').AsString:=cds10.FieldByName('IDKEY').AsString
      else
      cds20.FieldByName('SOURCE_PTR').Value:=cds10.FieldByName('rkey').Value;
      cds20.Post;
      cds20.next;
    end;
    cds20.First;
    while not cds20.Eof do
    begin
      if not Fmem[cds20.RecNo-1].bWhere and (Fmem[cds20.RecNo-1].fileName<>'') then
      begin
        cds20.Edit;
        if M=nil then M:=TMemoryStream.Create;
        M.Clear;
        M.LoadFromFile(Fmem[cds20.RecNo-1].fileName);
        PackStream(M);
        //tblobfield(cds20.FieldByName('file_content')).LoadFromStream(M);
        TGraphicField(cds20.FieldByName('file_content')).LoadFromStream(M);
        cds20.Post;
      end;
      cds20.next;
    end;
    M.Free;
  end;
  if (FEditType=0) or (FEditType=1) then //新增时短信接收人员记录处理data0248
  begin
   if  SGrid.Cells[0,1] <> '' then
   begin
    Lsql248:='select * from data0248 where CUST_PTR=0';
    if not gSvrIntf.IntfGetDataBySql(Lsql248,cds248) then Exit;
    try
     for  i:= 1 to SGrid.RowCount-2 do
     begin
      cds248.Append;
      cds248.FieldByName('D10_IDKey').AsString:= cds10.FieldByName('IDKEY').AsString;
      cds248.FieldByName('sys_ptr').value:=strtoint(SGrid.Cells[3,i]);
      cds248.FieldByName('position').value:=SGrid.Cells[2,i];
      cds248.Post;
     end;
    except
      on e:Exception do
      begin
       ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
      end;
    end;
   end;
  end;
  if FEditType=3 then //编辑时短信接收人员记录处理data0248
  begin
    Lsql248_2:='select * from data0248 where CUST_PTR='+cds10.FieldByName('rkey').AsString;
    if not gSvrIntf.IntfGetDataBySql(Lsql248_2,cds248_2) then Exit;
    if not cds248_2.IsEmpty then//先删除原有短信接收人员记录
    begin
     while not cds248_2.eof do cds248_2.Delete;
    end;
    if  SGrid.Cells[0,1] <> '' then
    begin
     Lsql248:='select * from data0248 where CUST_PTR=0';
     if not gSvrIntf.IntfGetDataBySql(Lsql248,cds248) then Exit;
    try
     for  i:= 1 to SGrid.RowCount-2 do
     begin
       cds248.Append;
       cds248.FieldByName('CUST_PTR').value:= cds10.FieldByName('rkey').Value;
       cds248.FieldByName('sys_ptr').value:=strtoint(SGrid.Cells[3,i]);
       cds248.FieldByName('position').value:=SGrid.Cells[2,i];
       cds248.Post;
     end;
    except
    on e:Exception do
       begin
        ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
       end;
    end;
    end;
  end;
  if cds10.State in [dsEdit,dsInsert] then cds10.Post;
  if cds12.State in [dsEdit,dsInsert] then cds12.Post;
  if cds04.State in [dsEdit,dsInsert] then cds04.Post;
  if cds248.State in [dsEdit,dsInsert] then cds248.Post;
  if cds20.State in [dsEdit,dsInsert] then cds20.Post;
  if cds318.State in [dsEdit,dsInsert] then cds318.Post;
  if cds248_2.State in [dsEdit,dsInsert] then cds248_2.Post;
  LPostData := VarArrayCreate([0,7],varVariant);
  if cds10.ChangeCount > 0 then
    LPostData[0] := cds10.Delta;
  if cds12.ChangeCount > 0 then
    LPostData[1] := cds12.Delta;
  if cds04.ChangeCount > 0 then
    LPostData[2] := cds04.Delta;
  if cds248.ChangeCount > 0 then
    LPostData[3] := cds248.Delta;
  if cds20.ChangeCount > 0 then
    LPostData[4] := cds20.Delta;
  if cds318.ChangeCount > 0 then
    LPostData[5] := cds318.Delta;
  if cds248_2.ChangeCount > 0 then
    LPostData[6] := cds248_2.Delta;
  if gSvrIntf.IntfPostModData('公共基础',83,LPostData,0) then
  begin
    cds10.MergeChangeLog;
    if (cds12.ChangeCount > 0) then cds12.MergeChangeLog;
    if (cds04.ChangeCount > 0) then cds04.MergeChangeLog;
    if (cds248.ChangeCount > 0) then cds248.MergeChangeLog;
    if (cds20.ChangeCount > 0) then cds20.MergeChangeLog;
    if (cds318.ChangeCount > 0) then cds318.MergeChangeLog;
    if (cds248_2.ChangeCount > 0) then cds248_2.MergeChangeLog;
    ShowMessage('保存成功');
    FAfterAppend;
    Close;
  end;
end;

procedure TfrmEdit_mod83.BtnUploadClick(Sender: TObject);
var i:integer;
    s:string;
    fs: TMemoryStream;
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;
    PackStream(fs);
    cds20.Edit;
    cds20.FieldByName('file_name').Value:=s;
    cds20.FieldByName('Indate').Value:=gFunc.GetSvrDateTime;
    cds20.Post;
    Fmem[cds20.RecNo-1].fileName:=OpenDialog1.FileName;
    Fmem[cds20.RecNo-1].bWhere:=false;
    fs.Free;
  end;
end;

procedure TfrmEdit_mod83.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEdit_mod83 := nil;
end;

procedure TfrmEdit_mod83.FormCreate(Sender: TObject);
begin
  inherited;
  spec_note_:=Tstringlist.Create;
  note_var:=Tstringlist.Create;
  keypreview:=true;
end;

procedure TfrmEdit_mod83.TreeView1Change(Sender: TObject; Node: TTreeNode);
var i:byte;
begin
  inherited;
  case node.SelectedIndex of
    0..6,8:notebook1.PageIndex:=node.SelectedIndex;
    7:notebook1.PageIndex:=0;
   else
    notebook1.PageIndex:=7;
  end;

  headercontrol1.Sections[1].Text:=node.Text;

  cds12.First;
  for i:=1 to node.SelectedIndex-9 do
  cds12.Next;
end;

procedure TfrmEdit_mod83.TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  treeview1.PopupMenu:=nil;
  if button=mbright then
    if treeview1.Selected.SelectedIndex=7 then
    begin
      n1.Enabled:=true;
      n2.Enabled:=false;
      n3.Enabled:=false;
      treeview1.PopupMenu:=PM1;
    end
    else if treeview1.Selected.SelectedIndex>8  then
    begin
      n1.Enabled:=false;
      n2.Enabled:=true;
      n3.Enabled:=true;
      treeview1.PopupMenu:=PM1;
    end
    else treeview1.PopupMenu:=nil;
end;

procedure TfrmEdit_mod83.Append10;
begin
  if FEditType=0 then //新增
  begin
   cds10.Append;
   cds10.FieldByName('idkey').Value := gFunc.CreateIDKey;
   cds10.FieldByName('customer_type').Value:=1;//客户状态为正常
   cds10.FieldByName('country_ptr').Value:=3;//国家为中国
   cds10.FieldByName('currency_ptr').Value:=1;//货币为人民币
   cds10.FieldByName('cust_ent_date').Value:=gFunc.GetSvrDateTime;//合作日期为当天
   cds10.FieldByName('edi_in_logging').Value:=0;//非主管客户为否
   cds10.FieldByName('credit_rating').Value:=3;//信用等级为差
   cds10.FieldByName('CREDIT_LIMIT').Value:=0;//信用限额为0
   cds10.FieldByName('cod_flag').Value:='N';//货到付款为否
   cds10.FieldByName('REG_TAX_FIXED_UNUSED').Value:='0';//发票到期计算方法
   cds10.FieldByName('discount_days').Value:=0;//折扣天数
   cds10.FieldByName('net_pay').Value:=0;//净付款天数
   cds10.FieldByName('discount_pct').Value:=0;//折扣对比率
   cds10.FieldByName('days_early_schedule').Value:=0;//计划提前天数
   cds10.FieldByName('edi_flag_for_invoice').Value:=0;//订单输入价格时是否含税
   cds10.FieldByName('edi_flag_for_soack').Value:=0;//是否转厂
   cds10.FieldByName('DO_SMOOTHING').Value:=0;//是否寄售
   cds10.FieldByName('smoothing_threshold').Value:=0;//员工人数
   cds10.FieldByName('quote_factor').Value:=0;//报价承受能力
   cds10.FieldByName('APPLY_IN_TRANSIT').Value:=0;//装箱单格式
   cds10.FieldByName('CONSUME_FORECASTS').Value:=0;//绝对保证按期交货
   cds10.FieldByName('COFC_FILENAME').Value:='N';//应收帐款短信通知
   cds10.FieldByName('QUOTE_FACTOR1').Value:=0;//连续下单0：否1：是
   cds10.Post;
  end;
  if FEditType=3 then //复制新增
  begin

    cds10.FieldByName('idkey').Value := gFunc.CreateIDKey;
    cds10.Post;
  end;
end;
procedure TfrmEdit_mod83.Init;
var
i:Integer;
Lsql04,Lsql20,Lsql248:string;
LArr: TArray<Integer>;
Lallow:Boolean;
begin
  LArr :=gFunc.GetUserModAuthIDArr(StrToInt(gvar.rkey73),83);
  Lallow:=False;
  for I := 0 to Length(LArr) - 1 do
  begin
    if 3 = LArr[I] then
    begin
      Lallow := True;
      Break;
    end;
  end;
  v_edit:=false; //判断是否修改过数据的变量
  getdata83; //读取装运、销售代表、国家、货币、总帐及信用等级
  Dbckhdfhxd.Enabled:= DbckFhbz.Checked;
  Memo2.Text:=cds10.FieldByName('Remark').AsString;
  Memo1.Text:=cds10.FieldByName('RemarkSpec').AsString;
  RkyDeveloper.Enabled:=Lallow;//财务权限
  RkyOrdersuper.Enabled:=Lallow;//财务权限
  if FEditType<2 then   //插入状态
  begin
    with cds04 do
    begin
      Lsql04:='select seed_flag,seed_value from data0004 where table_name='+'''Data0010''';
      if not gSvrIntf.IntfGetDataBySql(Lsql04,cds04) then Exit ;
      if cds04.fieldbyname('seed_flag').AsInteger<>1 then  //从04中读取控制码
       begin
        cds10.Edit;
        cds10.FieldByName('cust_code').Value := trim(Fieldvalues['seed_value']);
        cds10.Post;
        if FieldValues['seed_flag']=2  then self.update_04(trim(RkyCustcode.text),1); //如果固定字首则设置掩码
        if FieldValues['seed_flag']=4 then RkyCustcode.Enabled := false
       end
      else
       begin RkyCustcode.Text := '';  end;  //seed_flag=1完全手工输入编号
      cds04.Close;
    end;
  end
  else
   begin //编辑状态
    RkyCustcode.Text:=cds10.FieldByName('CUST_CODE').Value;
    gethistory;  //查找销售订单及发票历史信息
   end;
  if Lallow=False then  //如果没有银权不允许查看财务及销售佣金信息
  begin
    label35.Visible:=false;
    label36.Visible:=false;
    RkyAllocation.Visible:=false;
    groupbox1.Visible:=false;
  end;
  if (FEditType=2) or (FEditType=3) then  //新建0,复制1,检查2,编辑3
    Lsql20:='select  file_name, Indate, remark, RKEY, SOURCE_PTR,file_content'+
    ' from data0020 where source_ptr='+cds10.FieldByName('rkey').AsString
  else
    Lsql20:='select  file_name, Indate, remark, RKEY, SOURCE_PTR,file_content'+
    ' from data0020 where source_ptr=0';
  if not gSvrIntf.IntfGetDataBySql(Lsql20,cds20) then Exit;
  cds20.First;
  while not cds20.Eof do
  begin
    Fmem[cds20.RecNo-1].fileName:=cds20.Fieldbyname('file_name').AsString ;
    Fmem[cds20.RecNo-1].bWhere:=true;
    cds20.Next;
  end;
  cds20.First;

  SGrid.Cells[0,0]:='工号';
  SGrid.Cells[1,0]:='姓名';
  SGrid.Cells[2,0]:='职位';
  SGrid.Cells[3,0]:='rkey73';
  SGrid.ColWidths[0]:=100;
  SGrid.ColWidths[1]:=100;
  SGrid.ColWidths[2]:=200;
  SGrid.ColWidths[3]:=-1;
  if (FEditType=2) or (FEditType=3) then
  begin
   Lsql248:='SELECT dbo.Data0248.RKEY, dbo.Data0248.CUST_PTR, dbo.Data0248.sys_ptr, dbo.Data0248.position, dbo.Data0073.USER_FULL_NAME,'+
   'dbo.Data0073.USER_LOGIN_NAME FROM dbo.Data0248 INNER JOIN'+
   ' dbo.Data0073 ON dbo.Data0248.sys_ptr = dbo.Data0073.RKEY'+
   ' where  dbo.Data0248.CUST_PTR='+cds10.FieldByName('rkey').AsString;
   if not gSvrIntf.IntfGetDataBySql(Lsql248,cds248) then Exit;//帐龄短信接收人
   cds248.First;
   if not cds248.IsEmpty  then
   begin
    for i:=1 to cds248.RecordCount do
     begin
      SGrid.Cells[0,i] := cds248.FieldByName('USER_LOGIN_NAME').AsString;
      SGrid.Cells[1,i] := cds248.FieldByName('USER_FULL_NAME').AsString;
      if cds248.FieldByName('position').AsVariant = null then
      SGrid.Cells[2,i] := '无'
      else
      SGrid.Cells[2,i] := cds248.FieldByName('position').AsString;
      SGrid.Cells[3,i] := cds248.FieldByName('sys_ptr').AsString;
      SGrid.RowCount:=SGrid.RowCount+1;
      cds248.Next;
     end;
   end;
   cds248.First;
  end;
  if FEditType = 3 then  //编辑
  begin
    RKEY10:= cds10.FieldByName('RKEY').AsInteger;
    FLog[0].TRANS_TYPE:= 100;
    FLog[0].TRANS_DESCRIPTION:= '更改客户代码';
    FLog[0].FROM_STRING:= cds10.FieldByName('CUST_CODE').AsString;
    FLog[1].TRANS_TYPE:= 101;
    FLog[1].TRANS_DESCRIPTION:= '更改客户名称(中文)';
    FLog[1].FROM_STRING:= cds10.FieldByName('CUSTOMER_NAME').AsString;
    FLog[2].TRANS_TYPE:= 102;
    FLog[2].TRANS_DESCRIPTION:= '更改客户简称';
    FLog[2].FROM_STRING:= cds10.FieldByName('ABBR_NAME').AsString;
    FLog[3].TRANS_TYPE:= 103;
    FLog[3].TRANS_DESCRIPTION:= '更改付款方式';
    FLog[3].FROM_STRING:= cds10.FieldByName('FED_TAX_ID_NO').AsString;
    FLog[4].TRANS_TYPE:= 104;
    FLog[4].TRANS_DESCRIPTION:= '更改信用等级';
    FLog[4].FROM_STRING:= cds10.FieldByName('CREDIT_RATING').AsString;
    FLog[5].TRANS_TYPE:= 105;
    FLog[5].TRANS_DESCRIPTION:= '更改信用限额';
    FLog[5].FROM_STRING:= cds10.FieldByName('CREDIT_LIMIT').AsString;
    FLog[6].TRANS_TYPE:= 106;
    FLog[6].TRANS_DESCRIPTION:= '更改款到发货标识';
    FLog[6].FROM_STRING:= cds10.FieldByName('COD_FLAG').AsString;
    FLog[7].TRANS_TYPE:= 107;
    FLog[7].TRANS_DESCRIPTION:= '更改未付款最多超期天数';
    FLog[7].FROM_STRING:= cds10.FieldByName('INVOICE_NOTE_PAD_PTR').AsString;
    FLog[8].TRANS_TYPE:= 108;
    FLog[8].TRANS_DESCRIPTION:= '更改销售奖金分配';
    FLog[8].FROM_STRING:= cds10.FieldByName('SALES_DISCOUNT').AsString;
  end;
end;

procedure TfrmEdit_mod83.MenuItem1Click(Sender: TObject);
var
  f,Lsql20:string;
  fs: TMemoryStream;
  i:integer;
begin
  BtnUpload.Enabled:=(TMenuItem(Sender).Tag=10) or (TMenuItem(Sender).Tag=11);
  case  TMenuItem(Sender).Tag of
  10: begin DbmmRemark.SetFocus; cds20.Append; end;
  11: cds20.Edit;
  12: begin
        for i:=cds20.RecNo-1 to cds20.RecordCount-2 do
        begin
          Fmem[i].fileName:=Fmem[i+1].fileName;
          Fmem[i].bWhere:=Fmem[i+1].bWhere;
        end;
        Fmem[cds20.RecordCount-1].fileName:='';
        Fmem[cds20.RecordCount-1].bWhere:=false;
        cds20.Delete;
      end;
  13: begin
        i:=cds20.RecNo-1;
        if Fmem[i].bWhere then
        begin
          Lsql20:='select file_content FROM Data0020 where rkey='+cds20.fieldbyname('rkey').AsString;
          if not gSvrIntf.IntfGetDataBySql(Lsql20,cdstmp) then Exit;
          if cdstmp.fieldbyname('file_content').IsNull then
          begin
            showmessage('此文档为空...');
            exit;
          end;
          fs := TMemoryStream.Create;
          TBlobfield(cdstmp.fieldbyname('file_content')).SaveToStream(fs);
          UnPackStream(fs);
          if not DirectoryExists(TmpFileDir) then
            if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
          f:=TmpFileDir+cds20.FieldByName('file_Name').AsString;
          fs.SaveToFile(f);
          fs.Free;
          ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
        end
        else
          ShellExecute(self.Handle,nil,@Fmem[i].fileName[0],nil,nil,SW_SHOWNORMAL);
      end;
  end;
end;


procedure TfrmEdit_mod83.N1Click(Sender: TObject);
var
    LField: TField;
    i:word;
    v_copy:array[3..48] of variant;
    node:Ttreenode;
    Lfrm:TFrmEditAddr_Mod83;
begin
 inherited;
 if treeview1.Selected.SelectedIndex=7 then  //如果当前选中节点为装运地点
 begin
   Lfrm:=TFrmEditAddr_Mod83.Create(Self);
  try
   Lfrm.getdata('0');
   with Lfrm.cds12 do //初始化数据
   begin
    if not isempty then
    begin
     for i:=3 to 48 do  //除rkey,customer_ptr,location不复制
      v_copy[i]:=fieldvalues[fields[i].FieldName];
     append;
     for i:=3 to 48 do
      fieldvalues[fields[i].FieldName]:=v_copy[i];
      Post;
    end
    else
    begin
     append;
     fieldvalues['language_flag']:='Y'; // 如果为空则赋部分默认值
     fieldvalues['ship_lead_time']:=1;
     fieldvalues['state_ship_tax_flag']:='N';
     fieldvalues['state_prod_tax_flag']:='Y';
     fieldvalues['state_tool_tax_flag']:='N';
     fieldvalues['OVERSHIP_BY_QTY_1']:=0;
     fieldvalues['OVERSHIP_BY_QTY_2']:=0;
     fieldvalues['OVERSHIP_BY_QTY_3']:=0;
     fieldvalues['ORDER_QTY_RANGE_1']:=0;
     fieldvalues['ORDER_QTY_RANGE_2']:=0;
     Post;
    end;
   end;
   Lfrm.Init;
   if Lfrm.ShowModal=mrok then
   begin
    cds12.Append;
    for LField in cds12.Fields do //增加字段到cds12*
    begin
     if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
     if LFrm.cds12.FindField(LField.FieldName) <> nil then
     begin
      LField.Value := LFrm.cds12.FindField(LField.FieldName).Value;
     end;
    end;
    cds12.FieldByName('D10_IDKey').AsString := cds10.FieldByName('IDKey').AsString;
    cds12.Post;
    node:=treeview1.Items.AddChild(treeview1.Selected,cds12.FieldByName('LOCATION').Value);
    node.SelectedIndex:=note_index;
    note_index:=note_index+1;
    treeview1.Selected:=node;
    v_edit:=true;
   end;
  finally
   Lfrm.Free;
  end;
 end;
end;

procedure TfrmEdit_mod83.N2Click(Sender: TObject);
var
LField: TField;
Lfrm:TFrmEditAddr_Mod83;
begin
  inherited;
   if treeview1.Selected.SelectedIndex>7 then  //如果当前选中节点为装运子节点
  begin
    Lfrm:=TFrmEditAddr_Mod83.Create(Self);
    Lfrm.RkyCustomerCode.Text:=cds10.FieldByName('cust_code').AsString;
    Lfrm.RkyCustomerName.Text:=cds10.FieldByName('CUSTOMER_NAME').AsString;
    if FEditType>1 then //编辑或检查状态下编辑客户地址
    begin
     Lfrm.getdata(cds12.FieldByName('rkey').AsString);
    end
    else //新增状态下编辑客户地址
    begin
     Lfrm.getdata('0');
     Lfrm.cds12.Append;
     Lfrm.cds12.FieldByName('location').Value:=cds12.FieldByName('location').Value;
     Lfrm.cds12.FieldByName('SHIP_TO_ADDRESS_1').Value:=cds12.FieldByName('SHIP_TO_ADDRESS_1').Value;
     Lfrm.cds12.FieldByName('SHIP_TO_ADDRESS_2').Value:=cds12.FieldByName('SHIP_TO_ADDRESS_2').Value;
     Lfrm.cds12.FieldByName('SHIP_TO_ADDRESS_3').Value:=cds12.FieldByName('SHIP_TO_ADDRESS_3').Value;
     Lfrm.cds12.FieldByName('STATE').Value:=cds12.FieldByName('STATE').Value;
     Lfrm.cds12.FieldByName('ZIP').Value:=cds12.FieldByName('ZIP').Value;
     Lfrm.cds12.FieldByName('SHIP_TO_CONTACT').Value:=cds12.FieldByName('SHIP_TO_CONTACT').Value;
     Lfrm.cds12.FieldByName('SHIP_TO_PHONE').Value:=cds12.FieldByName('SHIP_TO_PHONE').Value;
     Lfrm.cds12.FieldByName('SHIP_TO_FAX').Value:=cds12.FieldByName('SHIP_TO_FAX').Value;
     Lfrm.cds12.FieldByName('SREP_1_COMM').Value:=cds12.FieldByName('SREP_1_COMM').Value;
     Lfrm.cds12.FieldByName('SREP_1_ALLOC').Value:=cds12.FieldByName('SREP_1_ALLOC').Value;
     Lfrm.cds12.FieldByName('SHIP_CTAX_PTR').Value:=cds12.FieldByName('SHIP_CTAX_PTR').Value;
     Lfrm.cds12.FieldByName('SHIP_SHIPPING_METHOD').Value:=cds12.FieldByName('SHIP_SHIPPING_METHOD').Value;
     Lfrm.cds12.FieldByName('SHIP_LEAD_TIME').Value:=cds12.FieldByName('SHIP_LEAD_TIME').Value;
     Lfrm.cds12.FieldByName('SHIP_FOB').Value:=cds12.FieldByName('SHIP_FOB').Value;
     Lfrm.cds12.FieldByName('SHIP_REG_TAX_ID').Value:=cds12.FieldByName('SHIP_REG_TAX_ID').Value;
     Lfrm.cds12.FieldByName('STATE_SHIP_TAX_FLAG').Value:=cds12.FieldByName('STATE_SHIP_TAX_FLAG').Value;
     Lfrm.cds12.FieldByName('STATE_PROD_TAX_FLAG').Value:=cds12.FieldByName('STATE_PROD_TAX_FLAG').Value;
     Lfrm.cds12.FieldByName('STATE_TOOL_TAX_FLAG').Value:=cds12.FieldByName('STATE_TOOL_TAX_FLAG').Value;
     Lfrm.cds12.FieldByName('LANGUAGE_FLAG').Value:=cds12.FieldByName('LANGUAGE_FLAG').Value;
     Lfrm.cds12.FieldByName('OVERSHIP_BY_QTY_1').Value:=cds12.FieldByName('OVERSHIP_BY_QTY_1').Value;
     Lfrm.cds12.FieldByName('OVERSHIP_BY_QTY_2').Value:=cds12.FieldByName('OVERSHIP_BY_QTY_2').Value;
     Lfrm.cds12.FieldByName('OVERSHIP_BY_QTY_3').Value:=cds12.FieldByName('OVERSHIP_BY_QTY_3').Value;
     Lfrm.cds12.FieldByName('ORDER_QTY_RANGE_1').Value:=cds12.FieldByName('ORDER_QTY_RANGE_1').Value;
     Lfrm.cds12.FieldByName('ORDER_QTY_RANGE_2').Value:=cds12.FieldByName('ORDER_QTY_RANGE_2').Value;
     Lfrm.cds12.FieldByName('COUNTRY_PTR').Value:=cds12.FieldByName('COUNTRY_PTR').Value;
     Lfrm.cds12.FieldByName('LOCNAME_FOR_FORM').Value:=cds12.FieldByName('LOCNAME_FOR_FORM').Value;
     Lfrm.cds12.FieldByName('EMAIL_FOR_CONTACT').Value:=cds12.FieldByName('EMAIL_FOR_CONTACT').Value;
     Lfrm.cds12.FieldByName('overship_flag').Value:=cds12.FieldByName('overship_flag').Value;
     Lfrm.cds12.FieldByName('EXPIRED_DATE').Value:=cds12.FieldByName('EXPIRED_DATE').Value;
     Lfrm.cds12.Post;
    end;
    if FEditType=2 then//检查状态
    begin
    Lfrm.btnSave.Enabled:=False;
    Lfrm.cds12.ReadOnly:=True;
    end;
    Lfrm.Init;
    try
      if Lfrm.ShowModal=mrok then
      begin
        v_edit:=true;
        treeview1.Selected.Text:=cds12.FieldByName('LOCATION').Value;
       if FEditType<>2 then
       begin
       cds12.Edit;
       for LField in cds12.Fields do
       begin
        if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
        if LFrm.cds12.FindField(LField.FieldName) <> nil then
        begin
          LField.Value := LFrm.cds12.FindField(LField.FieldName).Value;
        end;
       end;
       cds12.FieldByName('D10_IDKey').AsString := cds10.FieldByName('IDKey').AsString;
       cds12.Post;
       end;
      end;
    finally
      Lfrm.Free;
    end;
  end;
end;

procedure TfrmEdit_mod83.N3Click(Sender: TObject);
begin
  inherited;
  if treeview1.Selected.SelectedIndex>7 then  //如果当前选中节点为装运地点
  begin
    cds12.Delete;
    treeview1.Selected.Delete;
    v_edit:=true;
  end;
end;

procedure TfrmEdit_mod83.N6Click(Sender: TObject);
var
Lfrm:TfrmUser_Mod83;
s:string;
i:Integer;
begin
  inherited;
  Lfrm:=TfrmUser_Mod83.Create(Self);
  try
   s:='';
   for i:=1 to SGrid.RowCount-2 do
   s:=s+SGrid.Cells[3,i]+',';
   s:=s+'0';
   Lfrm.Lmainsql:='SELECT  dbo.Data0073.RKEY, dbo.Data0005.TPOSTION, dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.USER_FULL_NAME '+
                       'FROM   Data0073 INNER JOIN '+
                       '       Data0005 ON Data0073.EMPLOYEE_PTR = Data0005.RKEY AND Data0073.EMPLOYEE_PTR = Data0005.RKEY '+
                       ' WHERE NOT Data0073.RKEY in ('+s+') '+
                       'ORDER BY Data0073.USER_LOGIN_NAME ';
   LFrm.GetData;
   if LFrm.cdsMain.IsEmpty then
   begin
   ShowMessage('没有可操作人员!');
   Exit;
   end
   else
   begin
    Lfrm.Init(SGrid,Tcomponent(Sender).Tag);
   end;
    if LFrm.ShowModal= mrOk then
    begin
     //
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_mod83.N8Click(Sender: TObject);
var
  i:integer;
begin
    if SGrid.cells[1,SGrid.Row] <> '' then
    begin
       if   SGrid.RowCount <> 2 then
       begin
              for i:=SGrid.Row to SGrid.RowCount -1 do
              begin
                SGrid.Rows[i]:=SGrid.Rows[i+1];
              end;
              SGrid.RowCount:=SGrid.RowCount-1;
       end else  if SGrid.RowCount = 2  then
                  begin
                        SGrid.Rows[1].Clear;
                  end;
    end;
end;

procedure TfrmEdit_mod83.PM20Popup(Sender: TObject);
begin
  inherited;
  MenuItem1.Enabled:=not (FEditType=2); //新建0,复制1,检查2,编辑3
  MenuItem2.Enabled:=MenuItem1.Enabled and not cds20.IsEmpty;
  MenuItem3.Enabled:=MenuItem2.Enabled;
  N5.Enabled:=(cds20.RecordCount>0);
end;

procedure TfrmEdit_mod83.GetData(ARkey: string);
var
Lsql10,Lsql12:string;
begin
 Lsql10:='select *'+
' from Data0010'+
' where rkey='+ARkey;
 Lsql12:='select * from data0012 where customer_ptr='+Arkey;
 if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql10,Lsql12]),[cds10,cds12]) then Exit;
end;

procedure TfrmEdit_mod83.update_04(v_seed: string;ttype:byte);
var  //ttype为0代表更新04表控制码，1代表从04获取控制掩码
  i,v_length:integer;
  v_last,new_seed:string;
begin
  v_length := length(v_seed);
  for i := v_length downto 1 do
  begin
   if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
    if ttype=0 then
    begin
      v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
      cds04.Edit; //使前缀不变后缀加1
      cds04.FieldByName('SEED_VALUE').Value:=new_seed;
      cds04.Post;
      exit;
    end
    else
    begin//ttype=1从04里取员工代码设置掩码
      RkyCustcode.editmask:=copy(v_seed,1,i)+'!'+copy('999999999',i+1,v_length-i)+';1;_';
      RkyCustcode.Text:=copy(v_seed,1,i)+copy(v_seed,i+1,v_length-i);
      exit;
    end;

    if (i=1) and (ttype=0) then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     cds04.Edit;
     cds04.FieldByName('SEED_VALUE').Value:=new_seed;
     cds04.Post;
    end;
  end;
end;

procedure TfrmEdit_mod83.gethistory;
var Lsqlstr1,Lsqlstr2:string;
    Lcdstmp1,Lcdstmp2:TClientDataSet;
begin
  Lsqlstr1:='select sales_order,ent_date from data0060 where customer_ptr='+cds10.FieldByName('rkey').AsString+'order by ent_date ';
  Lsqlstr2:='select invoice_number,invoice_date from data0112 where customer_ptr='+cds10.FieldByName('rkey').AsString+'order by invoice_date ';
  Lcdstmp1:=TClientDataSet.Create(nil);
  Lcdstmp2:=TClientDataSet.Create(nil);
  try
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsqlstr1,Lsqlstr2]),[Lcdstmp1,Lcdstmp2]) then  Exit;
     //查找订单历史信息
  RkyFirstOrder.Text:=Lcdstmp1.fieldbyname('sales_order').AsString+'  ('+Lcdstmp1.fieldbyname('ent_date').AsString+')';
  Lcdstmp1.Last;
  RkyLastOrder.Text:=Lcdstmp1.fieldbyname('sales_order').AsString+'  ('+Lcdstmp1.fieldbyname('ent_date').AsString+')';
  //查找发票历史信息
  RkyFirstInvoice.Text:=Lcdstmp2.fieldbyname('invoice_number').AsString+'  ('+Lcdstmp2.fieldbyname('invoice_date').AsString+')';
  Lcdstmp2.Last;
  RkyLastInvoice.Text:=Lcdstmp2.fieldbyname('invoice_number').AsString+'  ('+Lcdstmp2.fieldbyname('invoice_date').AsString+')';
  finally
   Lcdstmp1.Free;
   Lcdstmp2.Free;
  end;
end;

procedure TfrmEdit_mod83.getdata83;
var
    node:Ttreenode;
begin
  note_index:=9; //变量赋初始值
  cds12.First;
  with cds12 do
  while not eof do
  begin
   node:=treeview1.Items.Addchild(treeview1.Items[7],fieldvalues['location']);
   node.SelectedIndex:=note_index;
   note_index:=note_index+1;
   next;
  end;
  treeview1.Items[1].Selected:=true;
  treeview1.FullExpand; //展开树
  combobox1.ItemIndex:=cds10.FieldByName('CREDIT_RATING').AsInteger-1;  //信用等级
end;

function TfrmEdit_mod83.check_before_save:boolean;
var
 Lsqlstr:string;
begin
  result:=true;
  Lsqlstr:='select seed_flag,seed_value from data0004 where table_name='+quotedstr('data0010');
  if not gSvrIntf.IntfGetDataBySql(Lsqlstr,cds04) then Exit;
  if (trim(RkyCustcode.Text)='') then
  begin
    messagedlg('客户代码不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    RkyCustcode.SetFocus;
    exit;
  end; //-------------
  if cds04.FieldByName('seed_flag').Value then
  if not (RkyCustcode.Text[length(RkyCustcode.Text)] in ['0'..'9']) then
  begin
    messagedlg('客户代码最后一位必须为数字！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    RkyCustcode.SetFocus;
    exit;
  end; //-------------
  if (trim(RkyCustName.Text)='') then
  begin
    messagedlg('客户名称不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    RkyCustName.SetFocus;
    exit;
  end; //-------------
  if (trim(RkyAbbrname.Text)='') then
  begin
    messagedlg('名称缩写不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    RkyAbbrname.SetFocus;
    exit;
  end; //-------------
  if trim(RkySalesman.Text)='' then
  begin
    messagedlg('销售代表不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    RkySalesman.SetFocus;
    exit;
  end; //-------------
  if trim(RkyCurrency.Text)='' then
  begin
    messagedlg('货币不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    RkyCurrency.SetFocus;
    exit;
  end; //-------------
  if trim(DbdtBegindate.Text)='' then
  begin
    messagedlg('开始合作日期不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=2;
    DbdtBegindate.SetFocus;
    exit;
  end; //-------------
  if trim(RkyQtyStaff.Text)='' then
  begin
    messagedlg('员工人数不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=2;
    RkyQtyStaff.SetFocus;
    exit;
  end;  //-------------
  if trim(RkyCreditline.Text)='' then
  begin
    messagedlg('信用限额不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=3;
    RkyCreditline.SetFocus;
    exit;
  end;  //-------------
  if trim(RkyHprice.Text)='' then
  begin
    messagedlg('报价承受能力不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=3;
    RkyHprice.SetFocus;
    exit;
  end; //-------------
  if cds12.IsEmpty then
  begin
    messagedlg('至少需要一个装运地址！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=7;
    treeview1.Items[7].Selected:=true;
    exit;
  end; //-------------
  if (Dbrdstatus.ItemIndex = 3) and (Trim(Memo2.Text) = '') then
  begin
    ShowMessage('当前【一般信息】页面, 客户状态为【停止】' + #13 + #13
    + '请在【计划安排】页面, 一般信息记事本中输入原因');
    result:=false;
    Notebook1.PageIndex := 6;
    TreeView1.Items[6].Selected := True;
    Memo2.SetFocus;
    Exit;
  end;
  if (ComboBox1.Text = '差') and (Trim(Memo2.Text) = '') then
  begin
    ShowMessage('当前【财务信息】页面, 信誉等级为【差】' + #13 + #13
    + '请在【计划安排】页面, 一般信息记事本中输入原因');
    result:=false;
    Notebook1.PageIndex := 6;
    TreeView1.Items[6].Selected := True;
    Memo2.SetFocus;
    Exit;
  end;
end;

procedure TfrmEdit_mod83.UnPackStream(var CompressedStream: TMemoryStream);
var
  SourceStream: TDecompressionStream;
  DestStream: TMemoryStream;
  Buffer: PChar;
  Count: integer;
  tmpstr:string;
Begin
  CompressedStream.Position:=0;
  tmpstr:='DDD';
  CompressedStream.ReadBuffer(tmpstr[1], 3);
  if tmpstr<>#6#3#1 then exit; //判断是否压缩的流
  CompressedStream.ReadBuffer(Count, SizeOf(Count));
  GetMem(Buffer, Count);
  DestStream := TMemoryStream.Create;
  SourceStream := TDecompressionStream.Create(CompressedStream);
  Try
    SourceStream.ReadBuffer(Buffer^, Count);
    DestStream.WriteBuffer(Buffer^, Count);
    SourceStream.Free;
    DestStream.Position := 0;//复位流指针
    CompressedStream.LoadFromStream(DestStream);
  finally
    FreeMem(Buffer);
    DestStream.Free;
  end;
end;

procedure TfrmEdit_mod83.PackStream(var CompressedStream: TMemoryStream);
var
  SourceStream: TCompressionStream;
  DestStream: TMemoryStream;
  Count: Integer;
Begin
  Count := CompressedStream.Size;
  DestStream := TMemoryStream.Create;
  SourceStream:=TCompressionStream.Create(clDefault, DestStream);
  Try
    CompressedStream.SaveToStream(SourceStream);
    SourceStream.Free;
    CompressedStream.Clear;
    CompressedStream.WriteBuffer(#6#3#1, 3);    //631 是压缩标记
    CompressedStream.WriteBuffer(Count, SizeOf(Count));
    CompressedStream.CopyFrom(DestStream, 0);
  finally
    DestStream.Free;
  end;
end;


end.
