unit part_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1bath_former: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses demo;

{$R *.dfm}

procedure TForm5.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  Adoquery1.Filter := '';
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm5.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  ModalResult:=mrok;
end;

procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
  if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text); 
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='MANU_PART_NUMBER';
end;

procedure TForm5.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
