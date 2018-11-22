{******************************************************************************}
{                                                                              }
{Code Maker: Jacky Zhong                                                       }
{Date: MAR. 15. 2007                                                           }
{Comments:通用查询父类                                                         }
{1.各个模块的查询条件设置容器,生成合法的条件SQL,并返回查询结果                 }
{2.封装了查询条件设置,SQL合法检验,SQL返回,记录查找,过滤,打印,等功能            }
{3.调入参数:模块编号,通过模块编号,从数据库读取模块的查询各项参数,完成查询前部署}
{                                                                              }
{******************************************************************************}
unit QueryStandard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, DBClient, Buttons,
  RzTabs, DBGridEh, ImgList, ComCtrls, ToolWin, Menus, RzButton, RzBmpBtn,
  Mask, RzEdit, RzDTP;

type
  TfrmQueryStandard = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    cdsQueryData: TClientDataSet;
    dsQueryData: TDataSource;
    Panel4: TPanel;
    cdsMaster: TClientDataSet;
    cdsItems: TClientDataSet;
    cdsItemsFieldCaption: TStringField;
    cdsItemsFieldName: TStringField;
    cdsItemsDataType: TStringField;
    cdsItemsInputValue: TStringField;
    cdsItemsPickItemId: TIntegerField;
    cdsItemsnType: TStringField;
    cdsItemsnOperator: TStringField;
    dsItems: TDataSource;
    Panel5: TPanel;
    cdsItemsInputType: TIntegerField;
    cdsItemsPickListValue: TStringField;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    DBGrid1: TDBGridEh;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    btnQry: TToolButton;
    btnFind: TToolButton;
    btnPrint: TToolButton;
    btnExport: TToolButton;
    btnExit: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    btnClear: TRzBitBtn;
    spbtnExec: TRzBitBtn;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DBGrid3: TDBGridEh;
    StatusBar1: TStatusBar;
    edtKey: TRzEdit;
    labelKey: TLabel;
    dtpStartDate: TRzDateTimePicker;
    dtpEndDate: TRzDateTimePicker;
    Label1: TLabel;
    procedure btnClearClick(Sender: TObject);
    procedure cdsItemsAfterScroll(DataSet: TDataSet);
    procedure cdsItemsBeforeDelete(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure spbtnExecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsItemsInputValueValidate(Sender: TField);
    procedure btnExitClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumnEh);
    procedure cdsQueryDataAfterOpen(DataSet: TDataSet);
    procedure DBGrid3CellClick(Column: TColumnEh);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure dtpStartDateChange(Sender: TObject);
  private
    { Private declarations }
    function Check_Operator(input:string):boolean;
    function Check_Type(input:string):boolean;

  public
    { Public declarations }
    function Check_Fields_Values:boolean;virtual;
    function Check_Between_Phrase(nExpr:string;DataType:string):boolean;virtual;
    function Get_Rslt:wideString;virtual;//返回挑选的记录数值
    procedure InitForm(qryNo:integer);virtual;
  end;

var
  frmQueryStandard: TfrmQueryStandard;

implementation
uses Client_FUNc,PUBFunc,Dlg_between,dlgRecordFind,dlgDataFilter;
{$R *.dfm}

procedure TfrmQueryStandard.btnClearClick(Sender: TObject);
var bk:Tbookmark;
begin
  try
    bk:= cdsItems.GetBookmark;
    cdsItems.DisableControls;
    cdsItems.First;
    while not cdsItems.eof do begin
      cdsItems.Edit;
      cdsItems.FieldByName('InputValue').Value := NULL;
      cdsItems.Next;
    end;
  finally
    if BK <> nil then
      cdsItems.GotoBookmark(bk);
    cdsItems.FreeBookmark(bk);
    cdsItems.EnableControls;
  end;
end;

function TfrmQueryStandard.Check_Between_Phrase(nExpr,
  DataType: string): boolean;
var
 i:integer;
 sLeft,sRight:string;
 vTmp:variant;
