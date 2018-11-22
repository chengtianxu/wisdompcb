//****************************************************************************//
//****                                                                    ****//
//**** Programer: Jacky Zhong                                             ****//
//**** Date: Aug. 2007                                                    ****//
//****                                                                    ****//
//****                                                                    ****//
//****************************************************************************//
unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB,
  ADODB, Menus,report_data;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    labelKey: TLabel;
    edtKey: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    StatusBar1: TStatusBar;
    ADOConnection1: TADOConnection;
    adsWo_List: TADODataSet;
    dsWo_List: TDataSource;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    RadioGroup2: TRadioGroup;
    tmp: TADOQuery;
    adsWo_ListRKEY: TAutoIncField;
    adsWo_ListPANEL_A_B: TIntegerField;
    adsWo_ListQty_SMQ: TFloatField;
    adsWo_Listwtype06: TWordField;
    adsWo_ListDEPT_CODE: TStringField;
    adsWo_ListDEPT_NAME: TStringField;
    adsWo_ListWO_DAYS: TIntegerField;
    adsWo_Listdeptptr: TIntegerField;
    adsWo_ListTTYPE: TStringField;
    adsWo_ListQUAN_SCH: TFloatField;
    adsWo_ListFLOW_NO: TSmallintField;
    adsWo_ListWORK_ORDER_NUMBER: TStringField;
    adsWo_ListPROD_STATUS: TSmallintField;
    adsWo_ListQUAN_REJ: TFloatField;
    adsWo_ListTimeDiff: TBCDField;
    adsWo_ListQUAN_PROD: TFloatField;
    adsWo_ListQUAN_ALLREJ: TIntegerField;
    adsWo_ListINTIME: TDateTimeField;
    adsWo_ListREFERENCE_PTR: TIntegerField;
    adsWo_ListPARENT_PTR: TIntegerField;
    adsWo_ListPANELS: TIntegerField;
    adsWo_ListPNL_ONLine: TIntegerField;
    adsWo_ListBOM_PTR: TIntegerField;
    adsWo_ListMANU_PART_NUMBER: TStringField;
    adsWo_ListMANU_PART_DESC: TStringField;
    adsWo_ListSTEP: TSmallintField;
    adsWo_Listd56_rkey: TAutoIncField;
    adsWo_ListWTYPE: TSmallintField;
    adsWo_ListFlow_NO_06: TSmallintField;
    adsWo_ListSCH_COMPL_DATE: TDateTimeField;
    adsWo_ListPARTS_PER_PANEL: TFloatField;
    adsWo_ListQTY_BACKLOG: TFloatField;
    adsWo_ListTO_BE_STOCKED: TFloatField;
    adsWo_ListDEPT_PTR: TIntegerField;
    adsWo_ListSO_NO: TStringField;
    adsWo_ListCUT_NO: TStringField;
    adsWo_ListPRODUCT_NAME: TStringField;
    adsWo_ListCUST_CODE: TStringField;
    adsWo_ListENT_DATETIME: TDateTimeField;
    adsWo_Listprod_Status_CN: TStringField;
    adsWo_ListOnlineStatus: TStringField;
    Label4: TLabel;
    Edit3: TEdit;
    adsWo_ListQTYREJECT: TBCDField;
    Label5: TLabel;
    Edit4: TEdit;
    adsWo_Listunit_sq: TFloatField;
    adsWo_ListREFERENCE_NUMBER: TStringField;
    N5: TMenuItem;
    N6: TMenuItem;
    adsWo_Listwhouse_ptr: TIntegerField;
    adsWo_ListFacNm: TStringField;
    N7: TMenuItem;
    MI1: TMenuItem;
    adsWo_Listrkey25: TAutoIncField;
    BitBtn6: TBitBtn;
    adsWo_ListQTYREJECT_1: TIntegerField;
    adsWo_Listso_oldnew: TStringField;
    adsWo_ListREFERENCE: TStringField;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    qryTmp: TADOQuery;
    aspWO_Split: TADOStoredProc;
    adsWo_ListOnlineStatus_Old: TStringField;
    adsWo_ListCUTNO_WO: TStringField;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    adsWo_ListReCheck: TStringField;
    adsWo_Listprod_Square: TFloatField;
    adsWo_Listprod_Square_includingBoader: TFloatField;
    BitBtn7: TBitBtn;
    adsWo_ListORIG_CUSTOMER: TStringField;
    adsWo_ListSAMPLE_NR: TStringField;
    N14: TMenuItem;
    N15: TMenuItem;
    adsWo_Listunit_sq_includingBoader: TFloatField;
    RadioGroup3: TRadioGroup;
    btn1: TBitBtn;
    adsWo_Listlayers: TWordField;
    adsWo_ListPO_NUMBER: TStringField;
    adsWo_Listanalysis_code_3: TStringField;
    adsWo_Listsotp: TStringField;
    adsWo_ListPRODUCT_GROUP_NAME: TStringField;
    adsWo_ListCPJS: TStringField;
    N16: TMenuItem;
    adsWo_ListABC36: TStringField;
    spABC36: TADOStoredProc;
    N17: TMenuItem;
    adsWo_ListPRIORITY_name: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
//    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure dtpStartDateChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure adsWo_ListAfterOpen(DataSet: TDataSet);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure N16Click(Sender: TObject);
    procedure adsWo_ListCalcFields(DataSet: TDataSet);
    procedure N17Click(Sender: TObject);
  private
    { Private declarations }
    vColumn:TColumnEh;
    rkey419,rkey73:Integer;
    procedure RefreshData(rKey:integer);//刷新数据
//    procedure item_click(sender:TObject);
    procedure DoSearch(subSql:string);
    function Change_WO_Status(iType:byte;Wo_ptr:integer):boolean;//处理作业单外发和生产状态转换
    procedure Calc_Qty;
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
      Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ShowField(k419,k73:Integer;fname:string;dbGrd:TDBGridEh);
    procedure loadField(tmp:TADOQuery;DbGrid:TDBGridEh);
  public
    { Public declarations }
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
    function WO_Split(rKey,PCS,PNL,vtype,wtype56,wtype06:integer;NEW_WONO,Remark:string):boolean;//作业单拆分
    function LotApply(FromRKEY06: string; wtype: Integer):Boolean;
    function StrCUTNO_WO(str: string; sign: string='-'):string;//取刻印内容(只针对待返工、待报废)
    function INQCLocked(ARkey06,ARkey34,AQty: Integer): Boolean;//是否在QC管控中
    function DecToABC36(ADec: Int64): string;
  end;

var
  frmMain: TfrmMain;

