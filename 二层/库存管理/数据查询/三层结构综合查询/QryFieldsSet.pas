unit QryFieldsSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClassMstrlDtl, ImgList, DB, DBClient, ComCtrls, ToolWin,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DBGridEh, Menus,
  Buttons, RzEdit, RzDBEdit, RzBtnEdt;

type
  TfrmQryFieldsSet = class(TfrmClassMstrlDtl)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label6: TLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    edtKey: TRzButtonEdit;
    DBMemo1: TRzDBMemo;
    RzDBMemo2: TRzDBMemo;
    procedure cdsDetailBeforeInsert(DataSet: TDataSet);
    procedure cdsDetailNewRecord(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure cdsDetailBeforePost(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure spbtnExClick(Sender: TObject);
    procedure cdsMasterAfterScroll(DataSet: TDataSet);
    procedure cdsMasterAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    SeqNo:integer;
    function Check_Before_Post:boolean;
//    procedure OpenData(pModId:integer;pBillNO:string);override;
  public
    { Public declarations }
  end;

var
  frmQryFieldsSet: TfrmQryFieldsSet;
       
implementation
uses client_Func,PUBFunc,ConstDeclare;
{$R *.dfm}

procedure TfrmQryFieldsSet.cdsDetailBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  cdsMaster.Edit;
  SeqNO := Get_Max_SeqNo(DataSet,Dtl_KeyField);
end;

procedure TfrmQryFieldsSet.cdsDetailNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('QryNo').Value := cdsMaster.fieldByName('qryNo').Value; 
  DataSet.FieldByName('SeqNo').Value := SeqNo+1;
  DataSet.FieldByName('InputType').Value := 0;
end;

function TfrmQryFieldsSet.Check_Before_Post: boolean;
begin
  if cdsDetail.isempty then
  begin
    ShowMsg('明细表的内容不能为空，请输入数值',1);
    result := false;
  end
  else
  if cdsMaster.FieldByName('qryNo').AsString = '' then
  begin
    ShowMsg('模块编号不允许为空，请输入数值',1);
    result := false;
  end
//  else if cdsMaster.FieldByName('PreSqlstr').AsString = '' then
  else if DBMemo1.Text = '' then
  begin
    ShowMsg('前SQL语句不能为空，请输入',1);
    result := false;
  end
  else
    result := true;
end;

procedure TfrmQryFieldsSet.btnSaveClick(Sender: TObject);
begin
  if not Check_Before_Post then exit;
  inherited;
end;

procedure TfrmQryFieldsSet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmQryFieldsSet := nil;
end;

procedure TfrmQryFieldsSet.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    if trim(edtKey.Text)<>'' then
    begin
      OpenData(ModId,trim(edtKey.Text),1);
    end;
  end;
end;



procedure TfrmQryFieldsSet.cdsDetailBeforePost(DataSet: TDataSet);
var
  i:integer;
begin
  inherited;
  for i := 0 to DBGridEh1.Columns.Count-1 do
  begin
    if trim(dataSet.fieldbyname(DBGridEh1.Columns[i].FieldName).AsString) = '' then
    begin
      if uppercase(DBGridEh1.Columns[i].FieldName) = 'PICKITEMID' then
      begin
        if dataSet.fieldbyname('InputType').asinteger = 1 then  //对话框选择
        begin
          if Uppercase(dataSet.fieldbyname('DataType').asstring)<>'D' then
          begin
            ShowMsg(DBGridEh1.Columns[i].Title.Caption+'不能为空',1);
            abort;
          end;
        end;
      end
      else if uppercase(DBGridEh1.Columns[i].FieldName) = 'PICKLISTVALUE' then
      begin
        if dataSet.fieldbyname('InputType').asinteger = 2 then  //下拉选择
        begin
          ShowMsg(DBGridEh1.Columns[i].Title.Caption+'不能为空',1);
          abort;
        end;
      end;
    end
  end;
end;

procedure TfrmQryFieldsSet.N1Click(Sender: TObject);
begin
  inherited;
  cdsDetail.append;
end;

procedure TfrmQryFieldsSet.N2Click(Sender: TObject);
begin
  inherited;
  cdsDetail.Delete;
end;

procedure TfrmQryFieldsSet.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  N1.Enabled := cdsDetail.Active;
  N2.Enabled := not cdsDetail.IsEmpty;
end;

procedure TfrmQryFieldsSet.spbtnExClick(Sender: TObject);
var
  sTmp:string;
  chKey:Char;
begin
  chKey:=#13;
  inherited;
  sTmp:=Get_Pick_Value(v_Pick_Qry_No,trim(edtKey.text),2);
  if sTmp<>'' then
  begin
    edtKey.text := sTmp;
    edtKeyKeyPress(sender,chKey);
  end;
end;

procedure TfrmQryFieldsSet.cdsMasterAfterScroll(DataSet: TDataSet);
begin
  if DataSet.Fields[0].AsString=''then
    OpenData(modId,'0',2)
  else
    OpenData(modId,DataSet.FieldByName(Mstrl_KeyField).AsString,2);
end;

procedure TfrmQryFieldsSet.cdsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty then
    OpenData(modId,'0',2);
end;

end.
