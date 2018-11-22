unit uSearchDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TfrmSearchDept = class(TForm)
    Splitter1: TSplitter;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    AQuery34: TADOQuery;
    AQuery34rkey: TAutoIncField;
    AQuery34dept_code: TStringField;
    AQuery34dept_name: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
     _filName:string;
  public
    { Public declarations }
  end;

var
  frmSearchDept: TfrmSearchDept;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmSearchDept.FormShow(Sender: TObject);
begin
 _filName:='dept_code';
end;

procedure TfrmSearchDept.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  AQuery34.Filter :=_filName+' like '''+trim(edit1.text)+'%'''
 else
  AQuery34.filter:='';
end;

procedure TfrmSearchDept.BitBtn1Click(Sender: TObject);
begin
 AQuery34.Filter:='';
end;

procedure TfrmSearchDept.DBGrid1DblClick(Sender: TObject);
begin
 if not AQuery34.IsEmpty then
 ModalResult:=mrOK;
end;

procedure TfrmSearchDept.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not AQuery34.IsEmpty) then ModalResult:=mrOK;
end;

procedure TfrmSearchDept.DBGrid1TitleClick(Column: TColumn);
begin
  _filName:=Column.FieldName;
  Label1.Caption:=column.Title.Caption ;
end;

procedure TfrmSearchDept.Button1Click(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure TfrmSearchDept.FormCreate(Sender: TObject);
begin
 aquery34.Open;
end;

procedure TfrmSearchDept.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if AQuery34.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

end.
