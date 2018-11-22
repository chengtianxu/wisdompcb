unit uQnty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TfrmQnty = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQnty: TfrmQnty;

implementation

uses damo;

{$R *.dfm}

procedure TfrmQnty.FormActivate(Sender: TObject);
begin
  with dm.aqQnty1 do
  begin
    dm.cdsQnty1.Close;
    Close;
    Parameters.ParamByName('SALES_ORDER').Value:= dm.ADS60SALES_ORDER.AsString;
    Parameters.ParamByName('MANU_PART_NUMBER').Value:= dm.ADS60MANU_PART_NUMBER.AsString;
    Open;
    dm.cdsQnty1.Open;
  end;
end;

procedure TfrmQnty.BitBtn1Click(Sender: TObject);
begin
  if not dm.cdsQnty1.Active then Exit;
  dm.cdsQnty1.First;
  while not dm.cdsQnty1.Eof do
  begin
    if dm.cdsQnty1.FieldByName('IsSelected').AsInteger=1 then
    begin
      dm.aqTmp.SQL.Clear;
      dm.aqTmp.SQL.Add('update data0053 set barcode_ptr = '+dm.ADS60.FieldByName('RKEY').AsString+' where RKEY = '+dm.cdsQnty1.FieldByName('RKEY').AsString);
      dm.aqTmp.ExecSQL;
    end;
    dm.cdsQnty1.Next;
  end;
end;

procedure TfrmQnty.BitBtn2Click(Sender: TObject);
begin
  if not dm.cdsQnty1.Active then Exit;
  dm.cdsQnty1.First;
  while not dm.cdsQnty1.Eof do
  begin
    if dm.cdsQnty1.FieldByName('IsSelected').AsInteger=1 then
    begin
      dm.aqTmp.SQL.Clear;
      dm.aqTmp.SQL.Add('update data0053 set barcode_ptr = Null where RKEY = '+dm.cdsQnty1.FieldByName('RKEY').AsString);
      dm.aqTmp.ExecSQL;
    end;
    dm.cdsQnty1.Next;
  end;
end;

procedure TfrmQnty.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
