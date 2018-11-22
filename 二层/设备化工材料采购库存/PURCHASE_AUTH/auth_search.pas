unit auth_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm_auth = class(TForm)
   Label1: TLabel;
   Edit1: TEdit;
   BitBtn1: TBitBtn;
   DBGrid1: TDBGrid;
   Button1: TButton;
   Button2: TButton;
   DataSource1: TDataSource;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1CODE: TStringField;
    ADOQuery1PURCHASE_APPROV_DESC: TStringField;
   procedure BitBtn1Click(Sender: TObject);
   procedure DBGrid1DblClick(Sender: TObject);
   procedure Edit1Change(Sender: TObject);
   procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
     Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_auth: TForm_auth;

implementation
uses damo, main;
{$R *.dfm}

procedure TForm_auth.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_auth.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult :=mrok;
end;

procedure TForm_auth.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  Adoquery1.Filter := 'CODE like '''+trim(edit1.Text)+'%'''
 else
  Adoquery1.Filter := '';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure TForm_auth.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_auth.FormCreate(Sender: TObject);
begin
 adoquery1.Close;
 adoquery1.Parameters[1].Value:=form1.csi_rkey.caption;
 adoquery1.Open;
end;

end.
