unit Mod474ModSet_Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Data.DB, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Datasnap.DBClient,
  RzLabel, RzDBLbl, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TfrmMod474ModSet_Edit = class(TfrmBaseEdit)
    cds419: TClientDataSet;
    ds419: TDataSource;
    cdsModOperators: TClientDataSet;
    dsMOdOperators: TDataSource;
    cdsModAuthCards: TClientDataSet;
    pgc1: TPageControl;
    dsModAuthCards: TDataSource;
    pgc2: TPageControl;
    ts1: TTabSheet;
    pnl4: TPanel;
    dbtxtDESCRIPTION: TDBText;
    dbtxtDESCRIPTION1: TDBText;
    pnl5: TPanel;
    eh1: TDBGridEh;
    pnl3: TPanel;
    eh2: TDBGridEh;
    btnAddToModAuthCard: TButton;
    cdsAuthCardOperators: TClientDataSet;
    dsAuthCardOperators: TDataSource;
    ehAuthCardOperators: TDBGridEh;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    pm3: TPopupMenu;
    mniDeleModOperator: TMenuItem;
    mniDeleModCard: TMenuItem;
    N3: TMenuItem;
    mniAddNewOperator: TMenuItem;
    mniAddNewCard: TMenuItem;
    mniEditModOperator: TMenuItem;
    mniEditModCard: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure cdsModAuthCardsAfterScroll(DataSet: TDataSet);
    procedure btnAddToModAuthCardClick(Sender: TObject);
    procedure mniDeleModOperatorClick(Sender: TObject);
    procedure mniDeleModCardClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure mniAddNewOperatorClick(Sender: TObject);
    procedure mniAddNewCardClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
    procedure mniEditModOperatorClick(Sender: TObject);
    procedure mniEditModCardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(AModID: string);virtual;
    procedure Init;
  end;

var
  frmMod474ModSet_Edit: TfrmMod474ModSet_Edit;

implementation

uses
  uCommFunc;

{$R *.dfm}

{ TfrmMod474ModSet_Edit }

procedure TfrmMod474ModSet_Edit.btnAddToModAuthCardClick(Sender: TObject);
begin
  inherited;
  if cdsModOperators.State in [dsEdit,dsInsert] then cdsModOperators.Post;
  if cdsModAuthCards.State in [dsEdit,dsInsert] then cdsModAuthCards.Post;
  cdsModAuthCardsAfterScroll(cdsModAuthCards);
  if (not cdsModOperators.IsEmpty) and (not cdsModAuthCards.IsEmpty) and (not cdsAuthCardOperators.Locate('ModAuthCard_IDKey;ModOperator_IDKey',VarArrayOf([cdsModAuthCards.FieldByName('idkey').AsString,cdsModOperators.FieldByName('idkey').AsString]),[loCaseInsensitive])) then
  begin
    cdsAuthCardOperators.Append;
    cdsAuthCardOperators.FieldByName('idkey').AsString := gFunc.CreateIDKey;
    cdsAuthCardOperators.FieldByName('ModID').AsInteger := FModID;
    cdsAuthCardOperators.FieldByName('ModOperator_IDKey').AsString := cdsModOperators.FieldByName('idkey').AsString;
    cdsAuthCardOperators.FieldByName('ModAuthCard_IDKey').AsString := cdsModAuthCards.FieldByName('idkey').AsString;
    cdsAuthCardOperators.Post;
    ehAuthCardOperators.DataSource := nil;
    ehAuthCardOperators.DataSource := dsAuthCardOperators;
  end;
end;

procedure TfrmMod474ModSet_Edit.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmMod474ModSet_Edit.btnSaveClick(Sender: TObject);
var
  LPostData: OleVariant;