begin
  result := true;
  i:= POS('AND',nExpr);
  sLeft:=trim(copy(nexpr,1,i-1));
  sRight:=trim(copy(nExpr,i+3,length(nExpr)-i));
  if (i >0) and (sLeft<>'') and (sRight<>'')then
  begin
    if DataType = 'F' then
    begin
      try
        vTmp:= StrToFloat(sLeft);
      except
        ShowMsg('错误的数字类型，请输入数字',1);
        result := false;
        exit;
      end;

      try
        vTmp:= StrToFloat(sRight);
      except
        ShowMsg('错误的数字类型，请输入数字',1);
        result := false;
        exit;
      end;
    end
    else if DataType = 'D' then
    begin
      try
        vTmp:= StrToDatetime(DeQuotedStr(sLeft));
      except
        ShowMsg('错误的日期类型，请输入日期',1);
        result := false;
        exit;
      end;

      try
        vTmp:= StrToDatetime(DeQuotedStr(sRight));
      except
        ShowMsg('错误的日期类型，请输入日期',1);
        result := false;
        exit;
      end;
    end
  end
  else
    result := false;
end;

function TfrmQueryStandard.Check_Fields_Values: boolean;
var bError:boolean;
FieldValue,nOperator,sDataType:string;
begin
  try
//  cdsItems.EnableControls;
    cdsItems.DisableControls;

    bError:= false;
    cdsItems.First;
    while not cdsItems.Eof do begin
      sDataType:= uppercase(trim(cdsItems.FieldByName('nType').AsString));
      nOperator:= uppercase(trim(cdsItems.FieldByName('nOperator').AsString));
      FieldValue:=trim(cdsItems.FieldByName('InputValue').AsString);
      if not Check_Type(sDataType) then
      begin
        ShowMsg('关系输入错误，必须属于"AND,OR"，请检查',1);
        bError:= true;
        break;
      end else
      if not Check_Operator(nOperator) then
      begin
        ShowMsg('条件因子输入错误，必须属于"=,<>,<,<=,>,>=,Like,between"，请检查',1);
        bError:=true;
        break;
      end;
      if FieldValue <> '' then
      begin
        sDataType := uppercase(trim(cdsItems.FieldByName('DataType').Asstring));
        if cdsItems.FieldByName('InputType').AsInteger = 2 then
           FieldValue:= Get_Pick_List_Inside_Value(FieldValue,cdsItems.FieldByName('PickListValue').AsString);
        IF sDataType = 'D' then
        begin
          if nOperator='LIKE' THEN
          begin
            ShowMsg('日期型的查询条件不能用Like操作',1);
            bError:=true;
            break;
          end;
          if nOperator='BETWEEN' then
          begin
  //
          end
          else
          try
            StrToDatetime(FieldValue);
          except
            ShowMsg('请输入正确的日期',1);
            bError:= true;
            break;
          end;
        end;
        if sDataType = 'F' then
        begin
          if nOperator='LIKE' THEN
          begin
            ShowMsg('数字型的查询条件不能用Like操作',1);
            bError:=true;
            break;
          end
          else if nOperator <> 'BETWEEN' then
            try
              StrToFloat(FieldValue);
            except
              bError:= true;
              ShowMsg('该查询条件必须输入数字',1);
              break;
            end;
        end;
      end;
      cdsItems.Next;
    end;
//  cdsItems.first;
  finally
    result := not bError;
    cdsItems.EnableControls;
  end;
end;

function TfrmQueryStandard.Check_Operator(input: string): boolean;
var
  tmpStr:string;
  n:integer;
begin
  tmpStr:= uppercase(trim(input));
  n:=Length(tmpStr);
  if n=1 then
    result:= (tmpStr[n] in ['=','>','<'])
  else if n=2 then
    result := ((tmpStr='<>') or (tmpStr='<=') or (tmpStr='>=') or (tmpStr='IN'))
  else if n= 4 then
    result := tmpstr='LIKE'
  else
    result := tmpstr='BETWEEN'
end;

function TfrmQueryStandard.Check_Type(input: string): boolean;
var
  tmpstr:string;
begin
  tmpStr:= uppercase(trim(input));
  result := ((tmpstr='AND') or (tmpstr='OR'));
end;

procedure TfrmQueryStandard.InitForm(qryNo: integer);
var
  vData:OleVariant;
  ErrorMsg:wideString;
