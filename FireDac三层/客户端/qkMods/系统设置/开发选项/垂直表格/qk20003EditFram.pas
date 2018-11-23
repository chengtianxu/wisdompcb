unit qk20003EditFram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkFunc.Commfunc,qkBaseEditFrm, RzButton,
  Vcl.ExtCtrls, RzPanel, qk20003Edit1, FireDAC.Comp.Client, FireDAC.Stan.Param,
  qk20003Edit2, Data.DB;

type
  Tfrmqk20003EditFram = class(Tfrmqkbaseedit)
    pnl1: TPanel;
    pnl2: TPanel;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEdit1: Tfrmqk20003edit1;
    FEdit2: Tfrmqk20003Edit2;
    Fds1: TFDMemTable;
    Fds2: TFDMemTable;
    FMainFrmDs: TFDMemTable;                       //Atype 0=new 1=edit
    procedure InitEditFram(AMainFrmDs: TFDMemTable;AType: Integer);
  end;

implementation

{$R *.dfm}

{ TForm1 }

procedure Tfrmqk20003EditFram.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetFK(Fds2,Fds1.FieldByName('IDKey').AsLargeInt);
  inherited;
end;

procedure Tfrmqk20003EditFram.InitEditFram(AMainFrmDs: TFDMemTable;AType: Integer);
const
  TBNAME1 = 'UI_EditGrid_Main';
  TBNAME2 = 'UI_EditGrid_Detail';
begin
  FMainFrmDs := AMainFrmDs;


  //-------Main
  FEdit1 := Tfrmqk20003edit1.Create(Self);
  FEdit1.InitGrid(20003);
  Fds1 := qkCommfunc.CreateDS(Self);
  Fds1.CloneCursor(FMainFrmDs);
  Fds1.MergeChangeLog;
  case AType of
    0: Fds1.Append;
    1: Fds1.Locate('IDKey',FMainFrmDs.FieldByName('IDKey').AsLargeInt,[]);
  end;
  FEdit1.DataSet := Fds1;
  fedit1.pnlBase1.Parent := pnl1;

  //-------Detail
  FEdit2 := Tfrmqk20003Edit2.Create(Self);
  FEdit2.InitGrid(ModID,2000301);
  Fds2 := qkCommfunc.CreateDS(Self);
  if not qkDataIntf.GetTableData(Fds2,TBNAME2,' ParentIDkey=' + Fds1.FieldByName('IDkey').AsLargeInt.ToString + ' order by seqno asc') then
    exit;
  FEdit2.DataSet := Fds2;
  FEdit2.pnlbase.Parent := pnl2;
  //-----

  PostDsList.Add(Fds1);
  PostDsList.Add(Fds2);
  PostTableArr := TBNAME1 + ';' + TBNAME2;
end;


end.
