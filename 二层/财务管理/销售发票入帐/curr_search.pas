unit curr_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_Curr = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1curr_code: TStringField;
    ADOQuery1curr_name: TStringField;
    ADOQuery1base_to_other: TFloatField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_Curr: TForm_Curr;

implementation

uses  damo;
{$R *.dfm}

procedure TForm_Curr.DBGrid1DblClick(Sender: TObject);
begin
if not ADOQuery1.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_Curr.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_Curr.Edit1Change(Sender: TObject);
begin
IF EDIT1.TEXT<>'' THEN
    ADOQuery1.Filter:=field_name+' like '''+trim(EDIT1.TEXT)+'%'''
ELSE
    ADOQuery1.FILTER:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Curr.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='curr_code';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Curr.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
end;

end.