begin
//  vData := VarArrayCreate([0,1], varVariant);
  if not coMyQuery.Get_Qry_Condition(qryNo,vData,ErrorMsg) then
  begin
    ShowMsg('获取服务器数据失败！',1);
    abort;
  end
  else
  begin
    cdsMaster.Data:= vData[0];
    cdsItems.Data := vData[1];
    cdsItems.First;
    while not cdsItems.Eof do begin
      cdsItems.edit;
      cdsItems.FieldByName('nType').Value := 'AND';
      cdsItems.FieldByName('nOperator').Value := '=';
      if Uppercase(trim(cdsItems.FieldByName('DataType').Asstring))='D' then
      begin
        cdsItems.FieldByName('nOperator').Value := 'BETWEEN';
        cdsItems.FieldByName('InputValue').Value :=QuotedStr(FormatDatetime('yyyy-mm-dd',Get_Month_First_Day(date)))+' AND '+QuotedStr(FormatDatetime('yyyy-mm-dd',Date));
      end
      else if (Uppercase(trim(cdsItems.FieldByName('DataType').Asstring))='S') and (cdsItems.FieldByName('InputType').AsInteger = 0 )then
        cdsItems.FieldByName('nOperator').Value := 'LIKE';
      cdsItems.next;
    end;
    cdsItems.first;
  end;
  dtpStartDate.Date := date;
  dtpEndDate.Date := date;
  if (DBGRid3.Columns.Count > 0) and (cdsQueryData.Active) then
    DBGrid3CellClick(DBGRid3.Columns[0]);
  Show;
end;

procedure TfrmQueryStandard.cdsItemsAfterScroll(DataSet: TDataSet);
var
  sDataType:string;
begin
  sDataType := uppercase(trim(cdsItems.FieldByName('DataType').Asstring));
  if cdsItems.FieldByName('InputType').AsInteger = 1 then
    DBGrid1.Columns[3].ButtonStyle := cbsEllipsis
  else
    DBGrid1.Columns[3].ButtonStyle := cbsAuto;
  if cdsItems.FieldByName('InputType').AsInteger = 2 then
    Add_Column_Pick_List(DBGrid1.Columns[3],cdsItems.FieldByName('PickListValue'))
  else
  begin
    DBGrid1.Columns[3].PickList.clear;
    DBGrid1.Columns[3].KeyList.clear;
  end;
  if sDataType = 'D' then
   cdsItems.FieldByName('DataType').EditMask := '!9999/99/00;1;_';
end;

procedure TfrmQueryStandard.cdsItemsBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmQueryStandard.DBGrid1EditButtonClick(Sender: TObject);
var
  sDataType,sTmp:string;
  sLeft,sRight:variant;
  sDate:Tdatetime;
begin
  sDataType := uppercase(trim(cdsItems.FieldByName('DataType').Asstring));
  if uppercase(trim(cdsItems.FieldByName('nOperator').AsString))= 'BETWEEN' then
  begin
    frmDlg_between:= TfrmDlg_between.Create(application);
    with frmDlg_between do begin
      try
        if trim(cdsItems.FieldByName('InputValue').Asstring)<> '' then
          if not Div_Between_Phrase(cdsItems.FieldByName('InputValue').Asstring,sDataType,sLeft,sRight)then
          begin
            ShowMsg('输入的查询值错误,请检查',1);
            abort;
          end;
        InitForm(sDataType,sLeft,sRight);
        if ShowModal = mrok then
        begin
          cdsItems.edit;
          cdsItems.FieldByName('InputValue').value := Get_rslt;
        end;
      finally
        free;
      end;
    end;
  end
  else
  begin
    IF sDataType = 'D' then
    begin
      if trim(cdsItems.FieldByName('InputValue').Asstring) <> '' then
        sDate:=Pick_Date(cdsItems.FieldByName('InputValue').AsDatetime)
      else
        sDate:= Pick_Date(date);
      if sDate <> 0 then
      begin
       cdsItems.edit;
       cdsItems.FieldByName('InputValue').value := DatetimeToStr(trunc(sDate));
      end
    end
    else
    begin
       sTmp:=Get_Pick_Value(cdsItems.FieldByName('PickItemId').value,cdsItems.FieldByName('InputValue').value,2);
       if sTmp<>'' then
       begin
         cdsItems.edit;
         cdsItems.FieldByName('InputValue').value := sTmp;
       end;
    end;
  end;
end;

function TfrmQueryStandard.Get_Rslt: wideString;
var
  MainSql,SubSql,nType,nOperator,sDataType,FieldValue:string;
