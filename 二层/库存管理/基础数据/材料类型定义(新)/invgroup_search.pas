unit invgroup_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    aq0019: TADOStoredProc;
    aq0019rkey: TIntegerField;
    aq0019inv_group_name: TStringField;
    aq0019inv_group_desc: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses damo;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
 aq0019.Open;
if aq0019.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 aq0019.Filter :='inv_group_name like '''+trim(edit1.Text)+'%'''
else
 aq0019.Filter :='';
if aq0019.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
if not aq0019.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not aq0019.IsEmpty) then ModalResult:=mrok;
end;

end.
