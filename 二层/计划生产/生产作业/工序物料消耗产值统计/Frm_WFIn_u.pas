unit Frm_WFIn_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ADODB, Buttons, ExtCtrls,iniFiles;

type
  TFrm_WFIn = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit12KeyPress(Sender: TObject; var Key: Char);
  private

  public
    Ftp:integer;
  end;

var
  Frm_WFIn: TFrm_WFIn;

implementation
 uses DM_u;
{$R *.dfm}

procedure TFrm_WFIn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true)
  else
    if key=vk_F12 then  SpeedButton1Click(Sender);
end;

procedure TFrm_WFIn.BitBtn2Click(Sender: TObject);
begin
  DM.ADO571.Cancel;
  close;
end;

procedure TFrm_WFIn.FormShow(Sender: TObject);
var F:TiniFile;
    Sts: TStringlist;
    i:integer;
begin
  try
    Sts:=TStringlist.Create;
    DBComboBox2.Items.Clear;
    F:=TiniFile.Create(extractfilepath(Application.ExeName)+'WISDOMPCB.ini');
    F.ReadSection('服务器',Sts);
    for i:=0 to sts.Count-1  do
      if sts.Strings[i]<>sCust then DBComboBox2.Items.Append(sts.Strings[i]);
  finally
    F.Free;
    Sts.Free;
  end;
end;

procedure TFrm_WFIn.SpeedButton1Click(Sender: TObject);
var sC:string;
    spart,Unt:string;
begin
  DM.ADO571ttype.AsInteger:=Frm_WFIn.RadioGroup1.ItemIndex;
  DM.ADO571.CheckBrowseMode;
  if DM.ADO571customer_name.Value='' then
  begin
    showmessage('请选择客户...');
    exit;
  end;
  if DM.ADO571MANU_PART_number.Value='' then
  begin
    showmessage('请输入本厂编号...');
    DBEdit1.SetFocus;
    exit;
  end;

  if (DM.ADO571PANEL_A_B.Value='APNL') or (DM.ADO571PANEL_A_B.Value='BPNL') then
  begin
    if DM.ADO571pan_qty.AsInteger=0 then
    begin
      showmessage('请输入PNL数量...');
      DBEdit3.SetFocus;
      exit;
    end;
  end else if DM.ADO571set_qty.AsInteger=0 then
  begin
    showmessage('请输入SET数量...');
    DBEdit7.SetFocus;
    exit;
  end;

  if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Post;
  sC:=DM.ADO571customer_name.AsString;
  Unt:=DM.ADO571PANEL_A_B.AsString;
  if Ftp=0 then  //add
  begin
    DM.ADO571.Append;
    DM.ADO571PANEL_A_B.Value:=Unt;
    DM.ADO571customer_name.Value:=sC;
    DBEdit1.SetFocus;
  end else begin
    if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Post;
    close;
  end;
end;

procedure TFrm_WFIn.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_WFIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Cancel;
end;


procedure TFrm_WFIn.DBEdit12KeyPress(Sender: TObject; var Key: Char);
begin
  if key='-' then abort;                      //数据库有大小约束
  if (key<>#13) and (strtofloat(TDBEdit(sender).Text+Key)>99.9999999) then abort;
end;

end.