implementation
uses QuerySet,common,MyClass,WO_INFO,Pick_Item_Single,ConstVar, Dlg_WO_Split, uSumQuery,
  ManuPart_WIP, PasFieldShow, StrUtils, MergeFrm;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not app_init_2(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请与系统管理员联系！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;
  MyDataClass :=TMyDataClass.Create(ADOConnection1);

//  vprev := '4';
//  user_ptr := '3300';
//  ADOConnection1.Open;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
var i:integer;
    sqlstr:string;
begin
 try
  if frmQuerySet.ShowModal = mrOk then
  begin
   for i:=1 to frmQuerySet.sgrid1.RowCount-2 do
   begin
    if frmQuerySet.sgrid1.Cells[2,i]<> '' then
     Sqlstr:=sqlstr+frmQuerySet.sgrid1.Cells[2,i];
   end;
   sqlstr:=sqlstr+'';
   DoSearch(sqlstr);
  end;
 finally
    //free;
 end;
end;

procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption <> vcolumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    vcolumn.Title.Color:=clbtnface;
    vColumn := Column;
    vcolumn.Title.Color:=clred;
    labelKey.Caption := '搜索：'+ Column.Title.Caption;
  end;
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) or (adsWo_List.FieldByName(Column.FieldName).FieldKind = fkCalculated)   then
    Exit;

  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
   begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
   end
  else
  if Column.Title.SortMarker = smUpEh then
   begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
   end ;

  if adsWo_List.IsEmpty then abort;
//  SelectedField := Column.FieldName;
  //edtKey.Text:='';

//  edtKey.Visible:= not(Column.Field.DataType in [ftDate, ftDateTime]);
//  edtKey.Visible:= False;
  Label1.Visible := false;
  dtpStartDate.Visible := False;
  dtpEndDate.Visible := false;
end;

procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
  try
    frmFieldShow:=TfrmFieldShow.Create(Application);
    frmFieldShow.key419:=rkey419;
    frmFieldShow.rkey73:=rkey73;
    if frmFieldShow.ShowModal=mryes then
      ShowField(rkey419,rkey73,frmMain.Name,DBGridEh1);
  finally
    frmFieldShow.Free;
  end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,'作业单查询')
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  if adsWo_List.Active then
    RefreshData(adsWo_List.fieldbyName('rKey').AsInteger)
  else RefreshData(0);
end;

procedure TfrmMain.RefreshData(rKey: integer);
begin
  adsWo_List.close;
  adswo_list.Prepared;
  adsWo_List.open;
  adsWo_List.Locate('rKey',rKey,[]);
  StatusBar1.Panels[1].Text := IntToStr(adsWo_List.RecordCount);
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

//procedure TfrmMain.item_click(sender: TObject);
//var i:byte;
//begin
//  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
//  for i:=0 to DBGridEh1.Columns.Count-1 do
//    if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
//    begin
//      DBGridEh1.Columns[i].Visible:=(sender as tmenuItem).Checked;
//      break;
//    end;
//end;

procedure TfrmMain.DoSearch(subSql: string);
var
  sqlstr:widestring;
  i:integer;
begin
  sqlstr:=uppercase(adsWo_List.CommandText);
  i:=Pos('WHERE',sqlstr);
  if i = 0 then
   begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
   end;
  Sqlstr:=copy(sqlstr,1,i-1);
  adsWo_List.Close;
  adsWo_List.CommandText := sqlstr+' WHERE (1=1) '+subsql ;
  adswo_list.Prepared;
  adsWo_List.open;
  StatusBar1.Panels[1].Text := IntToStr(adsWo_List.RecordCount);
end;

//procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
//var i:integer;
//    MI:TMenuItem;
//begin
//  while PopupMenu1.Items.Count>0 do
//    PopupMenu1.Items[0].free;
//  for i:= 0 to DBGridEh1.Columns.Count- 1 do
//  begin
//    MI:=TmenuItem.Create(self);
//    MI.Caption:=DBGridEh1.Columns[i].Title.Caption;
//    if DBGridEh1.Columns[i].Visible then
//      MI.Checked:=true;
//    MI.OnClick:=item_click;
//    self.PopupMenu1.Items.Add(MI);
//  end;
//end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  with TfrmWO_INFO.Create(Application)do
  try
    parent_ptr:=self.adsWo_ListPARENT_PTR.Value;
    Enter(adsWo_List.fieldByName('rkey').Value,adsWo_List.fieldByName('Bom_ptr').Value,
          adsWo_List.fieldByName('WTYPE').Value);
  finally
    free;
  end;
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  if adsWo_List.IsEmpty then abort;
  N3.Enabled := adsWo_List.fieldbyName('prod_status').AsInteger = 4; //外发转生产
  N4.Enabled := adsWo_List.fieldbyName('prod_status').AsInteger = 3; //生产转外发
  N6.Enabled :=(vprev='4') and (adsWo_List.fieldbyName('prod_status').AsInteger in [3,5,6]);
  N8.Enabled  := ((vprev='2') or (vprev='4'));
  N10.Enabled := ((vprev='2') or (vprev='4'));
  N12.Enabled := ((vprev='2') or (vprev='4'));
  N13.Enabled := ((vprev='2') or (vprev='4'));
  N17.Enabled := (vprev='4');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  BitBtn3Click(sender);
  self.vColumn:=self.DBGridEh1.Columns[0];
end;

function TfrmMain.Change_WO_Status(iType: byte;Wo_ptr:integer): boolean;
var
  sqlstr:string;
  iFlag:string;
  qryTmp:TadoQuery;
