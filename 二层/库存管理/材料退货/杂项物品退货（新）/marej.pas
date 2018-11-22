unit marej;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, Buttons;

type
  Tfrm_marej = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    ADS76: TADODataSet;
    DataSource1: TDataSource;
    ADS76RKEY: TAutoIncField;
    ADS76CODE: TStringField;
    ADS76REJECT_DESCRIPTION: TStringField;
    BitBtn1: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_marej: Tfrm_marej;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_marej.Edit1Change(Sender: TObject);
begin
  IF trim(EDIT1.TEXT)<>'' THEN
    ADS76.Filter := 'code like ''%'+trim(edit1.text)+'%'''
  ELSE
    ADS76.FILTER := '';
  if ADS76.IsEmpty then
    button1.Enabled:=false
  else
    button1.Enabled:=true;
end;

procedure Tfrm_marej.DBGridEh1DblClick(Sender: TObject);
begin
  if not ADS76.IsEmpty then
    ModalResult := mrOk;
end;

procedure Tfrm_marej.BitBtn1Click(Sender: TObject);
begin
  edit1.Text := '';
  edit1.SetFocus;
end;

end.
