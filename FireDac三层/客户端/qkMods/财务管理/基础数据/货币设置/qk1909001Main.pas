unit qk1909001Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzLabel, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  RzPanel, RzDBEdit;

type
  Tfrmqk1909001Main = class(TfrmqkBaseMain)
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lblBaseCurr: TLabel;
    edtCurr_Code: TRzDBEdit;
    edtCurr_ChsName: TRzDBEdit;
    edtRateTobase: TRzDBEdit;
    edtBaseToRate: TRzDBEdit;
    edtPrice_RateToBase: TRzDBEdit;
    edtPrice_RateTobase1: TRzDBEdit;
    edt1: TRzEdit;
    edt3: TRzEdit;
    edt4: TRzEdit;
    edt5: TRzEdit;
    lbl5: TLabel;
    edtPrice_RateTobase2: TRzDBEdit;
    procedure mt1AfterScroll(DataSet: TDataSet);
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitMainFrm(AModID: int64;AMainSqlIDKey: Int64);override;

  end;


implementation

uses
  qkFunc.Commfunc,qkSvrIntf.ClientIntf, qk1909001Edit;

{$R *.dfm}

procedure Tfrmqk1909001Main.InitMainFrm(AModID, AMainSqlIDKey: Int64);
begin
  inherited;
  mt1.DisableControls;
  if mt1.Locate('IsBaseCurr',True,[loCaseInsensitive]) then
  begin
    lblBaseCurr.Caption := mt1.FieldByName('Curr_Code').AsString;
  end;
  mt1.First;
  mt1.EnableControls;
end;

procedure Tfrmqk1909001Main.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    DataSet.Delete;
    if dmSvrIntf.PostDataByTable(mt1,'gBase_Curr') then
    begin
      qkDialog.DeleSucc;
    end;
  end;
end;

procedure Tfrmqk1909001Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1909001Edit) then
    exit;

  frmqk1909001Edit := Tfrmqk1909001Edit.Create(Self);
  frmqk1909001Edit.InitEdit(DataSet.FieldByName('IDKey').AsLargeInt);
  frmqk1909001Edit.Show;
end;

procedure Tfrmqk1909001Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1909001Edit) then
    exit;

  frmqk1909001Edit := Tfrmqk1909001Edit.Create(Self);
  frmqk1909001Edit.InitEdit(0);
  frmqk1909001Edit.Show;

end;

procedure Tfrmqk1909001Main.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1909001Edit) then
    exit;

  frmqk1909001Edit := Tfrmqk1909001Edit.Create(Self);
  frmqk1909001Edit.InitEdit(DataSet.FieldByName('IDKey').AsLargeInt);
  frmqk1909001Edit.SetReadOnly;
  frmqk1909001Edit.Show;
end;

procedure Tfrmqk1909001Main.mt1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  edt1.Text := DataSet.FieldByName('Curr_Code').AsString + '/本位币';
  edt3.Text := '本位币/' + DataSet.FieldByName('Curr_Code').AsString;
  edt4.Text := edt1.Text;
  edt5.Text := edt3.Text;
end;

end.
