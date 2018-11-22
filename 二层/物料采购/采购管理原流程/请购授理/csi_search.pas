unit csi_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_csi = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    adoquery1: TADOStoredProc;
    adoquery1user_id: TStringField;
    adoquery1user_full_name: TStringField;
    adoquery1DEPT_CODE: TStringField;
    adoquery1dept_name: TStringField;
    adoquery1employee_ptr: TIntegerField;
    adoquery1rkey: TIntegerField;
    adoquery1pr_id: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_csi: TForm_csi;

implementation
 uses damo;
{$R *.dfm}

procedure TForm_csi.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TForm_csi.Edit1Change(Sender: TObject);
begin
if edit1.Text<>'' then
 adoquery1.Filter := 'user_id like '''+trim(edit1.Text)+'%'''
else
 adoquery1.Filter := '';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_csi.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then
  ModalResult := mrok;
end;

procedure TForm_csi.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then
  ModalResult := mrok;
end;

procedure TForm_csi.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

end.