begin
  result := true;
  iFlag:='';
  case iType of
    1 : iFlag := '3';   //外发转生产
    2 : iFlag := '4';   //生产转外发
  end;
  if iFlag = '' then exit;
  sqlstr:=' update data0006 set prod_status = '+iFlag+' where rkey='+IntToStr(wo_ptr) + #13#10;
  if iType = 1 then
      sqlstr:= sqlstr + ' INSERT INTO DATA0117(SOURCE_TYPE,Action,source_ptr,empl_ptr,remark,tdate ) VALUES (2,7,'+IntToStr(wo_ptr)+','+ user_ptr + ',''外发转生产'','''+datetimetostr(now)+''')'
  else if iType = 2 then
      sqlstr:= sqlstr + ' INSERT INTO DATA0117(SOURCE_TYPE,Action,source_ptr,empl_ptr,remark,tdate ) VALUES (2,7,'+IntToStr(wo_ptr)+','+ user_ptr + ',''生产转外发'','''+datetimetostr(now)+''')';

  try
    qryTmp:=TAdoQuery.Create(nil);
    qryTmp.Connection := ADOConnection1;
    qryTmp.SQL.Clear;
    qryTmp.sql.Add(sqlstr);
    try
      qryTmp.ExecSQL;
      result := true;
    except
      result := false;
    end;
  finally
    qryTmp.Close;
    qryTmp.Free;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能提交入库',1);
    abort;
  end;
 if vprev<>'4' then
  ShowMsg('您无转换权限!',1)
 else
  if MSG_Dlg_ASK('确定将该作业单由外发转为生产吗？','提示',1) then
  if not Change_WO_Status(1,adsWo_List.fieldbyName('rKey').asinteger) then
   ShowMsg('外发转生产失败，请检查！',1)
  else
   RefreshData(adsWo_List.fieldbyName('rKey').asinteger);
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能提交入库',1);
    abort;
  end;
 if vprev<>'4' then
  ShowMsg('您无转换权限!',1)
 else
  if MSG_Dlg_ASK('确定将该作业单由生产转为外发吗？','提示',1) then
  if not Change_WO_Status(2,adsWo_List.fieldbyName('rKey').asinteger) then
    ShowMsg('生产转外发失败，请检查！',1)
  else RefreshData(adsWo_List.fieldbyName('rKey').asinteger);
end;

procedure TfrmMain.edtKeyChange(Sender: TObject);
var tmpstr,sFilter,Status_filter:string;
    DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(DBGridEh1.DataSource.DataSet);
  if not DATASET.Active then abort;
  tmpstr:= trim(edtKey.Text);
  if RadioGroup1.ItemIndex = 5 then
    Status_filter := ''
  else Status_filter := ' and prod_Status_CN='+ QuotedStr(RadioGroup1.Items[RadioGroup1.ItemIndex]);
  
  if TmpStr='' then
  begin
    if Status_filter<>'' then
      DATASET.Filter := Stringreplace(Status_filter,' and ','',[])
    else DATASET.Filter := '';
    DATASET.Filtered:= true;
    Calc_Qty;
  end
  else begin
//    if (DBGridEh1.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
    if (vColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      if RadioGroup2.ItemIndex = 0 then
        sFilter := '*'+uppercase(TmpStr)+'*'
      else sFilter := uppercase(TmpStr)+'*';
      DATASET.Filter := vColumn.Field.FieldName+' Like '+ QuotedStr(sFilter)+Status_filter;
      DATASET.Filtered:= true;
      Calc_Qty;
    end
    else if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := vColumn.Field.FieldName+'>='+TmpStr+Status_filter;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
      Calc_Qty;
    end
    else if vColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := vColumn.Field.FieldName + sFilter+Status_filter;
      DATASET.Filtered:= true;
      Calc_Qty;
    end;
  end;
end;

procedure TfrmMain.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
//    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  vColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TfrmMain.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter,Status_filter:string;
begin
  if not adsWo_List.Active then abort;
  if vColumn.Field.DataType in [ftDate, ftDateTime] then
   begin
    TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
    TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
    if RadioGroup1.ItemIndex = 9 then
      Status_filter := ''
    else
      Status_filter := ' and prod_Status_CN='+ QuotedStr(RadioGroup1.Items[RadioGroup1.ItemIndex]);

    sFilter := vColumn.Field.FieldName+'>='+TmpStr1+ ' AND ' +vColumn.Field.FieldName+'<'+TmpStr2;
    adsWo_List.Filter := sFilter+Status_filter;
    adsWo_List.Filtered:= true;
    Calc_Qty;
   end;
end;

procedure TfrmMain.RadioGroup1Click(Sender: TObject);
begin
 if vColumn = nil then
 begin
  if RadioGroup1.ItemIndex = 5 then
   adsWo_List.Filter := ''
  else adsWo_List.Filter := 'prod_Status_CN='+ QuotedStr(RadioGroup1.Items[RadioGroup1.ItemIndex]);
  adsWo_List.Filtered:=true;
  Calc_Qty;
 end
 else begin
  if vColumn.Field.DataType in [ftDate, ftDateTime] then
    dtpStartDateChange(sender)
  else edtKeyChange(sender);
 end;
end;

procedure TfrmMain.Calc_Qty;
var
  Qty_A,Qty_B,Qty_SMQ:double;
  Qty_pcs,Qty_kind:integer;
  sSort:widestring;
  sPrd:string;
begin
  try
    adsWo_List.DisableControls;
    Qty_A:=0;Qty_B:=0;Qty_SMQ:=0; Qty_pcs:=0; Qty_kind:=0; sPrd:='';
    sSort:=adsWo_List.Sort;
    adsWo_List.Sort:='MANU_PART_NUMBER';
    adsWo_List.First;
    while not adsWo_List.eof do begin
      if adsWo_List.fieldByName('PAnel_A_B').asinteger = 0 then
        Qty_A:= Qty_A+adsWo_List.fieldByName('PNL_ONLine').Asfloat
      else Qty_B:= Qty_B+adsWo_List.fieldByName('PNL_ONLine').Asfloat;

      Qty_pcs:=Qty_pcs+adsWo_List.fieldByName('QTY_BACKLOG').AsInteger + adsWo_List.fieldByName('TO_BE_STOCKED').AsInteger;
      Qty_SMQ:=Qty_SMQ+adsWo_List.fieldByName('Qty_SMQ').Asfloat;

      if sPrd<>adsWo_List.fieldByName('MANU_PART_NUMBER').AsString then  inc(Qty_kind);
      sPrd:=adsWo_List.fieldByName('MANU_PART_NUMBER').AsString ;

      adsWo_List.next;
    end;
    if sPrd<>adsWo_List.fieldByName('MANU_PART_NUMBER').AsString then  inc(Qty_kind);


    adsWo_List.Sort:=sSort;
    adsWo_List.first;
    edit1.Text :=formatfloat('#,###',qty_a)+' / '+formatfloat('#,###',qty_b);
    edit2.Text :=formatfloat('#,###.00',qty_smq);
    edit3.Text:= formatfloat('#,###',Qty_pcs);
    edit4.Text:= formatfloat('#,###',Qty_kind);
  finally
    adsWo_List.EnableControls;
  end;
end;

procedure TfrmMain.adsWo_ListAfterOpen(DataSet: TDataSet);
begin
  Calc_Qty;
end;

procedure TfrmMain.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 try
  if  (DBGridEHName.DataSource.DataSet.FieldByName('Prod_Status').AsInteger = 102) or (DBGridEHName.DataSource.DataSet.FieldByName('Prod_Status').AsInteger = 103)then //暂缓的变颜色
   begin
      DBGridEHName.Canvas.Brush.Color:=RGB(244,241,255);
      DBGridEHName.Canvas.FillRect(rect);
      //DBGridEHName.Canvas.font.color:=clblack; //不要此句，不然的话将不会显示不同的字体的颜色值
   end
  else
   if (DBGridEHName.DataSource.DataSet.FieldByName('WO_DAYS').AsInteger>0) then
    begin
     if DBGridEHName.DataSource.DataSet.FieldByName('TimeDiff').Asfloat >
        DBGridEHName.DataSource.DataSet.FieldByName('WO_DAYS').AsInteger then //停留时间过长
     begin
        DBGridEHName.Canvas.Brush.Color:=clMoneyGreen;
        DBGridEHName.Canvas.FillRect(rect);
     end;
    end
   else
    begin
      DBGridEHName.Canvas.Brush.Color:=clwhite;
      DBGridEHName.Canvas.FillRect(rect);
        //DBGridEHName.Canvas.font.color:=clblack;
   end;

   if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
    begin
     DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
     DBGridEHName.Canvas.FillRect(rect);
        //DBGridEHName.Canvas.font.color:=clblack;
    end;
   if self.adsWo_ListQTYREJECT.Value > 0 then
    begin
     DBGridEHName.Canvas.Font.Color := clred;
     DBGridEHName.Canvas.FillRect(rect);
    end;
   DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;


procedure TfrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
  showmsg(self.adsWo_List.CommandText,1);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.adsWo_List.Close;
  MyDataClass.Free;
end;

procedure TfrmMain.N6Click(Sender: TObject);
  var InputVar: PDlgInput ;
      s:string;
begin
  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能提交入库',1);
    abort;
  end;
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'warehouse_code/工厂编号/80,warehouse_name/工厂名称/200,ABBR_NAME/工厂简称/150';
    InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name,ABBR_NAME from data0015';
    inputvar.KeyField:='';

    inputvar.InPut_value:=adsWo_Listwhouse_ptr.Value;
    InputVar.AdoConn := ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
       tmp.Close;
       tmp.SQL.Text:='update data0056 set loc_ptr='+frmPick_Item_Single.adsPick.fieldbyname('rkey').AsString+
                     ' where rkey='+adsWo_Listd56_rkey.AsString+' and step='+adsWo_ListSTEP.AsString;
       if tmp.ExecSQL=0 then
         showmessage('选择工厂保存数据库失败,在线状态发生变化...')
       else begin
         s:='临时工厂改为:'+frmPick_Item_Single.adsPick.fieldbyname('warehouse_code').AsString;
         tmp.SQL.Text:='INSERT INTO DATA0117(SOURCE_TYPE,Action,source_ptr,empl_ptr,remark,tdate ) VALUES (2,7,'+adsWo_List.fieldbyName('rKey').AsString+','+ user_ptr + ','''+s+''',getdate())';
         tmp.ExecSQL;
         BitBtn3Click(nil);
       end;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmMain.MI1Click(Sender: TObject);
begin
  Form_report:=TForm_report.Create(Application);
  try
    Form_report.ppReport1.Reset;
    Form_report.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'Manu_workorder_sig.rtm';           //R:\NIERP\Report\Manu_instruction.rtm

    Form_report.ppReport1.Template.LoadFromFile;
    Form_report.ppreport1.SaveAsTemplate:=false;

    Form_report.ADS06.Parameters[0].Value:=adsWo_ListRKEY.asinteger;
    Form_report.ADS06.Open;

//    Form_report.ADS25.Parameters[0].Value:=adsWo_Listrkey25.AsInteger;
//    Form_report.ADS25.Open;

    Form_report.ppReport1.Print;
  finally
    Form_report.free;
  end;

end;

procedure TfrmMain.BitBtn6Click(Sender: TObject);
begin
  with TForm_report.Create(application) do
  try
    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'Manu_workorder_sig.rtm';           //R:\NIERP\Report\Manu_instruction.rtm
    ppReport1.Template.LoadFromFile;
    ppreport1.SaveAsTemplate:=True;
    ppDesigner1.ShowModal;
  FINALLY
    Free;
  END;
end;

procedure TfrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  if  (DBGridEh1.DataSource.DataSet.FieldByName('Prod_Status').AsInteger = 102) or (DBGridEh1.DataSource.DataSet.FieldByName('Prod_Status').AsInteger = 103)then //暂缓的变颜色
   begin
      DBGridEh1.Canvas.Brush.Color:=RGB(244,241,255);
    //  DBGridEHName.Canvas.FillRect(rect);
      //DBGridEHName.Canvas.font.color:=clblack; //不要此句，不然的话将不会显示不同的字体的颜色值
   end
  else
   if (DBGridEh1.DataSource.DataSet.FieldByName('WO_DAYS').AsInteger>0) then
    begin
     if DBGridEh1.DataSource.DataSet.FieldByName('TimeDiff').Asfloat >
        DBGridEh1.DataSource.DataSet.FieldByName('WO_DAYS').AsInteger then //停留时间过长
     begin
        DBGridEh1.Canvas.Brush.Color:=clMoneyGreen;
      //  DBGridEHName.Canvas.FillRect(rect);
     end;
    end
   else
    begin
      DBGridEh1.Canvas.Brush.Color:=clwhite;
    //  DBGridEHName.Canvas.FillRect(rect);
        //DBGridEHName.Canvas.font.color:=clblack;
   end;

   if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
    begin
     DBGridEh1.Canvas.Brush.Color:=RGB(0,224,224);
      //DBGridEHName.Canvas.FillRect(rect);
      //DBGridEHName.Canvas.font.color:=clblack;
    end;
    if self.adsWo_ListQTYREJECT_1.Value > 0 then
     DBGridEh1.Canvas.Font.Color := clfuchsia
    else
     if self.adsWo_ListQTYREJECT.Value > 0 then
       DBGridEh1.Canvas.Font.Color := clred;


  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.N8Click(Sender: TObject);
var
 row:string;
begin
 row:=adsWo_ListREFERENCE.Value;
// row:=
// InputBox('信息输入', '请输入在线备注:      ',row);
 if InputQuery('信息输入', '请输入在线备注:      ',row) then  //修正点cancel按钮也保存的BUG
 begin
   tmp.Close;
   tmp.SQL.Clear;
   tmp.SQL.Text:='update data0056 set REFERENCE='+QuotedStr(row)+
   ' where rkey='+adsWo_Listd56_rkey.AsString;
   if tmp.ExecSQL>0 then
    begin
     showmsg('保存成功',1);
     RefreshData(adsWo_ListRKEY.Value);
    end
   else
    showmsg('保存失败,请与管理员系联',1);
 end;
end;

procedure TfrmMain.N10Click(Sender: TObject);
var
  LQry: TADOQuery;
  LS: TStringList;
  prod_status: Integer;
begin
  //*****************
  //*生产过数管控，chengtx增加
  if INQCLocked(adsWo_List.FieldbyName('rKey').AsInteger,adsWo_List.fieldbyName('dept_ptr').AsInteger,adsWo_List.fieldbyName('QTY_BACKLOG').AsInteger) then
  begin
    ShowMessage('该工单受到品质部门管控，禁止流转，请联系品质部！');
    Exit;
  end;
  //*****************

  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能提交入库',1);
    abort;
  end;
  if not (strtoint(vprev) in [2,4]) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  LQry := TADOQuery.Create(Self);
  LS := TStringList.Create;
  try
    LS.Add('select rkey from data0400 where status = 0');
    if not SQLOpen(LQry, LS) then
    begin
      ShowMessage('打开失败');
      Exit;
    end;
    if not LQry.IsEmpty then
    begin
      ShowMessage('生产线在盘点,不能操作');
      Exit;
    end;
  finally
    LQry.Close;
    LQry.Free;
    LS.Free;
  end;
  prod_status:= adsWo_List.FieldByName('Prod_status').AsInteger;
  if (prod_status=3) or (prod_status=4) or (prod_status=5) or (prod_status=6) then //状态为：待分配、待入仓，生产中的作业单才能做拆分;4外发生产可做正常尾数拆分
  begin
    if ((adsWo_List.FieldByName('wtype06').AsInteger=2) or (adsWo_List.FieldByName('wtype06').AsInteger=4)
     or (adsWo_List.FieldByName('wtype06').AsInteger=5)) then
    begin
      ShowMsg('当前作业单处于待返工、待报废或已报废状态，不能做拆分',1);
      exit;
    end;
    frmDlg_WO_Split :=  TfrmDlg_WO_Split.Create(Application);
    with frmDlg_WO_Split do
    try
      if ((strtoint(vprev)=4) and (prod_status<>4)) then
        rdgType.Visible:= True
      else
      begin
        Caption:= Caption+'-尾数拆分';
        rdgType.Visible:= False;
      end;
      My_prod_status := prod_status;
      if Showmodal=mrok then
      begin
        if WO_Split(adsWo_List.fieldbyName('rKey').Asinteger,StrToINt(edtNewPCS.Text),StrToInt(edtNewPNL.Text),rdgType.ItemIndex,
             adsWo_List.FieldByName('wtype').AsInteger,adsWo_List.FieldByName('wtype06').AsInteger,edtNewWONO.Text,memo1.Text) then
        begin
          RefreshData(adsWo_List.fieldbyName('rKey').Asinteger);
          ShowMsg('拆分作业单成功！',1);
        end else
          ShowMsg('拆分作业单失败！',1);
      end;
    finally
      free;
    end
  end
  else
    ShowMsg('只有状态为:待分配、待入仓、外发生产，生产中的作业单才能被拆分,请检查',1);
end;

procedure TfrmMain.ShowLSMSG(LS: TStrings);
var
  S: string;
  I: Integer;
begin
  for I := 0 to LS.Count - 1 do
    S := S + #13 + LS[I];
  ShowMessage(S);
end;

function TfrmMain.SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.ExecSQL;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误');
    ShowLSMSG(ASQL);
  end;
end;

function TfrmMain.SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.Open;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误!');
    ShowLSMSG(ASQL);
  end;
end;

function TfrmMain.WO_Split(rKey, PCS, PNL, vtype, wtype56, wtype06: integer; NEW_WONO,
  Remark: string): boolean;
var
  SplitType: Integer;
  function HasIn56(WN: string; out RKey56: Integer): Boolean;
  var
    LQry: TADOQuery;
    LS: TStringList;
  begin
    LQry := TADOQuery.Create(Self);
    LS := TStringList.Create;
    try
      LS.Clear;
      LS.Add('SELECT D56.* FROM Data0056 D56 ');
      LS.Add('INNER JOIN Data0006 D06 ON D56.WO_PTR = D06.RKey ');
      LS.Add('WHERE D06.WORK_ORDER_NUMBER = ' + QuotedStr(WN));
      SQLOpen(LQry,LS);
      if LQry.IsEmpty then Result := False else Result := True;
      if Result then RKey56 := LQry.FieldByName('RKey').AsInteger else RKey56 := 0;
    finally
      LQry.Close;
      LQry.Free;
      LS.Free;
    end;
  end;
  function WriteErrorLog:boolean;
  var
    LQry: TADOQuery;
    sqlstr:string;
  begin        //记录作业单拆分失败日志
    sqlstr:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark)'+
            ' values ('+IntToStr(rKey)+','+'2,0,'+User_ptr+',getdate(),'+IntToStr(SplitType)+','+QuotedStr('作业单拆分失败，单号：'+adsWo_List.fieldbyName('WORK_ORDER_NUMBER').asstring)+')';
    LQry := TADOQuery.Create(Self);
    try
      LQry.Connection:=ADOConnection1;
      LQry.SQL.clear;
      LQry.sql.Add(sqlstr);
      try
        result:=LQry.ExecSQL=1;
      except
        result:=false;
      end;
    finally
      LQry.Close;
      LQry.Free;
    end;
  end;
var
  LQry: TADOQuery;
  LS: TStringList;
  RKey56: Integer;
begin
  aspWO_Split.Parameters.ParamByName('@OrgRkey').Value :=rKey;
  aspWO_Split.Parameters.ParamByName('@WONO').Value :=NEW_WONO;
  aspWO_Split.Parameters.ParamByName('@PCS').Value :=PCS;
  aspWO_Split.Parameters.ParamByName('@PNL').Value :=PNL;
  aspWO_Split.Parameters.ParamByName('@User_ptr').Value :=StrToInt(User_ptr);
  aspWO_Split.Parameters.ParamByName('@Remark').Value :=Remark;
  aspWO_Split.Parameters.ParamByName('@NeedTrans').Value :=0;

  if vtype = 0 then  //尾数拆分
  begin
    if wtype06=3 then  //返工作业单
      aspWO_Split.Parameters.ParamByName('@type').Value := 3  //返工作业单进行尾数拆分之后仍为返工作业单
    else
      aspWO_Split.Parameters.ParamByName('@type').Value := 1;  //正常或尾数作业单进行尾数拆分之后为尾数作业单
    SplitType:=6;
  end
  else if vtype = 1 then  //待返工拆分
  begin
    if wtype56>0 then  //返工中
      aspWO_Split.Parameters.ParamByName('@type').Value := 999
    else
      aspWO_Split.Parameters.ParamByName('@type').Value := 2;
    SplitType:=9;
  end
  else if vtype = 2 then  //待报废拆分
  begin
    aspWO_Split.Parameters.ParamByName('@type').Value := 4;
    SplitType:=10;
  end
  else
  begin
    aspWO_Split.Parameters.ParamByName('@type').Value := 999;  //999表示错误的拆分类型
    SplitType:= 6;
  end;
  try
    if not ADOConnection1.InTransaction then
      ADOConnection1.BeginTrans;
    aspWO_Split.ExecProc;
    result :=aspWO_Split.Parameters.ParamByName('@RETURN_VALUE').Value=0;
    if not result then
    begin
      ADOConnection1.RollbackTrans;
      WriteErrorLog;
      exit;
    end
    else
      ADOConnection1.CommitTrans;
  except
    ADOConnection1.RollbackTrans;
    result:=false;
    WriteErrorLog;
    exit;
  end;
  if HasIn56(NEW_WONO, RKey56) then
  begin
    if not Assigned(frmDlg_WO_Split) then Exit;
    LQry := TADOQuery.Create(Self);
    LS := TStringList.Create;
    try
      LS.Add('UPDATE Data0056 SET REFERENCE = ' + QuotedStr(frmDlg_WO_Split.Edit1.Text));
      LS.Add(' WHERE RKey=' + IntToStr(RKey56));
      SQLExec(LQry,LS);
    finally
      LQry.Close;
      LQry.Free;
      LS.Free;
    end;
  end;  
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能提交入库',1);
    abort;
  end;
  if adsWo_List.FieldByName('wtype').AsInteger>0 then  //Data0056的wtype>0,表示返工中
  begin
    ShowMsg('当前作业单处于返工中，不能做返工申请',1);
    exit;
  end;
  if MessageBox(Handle, '此操作会将该作业单变更为待返工状态,确定申请吗?', '提示', MB_OKCANCEL +
    MB_ICONQUESTION) = IDOK then
  begin
    if LotApply(adsWo_ListRKEY.AsString,2) then
    begin
      ShowMessage('返工申请提交成功!');
      RefreshData(adsWo_List.fieldbyName('rKey').Asinteger);
    end
    else
      ShowMessage('返工申请提交失败!');
  end;
end;

procedure TfrmMain.N13Click(Sender: TObject);
begin
  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能提交入库',1);
    abort;
  end;
  if MessageBox(Handle, '此操作会将该作业单变更为待报废状态,确定申请吗?', '提示', MB_OKCANCEL +
    MB_ICONQUESTION) = IDOK then
  begin
    if LotApply(adsWo_ListRKEY.AsString,4) then
    begin
      ShowMessage('报废申请提交成功!');
      RefreshData(adsWo_List.fieldbyName('rKey').Asinteger);
    end
    else
      ShowMessage('报废申请提交失败!');
  end;
end;

function TfrmMain.LotApply(FromRKEY06: string; wtype: Integer): Boolean;
var vSQL: TStringList;
begin
  Result:= True;
  if (adsWo_Listwtype06.AsInteger = 2) or (adsWo_Listwtype06.AsInteger = 4) or (adsWo_Listwtype06.AsInteger = 5) then
  begin
    Result:= False;
    ShowMessage('当前作业单为待返工、待报废或已报废状态,无法申请!');
    Abort;
  end;
  if not (adsWo_List.FieldByName('Prod_status').AsInteger in [3,5,6]) then
  begin
    Result:= False;
    ShowMessage('只有当前作业单为生产中、待入仓或待分配状态才能申请!');
    Abort;
  end;
  if adsWo_List.FieldByName('TO_BE_STOCKED').AsInteger > 0  then
  begin
    Result:= False;
    ShowMessage('待入库数量大于0,无法申请!');
    Abort;
  end;
  OpenQuery(qryTmp,'select wtype from data0006 where wtype in(2,4) and from_wo_ptr ='+FromRKEY06);
  if qryTmp.RecordCount > 0 then
  begin
    Result:= False;
    ShowMessage('存在待返工或待报废的子作业单,无法申请!');
    Abort;
  end;
  vSQL:= TStringList.Create;
//  vSQL.Add('update data0006 set put_type=wtype,wtype='+inttostr(wtype)+',CUTNO_WO='''+StrCUTNO_WO(adsWo_ListWORK_ORDER_NUMBER.AsString)+''' where RKEY ='+FromRKEY06);
  vSQL.Add('update data0006 set put_type=wtype,wtype='+inttostr(wtype)+' where RKEY ='+FromRKEY06);
  vSQL.Add('Insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark)');
  if wtype = 2 then
    vSQL.Add('values('+FromRKEY06+',2,0,'+User_ptr+',getdate(),11,''待返工PCS数量:'+adsWo_ListQTY_BACKLOG.AsString+''')')
  else
    vSQL.Add('values('+FromRKEY06+',2,0,'+User_ptr+',getdate(),12,''待报废PCS数量:'+adsWo_ListQTY_BACKLOG.AsString+''')');
  //ShowLSMSG(vSQL);
  if not SQLExec(qryTmp,vSQL) then Result:= False;
end;

function TfrmMain.StrCUTNO_WO(str, sign: string): string;
var aftStr: string;
begin
  if Pos('W-',str)=1 then  //退货作业单
  str:= Copy(str,3,Length(str)-2);
  aftStr:= str;
  while Pos(sign,aftStr)>0 do
  begin
    aftStr:= Copy(aftStr,Pos(sign,aftStr)+1,Length(aftStr)-Pos(sign,aftStr));
  end;
  Result:= Copy(str,1,Pos(sign,str))+aftStr;
end;

procedure TfrmMain.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSumQuery, frmSumQuery);
  frmSumQuery.Show;
end;

procedure TfrmMain.N15Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if not (strtoint(vprev) in [2,4]) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    Exit;
  end;
  if adsWo_List.FieldByName('WTYPE').AsInteger>0 then
  begin
    MessageBox(Handle, '当前作业单正在返工中,不允许调整步骤号', '提示', MB_OK +
      MB_ICONWARNING);
    Exit;
  end;
  BitBtn3Click(nil);  //先刷新一次避免程序开太久引发的问题
  with tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT t38.STEP_NUMBER,t34.DEPT_CODE,t34.DEPT_NAME FROM Data0006 t6');
    SQL.Add('INNER JOIN Data0025 t25 ON t6.BOM_PTR=t25.RKEY');
    SQL.Add('INNER JOIN Data0038 t38 ON t38.SOURCE_PTR=t25.RKEY');
    SQL.Add('INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY');
    SQL.Add('WHERE t6.WORK_ORDER_NUMBER = '''+adsWo_List.FieldByName('WORK_ORDER_NUMBER').AsString+'''');
    SQL.Add('AND t38.STEP_NUMBER = '+adsWo_List.FieldByName('STEP').AsString);
    SQL.Add('AND t34.DEPT_CODE = '''+adsWo_List.FieldByName('DEPT_CODE').AsString+'''');
    Open;
    if RecordCount=1 then
    begin
      MessageBox(Handle, '当前步骤号以及工序正确,不需要调整', '提示', MB_OK +
        MB_ICONWARNING);
      Abort;
    end;
  end;
  with tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT t38.STEP_NUMBER,t34.DEPT_CODE,t34.DEPT_NAME FROM Data0006 t6');
    SQL.Add('INNER JOIN Data0025 t25 ON t6.BOM_PTR=t25.RKEY');
    SQL.Add('INNER JOIN Data0038 t38 ON t38.SOURCE_PTR=t25.RKEY');
    SQL.Add('INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY');
    SQL.Add('WHERE t6.WORK_ORDER_NUMBER = '''+adsWo_List.FieldByName('WORK_ORDER_NUMBER').AsString+'''');
    SQL.Add('AND t34.DEPT_CODE = '''+adsWo_List.FieldByName('DEPT_CODE').AsString+'''');
    Open;
  end;
  if tmp.RecordCount>0 then  //更新步骤号
  begin
    try
      with qryTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE t56 SET STEP='+tmp.FieldByName('STEP_NUMBER').AsString);
        SQL.Add('FROM Data0056 t56 INNER JOIN Data0006 t6 ON t56.WO_PTR=t6.RKEY');
        SQL.Add('WHERE t6.WORK_ORDER_NUMBER='''+adsWo_List.FieldByName('WORK_ORDER_NUMBER').AsString+'''');
        ExecSQL;
      end;
      MessageBox(Handle, '操作成功!', '提示', MB_OK + MB_ICONINFORMATION);
      BitBtn3Click(nil);
    except
      MessageBox(Handle, '更新步骤号失败!', '错误', MB_OK + MB_ICONSTOP);
      Abort;
    end;
  end
  else
  begin  //选择步骤号
    try
      frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
      InputVar.Fields:='STEP_NUMBER/步骤/30,DEPT_CODE/工序代码/150,DEPT_NAME/工序名称/200';
      InputVar.Sqlstr:='SELECT t38.STEP_NUMBER,t34.DEPT_CODE,t34.DEPT_NAME,t34.RKEY FROM Data0006 t6'+#13+
      'INNER JOIN Data0025 t25 ON t6.BOM_PTR=t25.RKEY'+#13+
      'INNER JOIN Data0038 t38 ON t38.SOURCE_PTR=t25.RKEY'+#13+
      'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'+#13+
      'WHERE t6.WORK_ORDER_NUMBER ='''+adsWo_List.FieldByName('WORK_ORDER_NUMBER').AsString+''''+#13+
      'ORDER BY t38.STEP_NUMBER';
      inputvar.KeyField:='DEPT_CODE';
      inputvar.InPut_value:='';
      InputVar.AdoConn:= ADOConnection1;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        try
          with qryTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE t56 SET STEP='+frmPick_Item_Single.adsPick.Fieldbyname('STEP_NUMBER').AsString+',');
            SQL.Add('DEPT_PTR='+frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString);
            SQL.Add('FROM Data0056 t56 INNER JOIN Data0006 t6 ON t56.WO_PTR=t6.RKEY');
            SQL.Add('WHERE t6.WORK_ORDER_NUMBER='''+adsWo_List.FieldByName('WORK_ORDER_NUMBER').AsString+'''');
            ExecSQL;
          end;
          MessageBox(Handle, '操作成功!', '提示', MB_OK + MB_ICONINFORMATION);
          BitBtn3Click(nil);
        except
          MessageBox(Handle, '变更步骤号&工序失败!', '错误', MB_OK + MB_ICONSTOP);
          Abort;
        end;
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
    end;
  end;
end;

procedure TfrmMain.RadioGroup3Click(Sender: TObject);
var
  i: Integer;
begin
  if RadioGroup3.ItemIndex=0 then  //不含板边
  begin
    for i:= 0 to DBGridEh1.Columns.Count-1 do
    begin
      if DBGridEh1.Columns[i].FieldName='unit_sq' then DBGridEh1.Columns[i].Visible:= True;
      if DBGridEh1.Columns[i].FieldName='unit_sq_includingBoader' then DBGridEh1.Columns[i].Visible:= False;
    end;
  end
  else if RadioGroup3.ItemIndex=1 then  //含板边
  begin
    for i:= 0 to DBGridEh1.Columns.Count-1 do
    begin
      if DBGridEh1.Columns[i].FieldName='unit_sq' then DBGridEh1.Columns[i].Visible:= False;
      if DBGridEh1.Columns[i].FieldName='unit_sq_includingBoader' then DBGridEh1.Columns[i].Visible:= True;
    end;
  end
  else
  begin
    for i:= 0 to DBGridEh1.Columns.Count-1 do
    begin
      if DBGridEh1.Columns[i].FieldName='unit_sq' then DBGridEh1.Columns[i].Visible:= False;
      if DBGridEh1.Columns[i].FieldName='unit_sq_includingBoader' then DBGridEh1.Columns[i].Visible:= False;
    end;
  end;
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  if not Assigned(frmManuPart_WIP) then
    Application.CreateForm(TfrmManuPart_WIP, frmManuPart_WIP)
  else
    frmManuPart_WIP.Show;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  tmpsql:string;
begin
  tmpsql:='select Rkey from data0419 where programe=''A_EP001.exe''';
  if OpenQuery(tmp,tmpsql) then
  begin
    rkey419:=tmp.FieldByName('rkey').AsInteger;
  end;
  tmpsql:='select rkey from data0073 where employee_ptr=' + user_ptr;
  if OpenQuery(tmp,tmpsql) then
  begin
    rkey73:=tmp.FieldByName('rkey').AsInteger;
  end;
  Self.ShowField(rkey419,rkey73,frmMain.Name,DBGridEh1);
end;

procedure TfrmMain.ShowField(k419, k73: Integer;fname:string; dbGrd: TDBGridEh);
var
  i,bool,addInt:Integer;
  tmpstr1,tmpstr2:string;
  addField:Boolean;
  aqtmp1,aqtmp2:TADOQuery;
  aaa,bbb,ccc:string;
begin
  try
    aqtmp1:=TADOQuery.Create(nil);
    aqtmp2:=TADOQuery.Create(nil);
    aqtmp1.Connection:=frmMain.ADOConnection1;
    aqtmp2.Connection:=frmMain.ADOConnection1;
    bool:=0;
    tmpstr2:='';
    tmpstr1:='select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay '+
              ' from data0849 where D419_ptr= '+ IntToStr(k419) +' and D073_ptr= ' + IntToStr(k73);

    if OpenQuery(aqtmp1,tmpstr1) then
    begin
      if not aqtmp1.IsEmpty then
      begin
        if aqtmp1.RecordCount >= dbGrd.Columns.Count then           //没有增加字段，按数据库的数据调整排序，可见以及宽度
        begin
          aqtmp1.Sort:='FieldOrder';
          aqtmp1.First;
          while not aqtmp1.Eof do
          begin
            loadField(aqtmp1,dbGrd);       //加载字段
            aqtmp1.Next;
          end;
        end
        else
        begin                                                  //增加了字段，把新加的字段加入数据库中
          addInt:= dbGrd.Columns.Count-aqtmp1.RecordCount;     //存增加了多少个字段
          for i:=0 to dbGrd.Columns.Count-1 do
          begin
            aaa:= dbGrd.Columns[i].FieldName;
            aqtmp1.First;
            addField:=True;
            while not aqtmp1.Eof do
            begin
              if dbGrd.Columns[i].FieldName=aqtmp1.FieldByName('FieldName').Value then
              begin
                addField:=False;
                Break;
              end;
              aqtmp1.Next;                                               
            end;
            if addField then
            begin
              bbb:=dbGrd.Columns[i].FieldName;
              if dbGrd.Columns[i].Visible then bool:=1
              else bool:=0;
              tmpstr2:= tmpstr2 + 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,formname,GridName)' +
                                      'values('+IntToStr(k419)+','+ IntToStr(k73)+','+ QuotedStr(dbGrd.Columns[i].FieldName)+','+
                                      QuotedStr(dbGrd.Columns[i].Title.Caption)+','+ IntToStr(dbGrd.Columns.Count +1 - addInt)+','+
                                      IntToStr(dbGrd.Columns[i].Width)+','+ IntToStr(bool)+','+ QuotedStr(fname) +','+ QuotedStr(dbGrd.Name)+')'+#13;

              addInt:=addInt - 1;
              if addInt = 0 then Break;
            end;
          end;
          ExecSql(aqtmp2,tmpstr2);
          aqtmp1.First;
          while not aqtmp1.Eof do
          begin
            loadField(aqtmp1,dbGrd);          //加载字段
            aqtmp1.Next;
          end;
        end;
      end
      else
      begin                                     //如果当前使用人员当前程序在849表没找到，则新增
  //      tmpstr2:='delete from data0849 where D419_ptr='+ IntToStr(k419) +' and D073_ptr='+ IntToStr(k73);
  //      ExecSql(aqtmp2,tmpstr2);
        for i:=0 to dbGrd.Columns.Count-1 do
        begin
          if dbGrd.Columns[i].Visible then bool:=1
          else bool:=0;
          tmpstr2:= tmpstr2+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,formname,GridName)' +
                                'values('+IntToStr(k419)+','+ IntToStr(k73)+','+ QuotedStr(dbGrd.Columns[i].FieldName)+','+
                                QuotedStr(dbGrd.Columns[i].Title.Caption)+','+ IntToStr(dbGrd.Columns[i].Index)+','+
                                IntToStr(dbGrd.Columns[i].Width)+','+ IntToStr(bool)+ ','+ QuotedStr(fname) +','+ QuotedStr(dbGrd.Name)+ ')'+#13;

        end;
        ExecSql(aqtmp2,tmpstr2);
      end;
    end;
  finally
    aqtmp1.Free;
    aqtmp2.Free;
  end;
