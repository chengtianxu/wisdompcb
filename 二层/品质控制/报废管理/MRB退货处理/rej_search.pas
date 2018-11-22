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
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   file_name :string;
  public
    { Public declarations }
  end;

var
  Form_rej: TForm_rej;

implementation
uses damo;
{$R *.dfm}

procedure TForm_rej.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 dm.AQ39.Filter := '';
 edit1.SetFocus;
end;

procedure TForm_rej.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   dm.AQ39.Filter := file_name+' like ''%'+trim(edit1.Text)+'%'''
  else
   dm.AQ39.Filter := '';
if dm.AQ39.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_rej.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not dm.AQ39.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_rej.DBGrid1DblClick(Sender: TObject);
begin
if not dm.AQ39.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_rej.FormCreate(Sender: TObject);
begin
 file_name := 'REJ_CODE';
 dm.AQ39.Open;
end;

procedure TForm_rej.DBGrid1TitleClick(Column: TColumn);
begin
IF (Column.ReadOnly) and (column.FieldName<>file_name) then
 begin
  file_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.Text:='';
  edit1.SetFocus;
 end;
end;

end.
