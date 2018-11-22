unit rej_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TForm_rej = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1REJ_CODE: TStringField;
    ADOQuery1REJECT_DESCRIPTION: TStringField;
    ADOQuery1ttype: TStringField;
    ADOQuery1rkey: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_rej: TForm_rej;

implementation

uses demo;

{$R *.dfm}

procedure TForm_rej.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_rej.Edit1Change(Sender: TObject);
begin

 if trim(Edit1.text)<>'' then
  Adoquery1.Filter := 'rej_code like '''+trim(edit1.Text)+'%'''
 else
  Adoquery1.Filter := '';
 if adoquery1.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;

end;

procedure TForm_rej.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_rej.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_rej.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

end.
