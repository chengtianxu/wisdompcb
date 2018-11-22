unit cse_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_csi = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1user_full_name: TStringField;
    RadioGroup1: TRadioGroup;
    ADOQuery1USER_LOGIN_NAME: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_csi: TForm_csi;

implementation
 uses main;
{$R *.dfm}

procedure TForm_csi.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TForm_csi.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 if radiogroup1.ItemIndex=0 then
  adoquery1.Filter :=' USER_LOGIN_NAME like '''+trim(edit1.Text)+'%'''
 else
  adoquery1.Filter :=' user_full_name like ''%'+trim(edit1.Text)+'%'''
else
 adoquery1.Filter :='';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true; 
 
end;

procedure TForm_csi.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_csi.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_csi.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption :='用户标识:'
else
 label1.Caption :='用户名称:';
edit1.SetFocus;
end;

end.
