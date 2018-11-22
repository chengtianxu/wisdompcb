unit SameQryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, damo, DB, Math, ADODB;

type
  TfrmSameQry = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    edt4: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btn1: TButton;
    eh1: TDBGridEh;
    ds1: TDataSource;
    adsSameQry: TADODataSet;
    adsSameQrysetLength: TBCDField;
    adsSameQrysetWidth: TBCDField;
    strngfldSameQrymanu_part_number: TStringField;
    intgrfldSameQryrkey: TIntegerField;
    strngfldSameQryPnlPcsNum: TStringField;
    strngfldSameQrySetPcsNum: TStringField;
    intgrfldSameQrySETPERPNL: TIntegerField;
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt1Exit(Sender: TObject);
    procedure edt3KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmSameQry.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',#8]) then Key := #0;
  if Key = '.' then
  begin
    if Pos('.',(Sender as TEdit).Text) > 0 then Key := #0;
  end;
end;

procedure TfrmSameQry.edt1Exit(Sender: TObject);
begin
  if Length(Trim((Sender as TEdit).Text)) = 0 then
    (Sender as TEdit).Text := '1';
end;

procedure TfrmSameQry.edt3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then Key := #0;
end;

procedure TfrmSameQry.btn1Click(Sender: TObject);
var
  ASetW,ASetH,AOffset,tmp: Single;
  ASetPerPnl: Integer;

begin
  ASetW := StrToFloatDef(edt1.Text,-1);
  ASetH := StrToFloatDef(edt2.Text,-1);
  ASetPerPnl := StrToIntDef(edt3.Text,-1);
  AOffset := StrToFloatDef(edt4.Text,-1);
  if ASetW <= 0 then
  begin
    ShowMessage('SET长不正确');
    Exit;
  end;
  if ASetH <= 0 then
  begin
    ShowMessage('SET宽不正确');
    Exit;
  end;
  if ASetPerPnl <= 0 then
  begin
    ShowMessage('SET/PNL数不正确');
    Exit;
  end;
  if AOffset < 0 then
  begin
    ShowMessage('SET尺寸相差不正确S');
    Exit;
  end;
  tmp := MaxValue([ASetW,ASetH]);
  ASetH := MinValue([ASetW,ASetH]);
  ASetW := tmp;

  adsSameQry.Close;
  adsSameQry.Parameters.ParamByName('PLen').Value := ASetW;
  adsSameQry.Parameters.ParamByName('PWidth').Value := ASetH;
  adsSameQry.Parameters.ParamByName('P1').Value := AOffset;
  adsSameQry.Parameters.ParamByName('P2').Value := AOffset;
  adsSameQry.Parameters.ParamByName('P3').Value := DM.AQY0025MANU_PART_NUMBER.Value;
  adsSameQry.Parameters.ParamByName('P4').Value := ASetPerPnl;
  adsSameQry.Open;

end;

end.
