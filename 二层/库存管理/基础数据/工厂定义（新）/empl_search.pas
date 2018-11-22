unit empl_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TFrmEmployeeSearch = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOStoredProc;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmployeeSearch: TFrmEmployeeSearch;

implementation

uses damo, budget;

{$R *.dfm}

procedure TFrmEmployeeSearch.FormCreate(Sender: TObject);
begin
ADOQuery1.Open;
end;

procedure TFrmEmployeeSearch.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
end;

procedure TFrmEmployeeSearch.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter := 'empl_code like '''+trim(edit1.text)+'%'''
 else
  Adoquery1.filter := '';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure TFrmEmployeeSearch.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ADOQuery1.IsEmpty) then ModalResult := mrOK;
end;

procedure TFrmEmployeeSearch.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then ModalResult := mrOK;
end;

procedure TFrmEmployeeSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrOK;
end;

end.
