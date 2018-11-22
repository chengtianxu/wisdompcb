unit costbalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  Tcostbalance_frm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Edit10: TEdit;
    Label10: TLabel;
    Edit11: TEdit;
    Label11: TLabel;
    Edit13: TEdit;
    Label13: TLabel;
    Edit15: TEdit;
    Label15: TLabel;
    Edit17: TEdit;
    Label17: TLabel;
    Edit18: TEdit;
    Label19: TLabel;
    Edit19: TEdit;
    Label20: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label12: TLabel;
    Label14: TLabel;
    Edit12: TEdit;
    Edit14: TEdit;
    Label16: TLabel;
    Label18: TLabel;
    Edit16: TEdit;
    Edit20: TEdit;
    Label21: TLabel;
    Edit21: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Edit22: TEdit;
    Edit23: TEdit;
    Label24: TLabel;
    Edit24: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  costbalance_frm: Tcostbalance_frm;

implementation

uses damo;

{$R *.dfm}

procedure Tcostbalance_frm.BitBtn2Click(Sender: TObject);
var msg:string;
begin
  msg:='';
  try
    with dm.tmp do
    begin
      close;
      sql.Clear;
      sql.Add('Exec WZPR451;10 '+inttostr(BitBtn2.Tag)+','+Edit10.Text+','+Edit19.Text);
      ExecSQL;
    end;
    with dm.tmp do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT MATL_CST_IN_SFG_CLOSED,OVHD_CST_IN_SFG_CLOSED FROM DATA0451 WHERE RKEY='+inttostr(BitBtn2.Tag));
      open;
    end;
    IF dm.tmp.FieldByName('MATL_CST_IN_SFG_CLOSED').AsFloat=0 then msg:='*材料成本不需要调整';
    IF dm.tmp.FieldByName('OVHD_CST_IN_SFG_CLOSED').AsFloat=0 then msg:='*带入成本不需要调整';
    IF msg='' THEN
      Showmessage('调整成功')
    ELSE
      Showmessage('调整完成!'+#13+#13+msg);
  except
    on E:exception do
    begin
      Showmessage(E.Message+#13+#13+'调整失败');
      Abort;
    end;
  end;
end;

procedure Tcostbalance_frm.BitBtn3Click(Sender: TObject);
begin
  try
    with dm.tmp do
    begin
      close;
      sql.Clear;
      sql.Add('Exec WZPR451;11 '+inttostr(BitBtn3.Tag)+','+Edit10.Text+','+Edit19.Text);
      ExecSQL;
    end;
    Showmessage('取消调整成功');
  except
    on E:exception do
    begin
      Showmessage(E.Message+#13+#13+'取消调整失败');
      Abort;
    end;
  end;
end;

end.
