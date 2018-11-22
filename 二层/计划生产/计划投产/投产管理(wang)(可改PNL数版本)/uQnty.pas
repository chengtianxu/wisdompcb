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
    procedure FormCreate(Sender: TObject);
  private
    qty,selectqty:Integer;

    { Private declarations }
  public
    procedure InitData;
    { Public declarations }
  end;

var
  frmQnty: TfrmQnty;

implementation

uses damo;

{$R *.dfm}

procedure TfrmQnty.FormActivate(Sender: TObject);                 //20170615 mark by zsp
//var
//  rkey53:string;
begin
//  rkey53:='';
//  with dm.aqQnty1 do
//  begin
//    dm.cdsQnty1.Close;
//    Close;
////    Parameters.ParamByName('SALES_ORDER').Value:= dm.ADS60SALES_ORDER.AsString;
//    Parameters.ParamByName('MANU_PART_NUMBER').Value:= dm.ADS60MANU_PART_NUMBER.AsString;
//    Open;
//    dm.cdsQnty1.Open;
//    dm.cdsQnty1.First;
//    while not dm.cdsQnty1.Eof do
//    begin
//      rkey53 := rkey53 + DM.cdsQnty1RKEY.AsString + ',';
//      dm.cdsQnty1.Next;
//    end;
//    rkey53:= Copy(rkey53,1,Length(rkey53)-1);
//    DM.qry53.Close;
//    DM.qry53.SQL.Text:= 'SELECT * FROM DATA0053 WHERE RKEY IN (' + rkey53 + ')';
//    DM.qry53.Open;
//  end;
end;

procedure TfrmQnty.BitBtn1Click(Sender: TObject);                //20170615 mark by zsp
begin
//  if not dm.cdsQnty1.Active then Exit;
//  dm.cdsQnty1.First;
//  while not dm.cdsQnty1.Eof do
//  begin
//    if dm.cdsQnty1.FieldByName('IsSelected').AsInteger=1 then
//    begin
//      dm.aqTmp.SQL.Clear;
//      dm.aqTmp.SQL.Add('update data0053 set barcode_ptr = '+dm.ADS60.FieldByName('RKEY').AsString+' where RKEY = '+dm.cdsQnty1.FieldByName('RKEY').AsString);
//      dm.aqTmp.ExecSQL;
//    end;
//    dm.cdsQnty1.Next;
//  end;

  DM.ClearChk;
end;

procedure TfrmQnty.BitBtn2Click(Sender: TObject);             //20170615 mark by zsp
begin
//  if not dm.cdsQnty1.Active then Exit;
//  dm.cdsQnty1.First;
//  while not dm.cdsQnty1.Eof do
//  begin
//    if dm.cdsQnty1.FieldByName('IsSelected').AsInteger=1 then
//    begin
//      dm.aqTmp.SQL.Clear;
//      dm.aqTmp.SQL.Add('update data0053 set barcode_ptr = Null where RKEY = '+dm.cdsQnty1.FieldByName('RKEY').AsString);
//      dm.aqTmp.ExecSQL;
//    end;
//    dm.cdsQnty1.Next;
//  end;
end;

procedure TfrmQnty.BitBtn3Click(Sender: TObject);
begin
  DM.CancelChk;
  Close;
end;

procedure TfrmQnty.FormCreate(Sender: TObject);                                  //20170615 mark by zsp
begin
  InitData;
end;

procedure TfrmQnty.InitData;
var
  rkey53:string;                                     //20170615 mark by zsp
begin
  
  rkey53:='';
  if not DM.aqQnty1.Active then
  begin
    with dm.aqQnty1 do
    begin
      dm.cdsQnty1.Close;
      Close;
  //    Parameters.ParamByName('SALES_ORDER').Value:= dm.ADS60SALES_ORDER.AsString;
      Parameters.ParamByName('MANU_PART_NUMBER').Value:= dm.ADS60MANU_PART_NUMBER.AsString;
      Open;

      dm.cdsQnty1.Open;
      dm.cdsQnty1.First;
      while not dm.cdsQnty1.Eof do
      begin
        rkey53 := rkey53 + DM.cdsQnty1RKEY.AsString + ',';
        dm.cdsQnty1.Next;
      end;
      rkey53:= Copy(rkey53,1,Length(rkey53)-1);
      if rkey53 <> '' then
      begin
        DM.qry53.Close;
        DM.qry53.SQL.Text:= 'SELECT * FROM DATA0053 WHERE RKEY IN (' + rkey53 + ')';
        DM.qry53.Open;
      end;
    end;
  end;
end;

end.
