unit Frm_GXCL_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, DBCtrlsEh, DB, Mask, DBCtrls, ADODB,
  StdCtrls, Menus;

type
  TFrm_GXCL = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Edit3: TEdit;
    Shape1: TShape;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    CheckBox1: TCheckBox;
    N1: TMenuItem;
    Button1: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    Ftp:integer;
  public
    procedure initd(sDdept,sPrtNo:string;tp:integer);
  end;

var
  Frm_GXCL: TFrm_GXCL;

implementation
uses DM_u;
{$R *.dfm}

{ TFrm_GXCL }

procedure TFrm_GXCL.initd(sDdept,sPrtNo:string;tp:integer);
var i:integer;
begin
  Edit3.Text:=sPrtNo;
  FTp:=tp;
  if Ftp=3 then DM.ADO572.LockType:=ltReadOnly;
  if not DM.ADO572.Active then
  begin
    if (Ftp=2) or (Ftp=3) then     //edit or look
       DM.ADO572.Parameters[0].Value:=DM.ADO570RKEY.AsInteger
    else
      DM.ADO572.Parameters[0].Value:=-1;
    DM.ADO572.Open;
  end;
  DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
  DM.ADO572.First;
  setlength(DM.Fa,1000);
  i:=0;
  while not DM.ADO572.Eof do
  begin
    DM.Fa[i]:=DM.ADO572bach_num.AsString+'-'+DM.ADO572se_num.AsString;
    inc(i);
    DM.ADO572.Next;
  end;
  DM.isFa:=true;
end;

procedure TFrm_GXCL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_GXCL.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var iADO572bach_num,iADO572se_num:integer;
    DADO572measure_date:TDatetime;
    sADO572measure_empl:string;

begin
  if Ftp=3 then exit;    //look
  if (key=vk_return) and (DBEdit3.Text<>'') and (DM.ADO572.State in [DsInsert,dsEdit]) then
  begin
    DM.ADO572.Post;
    if CheckBox1.Checked then
    begin
      iADO572bach_num:=DM.ADO572bach_num.AsInteger;
      iADO572se_num:=DM.ADO572se_num.AsInteger+1;
      DADO572measure_date:=Dm.ADO572measure_date.AsDateTime;
      sADO572measure_empl:=DM.ADO572measure_empl.AsString;
      DM.ADO572.Append;
      DM.ADO572bach_num.AsInteger:=iADO572bach_num;
      DM.ADO572se_num.AsInteger:=iADO572se_num;
      Dm.ADO572measure_date.AsDateTime:=DADO572measure_date;
      DM.ADO572measure_empl.AsString:=sADO572measure_empl;
      DBEdit3.SetFocus;
    end;
  end;
end;

procedure TFrm_GXCL.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=Ftp<>3;
  N2.Enabled:=N1.Enabled and not DM.ADO572.IsEmpty;
end;

procedure TFrm_GXCL.N2Click(Sender: TObject);
begin
  DM.ADO572.Delete;
end;

procedure TFrm_GXCL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DM.ADO572.State in [DsInsert,dsEdit]) then
  begin
    if DBEdit3.Text<>'' then DM.ADO572.post else DM.ADO572.Cancel;
  end else if ((DBEdit3.Text='') or (DBEdit3.Text='0')) and not DM.ADO572.IsEmpty then
    DM.ADO572.Delete;
  DM.Fa:=nil;
  DM.isFa:=false;
end;

procedure TFrm_GXCL.N1Click(Sender: TObject);
var iADO572bach_num,iADO572se_num:integer;
    DADO572measure_date:TDatetime;
    sADO572measure_empl:string;
begin
  if DM.ADO572.RecordCount=0 then
  begin
    DM.ADO572.Append;
    DM.ADO572bach_num.AsInteger:=1;
    DM.ADO572se_num.AsInteger:=1;
    DBEdit3.SetFocus;
    exit;
  end;
  DM.ADO572.Last;
  iADO572bach_num:=DM.ADO572bach_num.AsInteger;
  iADO572se_num:=DM.ADO572se_num.AsInteger+1;
  DADO572measure_date:=Dm.ADO572measure_date.AsDateTime;
  sADO572measure_empl:=DM.ADO572measure_empl.AsString;
  DM.ADO572.Append;
  DM.ADO572bach_num.AsInteger:=iADO572bach_num;
  DM.ADO572se_num.AsInteger:=iADO572se_num;
  Dm.ADO572measure_date.AsDateTime:=DADO572measure_date;
  DM.ADO572measure_empl.AsString:=sADO572measure_empl;
  DBEdit3.SetFocus;
end;

procedure TFrm_GXCL.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_GXCL.DBEdit3KeyPress(Sender: TObject; var Key: Char);
var v:double;
begin
  if (key='-') or (key='+') then abort;
  if (key<>#13) and (key<>#8) then
  try
    V:=strtofloat(DBEdit3.Text+Key);
  except
    abort;
  end;
  if V>9.9999999 then abort;
end;

end.
