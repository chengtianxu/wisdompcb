unit InOutStockFrm_Mod525;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  DBCtrlsEh, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmInOutStock_Mod525 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    eh1: TDBGridEh;
    cdsDispaly: TClientDataSet;
    dsDispaly: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnPost: TButton;
    edtPlace: TEdit;
    mmoBaknote: TMemo;
    lbl5: TLabel;
    lblSuccNum: TLabel;
    lbl6: TLabel;
    lblAllNum: TLabel;
    cbx1: TComboBox;
    cdsPostMain: TClientDataSet;
    cdsPostDetail: TClientDataSet;
    mmoError: TMemo;
    lbl7: TLabel;
    procedure btnPostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FType: Integer; //0 = 入库 1=出库
    FTagDB: string;
  end;

var
  frmInOutStock_Mod525: TfrmInOutStock_Mod525;

implementation

uses
  uCommFunc;

{$R *.dfm}

procedure TfrmInOutStock_Mod525.btnPostClick(Sender: TObject);
var
  LSql: string;
  LNowDatetime: TDateTime;
  I: Integer;
  LData: OleVariant;
begin
  inherited;
  LNowDatetime := gFunc.GetSvrDateTime();
  lsql := 'select * from Pack_StockTag where TagDB = ' + QuotedStr(FTagDB) + ' AND TagID in (';
  cdsDispaly.DisableControls;
  try
    cdsDispaly.First;
    while not cdsDispaly.Eof do
    begin
      LSql := LSql + cdsDispaly.FieldByName('标签ID').AsString + ',';
      cdsDispaly.Next;
    end;
    LSql := LSql + '0)';

    if gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([lsql,'select * from Pack_StockTagDetail where 1=0']),[cdsPostMain,cdsPostDetail]) then
    begin
      cdsPostMain.DisableControls;
      cdsDispaly.First;
      while not cdsDispaly.Eof do
      begin
        if cdsPostMain.Locate('TagID',cdsDispaly.FieldByName('标签ID').AsInteger,[loCaseInsensitive]) then
        begin
          cdsPostMain.Edit;
          cdsPostMain.FieldByName('status').AsInteger := FType;
          if FType = 0 then
          begin
            cdsPostMain.FieldByName('D05_Ptr_In').AsString := gVar.rkey05;
            cdsPostMain.FieldByName('indatetime').AsDateTime := LNowDatetime;
          end else
          begin
            cdsPostMain.FieldByName('D05_Ptr_Out').AsString := gVar.rkey05;
            cdsPostMain.FieldByName('Outdatetime').AsDateTime := LNowDatetime;
          end;
          cdsPostMain.FieldByName('place').AsString := edtPlace.Text;
          cdsPostMain.FieldByName('baknote').AsString := mmoBaknote.Text;
          cdsPostMain.Post;
          cdsDispaly.Delete;
          Continue;
        end else
        begin
          if FType = 0 then
          begin
            cdsPostMain.Append;
            cdsPostMain.FieldByName('IDKey').AsString := gFunc.CreateIDKey;
            cdsPostMain.FieldByName('TagDB').AsString := FTagDB;
            cdsPostMain.FieldByName('TagID').AsInteger := cdsDispaly.FieldByName('标签ID').AsInteger;
            cdsPostMain.FieldByName('D05_Ptr_In').AsString := gVar.rkey05;
            cdsPostMain.FieldByName('indatetime').AsDateTime := LNowDatetime;
            cdsPostMain.FieldByName('status').AsInteger := 0;
            cdsPostMain.FieldByName('place').AsString := edtPlace.Text;
            cdsPostMain.FieldByName('LockStatus').AsInteger := 0;
            cdsPostMain.FieldByName('baknote').AsString := mmoBaknote.Text;
            cdsPostMain.Post;

            for I := 0 to cdsDispaly.Fields.Count - 1 do
            begin
              if cdsDispaly.Fields[I].AsString.Trim <> '' then
              begin
              cdsPostDetail.Append;
              cdsPostDetail.FieldByName('MainIDKey').AsString := cdsPostMain.FieldByName('IDKey').AsString;
              cdsPostDetail.FieldByName('SeqNo').AsInteger := I;
              cdsPostDetail.FieldByName('ParamName').AsString := cdsDispaly.Fields[I].FieldName;
              cdsPostDetail.FieldByName('ParamValue').AsString := cdsDispaly.Fields[I].FieldName;
              cdsPostDetail.Post;
              end;
            end;
            cdsDispaly.Delete;
            Continue;
          end else
          begin
            mmoError.Lines.Add(cdsDispaly.FieldByName('标签ID').AsString + ' 出库失败 不存在该记录');
          end;
        end;
        cdsDispaly.Next;
      end;

      LData := VarArrayCreate([0,1],varVariant);
      if cdsPostMain.State in [dsEdit,dsInsert] then cdsPostMain.Post;
      if cdsPostDetail.State in [dsEdit,dsInsert] then cdsPostDetail.Post;

      if cdsPostMain.ChangeCount > 0 then
        LData[0] := cdsPostMain.Delta;
      if cdsPostDetail.ChangeCount > 0 then
        LData[1] := cdsPostDetail.Delta;

      if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Pack_StockTag','Pack_StockTagDetail']),LData) then
      begin
        ShowMessage('保存成功');
        cdsDispaly.MergeChangeLog;
      end else
      begin
        ShowMessage('保存失败');
        cdsDispaly.CancelUpdates;
      end;
    end else
      exit;

  finally
    cdsDispaly.EnableControls;
  end;
end;

end.
