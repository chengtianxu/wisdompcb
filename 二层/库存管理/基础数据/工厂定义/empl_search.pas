unit empl_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ADODB;

type
  TFrmEmployeeSearch = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOStoredProc;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  FrmEmployeeSearch: TFrmEmployeeSearch;

implementation
uses main;
{$R *.DFM}
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

procedure TFrmEmployeeSearch.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
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

procedure TFrmEmployeeSearch.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

end.
