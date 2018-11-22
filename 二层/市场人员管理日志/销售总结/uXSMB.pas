unit uXSMB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmXSMB = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    AQery704: TADOQuery;
    Splitter1: TSplitter;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    AQery704YJH: TIntegerField;
    AQery704MJH: TIntegerField;
    AQery704MJHJE: TBCDField;
    AQery704EMPLOYEE_NAME: TStringField;
    AQery704EMPL_CODE: TStringField;
    AQery704YJHJE: TBCDField;
    AQery704LJJE: TBCDField;
    AQery704YWWJE: TBCDField;
    AQery704WWZNBL: TBCDField;
    AQery704RKEY: TAutoIncField;
    Button1: TButton;
    Button2: TButton;
    AQery704JHID: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     _filName:string;
  public
     _UserPTR:integer;
  end;

var
  frmXSMB: TfrmXSMB;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmXSMB.FormShow(Sender: TObject);
begin
  AQery704.Close;
  AQery704.Parameters.ParamValues['vrky']:=_UserPTR;
  AQery704.Open;
  _filName:='EMPL_CODE';
end;
procedure TfrmXSMB.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
  begin
    AQery704.Filter :=_filName+' like '''+trim(edit1.text)+'%'''
  end
 else
  AQery704.filter:='';
 if AQery704.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TfrmXSMB.DBGrid1DblClick(Sender: TObject);
begin
 if not AQery704.IsEmpty then
 ModalResult:=mrOK;
end;

procedure TfrmXSMB.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not AQery704.IsEmpty) then ModalResult:=mrOK;
end;

procedure TfrmXSMB.DBGrid1TitleClick(Column: TColumn);
begin
  _filName:=Column.FieldName;
  Label1.Caption:=column.Title.Caption ;
end;

procedure TfrmXSMB.Button1Click(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure TfrmXSMB.BitBtn2Click(Sender: TObject);
begin
 edit1.Text:='';
 AQery704.Filter:='';
end;



end.
