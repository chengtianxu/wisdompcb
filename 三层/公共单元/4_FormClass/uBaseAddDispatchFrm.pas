unit uBaseAddDispatchFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzBtnEdt, Data.DB, Datasnap.DBClient, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls;

type
  TfrmAddNewDispathOperator = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    cdsAuthCardOperator: TClientDataSet;
    dsAuthCardOperator: TDataSource;
    cdsAddUserOperator: TClientDataSet;
    lbl1: TLabel;
    grp1: TGroupBox;
    pnl6: TPanel;
    eh1: TDBGridEh;
    cdsAuthCardOperatorMasterCardIDKey: TStringField;
    cdsAuthCardOperatorOperatorIDKey: TStringField;
    cdsAuthCardOperatorOperatorID: TIntegerField;
    cdsAuthCardOperatorOperatorName: TStringField;
    cdsAuthCardOperatorOperatorDesc: TStringField;
    cdsAuthCardOperatorChecked: TBooleanField;
    dsAddUserOperator: TDataSource;
    dtpEnd: TDateTimePicker;
    lbl3: TLabel;
    dtpBegin: TDateTimePicker;
    lbl2: TLabel;
    edt1: TRzButtonEdit;
    procedure edt1ButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(AModID: string);
  end;

implementation

uses
  uCommFunc, uBaseSinglePickListFrm;

{$R *.dfm}

{ TfrmAddNewDispathOperator }

procedure TfrmAddNewDispathOperator.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAddNewDispathOperator.btnSaveClick(Sender: TObject);
var
  LNowTime: TDateTime;
begin
  inherited;
  if edt1.Tag = 0 then
  begin
    ShowMessage('请选择授权用户');
    Exit;
  end;
  LNowTime := gFunc.GetSvrDateTime;

  cdsAuthCardOperator.DisableControls;
  try
    cdsAuthCardOperator.First;
    while not cdsAuthCardOperator.Eof do
    begin
      if cdsAuthCardOperator.FieldByName('checked').AsBoolean then
      begin
        if not cdsAddUserOperator.Locate('MasterUserCard_IDKey;ModOperator_IDKey',
          VarArrayOf([cdsAuthCardOperator.FieldByName('MasterCardIDKey').AsString,cdsAuthCardOperator.FieldByName('OperatorIDKey').AsString]),
          [loCaseInsensitive])
        then
        begin
          cdsAddUserOperator.Append;
          cdsAddUserOperator.FieldByName('idkey').AsString := gFunc.CreateIDKey;
          cdsAddUserOperator.FieldByName('D73_Ptr').AsInteger := edt1.Tag;
          cdsAddUserOperator.FieldByName('MasterUserCard_IDKey').AsString := cdsAuthCardOperator.FieldByName('MasterCardIDKey').AsString;
          cdsAddUserOperator.FieldByName('ModOperator_IDKey').AsString := cdsAuthCardOperator.FieldByName('OperatorIDKey').AsString;
          cdsAddUserOperator.FieldByName('BeginTime').AsDateTime := dtpBegin.DateTime;
          cdsAddUserOperator.FieldByName('EndTime').AsDateTime := dtpEnd.DateTime;
          cdsAddUserOperator.FieldByName('CreateTime').AsDateTime := LNowTime;
          cdsAddUserOperator.FieldByName('ModID').AsInteger := FModID;
          cdsAddUserOperator.Post;
        end;
      end;
      cdsAuthCardOperator.Next;
    end;

    if cdsAddUserOperator.ChangeCount > 0 then
    begin
      if gSvrIntf.IntfPostDataByTable('Tier3_UserAddsModOperator',cdsAddUserOperator.Delta) then
      begin
        ShowMessage('操作成功');
      end;
    end else
      ShowMessage('操作成功');
    ModalResult := mrOk;
  finally
    cdsAuthCardOperator.EnableControls;
  end;
end;

procedure TfrmAddNewDispathOperator.edt1ButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
  LSql: string;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(474,2);
    if LFrm.ShowModal = mrOk then
    begin
      edt1.Text := LFrm.cdsPick.FieldByName('USER_FULL_NAME').AsString;
      edt1.Tag := LFrm.cdsPick.FieldByName('rkey').AsInteger;

      LSql := 'select * from Tier3_UserAddsModOperator ' +
              ' WHERE D73_Ptr = ' + LFrm.cdsPick.FieldByName('rkey').AsString +
              ' AND ModID = ' + IntToStr(FModID);
      gSvrIntf.IntfGetDataBySql(LSql,cdsAddUserOperator);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmAddNewDispathOperator.FormCreate(Sender: TObject);
begin
  inherited;
  dtpBegin.DateTime := gFunc.GetSvrDateTime;
end;

procedure TfrmAddNewDispathOperator.GetData(AModID: string);
var
  LSql: string;
begin
  LSql := cdsAuthCardOperator.CommandText +
          ' WHERE Tier3_ModAuthCardOperators.ModID = ' + AModID +
          ' AND D73_Ptr = ' + gVar.rkey73;
  gSvrIntf.IntfGetDataBySql(LSql,cdsAuthCardOperator);
end;

end.
