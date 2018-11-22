unit QryColumnSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, RzButton, DB, DBClient;

type
  TfrmQryColumnSet = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    btnClear: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    cdsColumnSet: TClientDataSet;
    dsMaster: TDataSource;
    procedure cdsColumnSetBeforeDelete(DataSet: TDataSet);
    procedure btnClearClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure cdsColumnSetBeforeInsert(DataSet: TDataSet);
    procedure cdsColumnSetNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    SeqNo,pQryNo:integer;
  public
    { Public declarations }
    procedure InitForm(QryNo:Integer);
  end;

var
  frmQryColumnSet: TfrmQryColumnSet;

implementation
uses Client_Func,PubFunc;
{$R *.dfm}

procedure TfrmQryColumnSet.cdsColumnSetBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmQryColumnSet.InitForm(QryNo: Integer);
var
  vData:OleVariant;
  ErrorMsg:wideString;
begin
  pQryNo:=QryNo;
  if not coMyQuery.Get_Sql_Data('select * from qry_Column_List where qryNo='+IntToStr(QryNo),vData,ErrorMsg) then
  begin
    ShowMsg('获取服务器数据失败:！'+ErrorMsg,1);
    abort;
  end
  else
    cdsColumnSet.Data:= vData;
end;

procedure TfrmQryColumnSet.btnClearClick(Sender: TObject);
var
  ErrorMsg:Widestring;
  vData:OleVariant;
  pBillNo:widestring;
begin
  pBillNo:= IntToStr(pQryNo);
  if cdsColumnSet.State in dsEditModes then
    cdsColumnSet.Post;
  if cdsColumnSet.ChangeCount > 0 then
  begin
    vData:= cdsColumnSet.Delta;
    if not coMyQuery.Update_One_Table(pQryNo,vData,ErrorMsg,pBillNo) then
      ShowMsg(ErrorMsg,1);
  end;
end;

procedure TfrmQryColumnSet.RzBitBtn1Click(Sender: TObject);
begin
  cdsColumnSet.CancelUpdates;
end;

procedure TfrmQryColumnSet.cdsColumnSetBeforeInsert(DataSet: TDataSet);
begin
  SeqNO := Get_Max_SeqNo(DataSet,'SeqNo');
end;

procedure TfrmQryColumnSet.cdsColumnSetNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('QryNo').Value := pQryNo; 
  DataSet.FieldByName('SeqNo').Value := SeqNo+1;
end;

end.
