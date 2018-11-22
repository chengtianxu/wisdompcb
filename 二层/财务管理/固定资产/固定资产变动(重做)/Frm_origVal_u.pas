unit Frm_origVal_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, ADODB;

type
  TFArryCurr = record
    rkey:integer;
    frate:real;
  end;

  TFrm_origVal = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    CBCurr: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    procedure CBCurrChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FArryCurr:array of TFArryCurr;
  public
    procedure init;
    { Public declarations }
  end;


implementation
 uses DM_u;
{$R *.dfm}

{ TFrm_origVal }

procedure TFrm_origVal.init;
var i:integer;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,CURR_CODE,base_to_other,exch_rate from data0001 order by 1';
  DM.tmp.Open;
  i:=0;
  setlength(FArryCurr,DM.tmp.RecordCount);
  while not DM.tmp.Eof do
  begin
    FArryCurr[i].rkey:=DM.tmp.fields[0].asinteger;
    FArryCurr[i].frate:=DM.tmp.fields[2].AsFloat;
    CBCurr.Items.Append(DM.tmp.fields[1].asstring);
    if DM.tmp.fields[0].asinteger=DM.ADO325_1.FieldByName('curr_ptr').AsInteger then
     CBCurr.ItemIndex:=i;
    DM.tmp.Next;
    inc(i);
  end;
end;

procedure TFrm_origVal.CBCurrChange(Sender: TObject);
begin
  DM.ADO325_1.Edit;
  DM.ADO325_1.FieldByName('curr_ptr').AsInteger:=FArryCurr[CBCurr.ItemIndex].rkey;
  DM.ADO325_1.FieldByName('ex_rate').AsFloat:=FArryCurr[CBCurr.ItemIndex].frate;
end;

procedure TFrm_origVal.BitBtn1Click(Sender: TObject);
begin
  if DBEdit1.Text='' then
  begin
    showmessage('请输入原币金额');
    exit;
  end;
  if CBCurr.Text='' then
  begin
    showmessage('请选择币别');
    exit;
  end;
  modalresult:=mrok;
end;

end.