begin
  inherited;
  if cdsModOperators.State in [dsEdit,dsInsert] then cdsModOperators.Post;
  if cdsModAuthCards.State in [dsEdit,dsInsert] then cdsModAuthCards.Post;
  if cdsAuthCardOperators.State in [dsEdit,dsInsert] then cdsAuthCardOperators.Post;


  LPostData := VarArrayCreate([0,2],varVariant);
  if cdsModOperators.ChangeCount > 0 then
    LPostData[0] := cdsModOperators.Delta;
  if cdsModAuthCards.ChangeCount > 0 then
    LPostData[1] := cdsModAuthCards.Delta;
  if cdsAuthCardOperators.ChangeCount > 0 then
    LPostData[2] := cdsAuthCardOperators.Delta;
  if gSvrIntf.IntfPostModData('公共基础',474,LPostData,1) then
  begin
    cdsModOperators.MergeChangeLog;
    cdsModAuthCards.MergeChangeLog;
    cdsAuthCardOperators.MergeChangeLog;
    ShowMessage('保存成功');
    Close;
  end;
end;

procedure TfrmMod474ModSet_Edit.cdsModAuthCardsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cdsAuthCardOperators.Filter := 'ModAuthCard_IDKey = ' + QuotedStr(cdsModAuthCards.FieldByName('idkey').AsString);
  cdsAuthCardOperators.Filtered := True;
end;

procedure TfrmMod474ModSet_Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmMod474ModSet_Edit := nil;
end;

procedure TfrmMod474ModSet_Edit.GetData(AModID: string);
var
  LSql: string;
  LSqlModOperator: string;
  LSqlModAuthCards: string;
  LSqlModAuthCardsOperators: string;
begin
  FModID := StrToInt(AModID);
  LSql := 'Select * from data0419 where modid = ' + AModID;
  LSqlModOperator := 'SELECT * FROM Tier3_ModOperators Where ModID = ' + AModID + ' Order by OperatorID ASC';
  LSqlModAuthCards := 'SELECT * FROM Tier3_ModAuthCard Where ModID = ' + AModID;
  LSqlModAuthCardsOperators := 'SELECT * FROM Tier3_ModAuthCardOperators Where ModID = ' + AModID;
  gSvrIntf.IntfGetDataBySqlArr(
    VarArrayOf([LSql,LSqlModOperator,LSqlModAuthCards,LSqlModAuthCardsOperators]),
    [cds419,cdsModOperators,cdsModAuthCards,cdsAuthCardOperators]
    );

end;

procedure TfrmMod474ModSet_Edit.Init;
var
  LLKField: TField;
  I: Integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM Tier3_ModAuthCardOperators WHERE 1=0',cdsAuthCardOperators);
  //在数据集关闭的情况下新增加一个字段
  try
    cdsAuthCardOperators.Close;
    cdsAuthCardOperators.FieldDefs.BeginUpdate;
    for i := 0 to cdsAuthCardOperators.FieldDefList.Count - 1 do
    begin
      cdsAuthCardOperators.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    //Add New Field
   //增加新的字段
    LLKField := TStringField.Create(cdsAuthCardOperators);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'OperatorID';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsModOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'OperatorID';
    LLKField.DataSet := cdsAuthCardOperators;

    LLKField := TStringField.Create(cdsAuthCardOperators);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'OperatorName';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsModOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'OperatorName';
    LLKField.DataSet := cdsAuthCardOperators;

    LLKField := TStringField.Create(cdsAuthCardOperators);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'OperatorDesc';
    LLKField.KeyFields := 'ModOperator_IDKey';
    LLKField.LookupDataSet := cdsModOperators;
    LLKField.LookupKeyFields := 'idkey';
    LLKField.LookupResultField := 'OperatorDesc';
    LLKField.DataSet := cdsAuthCardOperators;
  finally
    cdsAuthCardOperators.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmMod474ModSet_Edit.mniAddNewCardClick(Sender: TObject);
var
  LArr: TArray<string>;
begin
  inherited;
  SetLength(LArr,2);
  if InputQuery('令牌',['令牌名','描述'],LArr) then
  begin
    if cdsModAuthCards.Locate('AuthCardName',LArr[0],[loCaseInsensitive]) then
    begin
      ShowMessage('已经存在令牌');
      Exit;
    end else
    begin
      cdsModAuthCards.Append;
      cdsModAuthCards.FieldByName('ModID').AsInteger := FModID;
      cdsModAuthCards.FieldByName('idkey').AsString := gFunc.CreateIDKey;
      cdsModAuthCards.FieldByName('AuthCardName').AsString := LArr[0];
      cdsModAuthCards.FieldByName('AuthCardDesc').AsString := LArr[1];
      cdsModAuthCards.FieldByName('Status').AsInteger := 1;
      cdsModAuthCards.Post;
    end;
  end;
