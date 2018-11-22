unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, DB, Mask, DBCtrls, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Ftag:integer;
  end;

var
  Frm_detail: TFrm_detail;

implementation
uses DM_u;
{$R *.dfm}

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
begin
  DM.ADOinvt_incept.Post;
  if Ftag=0 then
  begin
    DM.ADOinvt_incept.Append;
    DBEdit1.SetFocus;
  end else
    close;
end;

procedure TFrm_detail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM.ADOinvt_incept.State in [dsInsert,dsEdit] then DM.ADOinvt_incept.Cancel;
end;

procedure TFrm_detail.FormShow(Sender: TObject);
var i:integer;
begin
  if Ftag=3 then
  begin
    for i:=0 to self.ComponentCount-1 do
     if (self.Components[i] is TDBEdit)  then
        TDBEdit(self.Components[i]).ReadOnly:=true
     else if (self.Components[i] is TDBDateTimeEditEh) then
        TDBDateTimeEditEh(self.Components[i]).ReadOnly:=true;
     BtnSave.Enabled:=false;
  end;
end;

end.
