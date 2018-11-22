unit MIStepFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, Grids, DBGridEh, ComCtrls,
  ExtCtrls, damo;

type
  TfrmMIStep = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl4: TPanel;
    pnl3: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    tvMI: TTreeView;
    ads38: TADODataSet;
    ds38: TDataSource;
    lbl1: TLabel;
    dbmmodept_note: TDBMemo;
    lbl2: TLabel;
    dbmmoDEF_ROUT_INST: TDBMemo;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    eh3: TDBGridEh;
    eh2: TDBGridEh;
    eh4: TDBGridEh;
    ads38STEP_NUMBER: TSmallintField;
    ads38DEPT_CODE: TStringField;
    ads38DEPT_NAME: TStringField;
    ads38rkey25: TAutoIncField;
    ads38DEF_ROUT_INST: TStringField;
    ads38rkey34: TAutoIncField;
    ads38rkey38: TAutoIncField;
    ads38OnLinePcs: TFloatField;
    ads38OnLinesPnl: TIntegerField;
    ads38_494: TADODataSet;
    ads38_494seq_no: TSmallintField;
    ads38_494step_number: TSmallintField;
    ads38_494PARAMETER_NAME: TStringField;
    ads38_494PARAMETER_VALUE: TStringField;
    ads38_494PARAMETER_DESC: TStringField;
    ds38_494: TDataSource;
    ads53: TADODataSet;
    ads53CODE: TStringField;
    ads53LOCATION: TStringField;
    ads53COLUMN1: TIntegerField;
    ads53ABBR_NAME: TStringField;
    ds53: TDataSource;
    ads38grade_code: TStringField;
    ads38grade_note: TWideStringField;
    dbgrdh1: TDBGridEh;
    lbl7: TLabel;
    qry279: TADOQuery;
    ds1: TDataSource;
    qry279PARAMETER_DESC: TStringField;
    qry279PARAMETER_VALUE: TStringField;
    procedure tvMIChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetMITree;
  end;

var
  frmMIStep: TfrmMIStep;

implementation

{$R *.dfm}

procedure TfrmMIStep.GetMITree;
var
  LSql: string;
  I: Integer;
begin
  tvMI.Items.Clear;
  LSql := ' ;WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) AS ' +
          '(' +
          ' SELECT RKey,1,MANU_PART_NUMBER,PARENT_PTR FROM Data0025 WHERE RKey = ' + DM.ADS60.fieldbyname('rkey25').AsString +
          ' UNION ALL ' +
          ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
          ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ' +
          ')' +
          ' SELECT * FROM CTE ORDER BY lv ASC';
  DM.SqlOpen(LSql);
  DM.qrytmp.First;
  while not DM.qrytmp.Eof do
  begin
    if (DM.qrytmp.FieldByName('PARENT_PTR').IsNull) or (tvMI.Items.Count = 0) then
    begin
      tvMI.Items.AddChildObject(nil,DM.qrytmp.FieldByName('MANU_PART_NUMBER').AsString,Pointer(DM.qrytmp.FieldByName('rkey').AsInteger));
    end else
    begin
      for I := 0 to tvMI.Items.Count - 1 do
      begin
        if Integer(tvMI.Items[I].Data) = DM.qrytmp.FieldByName('PARENT_PTR').AsInteger then
        begin
          tvMI.Items.AddChildObject(tvMI.Items[I],DM.qrytmp.FieldByName('MANU_PART_NUMBER').AsString,Pointer(DM.qrytmp.FieldByName('rkey').AsInteger));
          Break;
        end;
      end;
    end;
    DM.qrytmp.Next;
  end;
  tvMI.Items[0].Expand(True);
  tvMI.SetFocus;
  tvMI.Items[0].Selected := True;
  tvMIChange(tvMI,tvMI.Items[0]);  
end;

procedure TfrmMIStep.tvMIChange(Sender: TObject; Node: TTreeNode);
begin
  ads38.Close;
  ads38.Parameters[0].Value := Integer(tvMI.Selected.Data);
  ads38.Open;
  qry279.Close;
  qry279.Parameters[0].Value:=  Integer(tvMI.Selected.Data);
  qry279.Open;


  ads38_494.Open;
  ads53.Open;
end;

procedure TfrmMIStep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmMIStep := nil;
end;

procedure TfrmMIStep.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then ModalResult := mrOk;
end;

procedure TfrmMIStep.FormShow(Sender: TObject);
begin
  GetMITree;
end;

end.
