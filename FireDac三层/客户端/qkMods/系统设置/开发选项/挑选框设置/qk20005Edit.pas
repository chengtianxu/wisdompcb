unit qk20005Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
  Vcl.ExtCtrls, RzButton, Vcl.StdCtrls, Vcl.DBCtrls, RzEdit, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh;

type
  Tfrmqk20005Edit = class(Tfrmqkbaseeditvgrid)
    mtMainSql: TFDMemTable;
    mtMainSqlWhere: TFDMemTable;
    mtUIGrid: TFDMemTable;
    mtUIGridDetail: TFDMemTable;
    pnl1: TPanel;
    grp1: TGroupBox;
    dbmmoSqlTxt: TDBMemo;
    grp2: TGroupBox;
    pnl3: TPanel;
    pnl5: TPanel;
    dsUIGridDetail: TDataSource;
    mtPickID: TFDMemTable;
    dsMainSql: TDataSource;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitEdit(AModID,AIDKey: Int64): Boolean;
  end;

var
  frmqk20005Edit: Tfrmqk20005Edit;

implementation

uses
  qkSvrIntf.ClientIntf,qkFunc.Commfunc, qk20005EditUIGrid;

{$R *.dfm}

{ Tfrmqk20005Edit }

procedure Tfrmqk20005Edit.btnSaveClick(Sender: TObject);
begin
  mtPickID.Edit;
  mtPickID.FieldByName('MainSqlIDKey').AsLargeInt := mtPickID.FieldByName('IDKey').AsLargeInt;
  mtPickID.Post;

  qkCommfunc.SetCurrIDKey(mtMainSql);
  mtMainSql.Edit;
  mtMainSql.FieldByName('IDKey').AsLargeInt := mtPickID.FieldByName('IDKey').AsLargeInt;
  mtMainSql.FieldByName('GridIDKey').AsLargeInt := mtMainSql.FieldByName('IDKey').AsLargeInt;
  mtMainSql.FieldByName('UseFor').AsInteger := 1;//ÃÙ—°
  mtMainSql.FieldByName('Note').AsString := mtPickID.FieldByName('Note').AsString;
  mtMainSql.Post;

  qkCommfunc.SetFK(mtMainSqlWhere,mtMainSql.FieldByName('IDKey').AsLargeInt,'ParentIDkey');

  mtUIGrid.Edit;
  mtUIGrid.FieldByName('IDKey').AsLargeInt := mtMainSql.FieldByName('IDKey').AsLargeInt;
  mtUIGrid.FieldByName('UseFor').AsInteger := mtMainSql.FieldByName('UseFor').AsInteger;
  mtUIGrid.FieldByName('Note').AsString := mtMainSql.FieldByName('Note').AsString;
  mtUIGrid.Post;

  qkCommfunc.SetFK(mtUIGridDetail,mtUIGrid.FieldByName('IDKey').AsLargeInt,'ParentIDKey');


  inherited;

end;

function Tfrmqk20005Edit.InitEdit(AModID,AIDKey: Int64): Boolean;
begin
  ModID := AModID;
  Result := False;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := AIDKey;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('17',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    Exit;
  if not qkTmp.CopyDsLstToMT([mtPickID,mtMainSql,mtMainSqlWhere,mtUIGrid,mtUIGridDetail]) then
    Exit;

  PostDsList.Add(mtPickID);
  PostDsList.Add(mtMainSql);
  PostDsList.Add(mtMainSqlWhere);
  PostDsList.Add(mtUIGrid);
  PostDsList.Add(mtUIGridDetail);

  PostTableArr := 'UI_PickID;UI_MainSql;UI_MainSqlWhere;UI_Grid_ColumMain;UI_Grid_ColumDetail';

  InitGrid(AModID);

  if frmqk20005EditUIGrid <> nil then
    FreeAndNil(frmqk20005EditUIGrid);
  frmqk20005EditUIGrid := Tfrmqk20005EditUIGrid.Create(Self);

  frmqk20005EditUIGrid.InitGrid(AModID,2000401);
  frmqk20005EditUIGrid.DataSet := mtUIGridDetail;
  frmqk20005EditUIGrid.pnlbase.Parent := pnl5;

end;

end.
