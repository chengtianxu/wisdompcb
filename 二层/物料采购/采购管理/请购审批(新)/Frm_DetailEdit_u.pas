unit Frm_DetailEdit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, StdCtrls, Buttons, DB, Mask, DBCtrls, ADODB;

type
  TFrm_DetailEdit = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    BtSave: TBitBtn;
    BtCan: TBitBtn;
    EdtMat: TEdit;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBText1: TDBText;
    dbchkIF_urgency: TDBCheckBox;
    lbl1: TLabel;
    dbedtQUANTITY: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    function get_invzaitu(rkey17:integer):double;
  public
    Ftag:integer;
    procedure initData;
  end;

var
  Frm_DetailEdit: TFrm_DetailEdit;

implementation
uses DM_u,Frm_Matstock_u;
{$R *.dfm}

function TFrm_DetailEdit.get_invzaitu(rkey17: integer): double;
begin
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN) as qty_zaitu');
    sql.Add('FROM Data0071 INNER JOIN');
    sql.Add('Data0070 ON Data0071.PO_PTR = Data0070.RKEY');
    sql.Add('WHERE Data0070.STATUS = 5');
    sql.Add('and data0071.invt_ptr='+inttostr(rkey17));
    open;
    if IsEmpty then
      Result:=0
    else
      Result:=fieldbyname('qty_zaitu').AsFloat;
   end;

end;

procedure TFrm_DetailEdit.initData;
begin
   Edit3.Text:=floattostr(get_invzaitu(DM.AQ69INVT_PTR.Value)); //当前在途
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select top 1 quan_on_hand from data0017 where rkey='+DM.AQ69INVT_PTR.AsString;
   DM.tmp.Open;
   Edit2.Text:=DM.tmp.Fields[0].AsString;  //当前库存
end;

procedure TFrm_DetailEdit.BitBtn1Click(Sender: TObject);
begin
  if DM.AQ69INVT_PTR.Value>0 then
  with TFrm_Matstock.Create(nil) do
  begin
    ADOQuery1.Close;
    ADOQuery1.Parameters[0].Value:=dm.AQ69INVT_PTR.Value;
    ADOQuery1.Parameters[1].Value:=dm.AQ69INVT_PTR.Value;
    ADOQuery1.Open;
    ShowModal;
    free;
  end
end;

end.
