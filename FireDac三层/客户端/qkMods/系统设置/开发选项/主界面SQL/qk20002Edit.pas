unit qk20002Edit;

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
  Tfrmqk20002Edit = class(Tfrmqkbaseeditvgrid)
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
    btn1: TRzBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitEdit(AModID,AIDKey: Int64): Boolean;
  end;

var
  frmqk20002Edit: Tfrmqk20002Edit;

implementation

uses
  qkSvrIntf.ClientIntf,qkFunc.Commfunc, qk20002EditUIGrid, qk20002EditMainWhere;

{$R *.dfm}

{ Tfrmqk20002Edit }

procedure Tfrmqk20002Edit.btn1Click(Sender: TObject);
begin
  inherited;
  if frmqk20002EditMainWhere <> nil then
    FreeAndNil(frmqk20002EditMainWhere);
  frmqk20002EditMainWhere := Tfrmqk20002EditMainWhere.Create(Self);
  frmqk20002EditMainWhere.InitGrid(ModID,2000201);
  frmqk20002EditMainWhere.DataSet := mtMainSqlWhere;
  frmqk20002EditMainWhere.ShowModal;
end;

procedure Tfrmqk20002Edit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(mtMainSql);
  mtMainSql.Edit;
  mtMainSql.FieldByName('GridIDKey').AsLargeInt := mtMainSql.FieldByName('IDKey').AsLargeInt;
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

function Tfrmqk20002Edit.InitEdit(AModID,AIDKey: Int64): Boolean;
begin
  ModID := AModID;
  Result := False;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := AIDKey;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('15',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    Exit;
  if not qkTmp.CopyDsLstToMT([mtMainSql,mtMainSqlWhere,mtUIGrid,mtUIGridDetail]) then
    Exit;

  PostDsList.Add(mtMainSql);
  PostDsList.Add(mtMainSqlWhere);
  PostDsList.Add(mtUIGrid);
  PostDsList.Add(mtUIGridDetail);

  PostTableArr := 'UI_MainSql;UI_MainSqlWhere;UI_Grid_ColumMain;UI_Grid_ColumDetail';

  InitGrid(AModID);

  if frmqk20002EditUIGrid <> nil then
    FreeAndNil(frmqk20002EditUIGrid);
  frmqk20002EditUIGrid := Tfrmqk20002EditUIGrid.Create(Self);

  frmqk20002EditUIGrid.InitGrid(AModID,2000401);
  frmqk20002EditUIGrid.DataSet := mtUIGridDetail;
  frmqk20002EditUIGrid.pnlbase.Parent := pnl5;

end;

end.
