unit qk20004EditFram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkSvrIntf.ClientIntf,qkBaseEditFrm,
  RzButton, Vcl.ExtCtrls, RzPanel, qk20004Edit1,qk20004Edit2, FireDAC.Comp.Client,FireDAC.Stan.Param,
  qkFunc.Commfunc;

type
  Tfrmqk20004editfram = class(Tfrmqkbaseedit)
    pnl1: TPanel;
    pnl2: TPanel;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ffrm1: Tfrmqk20004Edit1;
    Ffrm2: Tfrmqk20004edit2;
    Fds1,Fds2: TFDMemTable;
    FMainFrmDs: TFDMemTable;                       //Atype 0=new 1=edit
    procedure InitEditFram(AMainFrmDs: TFDMemTable;AType: Integer);
  end;


implementation

{$R *.dfm}

{ Tfrmqk20004editfram }

procedure Tfrmqk20004editfram.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetFK(Fds2,Fds1.FieldByName('IDKey').AsLargeInt);
  inherited;
end;

procedure Tfrmqk20004editfram.InitEditFram(AMainFrmDs: TFDMemTable;
  AType: Integer);
const
  TBNAME1 = 'UI_Grid_ColumMain';
  TBNAME2 = 'UI_Grid_ColumDetail';
begin
  FMainFrmDs := AMainFrmDs;


  //-------Main
  ffrm1 := Tfrmqk20004edit1.Create(Self);
  ffrm1.InitGrid(20004);
  Fds1 := qkCommfunc.CreateDS(Self);
  Fds1.CloneCursor(FMainFrmDs);
  Fds1.MergeChangeLog;
  case AType of
    0: Fds1.Append;
    1: Fds1.Locate('IDKey',FMainFrmDs.FieldByName('IDKey').AsLargeInt,[]);
  end;
  ffrm1.DataSet := Fds1;
  ffrm1.pnlBase1.Parent := pnl1;

  //-------Detail
  ffrm2 := Tfrmqk20004Edit2.Create(Self);
  ffrm2.InitGrid(ModID,2000401);
  Fds2 := qkCommfunc.CreateDS(Self);
  if not qkDataIntf.GetTableData(Fds2,TBNAME2,' ParentIDkey=' + Fds1.FieldByName('IDkey').AsLargeInt.ToString + ' order by SeqNo Asc') then
    exit;
  ffrm2.DataSet := Fds2;
  ffrm2.pnlbase.Parent := pnl2;
  //-----

  PostDsList.Add(Fds1);
  PostDsList.Add(Fds2);
  PostTableArr := TBNAME1 + ';' + TBNAME2;
end;

end.
