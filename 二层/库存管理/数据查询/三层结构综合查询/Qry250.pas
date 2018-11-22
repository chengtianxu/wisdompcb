{******************************************************************************}
{                                                                              }
{Written by: Jacky Zhong                                                       }
{Date: MAR. 15. 2007                                                           }
{Comments:订单价格分析                                                         }
{1.提供订单价格分析的条件设置功能,并返回查询结果                               }
{2.对返回数据进行压缩和解压处理,可减少网络流量                                 }
{                                                                              }
{******************************************************************************}
unit Qry250;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryStandard, DB, DBClient, Grids, DBGrids, Buttons, ExtCtrls,
  DBGridEh, RzTabs, StdCtrls, RzPanel, RzSplit, ComCtrls, ToolWin, ImgList,
  Menus, RzButton, RzDTP, Mask, RzEdit;

type
  TfrmQry250 = class(TfrmQueryStandard)
    procedure btnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQryClick(Sender: TObject);
    procedure spbtnExecClick(Sender: TObject);
    procedure cdsQueryDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQry250: TfrmQry250;

implementation
uses Client_Func,PUbFunc;
{$R *.dfm}

procedure TfrmQry250.btnExportClick(Sender: TObject);
begin
  inherited;
  Export_dbGridEH_to_Excel(dbgrid3,'订单价格分析');
end;

procedure TfrmQry250.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmQry250 := nil;
end;

procedure TfrmQry250.btnQryClick(Sender: TObject);
var
  Sqlstr:Widestring;
begin
  inherited;
  if not Check_Fields_Values then exit;
  sqlstr:= Get_Rslt;

end;

procedure TfrmQry250.spbtnExecClick(Sender: TObject);
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
  StatusBar1.Panels[8].Text := '共耗时: '+FloatToStr(D)+'秒';
//  ShowMsg('共耗时: '+FloatToStr(D)+'秒',1);
end;

procedure TfrmQry250.cdsQueryDataAfterOpen(DataSet: TDataSet);
var
  tmp_Qty,tmp_Value,tmp_Rate:double;
begin
  tmp_value:=0;
  tmp_rate:=0;
  tmp_Qty:=0;
  try
    DataSet.DisableControls;
    DataSet.First;
    while not DataSet.Eof do begin
      tmp_value:=tmp_value+DataSet.FieldByName('ShippedAmt').asfloat;
      tmp_Qty := tmp_Qty + DataSet.FieldByName('TotalArea').AsFloat;
      tmp_rate:=tmp_rate+DataSet.FieldByName('MARKUP_RATE').asfloat*DataSet.FieldByName('ShippedAmt').asfloat;
      DataSet.Next;
    end;
    StatusBar1.Panels[5].Text := FloatToStr(round(tmp_Qty*100)/100);
    StatusBar1.Panels[7].Text := FormatFloat('###,###,###,##0.##',round(tmp_Value*100)/100);//FloatToStr(round(tmp_Value*100)/100);
    if tmp_value > 0 then
      StatusBar1.Panels[3].Text := FloatToStr(round(tmp_Rate/tmp_value*100)/100)+'%'
    else
      StatusBar1.Panels[3].Text := '0.00%';
  finally
    DataSet.First;
    Dataset.EnableControls;
  end;
  inherited;
end;

end.