end;

procedure TfrmMain.loadField(tmp: TADOQuery; DbGrid: TDBGridEh);
var
  i:Integer;
begin
  with tmp do
  begin
    for i:=0 to DbGrid.Columns.Count-1 do
    begin
      if (FieldByName('FieldName').Value=DbGrid.Columns[i].FieldName) then
      begin
        if (FieldByName('IsDisplay').Value <> DbGrid.Columns[i].Visible) or (FieldByName('FieldWidth').Value <> DbGrid.Columns[i].Width) then
        begin
          DbGrid.Columns[i].Visible:= FieldByName('IsDisplay').Value;
          DbGrid.Columns[i].Width:= FieldByName('FieldWidth').Value;
        end;
        DbGrid.Columns[i].Index:= FieldByName('FieldOrder').Value ;
        Break;
      end;
    end;
  end;
end;


procedure TfrmMain.DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i,tmp:Integer;
begin
  if MessageDlg('列顺序已经改变，是否保存排序？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FromIndex>ToIndex then
    begin
      tmp:=FromIndex;
      FromIndex:=ToIndex;
      ToIndex:=tmp;
    end;
    for i:= FromIndex to ToIndex do
    begin
      with frmMain.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=SQL.Text + 'update data0849 set fieldorder='+ IntToStr(i)+' where D419_ptr='+
            IntToStr(rkey419) +' and D073_ptr='+ IntToStr(rkey73) + ' and fieldname=' +
            QuotedStr(DBGridEh1.Columns[i].FieldName);
//        ShowMessage(SQL.Text);
        frmMain.tmp.ExecSQL;
      end;
    end;
  end;
end;

function TfrmMain.INQCLocked(ARkey06, ARkey34, AQty: Integer): Boolean;
var
  LSql: string;
begin
  Result := False;

  LSql := 'if object_id(N''dbo.QC_PassNumCheck'',N''U'') is not null begin select 1 end else select 0';
  if not OpenQuery(qryTmp,LSql) then Exit;
  if qryTmp.Fields[0].AsInteger = 0 then
  begin
    Exit;
  end;

  LSql := ' SELECT PassNum FROM qc_passNumCheck WHERE Enable = 1 AND Rkey06 = ' + IntToStr(ARkey06) +
          ' AND D34_ptr = ' + IntToStr(ARkey34);
  if not OpenQuery(qryTmp,LSql) then exit;
  if not qryTmp.IsEmpty then
  begin
    if AQty > qryTmp.FieldByName('PassNum').AsInteger then
    begin
      Result := True;
    end;
  end;

end;

procedure TfrmMain.N16Click(Sender: TObject);
var dDate:TDateTime;
 row:string;
begin
  if strtoint(vprev)=4 then
  begin
    row:=adsWo_ListSCH_COMPL_DATE.AsString;
    if InputQuery('日期输入', '请输入新的计划完工日期:      ',row) then  //修正点cancel按钮也保存的BUG
    begin
      if not TryStrToDate(row,dDate) then
      begin
        ShowMessage('日期转换失败，请确定日期格式是yyyy-mm-dd');
        Exit;
      end;
      tmp.Close;
      tmp.SQL.Clear;
      tmp.SQL.Text:='update data0006 set SCH_COMPL_DATE='+QuotedStr(row)+
      ' where rkey='+adsWo_ListRKEY.AsString;
      if tmp.ExecSQL>0 then
      begin
       showmsg('保存成功',1);
       RefreshData(adsWo_ListRKEY.Value);
      end
      else
      showmsg('保存失败,请与管理员系联',1);
    end;
  end else
  begin
    ShowMessage('权限不足！需要开通最高权限4');
    Exit;
  end;
end;

procedure TfrmMain.adsWo_ListCalcFields(DataSet: TDataSet);
var
  i: Integer;
begin
  try
    adsWo_List.FieldByName('ABC36').AsString := DecToABC36(adsWo_List.fieldbyname('rkey').AsInteger);
//      spABC36.Close;
//      spABC36.Parameters.ParamByName('@Dec').Value := adsWo_List.fieldbyname('rkey').AsInteger;
//      spABC36.ExecProc;
//      adsWo_List.FieldByName('ABC36').AsString := spABC36.Parameters.ParamByName('@out_ABC36').Value;

  except
  end;
end;

function TfrmMain.DecToABC36(ADec: Int64): string;
var
  LMod36: Int64;
  LTmp: Int64;
  RetStr: string;
begin
  LTmp := ADec;
  repeat
    LMod36 := LTmp mod 36;
    if LMod36 <= 9 then
      RetStr := RetStr + IntToStr(LMod36)
    else
      RetStr := RetStr + Char(LMod36 - 10 + 65);
    LTmp := LTmp div 36;
  until LTmp < 36;

  if LTmp <> 0 then
  begin
    if LTmp <= 9 then
      RetStr := RetStr + IntToStr(LTmp)
    else
      RetStr := RetStr + Char(LTmp - 10 + 65);
  end;

  Result :=  ReverseString(RetStr);
end;

procedure TfrmMain.N17Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) then
  begin
    messagedlg('对不起!您没有权限',mtinformation,[mbok],0) ;
    Exit;
  end;
  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能合卡',1);
    Exit;
  end;
  if not (adsWo_ListPROD_STATUS.Value  in [3,5,6]) then
  begin
    ShowMessage('对不起，只有作业单状态为生产中，待分配，待入仓的作业单才能合卡');
    Exit;
  end;
  if not ((adsWo_Listwtype06.Value  in [0,1]) or ( (adsWo_Listwtype06.Value in [3]) and (adsWo_ListReCheck.asstring='是')))  then
  begin
    ShowMessage('对不起，只有在线状态为正常和被拆分或者返工并且是正常重检的作业单才能合卡');
    Exit;
  end;

  frm_Merge := Tfrm_Merge.Create(Application);
  try
    frm_Merge.sql_text := frm_Merge.ADS06.CommandText;
    frm_Merge.Edit1.Text := adsWo_ListWORK_ORDER_NUMBER.AsString ;
    if frm_Merge.ShowModal=mrok then
    begin
      ShowMessage('合卡成功！');
      BitBtn3Click(Sender);
    end;
  finally
    frm_Merge.Free;
  end;
end;

end.
