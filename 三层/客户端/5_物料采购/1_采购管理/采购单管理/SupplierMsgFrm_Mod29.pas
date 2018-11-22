unit SupplierMsgFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.DBClient,uBaseFrm;

type
  TfrmSupplierMsg_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt1: TDBEdit;
    edt2: TDBEdit;
    edt3: TDBEdit;
    edt4: TDBEdit;
    mmo1: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    mmo2: TMemo;
    cds23: TClientDataSet;
    ds23: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(Rkey:string);
  end;

var
  frmSupplierMsg_Mod29: TfrmSupplierMsg_Mod29;

implementation

uses uCommFunc;
{$R *.dfm}

{ TForm1 }

procedure TfrmSupplierMsg_Mod29.GetData(Rkey: string);
var
  LSql23,LSql1,LSql2:string;
  LCds1,LCds2:TClientDataSet;
  i:Integer;
begin
  LSql23:=' select rkey,supplier_name,contact_name_1,CONT_PHONE_1,BILLING_ADDRESS_1  '+#13+
          ' from data0023 where rkey=' + Rkey;

  LSql1:='  select * from data0011  '+#13+
         '   where source_type=4023 and  '+#13+
         '  file_pointer=' + Rkey ;

  LSql2:='    select * from data0011 '+#13+
         ' where source_type=5023 and  '+#13+
         ' file_pointer=' + Rkey;
  LCds1:= TClientDataSet.Create(Self);
  LCds2:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql23,LSql1,LSql2]),[cds23,LCds1,LCds2]) then Exit;
    if not LCds1.IsEmpty then
    begin
      for i := 1 to 4 do
        mmo1.Lines.Add(LCds1.FieldByName('NOTE_PAD_LINE_' + IntToStr(i)).AsString);
    end;
    if not LCds2.IsEmpty then
    begin
      for i := 1 to 4 do
        mmo2.Lines.Add(LCds2.FieldByName('NOTE_PAD_LINE_' + IntToStr(i)).AsString);
    end;
  finally
    LCds1.Free;
    LCds2.Free;
  end;
end;

end.