begin
  try
    cdsItems.DisableControls;

    MainSql := cdsMaster.FieldByName('PreSqlstr').AsString;
    cdsItems.first;
    while not cdsItems.Eof do begin
      nType:= ' '+ uppercase(trim(cdsItems.FieldByName('nType').AsString))+' ' ;
      nOperator:= ' '+ uppercase(trim(cdsItems.FieldByName('nOperator').AsString))+' ' ;
      FieldValue:=trim(cdsItems.FieldByName('InputValue').AsString);
      if FieldValue <> '' then
      begin
        if cdsItems.FieldByName('InputType').AsInteger = 2 then
           FieldValue:= Get_Pick_List_Inside_Value(FieldValue,cdsItems.FieldByName('PickListValue').AsString);
        sDataType := uppercase(trim(cdsItems.FieldByName('DataType').Asstring));
        IF sDataType = 'D' then
        begin
          if trim(nOperator)='BETWEEN' then
            subsql:= subsql+ nType + ' '+ '('+trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+FieldValue+')'
          else
            subsql:= subsql+ nType + ' '+ '('+trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+
                     QuotedStr(FormatDatetime('yyyy-mm-dd',StrToDatetime(FieldValue)))+')';
        end
  //      S:字符型,D日期,F数字,
        else if sDataType = 'S' then
        begin
          if trim(nOperator)='LIKE' THEN
            subsql:= subsql+ nType + ' ('+ trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+
                     '''%'+FieldValue+'%'')'
          else
            subsql:= subsql+ nType + ' ('+ trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+
                     QuotedStr(FieldValue)+')';
        end
        else if sDataType = 'F' then
          subsql:= subsql+ nType + ' '+ '('+trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+
                   FieldValue+')';
      end;
      cdsItems.next;
    end;
  finally
    result := subSql;//MainSql+SubSql+ cdsMaster.FieldByName('sufSqlStr').AsString;
    cdsItems.EnableControls;
  end;
end;

procedure TfrmQueryStandard.spbtnExecClick(Sender: TObject);
var
  Sqlstr,ErrorMsg:Widestring;
  vData:OleVariant;
  MainSql:string;
begin
  ReSet_Sort(DBGRid3);
  MainSql := cdsMaster.FieldByName('PreSqlstr').AsString;
  cdsQueryData.Filtered:= false;
  if cdsItems.State in dsEditModes then
    cdsItems.Post;
  if not Check_Fields_Values then exit;
  sqlstr:= Get_Rslt;
  Sqlstr:= MainSql+sqlstr+ cdsMaster.FieldByName('sufSqlStr').AsString;
  if coMyQuery.Get_Sql_Data(sqlstr,vData,ErrorMsg) then
    cdsQueryData.Data := vData
  else
  begin
    ShowMsg('返回查询数据失败，请检查',1);
    exit;
  end;
end;

procedure TfrmQueryStandard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  frmQueryStandard := nil;
end;

procedure TfrmQueryStandard.cdsItemsInputValueValidate(Sender: TField);
var vtmp:variant;
vValue:string;
begin
  if trim(Sender.AsString)='' then exit;
  if cdsItems.FieldByName('nOperator').AsString = 'BETWEEN' then
  begin
    if not Check_Between_Phrase(Sender.Value,cdsItems.FieldByName('DataType').AsString) then
        abort;
  END
  ELSE
  BEGIN
    vValue := Sender.AsString;
    if cdsItems.FieldByName('InputType').AsInteger = 2 then
      vValue:= Get_Pick_List_Inside_Value(vValue,cdsItems.FieldByName('PickListValue').AsString);
    if cdsItems.FieldByName('DataType').AsString = 'F' then
    begin
      try
        vtmp:= StrToFloat(vValue);
      except
        ShowMsg('错误的数字类型，请输入数字',1);
        abort;
      end;
    end
    else if cdsItems.FieldByName('DataType').AsString = 'D' then
    begin
      try
        vtmp:= StrToDatetime(vValue);
      except
        ShowMsg('错误的日期类型',1);
        abort;
      end;
    end;
  END;
end;

procedure TfrmQueryStandard.btnExitClick(Sender: TObject);
begin
  close;
end;


procedure TfrmQueryStandard.N4Click(Sender: TObject);
var
  ListString:TStrings;
  FieldName:string;
begin
  if cdsQueryData.IsEmpty then
  begin
    ShowMsg('没有数据,无法查找',1);
    exit;
  end;
  with TfrmdlgRecordFind.Create(Application)do
  try
    try
      ListString:= TStringList.Create;
      Add_Fields_To_List(DBGRid3,ListString);
      comboxFieldList.Items.AddStrings(ListString);
      comboxFieldList.ItemIndex := comboxFieldList.IndexOf(DBGrid3.Columns.Items[DBGrid3.SelectedIndex].Title.Caption);
    finally
      ListString.Free;
    end;
    if ShowModal = mrok then
    begin
      if (trim(comboxFieldList.Text) = '') OR (trim(edtValue.Text)='') then exit;
      FieldName :=Find_FieldName_In_DBGRid(DBGRid3,trim(comboxFieldList.Text));
      if FieldName = '' then exit;
        cdsQueryData.Locate(FieldName,trim(edtValue.Text),[loPartialKey])
    end;
  finally
    free;
  end;
end;


procedure TfrmQueryStandard.N5Click(Sender: TObject);
var
  ListString:TStrings;
  sFilter:string;
  FieldName:string;
begin
  if cdsQueryData.IsEmpty then
  begin
    ShowMsg('没有数据,无法过滤',1);
    exit;
  end;
{  if not (DBGrid3.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
  begin
    ShowMsg('数据类型必须为字符型,否则无法过滤',1);
    exit;
  end;}
  with TfrmdlgDataFilter.Create(Application)do
  try
    try
      ListString:= TStringList.Create;
      Add_Fields_To_List(DBGRid3,ListString);
      comboxFieldList.Items.AddStrings(ListString);
      comboxFieldList.ItemIndex := comboxFieldList.IndexOf(DBGrid3.Columns.Items[DBGrid3.SelectedIndex].Title.Caption);
    finally
      ListString.Free;
    end;
    if ShowModal = mrok then
    begin
      if (trim(comboxFieldList.Text) = '') OR (trim(edtValue.Text)='') then exit;
      FieldName:=Find_FieldName_In_DBGRid(DBGRid3,trim(comboxFieldList.Text));
      if FieldName = '' then exit;

      if rgFilterType.ItemIndex = 0 then
        sFilter := trim(edtValue.Text)+'%'
      else if rgFilterType.ItemIndex = 1 then
        sFilter := '%'+trim(edtValue.Text)
      else
        sFilter := '%'+trim(edtValue.Text)+'%';
      cdsQueryData.Filter := FieldName+' Like '+ QuotedStr(sFilter);
      cdsQueryData.Filtered:= true;
    end;
  finally
    free;
  end;
end;

procedure TfrmQueryStandard.N6Click(Sender: TObject);
begin
  cdsQueryData.Filtered:= false;
end;

procedure TfrmQueryStandard.btnFindClick(Sender: TObject);
var
  P:TPoint;
begin
  P.X := BtnFind.ClientOrigin.X;
  P.Y := btnFind.Height+btnFind.ClientOrigin.Y;
  PopupMenu2.Popup(P.X,P.Y);
end;

procedure TfrmQueryStandard.btnPrintClick(Sender: TObject);
var
  P:TPoint;
begin
  P.X := btnPrint.ClientOrigin.X;
  P.Y := btnPrint.Height+btnPrint.ClientOrigin.Y;
  PopupMenu1.Popup(P.X,P.Y);
end;

procedure TfrmQueryStandard.btnExportClick(Sender: TObject);
begin
  if DbGrid3.DataSource.DataSet.IsEmpty then abort;
  Export_dbGridEH_to_Excel(dbgrid3,self.Caption);
end;

procedure TfrmQueryStandard.N1Click(Sender: TObject);
var
  RptName,RptTitle:string;
  vData:OleVariant;
begin
  if cdsQueryData.IsEmpty then exit;
  vData := VarArrayCreate([0, 0], varVariant);
  vData[0] :=cdsQueryData.Data;
  rptName:=Get_FS_Rpt_Name(cdsMaster.FieldByName('qryNo').asinteger,RptTitle);
  pCall_Report(rptName,RptTitle,UserId,vData,1);
end;

procedure TfrmQueryStandard.N2Click(Sender: TObject);
var
  RptName,RptTitle:string;
  vData:OleVariant;
begin
  if cdsQueryData.IsEmpty then exit;
  vData := VarArrayCreate([0, 0], varVariant);
  vData[0] :=cdsQueryData.Data;
  rptName:=Get_FS_Rpt_Name(cdsMaster.FieldByName('qryNo').asinteger,RptTitle);
  pCall_Report(rptName,RptTitle,UserId,vData,2);
end;

procedure TfrmQueryStandard.N3Click(Sender: TObject);
var
  RptName,RptTitle:string;
  vData:OleVariant;
begin
  if cdsQueryData.IsEmpty then exit;
  vData := VarArrayCreate([0, 0], varVariant);
  vData[0] :=cdsQueryData.Data;
  rptName:=Get_FS_Rpt_Name(cdsMaster.FieldByName('qryNo').asinteger,RptTitle);
  pCall_Report(rptName,RptTitle,UserId,vData,3);
end;

procedure TfrmQueryStandard.DBGrid3TitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(Column.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(Column.Field.DataSet).IndexName:='';
    TClientDataSet(Column.Field.DataSet).DeleteIndex(OldIndex);
  end;
  if Column.Title.SortMarker = smDownEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixPrimary]);
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
  begin
//      TClientDataSet(Column.Field.DataSet).DeleteIndex('px');
      Column.Title.SortMarker := smNoneEh;
  end
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smDownEh;
  end;{end case}
end;

procedure TfrmQueryStandard.cdsQueryDataAfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[1].Text := IntToStr(DataSet.RecordCount);
end;

procedure TfrmQueryStandard.DBGrid3CellClick(Column: TColumnEh);
begin
  edtKey.Enabled:= not cdsQueryData.IsEmpty;
  dtpStartDate.Enabled := edtKey.Enabled;
  dtpEndDate.Enabled := edtKey.Enabled;

  if cdsQueryData.IsEmpty then abort;
//  SelectedField := Column.FieldName;
  labelKey.Caption := Column.Title.Caption;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label1.Visible := not edtKey.Visible;
  dtpStartDate.Visible := Label1.Visible;
  dtpEndDate.Visible := Label1.Visible;
end;

procedure TfrmQueryStandard.edtKeyChange(Sender: TObject);
var  tmpstr,sFilter:string;
begin
  if not cdsQueryData.Active then abort;
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    cdsQueryData.Filtered:= false
  else
  begin
    if (DBGrid3.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      cdsQueryData.Filter := 'Upper('+DBGrid3.SelectedField.FieldName+') Like '+ QuotedStr(sFilter);
//      sFilter := '%'+TmpStr+'%';
//      cdsQueryData.Filter := DBGrid3.SelectedField.FieldName+' Like '+ QuotedStr(sFilter);
      cdsQueryData.Filtered:= true;
    end
    else if DBGrid3.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := DBGrid3.SelectedField.FieldName+'>='+TmpStr;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      cdsQueryData.Filter := sFilter;
      cdsQueryData.Filtered:= true;
    end
    else if DBGrid3.SelectedField.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      cdsQueryData.Filter := DBGrid3.SelectedField.FieldName + sFilter;
      cdsQueryData.Filtered:= true;
    end;
  end;
end;

procedure TfrmQueryStandard.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if DBGrid3.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TRzEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
//    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TRzEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TRzEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  DBGrid3.SelectedField.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TRzEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TRzEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TRzEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TRzEdit).text)>0 then
      if (key='-') then abort;
  end ;
{  else
  if DBGrid3.SelectedField.DataType in [[ftDate, ftDateTime]]) then
  begin
    if (Sender as TEdit)
  end;}
end;

procedure TfrmQueryStandard.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter:string;
begin
  if not cdsQueryData.Active then abort;
  TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
  TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
  if DBGrid3.SelectedField.DataType in [ftDate, ftDateTime] then
  begin
    sFilter := DBGrid3.SelectedField.FieldName+'>='+TmpStr1+ ' AND ' +DBGrid3.SelectedField.FieldName+'<'+TmpStr2;
    cdsQueryData.Filter := sFilter;
    cdsQueryData.Filtered:= true;
  end;
end;

end.
