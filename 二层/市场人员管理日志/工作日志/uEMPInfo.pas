unit uEMPInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, ADODB;

type
  TfrmEMPINFO = class(TForm)
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    AQery5: TADOQuery;
    Label1: TLabel;
    AQery5EMPL_CODE: TStringField;
    AQery5EMPLOYEE_NAME: TStringField;
    Edit1: TEdit;
    AQery5RKEY: TAutoIncField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _filName:string;
  public
    { Public declarations }
  end;

var
  frmEMPINFO: TfrmEMPINFO;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmEMPINFO.FormCreate(Sender: TObject);
begin
  _filName:='EMPLOYEE_NAME';
end;

procedure TfrmEMPINFO.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
  begin
    AQery5.Filter :=_filName+' like '''+trim(edit1.text)+'%'''
  end
 else
  AQery5.filter:='';
 if AQery5.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TfrmEMPINFO.DBGrid1DblClick(Sender: TObject);
begin
 if not AQery5.IsEmpty then
 ModalResult:=mrOK;
end;

procedure TfrmEMPINFO.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not AQery5.IsEmpty) then ModalResult:=mrOK;
end;

procedure TfrmEMPINFO.DBGrid1TitleClick(Column: TColumn);
begin
  _filName:=Column.FieldName;
  Label1.Caption:=column.Title.Caption ;
end;

procedure TfrmEMPINFO.Button1Click(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure TfrmEMPINFO.BitBtn2Click(Sender: TObject);
begin
 edit1.Text:='';
 AQery5.Filter:='';
end;


end.
