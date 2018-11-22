unit addedit_requ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, ExtCtrls, ComCtrls;

type
  TForm3 = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Button3: TButton;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBText4: TDBText;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    ADO279: TADOQuery;
    ADO279SPEC_RKEY: TStringField;
    ADO279PARAMETER_VALUE: TStringField;
    ADOMIN_aperture: TADOQuery;
    ADOMIN_aperturePARAMETER_VALUE: TStringField;
    DateTimePicker1: TDateTimePicker;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
  private
    v_close:byte;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo, edit_req, main;

{$R *.dfm}

procedure TForm3.Button2Click(Sender: TObject);
begin
  v_close:=1;
  dm.ADO301.Cancel;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  if dm.ADO301QUANTITY.Value<=0 then
  begin
    showmessage('请输入正确的外发数量');
    dbedit1.SetFocus;
  end
  else
  if dm.ADO301.State=dsinsert then
  begin
    dm.ADO301REQ_DATE.Value:=self.DateTimePicker1.Date;
    dm.ADO301.Post;
    dm.ADO301.Append;
    if dm.adowz300rkey.Value>0 then
      dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;//给主表指针赋值
    dm.ADO301REQ_DATE.Value:=form1.sys_shortdate;
    dm.ADO301UNIT_NAME.Value:='PNL';
    dbedit6.SetFocus;
  end
  else
  begin
    v_close:=1;
    self.ModalResult:=mrok;
  end;
end;

procedure TForm3.DBEdit1Exit(Sender: TObject);
begin
  if trim(dbedit1.Text) = '' then dbedit1.Field.Value := 0;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if v_close<>1 then  dm.ado301.Cancel;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  v_close:=1;
end;

end.
