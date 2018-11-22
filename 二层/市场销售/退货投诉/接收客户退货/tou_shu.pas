unit tou_shu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1LOG_NUMBER: TStringField;
    ADOQuery1LOG_DATE: TDateTimeField;
    ADOQuery1CONTENT: TStringField;
    ADOQuery1ANALYSIS: TStringField;
    ADOQuery1rkey: TIntegerField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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

procedure TForm4.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter :='LOG_NUMBER like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 modalresult:=mrok;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then modalresult:=mrok;
end;

end.
