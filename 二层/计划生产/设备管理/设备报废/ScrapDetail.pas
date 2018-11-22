unit ScrapDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, Buttons, Mask, ExtCtrls;

type
  TForm_ScrapDetail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lbfasset: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
    rkey417:integer;
  public
    { Public declarations }
  Ftag:integer;
  procedure initd;
  end;

var
  Form_ScrapDetail: TForm_ScrapDetail;

implementation

uses searchfs, demo, ADODB,common, DB;

{$R *.dfm}


procedure TForm_ScrapDetail.SpeedButton1Click(Sender: TObject);
begin
try
Form_fasset:=TForm_fasset.Create(Application);
if Form_fasset.ShowModal=mrok then
begin
with dm.temp do
begin
sql.Clear;
sql.Text:='select * from data0574 where fasset_ptr=:rkey417';
Parameters[0].Value:=form_fasset.ADO417RKEY.Value;
Open;
end;
if not dm.temp.IsEmpty then
begin
showmessage('此设备已在报废申请中!');
exit;
end;
edit2.Text:=Form_fasset.ADO417FASSET_CODE.Value;
lbfasset.Caption:=Form_fasset.ADO417FASSET_NAME.Value;
self.rkey417:=Form_fasset.ADO417RKEY.Value;
dm.ADO517.Close;
dm.ADO517.Parameters[0].Value:=Form_fasset.ADO417id_code.Value;
dm.ADO517.Open;
if not dm.ADO517.IsEmpty then
begin
dbedit1.Text:=dm.ADO517ORIGINAL_VALUE.AsString;
dbedit2.Text:=dm.ADO517SUMMED_DEPRE.AsString;
dbedit3.Text:=dm.ADO517NET_VALUE.AsString;
dbedit4.Text:=dm.ADO517EXPECTED_LIFE_MONTHS.AsString;
dbedit5.Text:=dm.ADO517DEPRED_MONTHS.AsString;
end
else
begin
dbedit1.Text:='0.00';
dbedit2.Text:='0.00';
dbedit3.Text:='0.00';
dbedit4.Text:='0.00';
dbedit5.Text:='0.00';
end;
end;
finally
Form_fasset.Free;
end;
end;
procedure TForm_ScrapDetail.initd;
begin
  if Ftag=0 then
  begin
    self.Caption:='设备报废申请-新增';
    dm.ADO574.Close;
    dm.ADO574.Parameters[0].Value:=null;
    dm.ADO574.Open;
    dm.ADO574.Append;
  end
  else if Ftag=1 then
  begin
    self.Caption:='设备报废申请-编辑';
    SpeedButton1.Enabled:=false;
    edit1.Text:=dm.ADS574allocate_number.Value;
    edit2.Text:=dm.ADS574FASSET_CODE.Value;
    self.rkey417:=dm.ADS574fasset_ptr.Value;
    lbfasset.Caption:=dm.ADS574FASSET_NAME.Value;
    DateTimePicker1.DateTime:=dm.ADS574allocate_date.Value;
    dm.ADO574.Close;
    dm.ADO574.Parameters[0].Value:=dm.ADS574rkey.Value;
    dm.ADO574.Open;
  end
  else if Ftag=2 then
    begin
    self.Caption:='设备报废申请-检查';
    SpeedButton1.Enabled:=false;
    BtnSave.Enabled:=false;
    edit1.ReadOnly:=true;
    DateTimePicker1.Enabled:=false;
    DBEdit6.ReadOnly:=true;
    DBEdit7.ReadOnly:=true;
    DBMemo1.ReadOnly:=true;
    DBMemo2.ReadOnly:=true;
    DBMemo3.ReadOnly:=true;
    DBEdit8.ReadOnly:=true;
    DBEdit9.ReadOnly:=true;
    DBEdit10.ReadOnly:=true;
    DBEdit11.ReadOnly:=true;
    edit1.Text:=dm.ADS574allocate_number.Value;
    edit2.Text:=dm.ADS574FASSET_CODE.Value;
    lbfasset.Caption:=dm.ADS574FASSET_NAME.Value;
    DateTimePicker1.DateTime:=dm.ADS574allocate_date.Value;
    dm.ADO574.Close;
    dm.ADO574.Parameters[0].Value:=dm.ADS574rkey.Value;
    dm.ADO574.Open;
  end;
end;

procedure TForm_ScrapDetail.BtnSaveClick(Sender: TObject);
begin
if trim(edit1.Text)='' then
begin
showmessage('报废单号不能为空!');
exit;
end;
if trim(edit2.Text)='' then
begin
showmessage('请先选择设备!');
exit;
end;
dm.ADO574.Edit;
dm.ADO574allocate_number.Value:=edit1.Text;
dm.ADO574fasset_ptr.Value:=self.rkey417;
dm.ADO574user_ptr.Value:=strtoint(user_ptr);
dm.ADO574allocate_date.AsString:=FormatdateTime('yyyy-mm-dd',DateTimePicker1.DateTime);
dm.ADO574outdeptname_empl.Value:=DBEdit6.Text;
dm.ADO574out_equipment.Value:=DBEdit7.Text;
dm.ADO574ORIGINAL_VALUE.Value:=strtofloat(DBEdit1.Text);
dm.ADO574SUMMED_DEPRE.Value:=strtofloat(DBEdit2.Text);
dm.ADO574NET_VALUE.Value:=strtofloat(DBEdit3.Text);
dm.ADO574EXPECTED_LIFE_MONTHS.Value:=StrToFloat(DBEdit4.Text);
dm.ADO574DEPRED_MONTHS.Value:=StrToFloat(DBEdit5.Text);
dm.ADO574remark.Value:=DBMemo1.Text;
dm.ADO574detection_remark.Value:=DBMemo2.Text;
dm.ADO574scrap_remark.Value:=DBMemo3.Text;
dm.ADOCon.BeginTrans;
try
dm.ADO574.Post;
dm.ADO574.UpdateBatch(arAll);
dm.ADOCon.CommitTrans;
rkey574:=dm.ADO574rkey.Value;
dm.ADS574.Close;
dm.ADS574.Open;
modalresult:=mrok;
except
dm.ADOCon.RollbackTrans;
showmessage('保存数据失败,报废单号可能重复!');
end;
end;

procedure TForm_ScrapDetail.BitBtn9Click(Sender: TObject);
begin
close;
end;

end.
