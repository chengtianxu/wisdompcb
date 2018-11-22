{******************************************************************************}
{                                                                              }
{Writen by: Jacky Zhong                                                        }
{Date: MAR. 26. 2007                                                           }
{Comments:查询的入口                                                           }
{1.定义了查询的入口,提供各个模块的条件设置容器,返回合法的SQL语句               }
{继承:     TfrmQuery_Param --> (其它查询模块从此继承)                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit Query_Param;

interface

uses Windows,DBGridEh, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DB, StrUtils,variants,
  ComCtrls, DBClient, RzTabs, RzButton ;

type
  TfrmQuery_Param = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    DBGrid1: TDBGridEh;
    btnClear: TRzBitBtn;
    spbtnExec: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    cdsMaster: TClientDataSet;
    cdsItems: TClientDataSet;
    cdsItemsFieldCaption: TStringField;
    cdsItemsFieldName: TStringField;
    cdsItemsDataType: TStringField;
    cdsItemsInputValue: TStringField;
    cdsItemsPickItemId: TIntegerField;
    cdsItemsnType: TStringField;
    cdsItemsnOperator: TStringField;
    cdsItemsInputType: TIntegerField;
    cdsItemsPickListValue: TStringField;
    dsItems: TDataSource;
    RzBitBtn1: TRzBitBtn;
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure cdsItemsAfterScroll(DataSet: TDataSet);
    procedure cdsItemsBeforeDelete(DataSet: TDataSet);
    procedure cdsItemsBeforeInsert(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cdsItemsInputValueValidate(Sender: TField);
    procedure btnClearClick(Sender: TObject);
    procedure spbtnExecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure cdsItemsnOperatorChange(Sender: TField);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    function Check_Operator(input:string):boolean;
    function Check_Type(input:string):boolean;
    function Check_Fields_Values:boolean;
    function Check_Between_Phrase(nExpr:string;DataType:string):boolean;
  public
    { Public declarations }
    procedure InitForm(qryNo:integer);virtual;
    function Get_Extra_Sql:string;virtual;
    function Get_Self_Sql:String;virtual;//返回挑选的记录数值
    function Get_Combine_Sql:string;virtual;
  end;

var
  frmQuery_Param: TfrmQuery_Param;

implementation
uses Client_FUNc,PUBFunc,Dlg_between;
{$R *.dfm}

{ TfrmPick_Item_Single }

function TfrmQuery_Param.Get_Self_Sql: String;
var
  MainSql,SubSql,nType,nOperator,sDataType,FieldValue:string;
  date_left,date_right:variant;
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
          if trim(nOperator)='BETWEEN' then  //日期型的,需要使用convert 函数转换,否则会有误差
          begin
            if Div_Between_Phrase(FieldValue,'D',date_left,date_right)then
            begin
              subsql:= subsql+ nType + ' '+ '('+trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+'Convert(datetime,'+QuotedStr(formatdatetime('yyyy-mm-dd hh:nn:ss',date_left))+',0)'+' AND '+'Convert(datetime,'+QuotedStr(formatdatetime('yyyy-mm-dd hh:nn:ss',date_right))+',0)'+')'
//              subsql:= subsql+ nType + ' '+ '('+trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+FieldValue+')'
            end;
          end
          else
            subsql:= subsql+ nType + ' '+ '('+trim(cdsItems.FieldByName('FieldName').Asstring)+' '+nOperator+
                     QuotedStr(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDatetime(FieldValue)))+')';
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

procedure TfrmQuery_Param.InitForm(qryNo:integer);
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
//        cdsItems.FieldByName('InputValue').Value :=QuotedStr(FormatDatetime('yyyy-mm-dd hh:nn:ss',Get_Month_First_Day(date)))+' AND '+QuotedStr(FormatDatetime('yyyy-mm-dd hh:nn:ss',Date));
      end
      else if (Uppercase(trim(cdsItems.FieldByName('DataType').Asstring))='S') and (cdsItems.FieldByName('InputType').AsInteger = 0 )then
        cdsItems.FieldByName('nOperator').Value := 'LIKE';
      cdsItems.next;
    end;
    cdsItems.first;
  end;
end;

procedure TfrmQuery_Param.DBGrid1EditButtonClick(Sender: TObject);
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

procedure TfrmQuery_Param.cdsItemsAfterScroll(DataSet: TDataSet);
var
  sDataType:string;
begin
  DBGrid1.Columns[3].EditMask := '';
  sDataType := uppercase(trim(cdsItems.FieldByName('DataType').Asstring));
  if cdsItems.FieldByName('InputType').AsInteger = 1 then
    DBGrid1.Columns[3].ButtonStyle := cbsEllipsis
  else
    DBGrid1.Columns[3].ButtonStyle := cbsAuto;
//  if (sDataType = 'D' or sDataType = 'F') and cdsItems.FieldByName('Item')
  if cdsItems.FieldByName('InputType').AsInteger = 2 then
    Add_Column_Pick_List(DBGrid1.Columns[3],cdsItems.FieldByName('PickListValue'))
  else
  begin
    DBGrid1.Columns[3].PickList.clear;
    DBGrid1.Columns[3].KeyList.clear;
  end;
//  if sDataType = 'D' then
//   DBGrid1.Columns[3].EditMask := '!9999/99/00;1;_';
end;

function TfrmQuery_Param.Check_Operator(input: string): boolean;
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

function TfrmQuery_Param.Check_Type(input: string): boolean;
var
  tmpstr:string;
begin
  tmpStr:= uppercase(trim(input));
  result := ((tmpstr='AND') or (tmpstr='OR'));
end;

procedure TfrmQuery_Param.cdsItemsBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmQuery_Param.cdsItemsBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

function TfrmQuery_Param.Check_Fields_Values: boolean;
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

procedure TfrmQuery_Param.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
{  if Modalresult = mrok then
    CanClose:=Check_Fields_Values
  else
    Canclose:=true;}
end;

procedure TfrmQuery_Param.cdsItemsInputValueValidate(Sender: TField);
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

function TfrmQuery_Param.Check_Between_Phrase(nExpr,
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

procedure TfrmQuery_Param.btnClearClick(Sender: TObject);
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

procedure TfrmQuery_Param.spbtnExecClick(Sender: TObject);
{var
  ErrorMsg:Widestring;
  vData:OleVariant;
  sqlstr:string;}
begin
//  sqlstr := Get_Combine_Sql;
{  if coMyQuery.Get_Sql_Data(sqlstr,vData,ErrorMsg) then
    cdsQueryData.Data := vData
  else
  begin
    ShowMsg('返回查询数据失败，请检查',1);
    exit;
  end;}
end;

function TfrmQuery_Param.Get_Extra_Sql: string;
begin
//  result := '';
end;

function TfrmQuery_Param.Get_Combine_Sql: string;
var
  Sqlstr:string;
  MainSql,Extra_sql:string;
begin
  MainSql := cdsMaster.FieldByName('PreSqlstr').AsString;
  if cdsItems.State in dsEditModes then
    cdsItems.Post;
  if not Check_Fields_Values then abort;
  sqlstr:= Get_Self_Sql;
  Extra_sql:=Get_Extra_Sql;
  if (sqlstr='') and (Extra_sql = '') then
  begin
    ShowMsg('请输入查询条件',1);
    abort;
  end;
  result:= MainSql+sqlstr+ Extra_sql+ cdsMaster.FieldByName('sufSqlStr').AsString;
end;

procedure TfrmQuery_Param.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  frmQuery_Param := nil;
end;

procedure TfrmQuery_Param.RzBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmQuery_Param.cdsItemsnOperatorChange(Sender: TField);
var
  sDataType:string;
begin
//  if cdsItems.FieldByName('InputType').AsInteger = 1 then exit;
  sDataType := uppercase(trim(cdsItems.FieldByName('DataType').Asstring));
  if Uppercase(Sender.AsString)='BETWEEN' then
  begin
    if (sDataType = 'D') or (sDataType= 'F') then
       DBGrid1.Columns[3].ButtonStyle := cbsEllipsis
    else
    begin
      ShowMsg('只有数字型和日期型的可以用"范围之内"的条件查询',1);
      DBGrid1.Columns[3].ButtonStyle := cbsAuto;
      abort;
    end;  
  end;
end;

procedure TfrmQuery_Param.DBGrid1DblClick(Sender: TObject);
begin
  if DBGrid1.Columns[3].ButtonStyle = cbsEllipsis then
    DBGrid1EditButtonClick(sender);
end;

end.





