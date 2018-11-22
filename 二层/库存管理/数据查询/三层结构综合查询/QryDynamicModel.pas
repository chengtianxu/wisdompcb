{******************************************************************************}
{                                                                              }
{Code Maker: Jacky Zhong                                                       }
{Date: MAR. 27. 2007                                                           }
{Comments:动态查询父类,继承于"通用查询父类"                                    }
{ 继承关系: TfrmQueryStandard--> TfrmQryDynamicModel                           }
{1.提供查询条件设置功能,SQL验证,并返回查询结果数据集                           }
{2.封装了查询条件设置,记录查找,过滤,打印,等功能                                }
{3.入口参数:模块编号,查询数据集                                                }
{从数据表qry_Column_List载入模块的栏位信息,                                    }
{4.可定义查询结果集DBGrid要显示的字段,并保存该设置                             }
{5.可定义查询结果集DBGrid中某个字段是否要统计,统计方式(平均,汇总)              }
{6.数据传输经过压缩和解压,可减少网络流量                                       }
{******************************************************************************}
unit QryDynamicModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryStandard, Menus, ImgList, DB, DBClient, ComCtrls, Grids,
  DBGridEh, RzTabs, RzButton, ExtCtrls, ToolWin, StdCtrls, Mask, RzEdit,
  RzDTP;

type
  TfrmQryDynamicModel = class(TfrmQueryStandard)
    cdsColumnList: TClientDataSet;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N8Click(Sender: TObject);
    procedure spbtnExecClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid3ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGrid3ColWidthsChanged(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  private
    { Private declarations }
    Colum_Changed:boolean;
  public
    { Public declarations }
    procedure InitForm(qryNo:integer;ItemData,pvData:OLEVAriant);overload;//vpData[0]:已定义好的查询条件;vpData[1],查询数据结果,sqlstr:查询条件
  end;

var
  frmQryDynamicModel: TfrmQryDynamicModel;

implementation

uses Client_FUnc,PUBFunc,QryColumnSet;
{$R *.dfm}

{ TfrmQryDynamicModel }

procedure TfrmQryDynamicModel.InitForm(qryNo: integer; ItemData,pvData: OLEVAriant);
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
    if VarIsEmpty(ItemData) then
    begin
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
        end;
        cdsItems.next;
      end;
      cdsItems.first;
    end
    else
      cdsItems.Data := ItemData;
//    if VarIsEmpty(vpData)
    cdsQueryData.data := pvData;
    cdsColumnList.Data := vData[2];
    Add_Columns_ToDBGrid(dbgrid3,cdsColumnList);
  end;
  dtpStartDate.Date := date;
  dtpEndDate.Date := date;
  if DBGRid3.Columns.Count > 0 then
    DBGrid3CellClick(DBGRid3.Columns[0]);
  Colum_Changed:=false;
  Show;
end;

procedure TfrmQryDynamicModel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmQryDynamicModel := nil;
end;

procedure TfrmQryDynamicModel.N8Click(Sender: TObject);
var
  vData:OleVariant;
  ErrorMsg:wideString;
begin
  inherited;
//  if ((strToInt(vprev)=2) or (strToInt(vprev)=4)) then
  begin
    with TfrmQryColumnSet.Create(Application) do
    try
      InitForm(cdsMaster.FieldByName('QryNo').Value);
      if Showmodal = mrok then
      begin
        if not coMyQuery.Get_Sql_Data('select * from qry_Column_List where qryNo='+cdsMaster.FieldByName('QryNo').Asstring,vData,ErrorMsg) then
        begin
          ShowMsg('获取服务器数据失败:！'+ErrorMsg,1);
          abort;
        end
        else
        begin
          cdsColumnList.Data := vData;
          Reset_Grid_Columns(dbgrid3,cdsColumnList);//Add_Columns_ToDBGrid(dbgrid3,cdsColumnList);
        end;
      end;
    finally
      free;
    end;
  end
//  else
//    ShowMsg('对不起,您没有设置栏位显示的权限!',1);
end;

procedure TfrmQryDynamicModel.spbtnExecClick(Sender: TObject);
var
  Sqlstr,ErrorMsg:Widestring;
  vData:OleVariant;
  MainSql:string;
  i : integer;
  D : Double;
begin
  i := GetTickCount;
  ReSet_Sort(DBGRid3);
  MainSql := cdsMaster.FieldByName('PreSqlstr').AsString;
  cdsQueryData.Filtered:= false;
  if cdsItems.State in dsEditModes then
    cdsItems.Post;
  if not Check_Fields_Values then exit;
  sqlstr:= Get_Rslt;
  Sqlstr:= MainSql+sqlstr+ cdsMaster.FieldByName('sufSqlStr').AsString;
  cdsQueryData.IndexName := '';
//  if coMyQuery.Get_Sql_Data(sqlstr,vData,ErrorMsg) then
  if coMyQuery.Get_Sql_Data_With_Compressed(sqlstr,vData,ErrorMsg) then
  begin
    if DeCompress_Data(vData) then
      cdsQueryData.Data := vData
    else
      ShowMsg('数据解压缩失败，请检查',1);
  end
  else
  begin
    ShowMsg('返回查询数据失败，请检查',1);
    exit;
  end;
  D := (GetTickCount - i)/1000;
  StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
end;

procedure TfrmQryDynamicModel.N9Click(Sender: TObject);
var
  vData:OleVariant;
  ErrorMsg:wideString;
begin
  inherited;
  if ((strToInt(vprev)=2) or (strToInt(vprev)=4)) then
  begin
    if Save_Grid_Columns_Change(cdsMaster.FieldByName('QryNo').Value,dbgrid3,cdsColumnList) then
      Colum_Changed:= false; //column_change saved and finished
  end
  else
    ShowMsg('对不起,您没有设置栏位显示的权限!',1);
  inherited;
end;

procedure TfrmQryDynamicModel.DBGrid3ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  inherited;
{  if ((strToInt(vprev)=2) or (strToInt(vprev)=4)) then
    Colum_Changed:=true
  else
    abort;}
end;

procedure TfrmQryDynamicModel.DBGrid3ColWidthsChanged(Sender: TObject);
begin
  inherited;
{  if ((strToInt(vprev)=2) or (strToInt(vprev)=4)) then
    Colum_Changed:=true
  else
    abort;}
end;

procedure TfrmQryDynamicModel.PopupMenu2Popup(Sender: TObject);
begin
  inherited;
  N9.Enabled := Colum_Changed;
end;

end.
