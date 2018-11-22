unit BOMBaoJiaCommonCalcstrFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzPanel, RzLabel, Vcl.Mask, RzEdit, RzDBEdit, Data.DB, Datasnap.DBClient, DataIntf, DBImpl,
  RzTabs, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBOMBaoJiaCommonCalcstr = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pnl2: TRzPanel;
    cdsBP16: TClientDataSet;
    dsBP16: TDataSource;
    pg1: TRzPageControl;
    tsTabSheet1: TRzTabSheet;
    tsTabSheet2: TRzTabSheet;
    lbl1: TRzLabel;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    lbl4: TRzLabel;
    lbl5: TRzLabel;
    lbl6: TRzLabel;
    lbl7: TRzLabel;
    edtbaofeilv_calcstr: TRzDBEdit;
    edtyunshu_cost_calcstr: TRzDBEdit;
    edtxiaoshou_cost_calcstr: TRzDBEdit;
    edtcaiwu_cost_calcstr: TRzDBEdit;
    edtguanli_cost_calcstr: TRzDBEdit;
    edtguanli_cost_calcstr1: TRzDBEdit;
    lbl8: TRzLabel;
    lbl9: TRzLabel;
    lbl10: TRzLabel;
    lbl11: TRzLabel;
    lbl13: TRzLabel;
    lbl14: TRzLabel;
    edtbaofeilv_calcstr1: TRzDBEdit;
    edtyunshu_cost_calcstr1: TRzDBEdit;
    edtxiaoshou_cost_calcstr1: TRzDBEdit;
    edtcaiwu_cost_calcstr1: TRzDBEdit;
    edtguanli_cost_calcstr2: TRzDBEdit;
    tsTabSheet3: TRzTabSheet;
    grp2: TGroupBox;
    lbl33: TRzLabel;
    lbl36: TRzLabel;
    lbl45: TRzLabel;
    lbl46: TRzLabel;
    edtManu_part_desc2: TRzDBEdit;
    edtManu_part_desc3: TRzDBEdit;
    edtManu_part_desc4: TRzDBEdit;
    edtManu_part_desc5: TRzDBEdit;
    grp1: TGroupBox;
    lbl32: TRzLabel;
    lbl51: TRzLabel;
    lbl52: TRzLabel;
    lbl55: TRzLabel;
    lbl56: TRzLabel;
    edtManu_part_desc1: TRzDBEdit;
    edtRpt_GongChengFei: TRzDBEdit;
    edtRpt_GongChengFei1: TRzDBEdit;
    edtRpt_CeShiFei: TRzDBEdit;
    edtRpt_CeShiFei1: TRzDBEdit;
    pgTabSheet1: TRzTabSheet;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    lbl12: TLabel;
    dbmmoSqlText: TDBMemo;
    cdsSql: TClientDataSet;
    dsSql: TDataSource;
    strngfldSqlSqlName: TStringField;
    strngfldSqlSqlText: TStringField;
    tsTabSheet4: TRzTabSheet;
    lbl15: TLabel;
    dbmmoreadline: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    FIBP16: IData;
    FIBPSql: IData;
  public
    { Public declarations }
    procedure GetData;
  end;


implementation

uses
  DM, WZ_gUnit;

{$R *.dfm}

procedure TfrmBOMBaoJiaCommonCalcstr.btn1Click(Sender: TObject);
begin
  if cdsBP16.FieldByName('idkey').AsString = '' then
  begin
    cdsBP16.Edit;
    cdsBP16.FieldByName('idkey').AsString := FIBP16.CreateKeyID;
    cdsBP16.Post;
  end;

  if not PostdataByInterface(cdsBP16,FIBP16) then
  begin
    ShowMessage('保存失败');
    Exit;
  end;

  if not PostdataByInterface(cdsSql,FIBPSql) then
  begin
    ShowMessage('保存失败');
    Exit;
  end;

  ShowMessage('保存成功');
  ModalResult := mrOk;
end;

procedure TfrmBOMBaoJiaCommonCalcstr.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBOMBaoJiaCommonCalcstr.FormCreate(Sender: TObject);
begin
  FIBP16 := TBP16.Create;
  FIBPSql := TBPSql.Create;
  pg1.ActivePageIndex := 0;
end;

procedure TfrmBOMBaoJiaCommonCalcstr.GetData;
begin
  FIBP16.SetSql('select * from bomprice16');
  cdsBP16.Data := FIBP16.GetData;

  FIBPSql.SetSql('select * from bompriceSql');
  cdsSql.Data := FIBPSql.GetData;

end;

end.