end;

procedure TfrmMod474ModSet_Edit.mniAddNewOperatorClick(Sender: TObject);
var
  LArr: TArray<string>;
begin
  inherited;
  SetLength(LArr,3);
  if InputQuery('功能',['功能号','功能名','描述'],LArr) then
  begin
    if cdsModOperators.Locate('OperatorID',LArr[0],[loCaseInsensitive]) then
    begin
      ShowMessage('已经存在相同功能号');
      Exit;
    end else
    begin
      cdsModOperators.Append;
      cdsModOperators.FieldByName('ModID').AsInteger := FModID;
      cdsModOperators.FieldByName('idkey').AsString := gFunc.CreateIDKey;
      cdsModOperators.FieldByName('OperatorID').AsString := LArr[0];
      cdsModOperators.FieldByName('OperatorName').AsString := LArr[1];
      cdsModOperators.FieldByName('OperatorDesc').AsString := LArr[2];
      cdsModOperators.Post;
    end;
  end;
end;

procedure TfrmMod474ModSet_Edit.mniDeleModOperatorClick(Sender: TObject);
begin
  inherited;
  if not cdsModOperators.IsEmpty then
    cdsModOperators.Delete;
end;

procedure TfrmMod474ModSet_Edit.mniEditModCardClick(Sender: TObject);
var
  LArr: TArray<string>;
begin
  inherited;
  SetLength(LArr,2);
  LArr[0] := cdsModAuthCards.FieldByName('AuthCardName').AsString;
  LArr[1] := cdsModAuthCards.FieldByName('AuthCardDesc').AsString;
  if InputQuery('令牌',['令牌名','描述'],LArr) then
  begin
    cdsModAuthCards.Edit;
    cdsModAuthCards.FieldByName('AuthCardName').AsString := LArr[0];
    cdsModAuthCards.FieldByName('AuthCardDesc').AsString := LArr[1];
    cdsModAuthCards.Post;
  end;
end;

procedure TfrmMod474ModSet_Edit.mniEditModOperatorClick(Sender: TObject);
var
  LArr: TArray<string>;
begin
  inherited;
  SetLength(LArr,2);
  LArr[0] := cdsModOperators.FieldByName('OperatorName').AsString;
  LArr[1] := cdsModOperators.FieldByName('OperatorDesc').AsString;
  if InputQuery('功能',['功能名','描述'],LArr) then
  begin
    cdsModOperators.Edit;
    cdsModOperators.FieldByName('OperatorName').AsString := LArr[0];
    cdsModOperators.FieldByName('OperatorDesc').AsString := LArr[1];
    cdsModOperators.Post;
  end;
end;

procedure TfrmMod474ModSet_Edit.mniDeleModCardClick(Sender: TObject);
begin
  inherited;
  if not cdsModAuthCards.IsEmpty then
    cdsModAuthCards.Delete;
end;

procedure TfrmMod474ModSet_Edit.N3Click(Sender: TObject);
begin
  inherited;
  if not cdsAuthCardOperators.IsEmpty then
    cdsAuthCardOperators.Delete;
end;

procedure TfrmMod474ModSet_Edit.pm1Popup(Sender: TObject);
begin
  inherited;
  mniEditModOperator.Enabled := not cdsModOperators.IsEmpty;
  mniDeleModOperator.Enabled := not cdsModOperators.IsEmpty;
end;

procedure TfrmMod474ModSet_Edit.pm2Popup(Sender: TObject);
begin
  inherited;
  mniEditModCard.Enabled := not cdsModAuthCards.IsEmpty;
  mniDeleModCard.Enabled := not cdsModAuthCards.IsEmpty;
end;

end.
