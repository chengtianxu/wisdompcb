unit uCPInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TfrmCPInfo = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    AQery50: TADOQuery;
    AQery50RKEY: TAutoIncField;
    AQery50MANU_PART_NUMBER: TStringField;
    AQery50MANU_PART_DESC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    _filName:string;
  public
    { Public declarations }
  end;

var
  frmCPInfo: TfrmCPInfo;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmCPInfo.FormCreate(Sender: TObject);
begin
 _filName:='MANU_PART_NUMBER';
end;

procedure TfrmCPInfo.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
  begin
    AQery50.Filter :=_filName+' like '''+trim(edit1.text)+'%'''
  end
 else
  AQery50.filter:='';

end;

procedure TfrmCPInfo.DBGrid1DblClick(Sender: TObject);
begin
 if not AQery50.IsEmpty then
  ModalResult:=mrOK;
end;

procedure TfrmCPInfo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not AQery50.IsEmpty) then ModalResult:=mrOK;
end;

procedure TfrmCPInfo.DBGrid1TitleClick(Column: TColumn);
begin
  _filName:=Column.FieldName;
  Label1.Caption:=column.Title.Caption ;
end;

procedure TfrmCPInfo.Button1Click(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure TfrmCPInfo.BitBtn2Click(Sender: TObject);
begin
 edit1.Text:='';
 AQery50.Filter:='';
end;

procedure TfrmCPInfo.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if AQery50.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

end.
